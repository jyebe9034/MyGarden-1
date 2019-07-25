package my.garden.service;

import java.util.List;

import my.garden.dto.ProductsDTO;

public interface ProductsService {
	public int insertProductsService(ProductsDTO dto);
	public int insertImageFileService(String title, String imgs);
	public List<ProductsDTO> selectProductsListByCategoryService(int start, int end, String category);
	public List<ProductsDTO> selectProductsListByPageService(int start, int end);
	public ProductsDTO selectOneProductService(int pnumber);
	public int deleteProductService(int pnumber);
	public int updateProductService(ProductsDTO dto);
	public List<ProductsDTO> selectProductsListByKeywordService(int start, int end, String keyword);
	public List<String> selectTitlesByCategoryService(String p_category)throws Exception;
}
