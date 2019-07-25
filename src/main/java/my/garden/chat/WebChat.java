package my.garden.chat;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value="/chatcontrol",configurator=HttpSessionSetter.class)
public class WebChat {

	// 웹소켓 Session이 필요함. 이 Session은 http의 session과는 다른 애야. Session이 클라이언트의 정보를 담고있어.
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>()); 
	// 나중에 동기화 처리를 하기 위해서 synchronizedSet을 사용함(for문이 돌고있는 중엔 add와 remove가 허용되지 않도록 하기 위해.)

	@OnMessage
	public void onMessage(String message, Session session) throws Exception{
		synchronized(clients) { // 만약 10명인 상태에서 갑자기 한명이 나가거나 들어오더라도 for문이 끝날때까지 기다리게 함.
			for(Session each : clients) {
				if(each != session) { // 내가 보낸 메세지가 나한테 오면 안되니까!
					each.getBasicRemote().sendText(message); // 이 코드에 의해 클라이언트들에게 메세지가 전달 됨.
				}
			}
		}		
	}

	@OnOpen // 메서드의 이름은 아무렇게나 지어도 되지만 어노테이션 OnOpen은 꼭 붙여줘야 함.
	public void onOpen(Session session, EndpointConfig ec) {  
		HttpSession hsession = (HttpSession)ec.getUserProperties().get("httpSession");
		String id = (String)hsession.getAttribute("loginId");
		System.out.println(id + "가 접속함");
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
	}
}
