package my.garden.controller;


import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import my.garden.dto.BoardFreeDTO;
import my.garden.dto.CommentFreeDTO;
import my.garden.service.BoardFreeService;

@Controller
public class BoardFreeController {


	@Autowired
	private BoardFreeService dao;

	@Autowired
	HttpSession session;

	@RequestMapping("/")
	public String home() {
		return "home";
	}

	@RequestMapping("boardFreeList")
	public String boardFreeList(String page, HttpServletRequest request) {
		int nowPage=0;
		if(page==null) {
			nowPage=1;
		}else {
			nowPage = Integer.parseInt(page);
		}

		request.setAttribute("page", nowPage);

		int start = (nowPage*4)-3;
		int end = nowPage*4;

		List<BoardFreeDTO> list = dao.serviceList(start, end);
		try {
			List<String> navi = dao.serviceGetBoardNavi(nowPage);
			request.setAttribute("navi", navi);
		} catch (Exception e) {
			e.printStackTrace();
		}

		//댓글 갯수 관련
		int count = dao.serviceBoardCountAll();
		for(int i = 0; i < count; i++) {	
			int bf_no=list.get(i).getBf_no();
			int tmp = dao.serviceCmtCountAll(bf_no);
			System.out.println(i+":"+bf_no+":"+tmp);
			list.get(i).setBf_cmtcount(tmp);
		}		

		request.setAttribute("list", list);	
		return "boardFree/boardFreeList";
	}

	@RequestMapping("boardFreeWrite")
	public String boardFreeWrite() {
		return "boardFree/boardFreeWrite";
	}

	@RequestMapping("boardFreeDelete")
	public String boardFreeDelete(int no, HttpServletRequest request) {
		int result = dao.serviceDelete(no);
		request.setAttribute("result", result);
		return "boardFree/boardFreeDeleteProc";
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

		int lastPage=0;
		if(cmtPage == null) {		
			if(dao.serviceCmtCountAll(no)%10==0) {
				lastPage=(dao.serviceCmtCountAll(no)/10);
			}else {
				lastPage=(dao.serviceCmtCountAll(no)/10)+1;
			}
			System.out.println("마지막 댓글페이지:"+lastPage);
			request.setAttribute("now", lastPage);		
		}else {
			lastPage = Integer.parseInt(cmtPage); 
		}

		int start = (lastPage*10)-9;
		int end = lastPage*10;
		try {
			List<String> navi = dao.serviceGetCmtNavi(lastPage, no);
			request.setAttribute("navi", navi);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<CommentFreeDTO> list = dao.serviceCmtList(no, start, end);
		System.out.println(list.size());
		for(int i=0 ; i<list.size();i++) {
			SimpleDateFormat sdf = new SimpleDateFormat("MM-dd HH:mm");
			String stringdate = sdf.format(list.get(i).getCf_writedate());
			list.get(i).setCf_stringdate(stringdate);
		}
		request.setAttribute("list", list);
		return "boardFree/boardFreeRead";
	}

	@ResponseBody
	@RequestMapping("freeCmtWrite")
	public Map<String, Object> freeCmtWrite(int no, String content, HttpServletRequest request) {		
		CommentFreeDTO dto = new CommentFreeDTO(no, 0, "yeonji", "y@gmail.com", null, content, null);
		dao.serviceCmtWrite(dto); //1.댓글 등록		
		int lastPage=0;
		if(dao.serviceCmtCountAll(no)%5==0) {
			lastPage=(dao.serviceCmtCountAll(no)/5);
		}else {
			lastPage=(dao.serviceCmtCountAll(no)/5)+1;
		}
		System.out.println("마지막 댓글페이지:"+lastPage);

		Map<String, Object> map = new HashMap<>(); //AJAX 리턴값에 담아 보낼 용도

		int start = (lastPage*10)-9;
		int end = lastPage*10;
		List<CommentFreeDTO> list = dao.serviceCmtList(no, start, end); //2.댓글 등록후 새로운 댓글 리스트 뽑기
		try {
			List<String> navi = dao.serviceGetCmtNavi(lastPage, no);
			map.put("navi", navi);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(int i=0 ; i<list.size();i++) {
			SimpleDateFormat sdf = new SimpleDateFormat("MM-dd HH:mm");
			String stringdate = sdf.format(list.get(i).getCf_writedate());
			list.get(i).setCf_stringdate(stringdate);
		}
		map.put("list", list);
		return map;
	}

	@ResponseBody
	@RequestMapping("freeCmtNaviProc")
	public Map<String, Object> freeCmtNaviProc(int no, int page){
		int start = (page*10)-9;
		int end= page*10;
		List<CommentFreeDTO> list = dao.serviceCmtList(no, start, end);
		for(int i=0 ; i<list.size();i++) {
			SimpleDateFormat sdf = new SimpleDateFormat("MM-dd HH:mm");
			String stringdate = sdf.format(list.get(i).getCf_writedate());
			list.get(i).setCf_stringdate(stringdate);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		try {
			List<String> navi = dao.serviceGetCmtNavi(page, no);
			map.put("navi", navi);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		map.put("page", page);
		return map;
	}

	@ResponseBody
	@RequestMapping("freeCmtModify")
	public Map<String,Object> freeCmtModify(int no, int seq, String cmt){
		System.out.println(seq+":"+cmt);
		int result = dao.serviceCmtModify(cmt, seq);
		Map<String,Object> map = new HashMap<>();
		map.put("result", result);
		map.put("cmt", cmt);
		return map;
	}

	@ResponseBody
	@RequestMapping("freeCmtDelete")
	public Map<String,Object> freeCmtDelete(int seq, int no, String page){
		int nowPage=0;
		int result = dao.serviceCmtDelete("cf_no",seq); //1. 댓글 삭제
		if(page==null) {
			if(dao.serviceCmtCountAll(no)%10==0) {
				nowPage=(dao.serviceCmtCountAll(no)/10);		
			}else {
				nowPage=(dao.serviceCmtCountAll(no)/10)+1;			
			}
		}else {
			nowPage=Integer.parseInt(page);
		}
		System.out.println("현재 댓글페이지:"+nowPage);
		
		//2. 댓글리스트
		int start = (nowPage*10)-9;
		int end= nowPage*10;
		List<CommentFreeDTO> list = dao.serviceCmtList(no, start, end);
		for(int i=0 ; i<list.size();i++) {
			SimpleDateFormat sdf = new SimpleDateFormat("MM-dd HH:mm");
			String stringdate = sdf.format(list.get(i).getCf_writedate());
			list.get(i).setCf_stringdate(stringdate);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		try {
			List<String> navi = dao.serviceGetCmtNavi(nowPage, no);
			map.put("navi", navi);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		map.put("page", page);	
		map.put("result", result);	
		return map;
	}
}
