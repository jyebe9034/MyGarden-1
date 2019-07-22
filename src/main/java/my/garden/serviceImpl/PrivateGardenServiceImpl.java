package my.garden.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.garden.dao.PrivateGardenDAO;
import my.garden.dto.PrivateGardenDTO;
import my.garden.service.PrivateGardenService;

@Service
public class PrivateGardenServiceImpl implements PrivateGardenService {
	
	@Autowired
	private PrivateGardenDAO pdao;
	
	public PrivateGardenDTO selectPrivateGardenInfoService(String id) throws Exception {
		return pdao.selectPrivateGardenInfo(id);
	}
	
	public int insertHurbInfo(String id, String hurb) throws Exception {
		return pdao.insertHurbInfo(id, hurb);
	}
}
