package my.garden.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import my.garden.dao.AdminDAO;
import my.garden.dto.AdminMemDTO;
import my.garden.dto.ShopListDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	SqlSessionTemplate sst;
	
	public List<AdminMemDTO> allMembers(){
		return sst.selectList("AdminDAO.allMembers");
	}
	
	public int totalSale() {
		return sst.selectOne("AdminDAO.totalSale");
	}
	
	public int totalCancel() {
		return sst.selectOne("AdminDAO.totalCancel");
	}
	
	public List<ShopListDTO> popularProduct(){
		return sst.selectList("AdminDAO.popularProducts");
	}
	
	public int totalSaleCount() {
		return sst.selectOne("AdminDAO.totalSaleCount");
	}
}
