package com.fulldoping.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fulldoping.member.dto.Member;
import com.fulldoping.member.dto.MemberFile;
import com.fulldoping.member.service.face.BusinessMemberService;
import com.fulldoping.member.service.impl.BusinessMemberServiceImpl;

@WebServlet("/member/businessjoin")
public class BusinessMemberJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//BusinessMemberService 객체 생성
	BusinessMemberService businessMemberService = new BusinessMemberServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/member/businessjoin [GET]");
		
		// VIEW 지정 - forward
		req.getRequestDispatcher("/WEB-INF/views/member/businessjoin.jsp").forward(req, resp);
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		System.out.println("/member/businessjoin [POST]");

		//회원정보 요청 파라미터 처리
		Member member = businessMemberService.getJoinBusinessMember(req);

		//회원 가입시 저장되는 회원 파일 정보 요청 파라미터 처리
		MemberFile memberFile = businessMemberService.businessFile(req);
		
		//insert 성공여부
		int businessJoinSuccess = businessMemberService.insertBusinessMember(member, memberFile);
		
		System.out.println( "businessJoinSuccess :" + businessJoinSuccess );
		
		System.out.println( "member :" + member );
		
//		// 사업자 회원가입
//		businessMemberService.joinBusiness(member);
		
		// 메인으로 리다이렉션
		resp.sendRedirect("/main");
	}	
}
