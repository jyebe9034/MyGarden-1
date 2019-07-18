package my.garden.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import my.garden.dto.CartDTO;
import my.garden.dto.MembersDTO;
import my.garden.dto.ShopListDTO;

@Component
public class ShoppingDAO {

	@Autowired
	private SqlSessionTemplate sst;

	public List<CartDTO> selectCartList(String userId) throws Exception{
		return sst.selectList("ShoppingDAO.selectCartList", userId);
	}
	
	public int delFromCart(CartDTO dto) throws Exception{
		return sst.delete("ShoppingDAO.delFromCart", dto);
	}
	
	public int delExpiredCart() throws Exception{
		return sst.delete("ShoppingDAO.delExpiredCart");
	}
	
	public MembersDTO selectMember(MembersDTO dto, String id) throws Exception{
		dto.setM_email(id);
		return sst.selectOne("LoginDAO.memSelectAll", dto);
	}
	
	public int insertIntoShopList(ShopListDTO dto) throws Exception{
		return sst.insert("ShoppingDAO.insertIntoShopList", dto);
	}
	
	public void delCartOrderd(String id, String title) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("title", title);
		sst.delete("ShoppingDAO.delCartOrderd", map);
	}
	
	public List<ShopListDTO> selectOrderList(ShopListDTO dto) throws Exception{
		return sst.selectList("ShoppingDAO.selectOrderList", dto);
	}
	
	public List<Long> selectOrderNo(String id) throws Exception{
		return sst.selectList("ShoppingDAO.selectOrderNo", id);
	}
	
	public int insertIntoCart(CartDTO dto) throws Exception{
		return sst.insert("ShoppingDAO.insertIntoCart", dto);
	}
	
	public int isCartExist(int c_p_no) throws Exception{
		return sst.selectOne("ShoppingDAO.isCartExist", c_p_no);
	}
	
	public int updateCart(CartDTO dto) throws Exception{
		return sst.update("ShoppingDAO.updateCart", dto);
	}
	
	
	
	
}
