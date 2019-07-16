package my.garden.serviceImpl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.JsonNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import my.garden.dao.LoginDAO;
import my.garden.dto.MembersDTO;

@Service
public class LoginService {

	@Autowired
	LoginDAO logDao;
	@Autowired
	HttpServletRequest request;
	
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
	
	public MembersDTO memSelectAll(MembersDTO dto, String id) {
		return logDao.memSelectAll(dto, id);
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
		if(dto.getM_social().equals("MG")) {
			dto.setM_pw(logDao.SHA256(dto.getM_pw()));
		}else {
			dto.setM_pw("N");
		}
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
	
	public String naverLogin() {
		return logDao.NaverLoginMakeUrl();
	}
	
	public String NaverLoginCallback() throws Exception{
		return logDao.NaverLoginCallback();
	}
	
	public String NaverLoginGetInfo(String code) {
		String socialEmail = logDao.NaverLoginGetInfo(code);
		String check = logDao.emailDupCheck(socialEmail);
        return socialEmail;
	}
	
	public int socialJoinSubmit(MembersDTO dto) {
		dto.setM_social(request.getSession().getAttribute("social").toString());
		dto.setM_ipaddress(request.getRemoteAddr());
//		System.out.println(request.getSession().getAttribute("profile").toString());
		if(request.getSession().getAttribute("profile").toString()==null) {
			dto.setM_profile("resources/img/profile.png");
		}else {
			dto.setM_profile(request.getSession().getAttribute("profile").toString());
		}
		System.out.println(dto.getM_email());
		
		return logDao.socialJoinSubmit(dto);
	}
	
	public Map<String, String> kakaoLoginMakeUrl(String code) {
		JsonNode jsonToken = logDao.kakaoLoginMakeUrl(code);
		JsonNode accessToken = jsonToken.get("access_token");
		JsonNode userInfo = logDao.kakaoLoginGetInfo(accessToken);
		
//		System.out.println("userInfo : " + userInfo);
		
		// Get id
        String id = userInfo.path("id").asText();
        String name = null;
        String profile = null;
        String socialEmail = null;

        // 유저정보 카카오에서 가져오기 Get properties
        JsonNode properties = userInfo.path("properties");
        JsonNode kakao_account = userInfo.path("kakao_account");
 
        name = properties.path("nickname").asText();
        profile = properties.path("profile_image").asText();
        socialEmail = kakao_account.path("email").asText();
 
//        System.out.println("id : " + id);
//        System.out.println("name : " + name);
//        System.out.println("email : " + email);
        
        Map<String, String> map = new HashMap();
        map.put("socialEmail", socialEmail);
        map.put("profile", profile);
        return map;
	}
	
}
