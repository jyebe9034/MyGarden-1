package my.garden.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {


	@Autowired
	private HttpSession session;
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("productsAdd")
	public String toProductsAdd() {
		return "products/productsAdd";
	}
	
	@RequestMapping("subscription")
	public String toSubscribe() {
		return "subscription/subscription";
	}

}
