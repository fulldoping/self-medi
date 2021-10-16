package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import dao.face.AdNoticeDao;
import dto.Notice;

public class AdNoticeDaoImpl implements AdNoticeDao {

	private PreparedStatement ps = null; //SQL수행 객체
	private ResultSet rs = null; //SQL조회 결과 객체
	
	Notice notice = new Notice();
	
	@Override
	public List<dto.Notice> selectAll(Connection conn) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<dto.Notice> selectAll(Connection conn, common.Paging paging) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int selectCntAll(Connection conn) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public dto.Notice selectBoardByBoardno(Connection conn, dto.Notice boardno) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int selectupdateHit(Connection conn, dto.Notice boardno) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public String selectNickByUserid(Connection conn, dto.Notice viewBoard) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int insert(Connection conn, dto.Notice board) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int delete(Connection conn, dto.Notice board) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int update(Connection conn, dto.Notice board) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int selectNextBoardno(Connection conn) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int selectinsertFile(Connection conn, dto.BoardFile boardFile) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public dto.BoardFile selectFile(Connection conn, dto.Notice viewBoard) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int commentsInsert(Connection conn, Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int commentsDelete(Connection conn, Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
}
