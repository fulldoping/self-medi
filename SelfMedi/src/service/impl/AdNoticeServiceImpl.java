package service.impl;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import common.Paging;
import dao.face.AdNoticeDao;
import dao.impl.AdNoticeDaoImpl;
import dto.BoardFile;
import dto.Notice;
import service.face.AdNoticeService;

public class AdNoticeServiceImpl implements AdNoticeService {
	
	public Connection conn = JDBCTemplate.getConnection();
	private AdNoticeDao adNoticeDao = new AdNoticeDaoImpl();

	@Override
	public List<Notice> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Notice> getList(Paging paging) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Paging getPaging(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notice getBoardno(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notice view(Notice boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getNick(Notice viewNotice) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void write(HttpServletRequest req) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(HttpServletRequest req) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(HttpServletRequest req) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BoardFile viewFile(Notice viewNotice) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void commentsWrite(HttpServletRequest req) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void commentsDelete(HttpServletRequest req) {
		// TODO Auto-generated method stub
		
	}


	
	
}
