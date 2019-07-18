package my.garden.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@Autowired
	HttpSession session;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
//		return "test";
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
