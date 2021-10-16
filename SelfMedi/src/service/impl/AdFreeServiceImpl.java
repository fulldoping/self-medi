package service.impl;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import common.Paging;
import dao.face.AdFreeDao;
import dao.impl.AdFreeDaoImpl;
import dto.Free;
import service.face.AdFreeService;

public class AdFreeServiceImpl implements AdFreeService {
	
	public Connection conn = JDBCTemplate.getConnection();
	private AdFreeDao adFreeDao = new AdFreeDaoImpl();

	@Override
	public List<Free> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Free> getList(Paging paging) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Paging getPaging(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Free getBoardno(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Free view(Free boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getNick(Free viewFree) {
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
