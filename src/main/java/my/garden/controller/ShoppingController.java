package my.garden.controller;

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
import my.garden.dto.ShopListDTO;
import my.garden.service.ShoppingService;

@Controller
public class ShoppingController {

	@Autowired
	HttpSession session;

	@Autowired
	ShoppingService shsvc;

	@RequestMapping("cart")
	public String toCart(HttpServletRequest request) {
		String id = (String)session.getAttribute("loginId");		
		try {
			Thread.sleep(500);
			request.setAttribute("list", shsvc.getCartList(id));
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "shopping/cart";
	}

	@ResponseBody
	@RequestMapping("cartDel")
	public void cartDel(HttpServletRequest request, CartDTO dto) {
		String id = (String)session.getAttribute("loginId");
		System.out.println(dto.getC_p_no());
		try {
			if(shsvc.delFromCart(id, dto)>0) {
				System.out.println(id + " 님의 장바구니 품목 삭제 성공");
			}
			request.setAttribute("list", shsvc.getCartList(id));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "order", method = RequestMethod.POST)
	public String toOrder(HttpServletRequest request, String productList, MembersDTO dto) {
		String id = (String)session.getAttribute("loginId");
		ObjectMapper mapper = new ObjectMapper();
		try {
			List<CartDTO> list = Arrays.asList(mapper.readValue(productList, CartDTO[].class));
			request.setAttribute("loginDTO", shsvc.getMember(dto, id));
			request.setAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "shopping/order";
	}
	
	@RequestMapping(value = "orderComplete")
	public String orderComplete(HttpServletRequest request, String orderList) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			List<ShopListDTO> list = Arrays.asList(mapper.readValue(orderList, ShopListDTO[].class));
			shsvc.insertIntoShopList(list);			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}	
		return "shopping/orderComplete";
	}

}

