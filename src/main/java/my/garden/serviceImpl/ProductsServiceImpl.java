package my.garden.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import my.garden.dao.ProductsDAO;
import my.garden.dto.ProductsDTO;
import my.garden.service.ProductsService;

@Service
public class ProductsServiceImpl implements ProductsService {

	@Autowired
	private ProductsDAO pdao;
	
	@Transactional("txManager")
	public int insertProductsService(ProductsDTO dto) {
		try {
			int result = pdao.insertProducts(dto);
			return result;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	@Transactional("txManager")
	public int insertImageFileService(String title, String imgs) {
		try {
			int result = pdao.insertImageFile(title, imgs);
			return result;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	@Transactional("txManager")
	public List<ProductsDTO> selectProductsListByCategoryService(int start, int end, String category) {
		try {
			List<ProductsDTO> result = pdao.selectProductsListByCategory(start, end, category);
			return result;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Transactional("txManager")
	public List<ProductsDTO> selectProductsListByPageService(int start, int end) {
		try {
			List<ProductsDTO> result = pdao.selectProductsListByPage(start, end);
			return result;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Transactional("txManager")
	public ProductsDTO selectOneProductService(int pnumber) {
		try {
			return pdao.selectOneProduct(pnumber);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Transactional("txManager")
	public int deleteProductService(int pnumber) {
		try {
			return pdao.deleteProduct(pnumber);
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	@Transactional("txManager")
	public int updateProductService(ProductsDTO dto) {
		try {
			return pdao.updateProduct(dto);
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
}
