package service.impl;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import common.Paging;
import dao.face.AdDclareDao;
import dao.impl.AdDclareDaoImpl;
import dto.Dclare;
import service.face.AdDclareService;

public class AdDclareServiceImpl implements AdDclareService {
	
	public Connection conn = JDBCTemplate.getConnection();
	private AdDclareDao adDclareDao = new AdDclareDaoImpl();

	@Override
	public List<Dclare> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Dclare> getList(Paging paging) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Paging getPaging(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Dclare getBoardno(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Dclare view(Dclare boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getNick(Dclare viewDclare) {
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
