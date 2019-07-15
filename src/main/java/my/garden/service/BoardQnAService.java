package my.garden.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import my.garden.dto.BoardQnADTO;

public interface BoardQnAService {
	public int writeQnA(BoardQnADTO dto) throws Exception;
	
	public List<BoardQnADTO> qnaList(int bq_p_no, int startNum2, int endNum2) throws Exception;
	public int qnaCount(int bq_p_no) throws Exception;
	public String getNavi(int qnaCurrentPage,int bq_p_no) throws Exception;
	
	
}
