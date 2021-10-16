package com.fulldoping.member.service.impl;

//import java.io.UnsupportedEncodingException;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import com.fulldoping.common.JDBCTemplate;
import com.fulldoping.member.dao.face.MemberDao;
import com.fulldoping.member.dao.impl.MemberDaoImpl;
import com.fulldoping.member.dto.Member;
import com.fulldoping.member.service.face.MemberService;

public class MemberServiceImpl implements MemberService {
	
	//MemberDao 객체
	private MemberDao memberDao = new MemberDaoImpl();
		
	@Override
	public Member getLoginMember(HttpServletRequest req) {
		
//		try {
//			req.setCharacterEncoding("UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
		
		//객체 생성
		Member member = new Member();
		
		System.out.println("req.getParameter(\"userId\")========= " + req.getParameter("userId")   );
		//전달파라미터에서 가져오기
		member.setUserId( req.getParameter("userId") );
		member.setUserPw( req.getParameter("userPw") );
		
		return member;
	}

	@Override
	public boolean login(Member member) {
		
		if ( memberDao.selectCntMemberByUserIdUserPw(JDBCTemplate.getConnection(), member) > 0 ) {
			return true; //로그인 성공
		} else {	
			return false; //로그인 실패	
		}	
	}

	@Override
	public Member info(Member member) {
		
		return memberDao.selectMemberByUserNo(JDBCTemplate.getConnection(), member);
	}

	@Override
	public Member getJoinMember(HttpServletRequest req) {
	
//		try {
//			req.setCharacterEncoding("UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}

		Member member = new Member();

		member.setUserKind(1);
		member.setUserId(req.getParameter("userId"));
		member.setUserPw(req.getParameter("userPw"));
		member.setUserName( req.getParameter("userName"));
		member.setUserNick(req.getParameter("userNick"));
		member.setUserPh( req.getParameter("userPh"));
		member.setUserEm( req.getParameter("userEm"));
		member.setUserGen( req.getParameter("userGen"));
		member.setUserBirth( req.getParameter("userBirth"));
		//회원번호 - DaoImpl에서 시퀀스로 자동생성
		//가입일자 - DaoImpl에서 sysdate로 자동생성
		//사업자번호 - null
		
		return member;
	}

	@Override
	public void join(Member member) {
		Connection conn = JDBCTemplate.getConnection();

		if( memberDao.insert(conn, member) > 0 ) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
	}
	
}
