package my.garden.dao;

import my.garden.dto.PrivateGardenDTO;

public interface PrivateGardenDAO {
	public PrivateGardenDTO selectPrivateGardenInfo(String id);
}
