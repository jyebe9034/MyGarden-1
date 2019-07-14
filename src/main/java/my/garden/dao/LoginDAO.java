package my.garden.dao;

import java.io.File;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
}
