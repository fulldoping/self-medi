<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnLogin").click(function() {
		
	})
	
	$("#btnBusinessLogin").click(function() {
		
	})
	
})
</script>

<h2 class="text-center">로그인</h2>
<hr>

<div class="text-center" id="login">

</div>

<button id="btnLogin">일반 로그인</button>
<button id="btnBusinessLogin">사업자 로그인</button>

<div class="text-center" id="logincontain"></div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
