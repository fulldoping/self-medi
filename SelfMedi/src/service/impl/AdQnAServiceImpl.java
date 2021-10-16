package service.impl;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import common.Paging;
import dao.face.AdQnADao;
import dao.impl.AdQnADaoImpl;
import dto.QnA;
import service.face.AdQnAService;

public class AdQnAServiceImpl implements AdQnAService {
	
	public Connection conn = JDBCTemplate.getConnection();
	private AdQnADao adQnADao = new AdQnADaoImpl();

	@Override
	public List<QnA> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<QnA> getList(Paging paging) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Paging getPaging(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public QnA getBoardno(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public QnA view(QnA boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getNick(QnA viewQnA) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(HttpServletRequest req) {
		// TODO Auto-generated method stub

	}

	@Override
	public void commentsDelete(HttpServletRequest req) {
		// TODO Auto-generated method stub

	}

}
