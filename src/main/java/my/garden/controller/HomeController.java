package my.garden.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("ProductsList")
	public String toProductsList() {
		return "products/productsList";
	}
}
