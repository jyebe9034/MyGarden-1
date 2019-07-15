package my.garden.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import my.garden.dto.MembersDTO;
import my.garden.serviceImpl.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	LoginService loginserv;
	@Autowired
	HttpServletResponse response;
	@Autowired
	HttpSession session;
	
	PrintWriter out;
	
	@RequestMapping("/login")
	public String Login() {
		return "login/login";
	}

	@RequestMapping("/join")
	public String Join() {
		return "login/join";
	}
	
	@RequestMapping("/joinSubmit")
	public String JoinSubmit(MembersDTO dto, MultipartFile ex_file) {
		loginserv.joinSubmit(dto, ex_file);
		return "login/joinThrough";
	}
	
	@ResponseBody
	@RequestMapping("/emailCheck")
	public boolean eamilCheck(String key) {
		return loginserv.emailDupCheck(key);
	}

	@ResponseBody
	@RequestMapping("/phoneCheck")
	public boolean phoneCheck(String key) {
		return loginserv.phoneDupCheck(key);
	}
	
	@ResponseBody
	@RequestMapping("/gardenCheck")
	public boolean gardenCheck(String key) {
		return loginserv.gardenDupCheck(key);
	}

	@RequestMapping("/isLoginOk")
	public String IsLoginOk(String loginId, String loginPw) {
		loginserv.isLoginOk(loginId, loginPw);
		if(loginserv.isLoginOk(loginId, loginPw)==null) {
			return "login/loginThrough";
		}else {
			session.setAttribute("loginId", loginId);
			String loginName = loginserv.getName(loginId);
			session.setAttribute("loginName", loginName);
			return "home";
		}
	}

	@RequestMapping("/logout")
	public String logout() {
		session.invalidate();
		return "home";
	}

	@RequestMapping("/reLogin")
	public String reLogin() {
		session.invalidate();
		return "login/login";
	}
	
	@RequestMapping("/mypageFirst")
	public String Mypage(MembersDTO dto) {
		session.setAttribute("memDTO", loginserv.memSelectAll(dto));
		return "login/mypageFirst";
	}

	@RequestMapping("/mypageInfo")
	public String MypageInfo(MembersDTO dto) {
		session.setAttribute("memDTO", loginserv.memSelectAll(dto));
		return "login/mypageInfo";
	}
	
	@ResponseBody
	@RequestMapping("/pwCheck")
	public boolean pwCheck(String key, String pw) {
		return loginserv.pwDupCheck(key, pw);
	}

	@RequestMapping("/updateInfo")
	public String updateInfo(MembersDTO dto) {
		loginserv.memUpdateAll(dto);
		return "login/mypageInfoThrough";
	}
	
	@RequestMapping("/mailSender")
	public String mailSender() throws Exception {
		String m_email = (String)session.getAttribute("loginId");
		loginserv.mailSender(m_email);
		return "login/findAccountAfterLogin";
	}
	
	@ResponseBody
	@RequestMapping("/findId")
	public String findId(String key) {
		return loginserv.findId(key);
	}
	
	@ResponseBody
	@RequestMapping("/findPwGetCode")
	public String findPwGetCode(String key) {
		System.out.println(key);
		String pwCode = loginserv.findPwGetCode(key);
		return pwCode;
	}

	@ResponseBody
	@RequestMapping("/findPwChange")
	public String findPwChange(String email, String pw) {
		loginserv.updateOne(email, pw);
		return null;
	}
	
}
