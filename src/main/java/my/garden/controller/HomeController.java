package my.garden.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import my.garden.dto.MembersDTO;

@Controller
public class HomeController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	MembersDTO mdto;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		mdto.setM_email("dlgodud");
		mdto.setM_name("이해영");
		mdto.setM_phone("010-2414-9070");
		mdto.setM_zipcode("12345");
		mdto.setM_address1("해영시");
		mdto.setM_address2("해영아파트");
		session.setAttribute("loginId", mdto);
		
		return "home";
	}
	
}
