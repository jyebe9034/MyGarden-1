package my.garden.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Controller;

import my.garden.dto.ChatDTO;

@Controller
public class ChatController {
	
	@MessageMapping("chat")
	@SendTo("/response") // 모두에게 뿌려주는게 아니라 /response를 구독한 사람들한테만 보내줄거야
	public ChatDTO messageProc(StompHeaderAccessor sha, ChatDTO dto) { // 얘가 OnMessage
		String name = (String)sha.getSessionAttributes().get("loginName");
		dto.setName(name);
		return dto; 
	}
}
