package com.fulldoping.free.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fulldoping.common.JDBCTemplate;
import com.fulldoping.free.dao.face.FreeDao;
import com.fulldoping.free.dto.Free;
import com.fulldoping.free.dto.FreeFile;
import com.fulldoping.util.Paging;

public class FreeDaoImpl implements FreeDao {

	private PreparedStatement ps = null;
	private ResultSet rs = null;
	

	@Override
	public List<Free> selectAll(Connection conn, Paging paging) {
		
		//SQL작성
		String sql = "";
		sql += "SELECT * FROM ( ";
		sql += "	SELECT rownum rnum, B.* FROM (";
		sql += "		SELECT";
		sql += "			boardno, userid, boardtitle";
		sql += "			, boarddate, hit";
		sql += "		FROM free";
		sql += "		ORDER BY boardno DESC";
		sql += "	) B";
		sql += " ) FREE";
		sql += " WHERE rnum BETWEEN ? AND ?";
		
		//결과 저장할 List
		List<Free> freeList = new ArrayList<>(); 
		
		try {
		
			ps = conn.prepareStatement(sql);
			ps.setInt(1, paging.getStartNo());
			ps.setInt(2, paging.getEndNo());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Free free = new Free();
				
				free.setBoardNo( rs.getInt("boardNo"));
				free.setUserId( rs.getString("userId"));
				free.setBoardTitle( rs.getString("boardTitle"));
				free.setBoardDate( rs.getDate("boardDate"));
				free.setHit( rs.getInt("hit"));
				
				//리스트에 결과값 저장
				freeList.add(free);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		return freeList;
	}
	
	
	@Override
	public int selectCntAll(Connection conn) {
		
		//SQL 작성
		String sql = "";
		sql += "SELECT count(*) FROM free";
		
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
	public Free selectFreeByBoardNo(Connection conn, Free boardNo) {
		
		//SQL 작성
		String sql = "";
		sql += "SELECT * FROM free";
		sql += " WHERE boardNo = ?";
		
		//결과 저장할 Free객체
		Free viewFree = null;
		
		try {
			ps = conn.prepareStatement(sql); //SQL수행 객체
			
			ps.setInt(1, boardNo.getBoardNo()); //조회할 게시글 번호 적용
			
			rs = ps.executeQuery(); //SQL 수행 및 결과집합 저장
			
			//조회 결과 처리
			while(rs.next()) {
				viewFree = new Free(); //결과값 저장 객체
				
				//결과값 한 행 처리
				viewFree.setBoardNo( rs.getInt("boardNo"));
				viewFree.setUserNo( rs.getInt("userNo"));
				viewFree.setUserId( rs.getString("userId"));
				viewFree.setBoardTitle( rs.getString("boardTitle"));
				viewFree.setBoardDate( rs.getDate("boardDate"));
				viewFree.setBoardContent( rs.getString("BoardContent"));
				viewFree.setDeclare( rs.getString("declare"));
				viewFree.setHit( rs.getInt("hit"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//DB객체 닫기
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		System.out.println("TESTviewFREE" + viewFree);
		//최종 결과 반환
		return viewFree;
	}
	
	@Override
	public int updateHit(Connection conn, Free boardNo) {
		
		//SQL 작성
		String sql = "";
		sql += "UPDATE free";
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
	public String selectNickByUserId(Connection conn, Free viewFree) {
		
		//SQL 작성
		String sql = "";
		sql += "SELECT usernick FROM member";
		sql += " WHERE userid = ?";
		
		//결과 저장할 String 변수
		String userNick = null;
		
		try {
			ps = conn.prepareStatement(sql); //SQL수행 객체
			ps.setString(1, viewFree.getUserId()); //조회할 id 적용
			
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
	
// ----------------------------------------------------------------------------여기 까지 출력 됨
	
	@Override
	public int insert(Connection conn, Free free) {
		System.out.println(free);
		
		//다음 게시글 번호 조회 쿼리
		String sql = "";
		sql += "INSERT INTO free(BOARDNO , USERNO , USERID , BOARDTITLE , BOARDDATE , BOARDCONTENT , DECLARE ,  HIT)";
		sql += " VALUES (?, ?, ?, ?, sysdate, ?, ?, 0)";
		
		int res = 0;
		
		try {
			//DB작업
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, free.getBoardNo());
			ps.setInt(2, free.getUserNo());//세션정보
			ps.setString(3, free.getUserId());//세션정보
			ps.setString(4, free.getBoardTitle());
			ps.setString(5, free.getBoardContent());
			ps.setString(6, free.getDeclare());
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
	}

	@Override
	public int selectNextBoardNo(Connection conn) {
		
		String sql = "";
		sql += "SELECT free_seq.nextval FROM dual";
		
		//결과 저장 변수
		int nextBoardNo = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				nextBoardNo = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return nextBoardNo;
	}
	
	@Override
	public int insertFile(Connection conn, FreeFile freeFile) {
		
		String sql = "";
		sql += "INSERT INTO freefile( fileno, boardno, originname, storedname, filesize )";
		sql += " VALUES( freefile_seq.nextval, ?, ?, ?, ? )";
		
		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, freeFile.getBoardNo());
			ps.setString(2, freeFile.getOriginName());
			ps.setString(3, freeFile.getStoredName());
			ps.setInt(4, freeFile.getFileSize());
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
	}

	@Override
	public FreeFile selectFile(Connection conn, Free viewFree) {
		
		String sql = "";
		sql += "SELECT * FROM freefile";
		sql += " WHERE boardno = ?";
		sql += " ORDER BY fileno";

		FreeFile freeFile = null;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, viewFree.getBoardNo());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				freeFile = new FreeFile();
				
				freeFile.setFileNo( rs.getInt("fileNo"));
				freeFile.setBoardNo( rs.getInt("boardNo"));
				freeFile.setOriginName( rs.getString("originName"));
				freeFile.setStoredName( rs.getString("storedName"));
				freeFile.setFileSize( rs.getInt("fileSize"));		
				freeFile.setWriteDate( rs.getDate("writeDate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
				
		return freeFile;
	}
	
	@Override
	public int update(Connection conn, Free free) {
		//다음 게시글 번호 조회 쿼리
		String sql = "";
		sql += "UPDATE free";
		sql += " SET boardtitle = ?,";
		sql += " 	boardcontent = ?";
		sql += " WHERE boardno = ?";
		
		//DB 객체
		PreparedStatement ps = null; 
		
		int res = -1;
		
		try {
			//DB작업
			ps = conn.prepareStatement(sql);
			ps.setString(1, free.getBoardTitle());
			ps.setString(2, free.getBoardContent());
			ps.setInt(3, free.getBoardNo());

			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
	}

	@Override
	public int delete(Connection conn, Free free) {
		
		//다음 게시글 번호 조회 쿼리
		String sql = "";
		sql += "DELETE free";
		sql += " WHERE boardno = ?";
		
		//DB 객체
		PreparedStatement ps = null; 
		
		int res = -1;
		
		try {
			//DB작업
			ps = conn.prepareStatement(sql);
			ps.setInt(1, free.getBoardNo());

			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
	}

	@Override
	public int deleteFile(Connection conn, Free free) {
		
		//다음 게시글 번호 조회 쿼리
		String sql = "";
		sql += "DELETE freefile";
		sql += " WHERE boardno = ?";
		
		//DB 객체
		PreparedStatement ps = null; 
		
		int res = -1;
		
		try {
			//DB작업
			ps = conn.prepareStatement(sql);
			ps.setInt(1, free.getBoardNo());

			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
	}

	
}
