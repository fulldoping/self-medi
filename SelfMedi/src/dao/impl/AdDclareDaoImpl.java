package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import common.Paging;
import dao.face.AdDclareDao;
import dto.Dclare;

public class AdDclareDaoImpl implements AdDclareDao {
	
	private PreparedStatement ps = null; //SQL수행 객체
	private ResultSet rs = null; //SQL조회 결과 객체
	
	Dclare dclare = new Dclare();

	@Override
	public List<Dclare> selectAll(Connection conn) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Dclare> selectAll(Connection conn, Paging paging) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectCntAll(Connection conn) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Dclare selectBoardByBoardno(Connection conn, Dclare dclare) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectupdateHit(Connection conn, Dclare dclare) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String selectNickByUserid(Connection conn, Dclare viewdclare) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(Connection conn, Dclare dclare) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int commentsDelete(Connection conn, Dclare dclare) {
		// TODO Auto-generated method stub
		return 0;
	}

}
