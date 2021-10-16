package com.fulldoping.notice.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fulldoping.common.JDBCTemplate;
import com.fulldoping.free.dto.Free;
import com.fulldoping.free.dto.FreeFile;
import com.fulldoping.notice.dao.face.NoticeDao;
import com.fulldoping.notice.dto.Notice;
import com.fulldoping.notice.dto.NoticeFile;
import com.fulldoping.paging.Paging;

public class NoticeDaoImpl implements NoticeDao {

	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	@Override
	public List<Notice> selectAll(Connection conn, Paging paging) {
		
		//SQL 작성
		String sql = "";
		sql += "SELECT * FROM ( ";
		sql += "	SELECT rownum rnum, B.* FROM (";
		sql += "		SELECT";
		sql += "			boardNo, userId, boardTitle";
		sql += "			, boardDate, hit";
		sql += "		FROM notice";
		sql += "		ORDER BY boardNo DESC";
		sql += "	) B";
		sql += " ) FREE";
		sql += " WHERE rnum BETWEEN ? AND ?";
		
		//결과 저장할 List
		List<Notice> noticeList = new ArrayList<>();
		
		
		try {
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, paging.getStartNo());
			ps.setInt(2, paging.getEndNo());
			
			rs = ps.executeQuery();
			
			
			while (rs.next()) {
				Notice notice = new Notice();
				
				notice.setBoardNo( rs.getInt("boardNo"));
				notice.setUserId( rs.getString("userId"));
				notice.setBoardTitle( rs.getString("boardTitle"));
				notice.setBoardDate( rs.getDate("boardDate"));
				notice.setHit( rs.getInt("hit"));
				
				//리스트에 결과값 저장
				noticeList.add(notice);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		System.out.println("TEST " +noticeList );
		return noticeList;
	}
	
	@Override
	public int selectCntAll(Connection conn) {
		
		//SQL 작성
		String sql = "";
		sql += "SELECT count(*) FROM notice";
		
		//총 게시글 수
		int count = 0;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return count;
	}
		
	@Override
	public Notice selectFreeByBoardNo(Connection conn, Notice boardNo) {
		
		//SQL 작성
		String sql = "";
		sql += "SELECT * FROM notice";
		sql += " WHERE boardNo = ?";
		
		//결과 저장할 Free객체
		Notice viewNotice = null;
		
		try {
			ps = conn.prepareStatement(sql); //SQL수행 객체
			
			ps.setInt(1, boardNo.getBoardNo()); //조회할 게시글 번호 적용
			
			rs = ps.executeQuery(); //SQL 수행 및 결과집합 저장
			
			//조회 결과 처리
			while(rs.next()) {
				viewNotice = new Notice(); //결과값 저장 객체
				
				//결과값 한 행 처리
				viewNotice.setBoardNo( rs.getInt("boardNo"));
				viewNotice.setUserNo( rs.getInt("userNo"));
				viewNotice.setUserId( rs.getString("userId"));
				viewNotice.setBoardTitle( rs.getString("boardTitle"));
				viewNotice.setBoardDate( rs.getDate("boardDate"));
				viewNotice.setBoardContent( rs.getString("BoardContent"));
				viewNotice.setDeclare( rs.getString("declare"));
				viewNotice.setHit( rs.getInt("hit"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//DB객체 닫기
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		System.out.println("TESTviewviewNotice" + viewNotice);
		//최종 결과 반환
		return viewNotice;
	}
		
	@Override
	public int updateHit(Connection conn, Notice boardNo) {
		//SQL 작성
		String sql = "";
		sql += "UPDATE notice";
		sql += " SET hit = hit + 1";
		sql += " WHERE boardNo = ?";	
		
		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql); //SQL수행 객체
			
			ps.setInt(1, boardNo.getBoardNo()); //조회할 게시글 번호 적용
			
			res = ps.executeUpdate(); //SQL 수행
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//DB객체 닫기
			JDBCTemplate.close(ps);
		}
		
		return res;
	}
	
	@Override
	public String selectuserNickByUserId(Connection conn, Notice viewNotice) {
		//SQL 작성
		String sql = "";
		sql += "SELECT userNick FROM member";
		sql += " WHERE userId = ?";
		
		//결과 저장할 String 변수
		String userNick = null;
		
		try {
			ps = conn.prepareStatement(sql); //SQL수행 객체
			ps.setString(1, viewNotice.getUserId()); //조회할 id 적용
			
			rs = ps.executeQuery(); //SQL 수행 및 결과집합 저장
			
			//조회 결과 처리
			while(rs.next()) {
				userNick = rs.getString("userNick");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//DB객체 닫기
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		System.out.println("NickTEST" + userNick);
		//최종 결과 반환
		return userNick;
		
	}
	
	@Override
	public NoticeFile selectFile(Connection conn, Notice viewNotice) {
		String sql = "";
		sql += "SELECT * FROM noticeFile";
		sql += " WHERE boardNo = ?";
		sql += " ORDER BY fileNo";

		NoticeFile noticeFile = null;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, viewNotice.getBoardNo());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				noticeFile = new NoticeFile();
				
				noticeFile.setFileNo( rs.getInt("fileNo"));
				noticeFile.setBoardNo( rs.getInt("boardNo"));
				noticeFile.setOriginName( rs.getString("originName"));
				noticeFile.setStoredName( rs.getString("storedName"));
				noticeFile.setFileSize( rs.getInt("fileSize"));		
				noticeFile.setWriteDate( rs.getDate("writeDate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
				
		return noticeFile;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
