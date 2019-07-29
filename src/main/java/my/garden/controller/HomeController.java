package my.garden.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import my.garden.service.BoardReviewService;

@Controller
public class HomeController {

	@Autowired
	HttpSession session;
	@Autowired
	private BoardReviewService brService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request) {
		
		try {
			request.setAttribute("topReviews", brService.topRcmdReviews());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "home";
	}
	
	@RequestMapping("/aboutMyGarden")
	public String aboutMyGarden() {
		return "login/aboutMyGarden";
	}

	@RequestMapping("productsAdd")
	public String toProductsAdd() {
		return "products/productsAdd";
	}

	@RequestMapping("toChat")
	public String toChat() {
		return "chat/chat";
	}
	
	@ResponseBody
	@RequestMapping("/test")
	public String test() {
		return "";
	}
	
}
