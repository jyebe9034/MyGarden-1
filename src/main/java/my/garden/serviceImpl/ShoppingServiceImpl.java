package my.garden.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import my.garden.dao.ShoppingDAO;
import my.garden.dto.CartDTO;
import my.garden.dto.MembersDTO;
import my.garden.dto.ShopListDTO;
import my.garden.dto.SubscribeDTO;
import my.garden.service.ShoppingService;

@Component
public class ShoppingServiceImpl implements ShoppingService{

	@Autowired
	ShoppingDAO dao;

	@Autowired
	ShopListDTO dto;

	public List<CartDTO> getCartList(String userId) throws Exception{
		return dao.selectCartList(userId);
	}

	@Transactional
	public int delFromCart(String userId, CartDTO dto) throws Exception {
		dto.setC_m_email(userId);
		dao.delExpiredCart();
		return dao.delFromCart(dto);
	}

	public MembersDTO getMember(MembersDTO dto, String id) throws Exception{
		return dao.selectMember(dto, id);
	}

	@Transactional
	public void insertIntoShopList(List<ShopListDTO> list, Long orderNo, String id) throws Exception {
		for(ShopListDTO dto : list) {
			dto.setS_orderno(orderNo);
			if(dto.getS_m_memo()=="") {
				dto.setS_m_memo("요청사항 없음");
			}
			dao.insertIntoShopList(dto);
			dao.delCartOrderd(id, dto.getS_p_title());
		}	
	}

	@Transactional
	public List<List<ShopListDTO>> getOrderList(String id) throws Exception{
		dao.updateShoplist();
		dto.setS_email(id);
		List<Long> orderNoList = dao.selectOrderNo(id);
		List<List<ShopListDTO>> listWrapper = new ArrayList<>();
		for(Long no : orderNoList) {
			dto.setS_orderno(no);
			listWrapper.add(dao.selectOrderList(dto));
		}		
		return listWrapper;
	}

	public int insertIntoCart(CartDTO dto) throws Exception{
		if(dao.isCartExist(dto.getC_p_no())>0) {
			return dao.updateCart(dto);			
		}else {
			return dao.insertIntoCart(dto);
		}
	}

	public List<List<ShopListDTO>> getOrderSearch(String id, String orderDuration, String orderStatus) throws Exception{	
		dto.setS_email(id);
		int duration = 0;
		if(orderDuration.equals("1주일")) {
			duration = 7;
		}else if(orderDuration.equals("1개월")) {
			duration = 30;
		}else if(orderDuration.equals("3개월")) {
			duration = 90;
		}else if(orderDuration.equals("6개월")) {
			duration = 180;
		}else if(orderDuration.equals("전체")) {
			duration = 1000;
		}

		List<Long> orderNoList = null;
		
		if(duration==1000) {
			if(orderStatus.equals("전체")) {
				orderNoList = dao.selectOrderNo(id);
			}else {
				orderNoList = dao.searchOrderNo(id, orderStatus);
			}
		}else {
			if(orderStatus.equals("전체")) {
				dto.setS_orderno_seq(duration);
				orderNoList = dao.searchOrderNoAll(dto);
			}else {
				dto.setS_orderno_seq(duration);
				dto.setS_statement(orderStatus);
				orderNoList = dao.searchOrderNoDuration(dto);
			}
		}
		
		List<List<ShopListDTO>> listWrapper = new ArrayList<>();
		for(Long no : orderNoList) {
			dto.setS_orderno(no);
			listWrapper.add(dao.selectOrderList(dto));
		}		
		return listWrapper;
	}
	
	public int insertSubscribe(SubscribeDTO sbdto, String id) throws Exception{
		sbdto.setSb_email(id);
		return dao.insertSubscribe(sbdto);
	}
	
	@Transactional
	public List<SubscribeDTO> getSubsList(String id) throws Exception{
		dao.updateSubslist();			
		return dao.selectSubsList(id);
	}


}
