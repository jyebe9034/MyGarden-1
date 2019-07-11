package my.garden.controller;

import java.sql.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
//		return "test";
	}
	
	
	
	//test
	@RequestMapping("gender")
	public String gender(String m_garden, String m_gender, String m_name, String m_email, String m_pw, String m_phone, String m_birth) {
		System.out.println(m_garden);
		System.out.println(m_gender);
		System.out.println(m_name);
		System.out.println(m_email);
		System.out.println(m_pw);
		System.out.println(m_phone);
		System.out.println(m_birth);
		return "test";
	}
	
	@RequestMapping("/profile")
	public String profile(MultipartFile image) {
		System.out.println(image);
		return "test";
	}
	
}
