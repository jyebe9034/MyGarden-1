package my.garden.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.garden.dao.ChatDAO;
import my.garden.service.ChatService;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDAO cdao;
	
	public int insertClientSendMessageService(String email, String message, String grade) throws Exception {
		return cdao.insertClientSendMessage(email, message, grade);
	}
	
	public int insertAdminSendMessageService(String email, String message, String rEmail, String grade) throws Exception {
		return cdao.insertAdminSendMessage(email, message, rEmail, grade);
	}
	
}
