package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import common.Paging;
import dao.face.AdQnADao;
import dto.QnA;

public class AdQnADaoImpl implements AdQnADao {
	
	private PreparedStatement ps = null; //SQL수행 객체
	private ResultSet rs = null; //SQL조회 결과 객체
	
	QnA qna = new QnA();

	@Override
	public List<QnA> selectAll(Connection conn) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<QnA> selectAll(Connection conn, Paging paging) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectCntAll(Connection conn) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public QnA selectBoardByBoardno(Connection conn, QnA qna) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectupdateHit(Connection conn, QnA qna) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String selectNickByUserid(Connection conn, QnA viewqna) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(Connection conn, QnA qna) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int commentsDelete(Connection conn, QnA qna) {
		// TODO Auto-generated method stub
		return 0;
	}

}
