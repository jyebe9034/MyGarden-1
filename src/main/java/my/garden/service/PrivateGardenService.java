package my.garden.service;

import my.garden.dto.PrivateGardenDTO;

public interface PrivateGardenService {
	public PrivateGardenDTO selectPrivateGardenInfoService(String id) throws Exception;
	public int insertPrivateGardenService(String id, String hurb) throws Exception;
}
