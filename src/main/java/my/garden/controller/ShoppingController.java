package my.garden.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import my.garden.dto.CartDTO;
import my.garden.dto.MembersDTO;
import my.garden.service.ShoppingService;

@Controller
public class ShoppingController {

	@Autowired
	HttpSession session;

	@Autowired
	ShoppingService shsvc;

	@RequestMapping("cart")
	public String toCart(HttpServletRequest request) {
		MembersDTO mdto = (MembersDTO)session.getAttribute("loginId");		
		try {
			Thread.sleep(500);
			request.setAttribute("list", shsvc.getCartList(mdto.getM_email()));
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "shopping/cart";
	}
	
	@ResponseBody
	@RequestMapping("cartDel")
	public void cartDel(HttpServletRequest request, CartDTO dto) {
		MembersDTO mdto = (MembersDTO)session.getAttribute("loginId");
		System.out.println(dto.getC_p_no());
		try {
			if(shsvc.delFromCart(mdto.getM_email(), dto)>0) {
				System.out.println(mdto.getM_email() + " 님의 장바구니 품목 삭제 성공");
			}
			request.setAttribute("list", shsvc.getCartList(mdto.getM_email()));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "order", method = RequestMethod.POST)
	public String toOrder(HttpServletRequest request, String productList) {	
		 ObjectMapper mapper = new ObjectMapper();
	        try {
	            List<CartDTO> list = Arrays.asList(mapper.readValue(productList, CartDTO[].class));
	            request.setAttribute("list", list);
	        } catch (IOException e) {
	            e.printStackTrace();
				return "error";
	        }
		return "shopping/order";
	}

}

