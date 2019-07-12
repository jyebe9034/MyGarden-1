package my.garden.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import my.garden.dao.LoginDAO;
import my.garden.dto.MembersDTO;

@Controller
public class LoginController {
	
	@Autowired
	LoginDAO loginDAO;
	
	@RequestMapping("/login")
	public String Login() {
		return "login/login";
	}

	@RequestMapping("/join")
	public String Join() {
		return "login/join";
	}
	
	@RequestMapping("/joinSubmit")
	public String JoinSubmit(MembersDTO dto) {
//		loginDAO.joinSubmit(dto);
		return "login/join";
	}
	
}
