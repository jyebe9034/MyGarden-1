package my.garden.dao;

import java.util.List;

import my.garden.dto.ProductsDTO;

public interface ProductsDAO {
	public int insertProducts(ProductsDTO dto);
	public int insertImageFile(String title, String imgs);
	public List<ProductsDTO> selectProductsListByCategory(int start, int end, String Category);
	public List<ProductsDTO> selectProductsListByPage(int start, int end);
	public ProductsDTO selectOneProduct(int pnumber);
	public int deleteProduct(int p_no);
	public int deleteImagePath(String img_p_title);
	public int updateProduct(ProductsDTO dto);
	public List<ProductsDTO> selectProductsListByKeyword(int start, int end, String keyword);
}
