package my.garden.dao;

import java.util.List;

import my.garden.dto.AdminMemDTO;
import my.garden.dto.ShopListDTO;

public interface AdminDAO {
	public List<AdminMemDTO> allMembers();
	public int totalSale();
	public int totalCancel();
	public List<ShopListDTO> popularProduct();
	public int totalSaleCount();
	public int statCheck(String stat);
}
