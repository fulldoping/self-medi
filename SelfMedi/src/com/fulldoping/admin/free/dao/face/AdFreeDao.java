package com.fulldoping.admin.free.dao.face;

import java.sql.Connection;
import java.util.List;

import com.fulldoping.free.dto.Free;
import com.fulldoping.paging.Paging;

public interface AdFreeDao {

	/**
	 * Free테이블 전체 조회
	 * 
	 * @param conn - DB연결 객체
	 * @param paging - 페이징 정보 객체
	 * @return List<Free> - 테이블 전체 조회 결과 리스트
	 */
	public List<Free> selectAll(Connection conn, Paging paging);
	
	/**
	 * 총 게시글 수 조회
	 * 
	 * @param conn - DB연결 객체
	 * @return int - Board테이블 전체 행 수 조회 결과
	 */

	public int selectCntAll(Connection conn);

}
