package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import common.Paging;
import dao.face.AdFreeDao;
import dto.Free;

public class AdFreeDaoImpl implements AdFreeDao {
	
	private PreparedStatement ps = null; //SQL수행 객체
	private ResultSet rs = null; //SQL조회 결과 객체
	
	Free free = new Free();

	@Override
	public List<Free> selectAll(Connection conn) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Free> selectAll(Connection conn, Paging paging) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectCntAll(Connection conn) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Free selectBoardByBoardno(Connection conn, Free free) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectupdateHit(Connection conn, Free free) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String selectNickByUserid(Connection conn, Free viewfree) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(Connection conn, Free free) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int commentsDelete(Connection conn, Free free) {
		// TODO Auto-generated method stub
		return 0;
	}

}
