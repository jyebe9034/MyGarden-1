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
		registry.setApplicationDestinationPrefixes("/app"); // 실제로 메세지를 받는 코드는 여기!
		registry.enableSimpleBroker("/response"); // 클라이언트가 listen할 url이야. 
	}

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		StompWebSocketEndpointRegistration ser = registry.addEndpoint("/webchat"); // 연결정보를 수립할 때만 사용됨.클라이언트와 서버를 연결시켜줌
		// ser은 나중에 session 정보등을 공유할 때 사용하게 될거야.
		ser.setAllowedOrigins("*"); // 모든 cross-origin 오류를 꺼주는 코드
		ser.addInterceptors(new HttpSessionHandshakeInterceptor());
		ser.withSockJS();
	}
}
