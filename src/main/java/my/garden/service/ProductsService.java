package my.garden.service;

import java.util.List;

import my.garden.dto.ProductsDTO;

public interface ProductsService {
	public int insertProductsService(ProductsDTO dto);
	public List<ProductsDTO> selectProductsListByCategoryService(int start, int end, String category);
	public List<ProductsDTO> selectProductsListByPageService(int start, int end);
	public ProductsDTO selectOneProductService(int pnumber);
}
