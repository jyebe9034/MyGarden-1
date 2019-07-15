package my.garden.serviceImpl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import my.garden.dao.LoginDAO;
import my.garden.dto.MembersDTO;

@Service
public class LoginService {

	@Autowired
	LoginDAO logDao;
	
	public int joinSubmit(MembersDTO dto, MultipartFile ex_file) {
		logDao.profile(dto, ex_file);
		return logDao.joinSubmit(dto);
	} 
	
	public boolean emailDupCheck(String key) {
		if(logDao.emailDupCheck(key)==null) {
			return false;
		}else {
			return true;
		}
	}

	public boolean phoneDupCheck(String key) {
		if(logDao.phoneDupCheck(key)==null) {
			return false;
		}else {
			return true;
		}
	}

	public boolean gardenDupCheck(String key) {
		if(logDao.gardenDupCheck(key)==null) {
			return false;
		}else {
			return true;
		}
	}
	
	public String isLoginOk(String loginId, String loginPw) {
		String shaPw = logDao.SHA256(loginPw);
		return logDao.isLoginOk(loginId, shaPw);
	}
	
	public String getName(String loginId){
		return logDao.getName(loginId);
	}
	
	public MembersDTO memSelectAll(MembersDTO dto) {
		return logDao.memSelectAll(dto);
	}

	public boolean pwDupCheck(String key, String pw) {
		String result = logDao.pwDupCheck(key).toString();
		String pastPw = logDao.SHA256(pw).toString();
		if(result.equals(pastPw)) {
			return true;
		}else {
			return false;
		}
	}
	
	public int memUpdateAll(MembersDTO dto) {
		dto.setM_pw(logDao.SHA256(dto.getM_pw()));
		return logDao.memUpdateAll(dto);
	}
	
	public int mailSender(String m_email) throws Exception {
		String randomCode = logDao.mailSender(m_email);
		Map<String, String> map = new HashMap();
		map.put("col", "m_pw");
		map.put("colVal", logDao.SHA256(randomCode));
		map.put("whereCol", "m_email");
		map.put("value", m_email);
		return logDao.findAccountChange(map);
	}
	
	public String findId(String key) {
		return logDao.findId(key);
	}
	
	public String findPwGetCode(String key) {
		try {
			return logDao.mailSender(key);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public int updateOne(String m_email, String m_pw) {
		Map<String, String> map = new HashMap();
		map.put("col", "m_pw");
		map.put("colVal", logDao.SHA256(m_pw));
		map.put("whereCol", "m_email");
		map.put("value", m_email);
		return logDao.findAccountChange(map);
	}
	
}
