<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript"
	src="<%=request.getContextPath() %> /resources/js/httpRequest.js">
</script>

<script type="text/javascript">
$(document).ready(function() {
   //페이지 첫 접속 시 입력창으로 포커스 이동
   $("input").eq(0).focus();
   
   //패스워드 입력 창에서 엔터 입력 시 form submit
   $("input").eq(1).keydown(function(key) {
      if(key.keyCode == 13) {
         $(this).parents("form").submit();
      }
   })

   //로그인 버튼 클릭 시 form submit
   $("#btnLogin").click(function() {
      $(this).parents("form").submit();
   })
   
   //취소 버튼 누르면 뒤로가기
   $("#btnCancel").click(function() {
      history.go(-1);
   })

});
</script>

<style type="text/css">
form {
   width: 400px;
   margin: 0 auto;
}
</style>


<div class="container">

<h2 class="text-center">사업자 로그인</h2>
<hr>

<form action="/member/businesslogin" method="post">
    
<div>
	<label for="userId">아이디</label>
	<div>
	<input type="text" id="userId" name="userId" />
	</div>
</div>
  
<div>
	<label for="userPw">패스워드</label>
	<div>
	<input type="text" id="userPw" name="userPw" />
	</div>
</div>

<div>
<label><a href="<%=request.getContextPath()%>/member/finduserid">아이디찾기</a> | </label>
	<label><a href="<%=request.getContextPath()%>/member/finduserpw">비밀번호 찾기</a> | </label> 
	<label><a href="<%=request.getContextPath()%>/member/businessjoin">회원가입</a></label>
</div>
<div>
	<label for="btnLogin"></label>
	<div>
	<button type="button" id="btnLogin">로그인</button>
	</div>
</div>
   
</form>

<!-- .container -->
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
