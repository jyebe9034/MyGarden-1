package my.garden.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import my.garden.dto.CartDTO;

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
	
	
}
