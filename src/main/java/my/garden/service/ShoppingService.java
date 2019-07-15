package my.garden.service;

import java.util.List;

import my.garden.dto.CartDTO;

public interface ShoppingService {
	
	public List<CartDTO> getCartList(String userId) throws Exception;
	
	public int delFromCart(String userId, CartDTO dto) throws Exception;
	
}
