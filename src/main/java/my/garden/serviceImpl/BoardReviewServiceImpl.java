package my.garden.serviceImpl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import my.garden.dao.BoardReviewDAO;
import my.garden.dto.BoardReviewDTO;
import my.garden.service.BoardReviewService;

@Service
public class BoardReviewServiceImpl implements BoardReviewService{
	

	@Autowired
	private BoardReviewDAO brDao;
	
	@Transactional("txManager")
	public int writeReview(BoardReviewDTO dto, MultipartFile image) throws Exception{
		return brDao.writeReview(dto, image);
	}
	
	@Transactional("txManager")
	public List<BoardReviewDTO> reviewList(int br_p_no, int startNum, int endNum) throws Exception {
		return brDao.reviewList(br_p_no, startNum, endNum);
	}
	
	@Transactional("txManager")
	public String getNavi(int currentPage,int br_p_no) throws Exception{
		return brDao.getNavi(currentPage, br_p_no);
	}
	
	@Transactional("txManager")
	public int RecommendCountUp(int br_recommend, int br_no) throws Exception{
		return brDao.RecommendCountUp(br_recommend, br_no);
	}
	
	
}
