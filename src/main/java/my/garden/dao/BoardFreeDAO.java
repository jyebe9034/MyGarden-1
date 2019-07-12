package my.garden.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import my.garden.dto.BoardFreeDTO;
import my.garden.dto.CommentFreeDTO;


public interface BoardFreeDAO {
	public int write(BoardFreeDTO dto);
	public List<BoardFreeDTO> list(int start, int end);
	public BoardFreeDTO read(int bf_no);
	public int cmtWrite(CommentFreeDTO dto);
	public int boardCountAll();
	public int CmtCountAll(int bf_no);
	public List<CommentFreeDTO> cmtList(int bf_no, int start, int end);
	public List<String> getBoardNavi(int currentPage) throws Exception;
	public List<String> getCmtNavi(int currentPage, int bf_no) throws Exception;
}
