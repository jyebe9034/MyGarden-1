package my.garden.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import my.garden.dao.ChatDAO;

@Repository
public class ChatDAOImpl implements ChatDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	public int insertClientSendMessage(String email, String message, String grade) {
		String[] msg = new String[] {email, message, grade};
		try {
			return sst.insert("ChatDAO.insertClientSendMessage", msg);
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public int insertAdminSendMessage(String email, String message, String rEmail, String grade) {
		String[] msg = new String[] {email, message, rEmail, grade};
		try {
			return sst.insert("ChatDAO.insertAdminSendMessage", msg);
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
}
