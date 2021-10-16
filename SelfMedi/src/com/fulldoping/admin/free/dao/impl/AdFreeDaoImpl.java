package com.fulldoping.admin.free.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fulldoping.admin.free.dao.face.AdFreeDao;
import com.fulldoping.common.JDBCTemplate;
import com.fulldoping.free.dto.Free;
import com.fulldoping.paging.Paging;

public class AdFreeDaoImpl implements AdFreeDao {

	private PreparedStatement ps = null; //SQL수행 객체
	private ResultSet rs = null; //SQL조회 결과 객체
	
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
		List<Free> adfreeList = new ArrayList<>(); 
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, paging.getStartNo());
			ps.setInt(2, paging.getEndNo());
			
			rs = ps.executeQuery();
			
			
			while (rs.next()) {
				Free adfree = new Free();
				
				adfree.setBoardNo(rs.getInt("boardNo"));
				adfree.setUserId( rs.getString("userId"));
				adfree.setBoardTitle( rs.getString("boardTitle"));
				adfree.setBoardDate( rs.getDate("boardDate"));
				adfree.setHit( rs.getInt("hit"));
				
				adfreeList.add(adfree);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return adfreeList;
	}
	
	@Override
	public int selectCntAll(Connection conn) {
		
		return 0;
	}
}
