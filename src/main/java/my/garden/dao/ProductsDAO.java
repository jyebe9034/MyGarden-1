package my.garden.dao;

import java.util.List;

import my.garden.dto.ProductsDTO;

public interface ProductsDAO {
	public int insertProducts(ProductsDTO dto);
	public List<ProductsDTO> selectProductsList();
	public List<ProductsDTO> selectProductsListByPage(int start, int end);
	public ProductsDTO selectOneProduct(int pnumber);
}
