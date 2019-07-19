package my.garden.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import my.garden.dao.AdminDAO;
import my.garden.dto.AdminMemDTO;
import my.garden.dto.ShopListDTO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminDAO dao;
	
	@RequestMapping("adminIndex")
	public String adminIndex(HttpServletRequest request) {
		List<AdminMemDTO> member = dao.allMembers();
		request.setAttribute("member", member);
		int totalSale = dao.totalSale();
		int totalCancel = dao.totalCancel();
		int realSale = totalSale - totalCancel;
		request.setAttribute("totalSale", totalSale);
		request.setAttribute("totalCancel", totalCancel);
		request.setAttribute("realSale", realSale);
		
		List<ShopListDTO> popular = dao.popularProduct();
		request.setAttribute("popular", popular);
		int totalCount = dao.totalSaleCount();
		
		List<Long> count = new ArrayList<>();
		for(int i=0; i<5; i++) {
		System.out.println(Math.round(((double)popular.get(i).getS_p_count()/totalCount)*100));
		count.add(Math.round(((double)popular.get(i).getS_p_count()/totalCount)*100));
		}
		request.setAttribute("count", count);
		return "forAdmin/adminIndex";
	}
	 
	@RequestMapping("adminStat")
	public String adminStat() {
		return "forAdmin/adminStat";
	}
	
	@RequestMapping("adminMembers")
	public String adminMember(HttpServletRequest request) {
		List<AdminMemDTO> member = dao.allMembers();
		request.setAttribute("member", member);
		return "forAdmin/adminMembers";
	}

}
