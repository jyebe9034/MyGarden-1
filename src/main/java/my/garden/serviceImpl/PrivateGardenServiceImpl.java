package my.garden.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.garden.dao.LoginDAO;
import my.garden.dao.PrivateGardenDAO;
import my.garden.dto.MembersDTO;
import my.garden.dto.PrivateGardenDTO;
import my.garden.service.PrivateGardenService;

@Service
public class PrivateGardenServiceImpl implements PrivateGardenService {
	
	@Autowired
	private PrivateGardenDAO pdao;
	
	@Autowired
	private LoginDAO ldao;
	
	public PrivateGardenDTO selectPrivateGardenInfoService(String id) throws Exception {
		return pdao.selectPrivateGardenInfo(id);
	}
	
	// 애플민트 : 온도 15~20(default 18), 습도 약간 습함, 빛 강한 직사광선 아닌 햇빛
	// 바질 : 온도 25~30(default 27), 습도 약간 습함, 빛 햇빛좋아함
	// 워터크래스 : 온도 15~20(default 18), 습도 습기 좋아함, 빛 반그늘
	// 고수 : 온도 15~20(default 18), 습도 약간 습함, 빛 양지나 반양지
	// 오레가노 : 온도 15~20(default 18), 습도 적정습도, 빛 햇빛좋아함
	// 파슬리 : 온도 10~18(default 14), 습도 과습, 빛 강한 직삭광선 아닌 햇빛
	// 페퍼민트 : 온도 15~20(default 18), 습도 약간 습함, 빛 반양지
	// 타임 : 온도 16~23(default 19), 습도 약간 습함, 빛 햇빛좋아함
	// 루꼴라 : 온도 10~18(default 14), 습도 상관없음, 빛 햇빛좋아하지만 너무 강하면 잎이 뻣벗해짐
	public int insertPrivateGardenService(String id, String hurb) throws Exception {
		PrivateGardenDTO pdto;
		MembersDTO dto = ldao.memSelectAll(id);
		if(!dto.getM_grade().equals("admin")) { // 관리자가 아니라면 등급변경
			int result = pdao.updateGrade(id);
			System.out.println("등급변경 : " + result);
		}
		
		if(hurb.equals("바질(Basil")) {
			pdto = new PrivateGardenDTO(id,dto.getM_name(),hurb, 27);
		}else if(hurb.equals("파슬리(Parsley)") || hurb.equals("루꼴라(Rucola")) {
			pdto = new PrivateGardenDTO(id,dto.getM_name(),hurb, 14);
		}else if(hurb.equals("타임(Thyme")) {
			pdto = new PrivateGardenDTO(id,dto.getM_name(),hurb, 19);
		}else {
			pdto = new PrivateGardenDTO(id,dto.getM_name(),hurb, 18);
		}
		return pdao.insertPrivateGarden(pdto);
	}
}