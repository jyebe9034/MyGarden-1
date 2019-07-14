package my.garden.serviceImpl;

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
	
}
