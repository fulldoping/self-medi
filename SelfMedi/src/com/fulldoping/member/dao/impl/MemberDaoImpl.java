package com.fulldoping.member.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.fulldoping.common.JDBCTemplate;
import com.fulldoping.member.dao.face.MemberDao;
import com.fulldoping.member.dto.Member;

public class MemberDaoImpl implements MemberDao {

	private PreparedStatement ps = null; // SQL 수행 객체;
	private ResultSet rs = null; // SQL 조회 결과 객체

	@Override
	public int selectCntMemberByUserIdUserPw(Connection conn, Member member) {

		// SQL 작성
		String sql = "";
		sql += "SELECT count(*) FROM member";
		sql += " WHERE 1=1";
		//sql += "	AND userNo = ? ";
		sql += "	AND userId = ? ";
		sql += " 	AND userPw = ? ";

		// 결과 저장할 변수
		int cnt = -1;

		try {
			ps = conn.prepareStatement(sql); // SQL 수행 객체
			//ps.setInt(1, member.getUserNo());
			ps.setString(1, member.getUserId());
			ps.setString(2, member.getUserPw());
			
//			System.out.println("sql + +++++" + sql);

			rs = ps.executeQuery(); // SQL 수행 및 결과집합 저장

			while (rs.next()) {
				System.out.println("selectCntMemberByUserIdUserPw() -> rs.getInt(1) : " + rs.getInt(1));
				cnt = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB객체 담기
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}

		// 최종 결과 반환
		return cnt;
	}

	@Override
	public Member selectMemberByUserNo(Connection conn, Member member) {

		// SQL 작성
		String sql = "";
		sql += "SELECT * FROM member";
		sql += " WHERE 1=1";
		sql += "	AND userId = ? ";
		sql += "	AND userPw = ? ";

		// 결과 저장할 변수
		Member result = null;

		try {
			ps = conn.prepareStatement(sql); // SQL 수행 객체

//			ps.setInt(1, 1);
			ps.setString(1, member.getUserId());
			ps.setString(2, member.getUserPw());

			rs = ps.executeQuery(); // SQL 수행 및 결과집합 저장

			while (rs.next()) {
				result = new Member();

				result.setUserNo( rs.getInt("userNo") );
				result.setUserKind( rs.getInt("userKind") );
				result.setUserId( rs.getString("userId") );
				result.setUserPw( rs.getString("userPw") );
				result.setUserName( rs.getString("userName") );
				result.setUserNick( rs.getString("userNick") );
				result.setUserPh( rs.getString("userPh") );
				result.setUserEm( rs.getString("userEm") );
				result.setUserGen( rs.getString("userGen") );
				result.setUserBirth( rs.getString("userBirth") );
				result.setJoinDate( rs.getDate("joinDate") );
				result.setBusinessNo( rs.getInt("businessNo") );
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB객체 닫기
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}

		// 최종 결과 반환
		return result;
	}

	
	@Override
	public int insert(Connection conn, Member member) {
		
		//SQL 작성
		String sql = "";
		sql += "INSERT INTO member";
		sql += " ( userNo, userKind, userId, userPw, userName, userNick, userPh, userEm, userGen, userBirth, businessNo)";
		sql += " VALUES( member_seq.nextval, 1, ?, ?, ?, ?, ?, ?, ?, ?, NULL)";
		
		int res = 0;
		
		try {
			//DB작업
			ps = conn.prepareStatement(sql);

//			ps.setInt(1, member.getUserKind());
			ps.setString(1, member.getUserId());
			ps.setString(2, member.getUserPw());
			ps.setString(3, member.getUserName());
			ps.setString(4, member.getUserNick());
			ps.setString(5, member.getUserPh());
			ps.setString(6, member.getUserEm());
			ps.setString(7, member.getUserGen());
			ps.setString(8, member.getUserBirth());
			
			//ps.setDate(10, member.getJoinDate()); - 자동생성
			//ps.setInt(9, member.getBusinessNo()); - null
			
			res = ps.executeUpdate();
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {			
			//DB객체 닫기
			JDBCTemplate.close(ps);
		}
		return res;
	}
}
