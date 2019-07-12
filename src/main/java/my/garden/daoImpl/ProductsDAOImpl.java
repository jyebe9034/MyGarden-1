package my.garden.daoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import my.garden.dao.ProductsDAO;
import my.garden.dto.ProductsDTO;

@Repository
public class ProductsDAOImpl implements ProductsDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	public int insertProducts(ProductsDTO dto) {
		try {
			return sst.insert("ProductsDAO.insertProducts", dto);
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public List<ProductsDTO> selectProductsList() {
		try {
			return sst.selectList("ProductsDAO.selectProductsList");
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<ProductsDTO> selectProductsListByPage(int start, int end) {
		int[] arr = {start, end};
		try {
			return sst.selectList("ProductsDAO.selectProductsListByPage", arr);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ProductsDTO selectOneProduct(int p_no) {
		try {
			return sst.selectOne("ProductsDAO.selectOneProduct", p_no);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
