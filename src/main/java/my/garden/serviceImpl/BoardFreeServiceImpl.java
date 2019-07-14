package my.garden.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import my.garden.dao.BoardFreeDAO;
import my.garden.dto.BoardFreeDTO;
import my.garden.dto.CommentFreeDTO;
import my.garden.service.BoardFreeService;

@Service
public class BoardFreeServiceImpl implements BoardFreeService{

	@Autowired
	private BoardFreeDAO dao;
	
	@Transactional("txManager")
	public int serviceWrite(BoardFreeDTO dto) {
		return dao.write(dto);
	}
	
	@Transactional("txManager")
	public int serviceDelete(int bf_no) {
		return dao.delete(bf_no);
	}
	
	@Transactional("txManager")
	public int serviceModify(int bf_no, String column, String value) {
		return dao.modify(bf_no, column, value);
	}
	@Transactional("txManager")
	public List<BoardFreeDTO> serviceList(int start, int end) {
		return dao.list(start, end);
		
	}
	
	@Transactional("txManager")
	public BoardFreeDTO serviceRead(int bf_no) {
		return dao.read(bf_no);
	}
	
	@Transactional("txManager")
	public int serviceBoardCountAll() {
		return dao.boardCountAll();
	}
	
	@Transactional("txManager")
	public List<String> serviceGetBoardNavi(int currentPage) throws Exception{
		return dao.getBoardNavi(currentPage);
	}
	
	//댓글
	@Transactional("txManager")
	public int serviceCmtWrite(CommentFreeDTO dto) {
		return dao.cmtWrite(dto);
	}
	
	@Transactional("txManager")
	public int serviceCmtModify(String cf_comment, int cf_no) {
		return dao.cmtModify(cf_comment, cf_no);
	}
	
	@Transactional("txManager")
	public int serviceCmtDelete(String column, int value) {
		return dao.cmtDelete(column, value);
	}
	
	@Transactional("txManager")
	public List<CommentFreeDTO> serviceCmtList(int bf_no, int start, int end){
		return dao.cmtList(bf_no, start, end);
	}
	
	@Transactional("txManager")
	public int serviceCmtCountAll(int cf_bf_no) {
		return dao.cmtCountAll(cf_bf_no);
	}
	
	@Transactional("txManager")
	public List<String> serviceGetCmtNavi(int currentPage, int cf_bf_no) throws Exception{
		return dao.getCmtNavi(currentPage, cf_bf_no);
	}
}
