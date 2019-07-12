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
	
	public int insertJoinSubmit(MembersDTO dto, MultipartFile ex_file) {
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
	
}
