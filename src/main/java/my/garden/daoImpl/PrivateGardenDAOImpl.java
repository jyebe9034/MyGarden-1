package my.garden.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import my.garden.dao.PrivateGardenDAO;
import my.garden.dto.PrivateGardenDTO;

@Repository
public class PrivateGardenDAOImpl implements PrivateGardenDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public PrivateGardenDTO selectPrivateGardenInfo(String g_email) {
		try {
			 return sst.selectOne("PrivateGardenDAO.selectMyGardenInfo", g_email);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
