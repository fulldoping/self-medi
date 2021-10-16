package com.fulldoping.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.fulldoping.member.dto.Member;

public class AdminLoginFilter implements Filter {
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
	
		//관리자 로그인 했을 때만 관리자 페이지에 접속 가능하도록 하는 필터
		
		//테스트 코드 작성 - 추후 주석처리
		System.out.println("AdminLoginFilter - doFilter()");
		
		//관리자 로그인 확인
		
		// DTO에 저장된 userkind를 비교한다. 
		// ㄴ 관리자 로그인 상황일 때 userkind를 DTO에 담는 절차가 필요하다.
		
		Member member = new Member();
		
		if( 0 == member.getUserKind() ) {
			
			//아래 코드(chain)를 적지 않으면 화면이 나오지 않는다.
			//요청정보를 컨트롤러로 전달한다
			chain.doFilter(request, response);
			
		}
		
		
	}

}
