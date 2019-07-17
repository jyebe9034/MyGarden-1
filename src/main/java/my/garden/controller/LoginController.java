package my.garden.controller;

import java.io.PrintWriter;
import java.util.Map;

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
		int result = loginserv.joinSubmit(dto, ex_file);
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
		if (loginserv.isLoginOk(loginId, loginPw) == null) {
			return "login/loginThrough";
		} else {
			session.setAttribute("loginId", loginId);
			String loginName = loginserv.getName(loginId);
			session.setAttribute("loginName", loginName);

			session.setAttribute("grade", "admin"); // 임시로 관리자로 넣어둠
			System.out.println("로그인 성공!");
			return "home";
		}
	}

	@RequestMapping("/logout")
	public String logout() throws Exception {
		session.invalidate();
		out = response.getWriter();

		// out.print("<body>\r\n" +
		// " //�α��� �� �ڷΰ��� ����\r\n" +
		// " history.pushState(null, null, location.href);\r\n" +
		// " window.onpopstate = function () {\r\n" +
		// " history.go(1);\r\n" +
		// " };</body>");

		return "home";
	}

	@RequestMapping("/reLogin")
	public String reLogin() {
		session.invalidate();
		return "login/login";
	}

	@RequestMapping("/mypageFirst")
	public String Mypage(MembersDTO dto) {
		String loginName = (String) session.getAttribute("loginName");
		if (loginName == null) {
			return "login/login";
		} else {
			String id = (String) session.getAttribute("loginId");
			session.setAttribute("memDTO", loginserv.memSelectAll(dto, id));
			return "login/mypageFirst";
		}
	}

	@RequestMapping("/mypageInfo")
	public String MypageInfo(MembersDTO dto) {
		String loginName = (String) session.getAttribute("loginName");
		if (loginName == null) {
			return "login/login";
		} else {
			String id = (String) session.getAttribute("loginId");
			session.setAttribute("memDTO", loginserv.memSelectAll(dto, id));
			return "login/mypageInfo";
		}
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
		String m_email = (String) session.getAttribute("loginId");
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

	@ResponseBody
	@RequestMapping("/naverLogin")
	public String naverLogin() {
		return loginserv.naverLogin();
	}

	@RequestMapping("/callbackNaver")
	public String naverCallback() throws Exception {
		String code = loginserv.NaverLoginCallback();
		String socialEmail = loginserv.NaverLoginGetInfo(code);
		boolean result = loginserv.emailDupCheck(socialEmail);

		if (result == true) { // �� �� - Ȩ���� �̵�
			session.setAttribute("loginName", loginserv.getName(socialEmail));
			session.setAttribute("loginId", socialEmail);
			return "home";
		} else { // ���� �α��� - �����Է� �������� �̵�

			session.setAttribute("loginId", socialEmail);
			session.setAttribute("social", "naver");
			// session.setAttribute("profile", "null");
			return "login/socialLoginThrough";
		}
	}

	@RequestMapping("/socialJoin")
	public String socialJoin(MembersDTO dto) {
		return "login/socialJoin";
	}

	@RequestMapping("/socialJoinSubmit")
	public String socialJoinSubmit(MembersDTO dto) {
		System.out.println(dto.getM_profile());
		loginserv.socialJoinSubmit(dto);
		return "login/findAccountAfterLogin";
	}

	@ResponseBody
	@RequestMapping("/kakaoLogin")
	public String kakaoLogin() {
		String url = "https://kauth.kakao.com/oauth/authorize?client_id=5a8617254e6227196ff9c31a66275c78&redirect_uri=http://localhost/kakaoCallback&response_type=code";
		return url;
	}

	@RequestMapping("/kakaoCallback")
	public String kakaoLoginMakeUrl(String code) {
		Map<String, String> map = loginserv.kakaoLoginMakeUrl(code);
		String socialEmail = map.get("socialEmail");
		String profile = map.get("profile");

		boolean result = loginserv.emailDupCheck(socialEmail);

		if (result == true) { // �� �� - Ȩ���� �̵�
			session.setAttribute("loginName", loginserv.getName(socialEmail));
			session.setAttribute("loginId", socialEmail);
			return "home";
		} else { // ���� �α��� - �����Է� �������� �̵�
			session.setAttribute("loginId", socialEmail);
			session.setAttribute("profile", profile);
			session.setAttribute("social", "kakao");
			return "login/socialLoginThrough";
		}
	}

}