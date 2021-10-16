<%@page import="com.fulldoping.member.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="container">

<div class="text-center">

<form action="/member/finduserpw" method="post" >


<c:if test="${(empty member.userId and member.userId == null) or (empty member.userName and member.userName == null) 
	or (empty member.userEm and member.userEm == null)}">
	
   <strong>비밀번호 찾기에 실패했습니다</strong><br>
   <input type="button" value="돌아가기"
         onClick="history.back()">
</c:if>


<c:if test="${(not empty member.userId and member.userId != null) or (not empty member.userName and member.userName != null) 
	or (not empty member.userEm and member.userEm != null)}">
   
<strong>회원님 비밀번호는 <c:out value="${member.userPw }" ></c:out> 입니다</strong><br>

   <button type="button" onclick='location.href="/member/login";'>로그인</button>
   <button type="button" onclick='location.href="/member/finduserid";'>아이디 찾기</button>
</c:if>

</form>

</div>

<!-- .container -->
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />