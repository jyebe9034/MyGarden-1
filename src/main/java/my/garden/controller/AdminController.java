package my.garden.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("adminView")
	public String adminView() {
		return "/admin/adminView";
	}
}
