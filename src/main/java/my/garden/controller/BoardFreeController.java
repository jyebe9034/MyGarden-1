package my.garden.controller;


import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import my.garden.dto.BoardFreeDTO;
import my.garden.dto.CommentFreeDTO;
import my.garden.service.BoardFreeService;

@Controller
public class BoardFreeController {

	@Autowired
	private BoardFreeService dao;

	@RequestMapping("/")
	public String home() {
		return "home";
	}

	@RequestMapping("boardFreeList")
	public String boardFreeList(String page, HttpServletRequest request) {

		int nowPage = Integer.parseInt(page);
		if(page==null) {
			nowPage=1;
		}

		request.setAttribute("page", page);

		int start = (nowPage*4)-3;
		int end = nowPage*4;

		List<BoardFreeDTO> list = dao.serviceList(start, end);
		try {
			List<String> navi = dao.serviceGetBoardNavi(nowPage);
			request.setAttribute("navi", navi);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("list", list);
		
		//댓글 갯수 관련
		int count = dao.serviceBoardCountAll();
		int[] cmtCount = new int [count];
		for(int i = 0; i < count; i++) {	
				int tmp = dao.serviceCmtCountAll(i+1);
				System.out.println(i+":"+tmp);
				cmtCount[i] = tmp;
			}		
		request.setAttribute("cmtCount", cmtCount);	
		return "boardFree/boardFreeList";
	}

	@RequestMapping("boardFreeWrite")
	public String boardFreeWrite() {
		return "boardFree/boardFreeWrite";
	}

	@RequestMapping("boardFreeWriteProc")
	public String boardFreeWriteProc(BoardFreeDTO dto, HttpServletRequest request) {
		int result = dao.serviceWrite(new BoardFreeDTO(0, dto.getBf_title(), "yeonji", dto.getBf_content(), 0, null, 0, null, 0));
		request.setAttribute("result", result);
		return "boardFree/boardFreeWriteView";
	}

	@RequestMapping("boardFreeWriteView")
	public String boardFreeWriteView() {
		return "boardFree/boardFreeWriteView";
	}

	@RequestMapping("boardFreeRead")
	public String boardFreeRead(int no, String cmtPage, HttpServletRequest request) {
		request.setAttribute("page", dao.serviceRead(no)); //글번호에 해당하는 페이지dto

		//댓글관련
		int currentPage = 0; 
		if(cmtPage == null) {
			int lastPage=0;
			if(dao.serviceCmtCountAll(no)%5==0) {
				lastPage=(dao.serviceCmtCountAll(no)/5);
			}else {
				lastPage=(dao.serviceCmtCountAll(no)/5)+1;
			}
			System.out.println("마지막 댓글페이지:"+lastPage);
			currentPage=lastPage;
		}else {
			currentPage = Integer.parseInt(cmtPage); 
		}
		
		int start = (currentPage*5)-4;
		int end = currentPage*5;
		try {
			List<String> navi = dao.serviceGetCmtNavi(currentPage, no);
			request.setAttribute("navi", navi);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<CommentFreeDTO> list = dao.serviceCmtList(no, start, end);
		System.out.println(list.size());
		request.setAttribute("list", list);
		return "boardFree/boardFreeRead";
	}

	@ResponseBody
	@RequestMapping("freeCmtWrite")
	public Map<String, Object> freeCmtWrite(int cf_bf_no, String content, String cmtPage, HttpServletRequest request) {		
		CommentFreeDTO dto = new CommentFreeDTO(cf_bf_no, 0, "yeonji", "y@gmail.com", null, content, null);
		dao.serviceCmtWrite(dto); //1.댓글 등록		
		int currentPage=0;
		if(cmtPage.equals("")) {
			int lastPage=0;
			if(dao.serviceCmtCountAll(cf_bf_no)%5==0) {
				lastPage=(dao.serviceCmtCountAll(cf_bf_no)/5);
			}else {
				lastPage=(dao.serviceCmtCountAll(cf_bf_no)/5)+1;
			}
			System.out.println("마지막 댓글페이지:"+lastPage);
			currentPage=lastPage;
		}else {	
			currentPage = Integer.parseInt(cmtPage);
		}
		
		Map<String, Object> map = new HashMap<>(); //AJAX 리턴값에 담아 보낼 용도
		map.put("page", currentPage);//네비 색 칠하는 용도
		
		
		int start = (currentPage*5)-4;
		int end = currentPage*5;
		List<CommentFreeDTO> list = dao.serviceCmtList(cf_bf_no, start, end); //2.댓글 등록후 새로운 댓글 리스트 뽑기
		try {
			List<String> navi = dao.serviceGetCmtNavi(currentPage, cf_bf_no);
			map.put("navi", navi);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(int i=0 ; i<list.size();i++) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String stringdate = sdf.format(list.get(i).getCf_writedate());
			list.get(i).setCf_stringdate(stringdate);
		}
	
		map.put("list", list);
		return map;
	}
}
