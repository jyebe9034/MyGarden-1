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

import my.garden.dao.BoardReviewDAO;
import my.garden.dto.BoardReviewDTO;

@Repository
public class BoardReviewDAOImpl implements BoardReviewDAO{
	@Autowired
	private SqlSessionTemplate sst;
	@Autowired
	private HttpSession session;

	public int writeReview(BoardReviewDTO dto, MultipartFile image) {	//글작성	
		String id = "aa"; //나중에 아이디 받아오기!!!!!★
		int br_p_no = 1;//글번호 받아오기!!!!!★
		dto.setBr_p_no(br_p_no);
		
		System.out.println("이미지" + image);
		String path = "D:\\SpringOnly\\finalProject\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\MyGarden\\resources\\";
		File dir = new File(path + id + "/"); //폴더경로
		//System.out.println("폴더 존재? : " + dir.isDirectory());
		if(!dir.isDirectory()) { // 폴더가 있는지 확인.
			System.out.println("폴더생성");
			dir.mkdirs(); // 없으면 생성
		}
		String resourcePath = session.getServletContext().getRealPath("/resources/"+id);
		System.out.println("resourcePath : " + resourcePath);

		File newFile = new File(resourcePath + "/" + System.currentTimeMillis() + "_review.png");
		try {
			image.transferTo(newFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String filePath = "/resources/"+ id +"/" + newFile.getName();
		System.out.println("filePath : " + filePath);
		dto.setBr_imagepath(filePath);


		return sst.insert("boardReviewMB.writeReview",dto);
	}

	public List<BoardReviewDTO> reviewList(int br_p_no, int startNum, int endNum){ //상세페이지에서 후기목록
		System.out.println("dao왔음");
		Map<String,Integer> map = new HashMap<>();
		map.put("br_p_no", br_p_no);
		map.put("startNum",startNum);
		map.put("endNum", endNum);
		return sst.selectList("boardReviewMB.reviewList",map);
	}

	public int reviewCount(int br_p_no) { //상세페이지에서 총 후기 개수(상품별 후기 개수)
		return sst.selectOne("boardReviewMB.reviewCount", br_p_no);
	}


	/*페이지 네비게이터*/
	public String getNavi(int currentPage,int br_p_no){

		int recordTotalCount = reviewCount(br_p_no);
		int recordCountPerPage = 5; //5개의 글이 보이게 한다.	
		int naviCountPerPage = 5; //5개의 네비가 보이게 한다.

		int pageTotalCount = recordTotalCount / recordCountPerPage;
		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount++;
		}

		//현재  페이지 오류 검출 및 정정
		/*보안코드 : 현재페이지가 1보다 작다면 1로, 전체페이지보다 크다면 전체페이지(pageTotalCount)로 표시하겠다*/
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		int startNavi = (currentPage - 1)/naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage - 1); 

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		System.out.println("현재 위치 : " + currentPage);
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
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"reviewAndQnA?br_p_no=1&currentPage="+prevStartNavi+"\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>");

		}
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<li class=\"page-item\"><a class=\"page-link pageNumber\" href=\"reviewAndQnA?br_p_no=1&currentPage="+ i +"\">" + i + "</a></li>");
		}
		if(needNext) {
			int nextEndNavi = endNavi+1;
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"reviewAndQnA?br_p_no=1&currentPage="+ nextEndNavi++ +"\""+ 
					"							aria-label=\"Next\"> <span aria-hidden=\"true\">&raquo;</span>" + 
					"						</a></li>");
		}

		return sb.toString();
	}

	/*도움돼요 +씩 카운트*/
	public int RecommendCountUp(int br_recommend, int br_no) {
		Map<String,Integer> map = new HashMap<>();
		map.put("br_recommend", br_recommend);
		map.put("br_no",br_no);
		return sst.update("boardReviewMB.recommendCountUp",map);
	}


}
