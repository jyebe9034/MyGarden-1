package my.garden.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.StompWebSocketEndpointRegistration;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

@Configuration // 설정을 지정하기 위한 Bean
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
	
	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		// 클라이언트가 서버에게 /app을 붙이고 메세지를 전달할 주소
		registry.setApplicationDestinationPrefixes("/app"); // 실제로 메세지를 받는 코드는 여기!
		// 메세지 브로커가 /response가 들어가는 구독자들에게 메세지 전달
		registry.enableSimpleBroker("/response"); // 클라이언트가 listen할 url이야. 
	}

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		// 클라이언트가 서버에 접속할 Endpoint를 설정한다. Endpoint는 여러개 추가 가능
		// 클라이언트에서 WebSocket대신 SockJS로 접속하려면 .withSockJS()를 붙여주면 된다.
		StompWebSocketEndpointRegistration ser = registry.addEndpoint("/webchat"); // 연결정보를 수립할 때만 사용됨.클라이언트와 서버를 연결시켜줌
		// ser은 나중에 session 정보등을 공유할 때 사용하게 될거야.
		ser.setAllowedOrigins("*"); // 모든 cross-origin 오류를 꺼주는 코드
		ser.addInterceptors(new HttpSessionHandshakeInterceptor());
		ser.withSockJS();
	}
}
