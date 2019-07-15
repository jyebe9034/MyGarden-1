package my.garden.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public int insertImageFile(String title, String imgs) {
		String[] info = new String[] {title, imgs};
		try {
			return sst.insert("ProductsDAO.insertImageFile", info);
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public List<ProductsDTO> selectProductsListByCategory(int start, int end, String category) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("category", category);
		try {
			return sst.selectList("ProductsDAO.selectProductsListByCategory", map);
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
