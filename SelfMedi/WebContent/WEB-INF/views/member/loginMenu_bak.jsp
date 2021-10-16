<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$("a").click(function(){ //클릭할 수 있는 코드
		console.log("a태그 클릭") //개발자 콘솔 출력
//		alert("테스트") //팝업 창 출력
		
		console.log( $(this).attr("href") ) //지금 선택한 객체
		
		//URL로 요청을 보내고 응답 데이터를 객체의 innerHTML로 반영한다
		$("#login").load( $(this).attr("href") )
		
		//<a>태그의 페이지이동(기본동작) 막기
		return false;  //페이지 이동을 중지시킨다
	})
	
	$("#btnLogin").click(function() {
		
	})
})
</script>

<h2 class="text-center">로그인</h2>
<hr>

<div class="text-center" id="login">
<%--    <a href="<%=request.getContextPath()%>/member/login.jsp">일반 로그인</a> --%>
<%--    <a href="<%=request.getContextPath()%>/member/businessLogin.jsp">사업자 로그인</a> --%>
</div>

<button id="btnLogin">일반 로그인</button>
<button id="btnBusinessLogin">사업자 로그인</button>

<div class="text-center" id="logincontain"></div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
