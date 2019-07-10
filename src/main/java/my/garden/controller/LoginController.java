package my.garden.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("/login")
	public String Login() {
		return "login/login";
	}

	@RequestMapping("/join")
	public String Join() {
		return "login/join";
	}
	
}
