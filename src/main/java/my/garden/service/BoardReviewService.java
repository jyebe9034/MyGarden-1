package my.garden.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import my.garden.dto.BoardReviewDTO;

public interface BoardReviewService {
	public int writeReview(BoardReviewDTO dto, MultipartFile image) throws Exception;
	public List<BoardReviewDTO> reviewList(int br_p_no, int startNum, int endNum) throws Exception;
	public String getNavi(int currentPage,int br_p_no) throws Exception;
	public int RecommendCountUp(int br_recommend, int br_no) throws Exception;
}
