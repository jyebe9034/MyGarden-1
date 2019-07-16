package my.garden.dao;

import java.io.File;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import my.garden.dto.MembersDTO;

@Repository
public class LoginDAO {

	@Autowired
	private SqlSessionTemplate sst;
	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest request;
	
	public static String SHA256(String str){
		String SHA = ""; 
		try{
			MessageDigest sh = MessageDigest.getInstance("SHA-256"); 
			sh.update(str.getBytes()); 
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer(); 
			for(int i = 0 ; i < byteData.length ; i++){
				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}
			SHA = sb.toString();
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace(); 
			SHA = null; 
		}
		return SHA;
	}
	
	public void profile(MembersDTO dto, MultipartFile ex_file) {
		String uploadPath = session.getServletContext().getRealPath("resources/prof");
		if(!new File(uploadPath).exists()) {
			new File(uploadPath).mkdirs();
		}
		String prof = System.currentTimeMillis() + ".png";
		try {
			ex_file.transferTo(new File(uploadPath + "/" + prof));
			dto.setM_realpath(uploadPath + "/" + prof);
			dto.setM_profile("resources/prof/" + prof);
		} catch (Exception e) {
			System.out.println("ss");
			e.printStackTrace();
		} 
	}
	
	public int joinSubmit(MembersDTO dto) {
		dto.setM_pw(this.SHA256(dto.getM_pw()));
		dto.setM_ipaddress(request.getRemoteAddr());
		return sst.insert("LoginDAO.joinSubmit", dto);
	}
	
	public String emailDupCheck(String key) {
		Map<String, String> map = new HashMap();
		map.put("col", "m_email");
		map.put("whereCol", "m_email");
		map.put("value", key);
		return sst.selectOne("LoginDAO.dupCheck", map);
	}

	public String phoneDupCheck(String key) {
		Map<String, String> map = new HashMap();
		map.put("col", "m_phone");
		map.put("whereCol", "m_phone");
		map.put("value", key);
		return sst.selectOne("LoginDAO.dupCheck", map);
	}

	public String gardenDupCheck(String key) {
		Map<String, String> map = new HashMap();
		map.put("col", "m_garden");
		map.put("whereCol", "m_garden");
		map.put("value", key);
		return sst.selectOne("LoginDAO.dupCheck", map);
	}
	
	public String isLoginOk(String loginId, String shaPw) {
		Map<String, String> map = new HashMap();
		map.put("id", loginId);
		map.put("pw", shaPw);
		map.put("m_email", "m_email");
		map.put("m_pw", "m_pw");
		return sst.selectOne("LoginDAO.isLoginOk", map);
	}
	
	public String getName(String loginId) {
		Map<String, String> map = new HashMap();
		map.put("value", loginId);
		map.put("col", "m_name");
		map.put("whereCol", "m_email");
		return sst.selectOne("LoginDAO.dupCheck", map);
	}
	
	public MembersDTO memSelectAll(MembersDTO dto) {
		String id = (String)session.getAttribute("loginId");
		dto.setM_email(id);
		return sst.selectOne("LoginDAO.memSelectAll", dto);
	}

	public String pwDupCheck(String key) {
		Map<String, String> map = new HashMap();
		map.put("col", "m_pw");
		map.put("whereCol", "m_email");
		map.put("value", key);
		return sst.selectOne("LoginDAO.dupCheck", map);
	}
	
	public int memUpdateAll(MembersDTO dto) {
		return sst.insert("LoginDAO.memUpdateAll", dto);
	}
	
	public String randomCode() {
		String[] ALPHA = new String[] {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9"};
		String rN="";
		for(int i=0; i<8; i++){
			int randTnum = (int) Math.floor(Math.random()*ALPHA.length);
			rN += ALPHA[randTnum];
		}
		return rN;
	}
	
	public String mailSender(String m_email) throws Exception {
		// ���̹��� ��� smtp.naver.com �� �Է��մϴ�. 
		// Google�� ��� smtp.gmail.com �� �Է��մϴ�. 
		String host = "smtp.naver.com"; 
		final String username = "���̵�"; //���̹� ���̵� �Է����ּ���. @nave.com�� �Է����� ���ñ���. 
		final String password = "��й�ȣ"; //���̹� �̸��� ��й�ȣ�� �Է����ּ���. 
		int port=465; //��Ʈ��ȣ 
		
		// ���� ���� 
		String recipient = m_email; //�޴� ����� �����ּҸ� �Է����ּ���. 
		String subject = "���� ���� �ӽ� ��й�ȣ"; //���� ���� �Է����ּ���. 
			String randomCode = this.randomCode();
		String body = "�ӽ� ��й�ȣ�� " + randomCode + "�Դϴ�. "; //���� ���� �Է����ּ���. 
		Properties props = System.getProperties(); // ������ ��� ���� ��ü ���� 
		
		// SMTP ���� ���� ���� 
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", port); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", host); 
		
		//Session ���� 
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			String un=username; 
			String pw=password; 
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
				return new javax.mail.PasswordAuthentication(un, pw); 
				} 
			}); 
		session.setDebug(true); //for debug 
		Message mimeMessage = new MimeMessage(session); //MimeMessage ���� 
		mimeMessage.setFrom(new InternetAddress("���̵�Ǯ")); //�߽��� ���� , ������ ����� �̸����ּҸ� �ѹ� �� �Է��մϴ�. �̶��� �̸��� Ǯ �ּҸ� �� �ۼ����ּ���. 
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //�����ڼ��� //.TO �ܿ� .CC(����) .BCC(��������) �� ����
		
		mimeMessage.setSubject(subject); //������� 
		mimeMessage.setText(body); //������� 
		Transport.send(mimeMessage); //javax.mail.Transport.send() �̿�
		
		return randomCode;
	}
	
	public int findAccountChange(Map<String, String> map) {
		return sst.insert("LoginDAO.updateOne", map);
	}
	
	public String findId(String key) {
		Map<String, String> map = new HashMap();
		map.put("col", "m_email");
		map.put("whereCol", "m_phone");
		map.put("value", key);
		return sst.selectOne("LoginDAO.dupCheck", map);
	}
	
}
