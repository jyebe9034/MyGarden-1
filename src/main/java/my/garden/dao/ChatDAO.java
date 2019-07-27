package my.garden.dao;

public interface ChatDAO {
	public int insertClientSendMessage(String email, String message, String grade);
	public int insertAdminSendMessage(String email, String message, String rEmail, String grade);
}
