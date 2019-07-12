package my.garden.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import my.garden.dto.BoardReviewDTO;
import my.garden.service.BoardReviewService;



@Controller
public class BoardReviewAndQnAController {

	@Autowired
	private BoardReviewService service;
	
	@RequestMapping("reviewAndQnA")
	public String reviewAndQnA(HttpServletRequest request,int currentPage, int br_p_no) {	 //여기!!
		
		
        currentPage = Integer.parseInt(request.getParameter("currentPage"));
		br_p_no = Integer.parseInt(request.getParameter("br_p_no"));
//      int recordCountPerPage = 10;
//      int naviCountPerPage = 10;
      
		int startNum = (5 * currentPage) - 4;
        int endNum = startNum + 4;
		
		System.out.println("startNum : " + startNum);
		
	
		System.out.println("서비스왔음 ㅜ");
		System.out.println("p_no : " + br_p_no);
		List<BoardReviewDTO> reviewList = null;
		try {
			request.setAttribute("reviewList", service.reviewList(br_p_no, startNum, endNum));
			request.setAttribute("getNavi", service.getNavi(currentPage, br_p_no));
			request.setAttribute("currentPage", currentPage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/boardProducts/reviewAndQnA";
	}
	
	@RequestMapping("reviewWriteForm")
	public String reviewWriteForm() {
		return "/boardProducts/reviewWriteForm";
	}
	
	@RequestMapping("writeReview")
	public String writeReview(BoardReviewDTO dto, MultipartFile image) {
		try {
			service.writeReview(dto, image);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("controller");
		return "redirect:reviewAndQnA?br_p_no=1&currentPage=1"; //나중에 고치기..글번호
	}
	
	@ResponseBody
	@RequestMapping("recommendCountUp")
	public int recommendCountUp(HttpServletRequest request, BoardReviewDTO dto) {
		int br_no = Integer.parseInt(request.getParameter("br_no"));
		int br_recommend = Integer.parseInt(request.getParameter("br_recommend"));
		System.out.println("br_no : " + br_no);
		System.out.println("br_recommend : " + br_recommend);
		
		int result = br_recommend;
		try {
			result = br_recommend+1;
			System.out.println("set할 result값 : " + result);
			dto.setBr_recommend(result);
			System.out.println("set한 후 recommend값 : " + dto.getBr_recommend());
			
			service.RecommendCountUp(result, br_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
	}

}
