package my.garden.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import my.garden.dto.PrivateGardenDTO;
import my.garden.service.PrivateGardenService;

@Controller
public class PrivateGardenController {

	@Autowired
	HttpSession session;
	
	@Autowired 
	private PrivateGardenService gservice;
	
	@RequestMapping("private")
	public String toPrivate(Model model) {
		String id = (String)session.getAttribute("loginId");
		try {
			PrivateGardenDTO dto = gservice.selectPrivateGardenInfoService(id);
			if(dto == null) {
				return "privategarden/firstPrivateGarden";
			}else {
				model.addAttribute(dto);
				return "privategarden/privateGarden";
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
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
					model.addAttribute(dto);
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
			System.out.println("insertprivategarden : " + result);
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
}
