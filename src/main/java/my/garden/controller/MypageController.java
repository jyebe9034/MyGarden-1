package my.garden.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import my.garden.dto.CalendarDTO;
import my.garden.dto.MembersDTO;
import my.garden.dto.PrivateGardenDTO;
import my.garden.dto.SubscribeDTO;
import my.garden.service.PrivateGardenService;
import my.garden.service.ShoppingService;
import my.garden.serviceImpl.LoginServiceImpl;

@Controller
public class MypageController {

	@Autowired
	LoginServiceImpl loginserv;

	@Autowired
	HttpSession session;

	@Autowired
	ShoppingService shsvc;

	@RequestMapping("/mypageFirst")
	public String Mypage(MembersDTO dto) {
		String loginName = (String)session.getAttribute("loginName");
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String[] mname = new String[]{"Ja", "Fb", "Mr", "Ap", "Ma", "Ju", "Jl", "Ag", "Sp", "Ot", "Nv", "Dc"};
		if(loginName==null) {
			return "login/login";
		}else {
			String id = (String)session.getAttribute("loginId");
			List<CalendarDTO> lists = loginserv.calendarList(id);
			session.setAttribute("memDTO", loginserv.memSelectAll(dto, id));
			session.setAttribute("cal", loginserv.getCalender(year));
			session.setAttribute("year", year);
			session.setAttribute("mm", mname);
			session.setAttribute("lists", new Gson().toJson(lists));
			return "login/mypageFirst"; 
		}
	}

	@RequestMapping("/mypageInfo")
	public String MypageInfo(MembersDTO dto) {
		String loginName = (String)session.getAttribute("loginName");
		if(loginName==null) {
			return "login/login";
		}else {
			String id = (String)session.getAttribute("loginId");
			session.setAttribute("memDTO", loginserv.memSelectAll(dto, id));
			return "login/mypageInfo";
		}
	}

	@RequestMapping("/mypageGardenChange")
	public String MypageGardenChange(MembersDTO dto, int key) {
		String id = (String)session.getAttribute("loginId");
		List<CalendarDTO> lists = loginserv.calendarList(id);
		session.setAttribute("memDTO", loginserv.memSelectAll(dto, id));
		session.removeAttribute("cal");
		session.removeAttribute("year");
		session.setAttribute("cal", loginserv.getCalender(key));
		session.setAttribute("year", key);
		session.setAttribute("lists", new Gson().toJson(lists));
		return "login/mypageFirst";
	}

	@RequestMapping("/updateInfo")
	public String updateInfo(MembersDTO dto) {
		loginserv.memUpdateAll(dto);
		return "login/mypageInfoThrough";
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

	@RequestMapping("subsList")
	public String toSubsList(HttpServletRequest request) {
		String id = (String)session.getAttribute("loginId");		
		try {
			request.setAttribute("list", shsvc.getSubsList(id));
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "shopping/subsList";
	}

	@RequestMapping(value = "subsCancel", method = RequestMethod.POST)
	public String subsCancel(HttpServletRequest request, SubscribeDTO sbdto) {
		String id = (String)session.getAttribute("loginId");	
		try {
			request.setAttribute("result", shsvc.subsCancel(id, sbdto));
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "shopping/subsCancelProc";
	}

	@RequestMapping("subsSearch")
	public String toSubsSearch(HttpServletRequest request, SubscribeDTO sbdto) {
		String id = (String)session.getAttribute("loginId");	
		try {
			request.setAttribute("list", shsvc.getSubsSearch(id, sbdto));
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "shopping/subsList";
	}

	@RequestMapping(value = "orderSearch", method = RequestMethod.POST)
	public String toOrderSearch(HttpServletRequest request, String orderDuration, String orderStatus) {
		String id = (String)session.getAttribute("loginId");	
		try {
			request.setAttribute("listWrapper", shsvc.getOrderSearch(id, orderDuration, orderStatus));
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "shopping/orderList";
	}

	@RequestMapping("shipping")
	public String toShipping(HttpServletRequest request, Long s_orderno, String s_p_title) {
		String id = (String)session.getAttribute("loginId");
		try {
			request.setAttribute("s_orderno",s_orderno);
			request.setAttribute("s_p_title",s_p_title);
			request.setAttribute("shippingDTO", shsvc.getOrderShipping(s_orderno, id).get(0));
			System.out.println(s_orderno + " : " + s_p_title);
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "shopping/shipping";
	}

}
