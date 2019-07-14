package my.garden.service;

import java.util.List;

import my.garden.dto.BoardFreeDTO;
import my.garden.dto.CommentFreeDTO;

public interface BoardFreeService {
	public int serviceWrite(BoardFreeDTO dto);
	public int serviceDelete(int bf_no);
	public int serviceModify(int bf_no, String column, String value);
	public List<BoardFreeDTO> serviceList(int start, int end);
	public BoardFreeDTO serviceRead(int bf_no);
	public List<String> serviceGetBoardNavi(int currentPage) throws Exception;
	public int serviceBoardCountAll();
	
	
	//댓글 
	public int serviceCmtWrite(CommentFreeDTO dto);
	public int serviceCmtModify(String cf_comment, int cf_no);
	public int serviceCmtDelete(String column, int value);
	public List<CommentFreeDTO> serviceCmtList(int cf_bf_no, int start, int end);
	public int serviceCmtCountAll(int cf_bf_no);
	public List<String> serviceGetCmtNavi(int currentPage, int cf_bf_no) throws Exception;
}
