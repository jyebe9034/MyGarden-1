package my.garden.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import my.garden.dto.MembersDTO;
import my.garden.dto.PrivateGardenDTO;
import my.garden.service.PrivateGardenService;
import my.garden.service.ShoppingService;
import my.garden.serviceImpl.LoginService;

@Controller
public class MypageController {
	
	@Autowired
	LoginService loginserv;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ShoppingService shsvc;
	
	@Autowired 
	private PrivateGardenService gserivce;
	
	@RequestMapping("mypageFirst")
	public String Mypage(MembersDTO dto) {
		String loginName = (String) session.getAttribute("loginName");
		if (loginName == null) {
			return "login/login";
		} else {
			String id = (String) session.getAttribute("loginId");
			session.setAttribute("memDTO", loginserv.memSelectAll(dto, id));
			return "login/mypageFirst";
		}
	}

	@RequestMapping("mypageInfo")
	public String MypageInfo(MembersDTO dto) {
		String loginName = (String) session.getAttribute("loginName");
		if (loginName == null) {
			return "login/login";
		} else {
			String id = (String) session.getAttribute("loginId");
			session.setAttribute("memDTO", loginserv.memSelectAll(dto, id));
			return "login/mypageInfo";
		}
	}
	
	@RequestMapping("orderList")
	public String toOrderList(HttpServletRequest request) {
		String id = (String)session.getAttribute("loginId");		
		try {
			request.setAttribute("listWrapper", shsvc.getOrderList(id));
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "shopping/orderList";
	}
	
	@RequestMapping("private")
	public String PrivateGarden(Model model) {
		String id = (String)session.getAttribute("loginId");
		try {
			PrivateGardenDTO dto = gserivce.selectPrivateGardenInfoService(id);
			if(dto == null) {
				return "privategarden/firstprivategarden";
			}else {
				model.addAttribute(dto);
				return "privategarden/privategarden";
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping("secretgarden")
	public String toSecretGarden() {
		return "privategarden/test01";
	}
}
