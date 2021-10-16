<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
.button{
	margin:0 auto;
	text-align: center;
}
</style>

<!-- 비로그인상태 -->
<c:if test="${empty login or not login }">
<div class="button">
   <strong>로그인이 필요합니다</strong>
   <br><br>
   <button onclick='location.href="<%=request.getContextPath() %>/member/login";'>일반 로그인</button>
   <button onclick='location.href="<%=request.getContextPath() %>/member/businesslogin";'>사업자 로그인</button>
   <br><br>
   <button onclick='location.href="<%=request.getContextPath() %>/member/join";'>일반 회원가입</button>
   <button onclick='location.href="<%=request.getContextPath() %>/member/businessjoin";'>사업자 회원가입</button>
</div>
   
</c:if>

<!-- 로그인상태 -->
<c:if test="${not empty login and login and userKind ne 0}">
<div class="button">
   <strong>${userNick }님, 환영합니다</strong><br>
   <button onclick='location.href="<%=request.getContextPath() %>/board/list";'>마이페이지</button>
   <button onclick='location.href="<%=request.getContextPath() %>/selftest/write";'>자가진단 작성</button>
   <button onclick='location.href="<%=request.getContextPath() %>/selftest/list";'>자가진단 목록</button>
   <button onclick='location.href="<%=request.getContextPath() %>/basket/view";'>보관함</button>
   <button onclick='location.href="<%=request.getContextPath() %>/free/list";'>자유게시판</button>
   <button onclick='location.href="<%=request.getContextPath() %>/notice/list";'>공지사항</button>
   <button onclick='location.href="<%=request.getContextPath() %>/QnA/list";'>QnA게시판</button>
   <button onclick='location.href="<%=request.getContextPath() %>/member/logout";'>로그아웃</button>
</div>
</c:if>

<c:if test="${not empty login and login and userKind eq 0}">
<div class="button">
   <strong>관리자님, 환영합니다</strong><br>
   <button onclick='location.href="<%=request.getContextPath() %>/ad/member/list";'>회원 관리</button>
   <button onclick='location.href="<%=request.getContextPath() %>/ad/notice/list";'>공지사항 관리</button>
   <button onclick='location.href="<%=request.getContextPath() %>/ad/free/list";'>자유게시판 관리</button>
   <button onclick='location.href="<%=request.getContextPath() %>/ad/qna/list";'>QnA 관리</button>
   <button onclick='location.href="<%=request.getContextPath() %>/ad/declare/list";'>신고된 게시글 관리</button>
   <button onclick='location.href="<%=request.getContextPath() %>/ad/product/list";'>상품 관리</button>
   <button onclick='location.href="<%=request.getContextPath() %>/member/logout";'>로그아웃</button>
</div>
</c:if>


<!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />