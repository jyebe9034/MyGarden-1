package my.garden.service;

public interface ChatService {
	public int insertClientSendMessageService(String email, String message, String grade) throws Exception;
	public int insertAdminSendMessageService(String email, String message, String rEmail, String grade) throws Exception;
}
