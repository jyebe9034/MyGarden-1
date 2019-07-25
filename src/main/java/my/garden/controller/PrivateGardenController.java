package my.garden.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import my.garden.dto.PrivateGardenDTO;
import my.garden.service.PrivateGardenService;

@Controller
public class PrivateGardenController {

	@Autowired
	HttpSession session;
	
	@Autowired 
	private PrivateGardenService gservice;
	
	@RequestMapping("privateGarden")
	public String privateGarden(Model model) {
		String id = (String)session.getAttribute("loginId");
		if(id == null) {
			return "alerts/privateIdCheck";
		}else {
			try {
				PrivateGardenDTO dto = gservice.selectPrivateGardenInfoService(id);
				if(dto == null) {
					return "privategarden/firstGuide";
				}else {
					model.addAttribute("result", dto);
					return "privategarden/privateGardenManage";
				}
			}catch(Exception e) {
				e.printStackTrace();
				return "error";
			}
		}
	}
	
	@RequestMapping("toSelectHurb")
	public String toSelectHurb() {
		return "privategarden/selectHurb";
	}
	
	@RequestMapping("toConfirmHurb")
	public String insertPrivateGarden(String hurb) {
		String id = (String)session.getAttribute("loginId");
		try {
			int result = gservice.insertPrivateGardenService(id, hurb);
			if(result > 0) {
				return "redirect:/privateGarden";				
			}else {
				return "error";
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="updateState", produces="text/html;charset=utf8")
	public String updateState(String light, String humid, String temper) {
		String id = (String)session.getAttribute("loginId");
		int temp = Integer.parseInt(temper);
		try {
			int result = gservice.updatePrivateGardenService(id,light,humid,temp);
			if(result > 0) {
				return "잘 다녀옴";
			}else {
				return "문제가 발생함";
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
}
