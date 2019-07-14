package my.garden.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import my.garden.dto.BoardFreeDTO;
import my.garden.dto.CommentFreeDTO;


public interface BoardFreeDAO {
	public int write(BoardFreeDTO dto);
	public List<BoardFreeDTO> list(int start, int end);
	public BoardFreeDTO read(int bf_no);
	public int delete(int bf_no);
	public int modify(int bf_no, String column, String value);
	public int boardCountAll();
	
	
	public int cmtWrite(CommentFreeDTO dto);
	public List<CommentFreeDTO> cmtList(int bf_no, int start, int end);
	public List<String> getBoardNavi(int currentPage) throws Exception;
	public List<String> getCmtNavi(int currentPage, int bf_no) throws Exception;
	public int cmtCountAll(int bf_no);
	public int cmtModify(String cf_comment, int cf_no);
	public int cmtDelete(String column, int value);
}
