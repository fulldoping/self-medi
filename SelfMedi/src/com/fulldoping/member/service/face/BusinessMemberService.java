package com.fulldoping.member.service.face;

import javax.servlet.http.HttpServletRequest;

import com.fulldoping.member.dto.Member;

public interface BusinessMemberService {

	/**
	 * 사업자 로그인 정보 추출
	 * 
	 * @param req - 요청 정보 객체
	 * @return - 사업자 로그인 정보
	 */
	public Member getLoginBusinessMember(HttpServletRequest req);
	
	/**
	 * 사업자 로그인 처리
	 * 
	 * @param member - 요청 정보 객체
	 * @return true - 인증됨, false - 인증되지 않음
	 */
	public boolean loginBusiness(Member member);
	
	/**
	 * 사업자 유저 정보 가져오기
	 * 
	 * @param member - 회원 아이디를 가진 객체
	 * @return Member - 조회된 회원 정보
	 */
	public Member infoBusiness(Member member);

	/**
	 * 사업자 회원가입 정보 추출하기
	 * 
	 * @param req - 요청정보 객체
	 * @return - 추출한 회원가입 정보
	 */
	public Member getJoinBusinessMember(HttpServletRequest req);

	/**
	 * 사업자 회원가입 처리
	 * 
	 * @param param - 회원가입 정보 객체
	 */
	public void joinBusiness(Member member);
	
}