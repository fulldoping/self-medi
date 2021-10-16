package com.fulldoping.member.service.impl;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import com.fulldoping.common.JDBCTemplate;
import com.fulldoping.member.dao.face.BusinessMemberDao;
import com.fulldoping.member.dao.impl.BusinessMemberDaoImpl;
import com.fulldoping.member.dto.Member;
import com.fulldoping.member.service.face.BusinessMemberService;

public class BusinessMemberServiceImpl implements BusinessMemberService {


	//MemberDao 객체
	private BusinessMemberDao businessMemberDao = new BusinessMemberDaoImpl();
	
	@Override
	public Member getLoginBusinessMember(HttpServletRequest req) {
		
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//객체 생성
		Member member = new Member();
		
		System.out.println("req.getParameter(\"userId\")========= " + req.getParameter("userId")   );
		//전달파라미터에서 가져오기
		member.setUserId( req.getParameter("userId") );
		member.setUserPw( req.getParameter("userPw") );
		
		return member;
	}

	
	@Override
	public boolean loginBusiness(Member member) {
		
		if ( businessMemberDao.selectCntBusinessMemberByUserIdUserPw(JDBCTemplate.getConnection(), member) > 0 ) {
			return true; //로그인 성공
		} else {	
			return false; //로그인 실패	
		}	
	}

	
	@Override
	public Member infoBusiness(Member member) {
		
		return businessMemberDao.selectBusinessMemberByUserNo(JDBCTemplate.getConnection(), member);
	}

	
	@Override
	public Member getJoinBusinessMember(HttpServletRequest req) {
//		try {
//			req.setCharacterEncoding("UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}

		Member member = new Member();
		
		member.setUserKind(2);
		member.setUserId(req.getParameter("userId"));
		member.setUserPw(req.getParameter("userPw"));
		member.setUserName( req.getParameter("userName"));
		member.setUserNick(req.getParameter("userNick"));
		member.setUserPh( req.getParameter("userPh"));
		member.setUserEm( req.getParameter("userEm"));
		member.setUserGen( req.getParameter("userGen"));
		member.setUserBirth( req.getParameter("userBirth"));
		member.setBusinessNo( Integer.parseInt(req.getParameter("businessNo")));
		//회원번호userNo 	- DaoImpl에서 시퀀스로 자동생성
		//가입일자joinDate 	- DaoImpl에서 sysdate로 자동생성
		
		return member;
	}

	
	@Override
	public void joinBusiness(Member member) {
		Connection conn = JDBCTemplate.getConnection();

		if( businessMemberDao.insertBusiness(conn, member) > 0 ) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
	}
	
	
}
