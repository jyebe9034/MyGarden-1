package my.garden.dao;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import my.garden.dto.BoardQnADTO;
import my.garden.dto.CommentFreeDTO;
import my.garden.dto.CommentQnADTO;

public interface BoardQnADAO {
	public int writeQnA(BoardQnADTO dto) throws Exception;
	
	public List<BoardQnADTO> qnaList(int bq_p_no, int startNum2, int endNum2) throws Exception;
	public int qnaCount(int bq_p_no) throws Exception;
	public String getNavi(int qnaPage,int bq_p_no) throws Exception;
	
	public BoardQnADTO readQnA(int bq_no, String mine) throws Exception;
	public int updateQnA(BoardQnADTO dto, int bq_no) throws Exception;

	//public String checkAdmin(String m_email) throws Exception;
	public int writeComment(CommentQnADTO dto) throws Exception;
	public int setAnsY(int cq_no) throws Exception;
	
	public CommentQnADTO commentList(int cq_no) throws Exception;
	
	public int updateComment(int cq_no, String cq_comment) throws Exception;
	
	public int deleteComment(int cq_no) throws Exception;	
	public int setAnsN(int cq_no) throws Exception;
	
}
