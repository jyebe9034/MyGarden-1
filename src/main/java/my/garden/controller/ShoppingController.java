package my.garden.controller;

import java.text.SimpleDateFormat;
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
import my.garden.dto.SubscribeDTO;
import my.garden.service.ProductsService;
import my.garden.service.ShoppingService;

@Controller
public class ShoppingController {

	@Autowired
	HttpSession session;

	@Autowired
	ShoppingService shsvc;
	
	@Autowired
	private ProductsService pdsvc;

	@RequestMapping("cart")
	public String toCart(HttpServletRequest request) {
		String id = (String)session.getAttribute("loginId");		
		try {
			Thread.sleep(500);
			if(id!=null) {
				request.setAttribute("list", shsvc.getCartList(id));
			}
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
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			request.setAttribute("orderDate", sdf.format(System.currentTimeMillis()));
			request.setAttribute("loginDTO", shsvc.getMember(dto, id));
			request.setAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "shopping/order";
	}

	@RequestMapping(value = "orderComplete", method = RequestMethod.POST)
	public String orderComplete(HttpServletRequest request, String orderList) {
		String id = (String)session.getAttribute("loginId");		
		try {
			ObjectMapper mapper = new ObjectMapper();
			Long orderNo = System.currentTimeMillis();
			List<ShopListDTO> list = Arrays.asList(mapper.readValue(orderList, ShopListDTO[].class));
			shsvc.insertIntoShopList(list, orderNo, id);		
			request.setAttribute("orderNo", orderNo);
			request.setAttribute("orderDTO", list.get(0));
			request.setAttribute("list", list);

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}	
		return "shopping/orderComplete";
	}

	@ResponseBody
	@RequestMapping(value = "insertCart", method = RequestMethod.POST)
	public void insertCart(CartDTO dto) {
		String id = (String)session.getAttribute("loginId");
		dto.setC_m_email(id);
		try {
			shsvc.insertIntoCart(dto);
		}catch(Exception e) {
			e.printStackTrace();
		}
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
	public String toShipping(HttpServletRequest request) {

		return "shopping/shipping";
	}

	@RequestMapping("subscription")
	public String toSubscribe(HttpServletRequest request, MembersDTO dto) {
		String id = (String)session.getAttribute("loginId");

		try {
			if(id!=null) {
				request.setAttribute("loginDTO", shsvc.getMember(dto, id));
			}
			request.setAttribute("vagetables", pdsvc.selectTitlesByCategoryService("vagetable"));
			request.setAttribute("fruits", pdsvc.selectTitlesByCategoryService("fruit"));
			request.setAttribute("eggs", pdsvc.selectTitlesByCategoryService("egg"));
			request.setAttribute("grains", pdsvc.selectTitlesByCategoryService("grain"));
			request.setAttribute("sources", pdsvc.selectTitlesByCategoryService("source"));
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "subscription/subscription";
	}

	@RequestMapping(value = "subsComplete", method = RequestMethod.POST)
	public String subsComplete(HttpServletRequest request, SubscribeDTO sbdto, MembersDTO dto) {
		String id = (String)session.getAttribute("loginId");		
		try {					
			shsvc.insertSubscribe(sbdto, id);
			if(sbdto.getSb_category().equals("나만의 박스")) {
				sbdto.setSb_category("나만의 박스(구성 : " + sbdto.getSb_component1() + ", " + 
						sbdto.getSb_component2() + ", " + sbdto.getSb_component3() + ")");
			}
			request.setAttribute("subsDTO", sbdto);
			request.setAttribute("loginDTO", shsvc.getMember(dto, id));
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}	
		return "shopping/subsComplete";
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
	
}

