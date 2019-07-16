package my.garden.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import my.garden.dao.BoardQnADAO;
import my.garden.dto.BoardQnADTO;
import my.garden.service.BoardQnAService;

@Service
public class BoardQnAServiceImpl implements BoardQnAService{

	@Autowired
	private BoardQnADAO qnaDao;
	
	public int writeQnA(BoardQnADTO dto) throws Exception {	
		return qnaDao.writeQnA(dto);
	}
	
	public List<BoardQnADTO> qnaList(int bq_p_no, int startNum2, int endNum2) throws Exception{
		return qnaDao.qnaList(bq_p_no, startNum2, endNum2);
	}
	public int qnaCount(int bq_p_no) throws Exception{
		return qnaDao.qnaCount(bq_p_no);
	}
	public String getNavi(int qnaPage,int bq_p_no) throws Exception{
		return qnaDao.getNavi(qnaPage, bq_p_no);
	}
	public BoardQnADTO readQnA(int bq_no, String mine)  throws Exception{
		return qnaDao.readQnA(bq_no, mine);
	}
	
	@Transactional("txManager")
	public int updateQnA(BoardQnADTO dto, int bq_no) throws Exception {
		qnaDao.readQnA(bq_no, "y");
		return qnaDao.updateQnA(dto, bq_no);
	}
	
	public String checkAdmin(String m_email) throws Exception{
		return qnaDao.checkAdmin(m_email);
	}
	
	@Transactional("txManager")
	public int writeComment(int cq_no) throws Exception {
		int result1 = qnaDao.writeComment();
		int result2 = qnaDao.setAnsY(cq_no);
		return result1 + result2;
	}
	
}
