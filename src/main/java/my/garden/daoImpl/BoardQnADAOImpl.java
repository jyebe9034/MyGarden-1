package my.garden.daoImpl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import my.garden.dao.BoardQnADAO;
import my.garden.dto.BoardQnADTO;
import my.garden.dto.BoardReviewDTO;


@Repository
public class BoardQnADAOImpl implements BoardQnADAO{
	@Autowired
	private SqlSessionTemplate sst;
	
	public int writeQnA(BoardQnADTO dto) {	//글작성	
		return sst.insert("boardQnAMB.writeQnA",dto);
	}
	
	public List<BoardQnADTO> qnaList(int bq_p_no, int startNum, int endNum){ //상세페이지에서 Q&A 목록
		System.out.println("dao왔음");
		Map<String,Integer> map = new HashMap<>();
		map.put("bq_p_no", bq_p_no);
		map.put("startNum",startNum);
		map.put("endNum", endNum);
		return sst.selectList("boardQnAMB.qnaList",map);
	}

	public int qnaCount(int bq_p_no) { //상세페이지에서 총  Q&A 개수(상품별  Q&A 개수)
		return sst.selectOne("boardQnAMB.qnaCount", bq_p_no);
	}


	/*페이지 네비게이터*/
	public String getNavi(int qnaCurrentPage,int bq_p_no){

		int recordTotalCount = qnaCount(bq_p_no);
		int recordCountPerPage = 5; //5개의 글이 보이게 한다.	
		int naviCountPerPage = 5; //5개의 네비가 보이게 한다.

		int pageTotalCount = recordTotalCount / recordCountPerPage;
		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount++;
		}

		//현재  페이지 오류 검출 및 정정
		/*보안코드 : 현재페이지가 1보다 작다면 1로, 전체페이지보다 크다면 전체페이지(pageTotalCount)로 표시하겠다*/
		if(qnaCurrentPage < 1) {
			qnaCurrentPage = 1;
		}else if(qnaCurrentPage > pageTotalCount) {
			qnaCurrentPage = pageTotalCount;
		}
		int startNavi = (qnaCurrentPage - 1)/naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage - 1); 

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		System.out.println("현재 위치 : " + qnaCurrentPage);
		System.out.println("네비 시작 : " + startNavi);
		System.out.println("네비 끝 : " + endNavi);

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) { 
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();

		if(needPrev) {
			int prevStartNavi = startNavi-1;
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"reviewAndQnA?br_p_no=1&currentPage=1&qnaCurrentPage="+prevStartNavi+"\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>");

		}
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<li class=\"page-item\"><a class=\"page-link pageNumber\" href=\"reviewAndQnA?br_p_no=1&currentPage=1&qnaCurrentPage="+ i +"\">" + i + "</a></li>");
		}
		if(needNext) {
			int nextEndNavi = endNavi+1;
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"reviewAndQnA?br_p_no=1&currentPage=1&qnaCurrentPage="+ nextEndNavi++ +"\""+ 
					"							aria-label=\"Next\"> <span aria-hidden=\"true\">&raquo;</span>" + 
					"						</a></li>");
		}

		return sb.toString();
	}


	
}
