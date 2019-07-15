package my.garden.service;

import java.util.List;

import my.garden.dto.CartDTO;
import my.garden.dto.MembersDTO;

public interface ShoppingService {
	
	public List<CartDTO> getCartList(String userId) throws Exception;
	
	public int delFromCart(String userId, CartDTO dto) throws Exception;
	
	public MembersDTO getMember(MembersDTO dto, String id) throws Exception;
}
