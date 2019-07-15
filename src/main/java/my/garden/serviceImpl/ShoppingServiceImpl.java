package my.garden.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import my.garden.dao.ShoppingDAO;
import my.garden.dto.CartDTO;
import my.garden.service.ShoppingService;

@Component
public class ShoppingServiceImpl implements ShoppingService{
	
	@Autowired
	ShoppingDAO dao;
	
	public List<CartDTO> getCartList(String userId) throws Exception{
		return dao.selectCartList(userId);
	}

	public int delFromCart(String userId, CartDTO dto) throws Exception {
		dto.setC_m_email(userId);
		return dao.delFromCart(dto);
	}
}
