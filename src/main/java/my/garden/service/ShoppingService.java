package my.garden.service;

import java.util.List;

import my.garden.dto.CartDTO;
import my.garden.dto.MembersDTO;
import my.garden.dto.ShopListDTO;

public interface ShoppingService {
	
	public List<CartDTO> getCartList(String userId) throws Exception;
	
	public int delFromCart(String userId, CartDTO dto) throws Exception;
	
	public MembersDTO getMember(MembersDTO dto, String id) throws Exception;
	
	public void insertIntoShopList(List<ShopListDTO> list, Long orderNo, String id) throws Exception;

	public List<List<ShopListDTO>> getOrderList(String id) throws Exception;
	

}
