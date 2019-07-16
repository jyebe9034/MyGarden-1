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
	
	
	
//	//test
//	@RequestMapping("/test2")
//	public String gender(String m_zipcode) {
//		System.out.println(m_zipcode);
//		return "test2";
//	}

	
}