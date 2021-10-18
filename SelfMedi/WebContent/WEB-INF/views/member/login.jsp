<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />



<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css">
<!-- <script src="//code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="//code.jquery.com/ui/1.13.0/jquery-ui.js"></script>


<%-- <script type="text/javascript" src="<%=request.getContextPath() %> /resources/js/httpRequest.js"> --%>
<!-- </script> -->


<script type="text/javascript">
$(document).ready(function() {
   //페이지 첫 접속 시 입력창으로 포커스 이동
   $("input[type=text]").eq(0).focus();
   
   //패스워드 입력 창에서 엔터 입력 시 form submit
   $("input[type=text]").eq(1).keydown(function(key) {
      if(key.keyCode == 13) {
         $(this).parents("form").submit();
      }
   })

   //로그인 버튼 클릭 시 form submit
   $("[name='login']").click(function() {
      $(this).parents("form").submit();
  
   })
   
  /* /*  if(fragment-1 == 1) {
  
   $("#fragment-1").css("display", "block");
   $("#fragment-2").css("display", "none");
   
   } else {
      $("#fragment-1").css("display", "none");
      $("#fragment-2").css("display", "block");
      
   } */

   });
</script>


<!-- style="background-color:#345EE6; color:#FFFFFF -->
<!-- style="background-color:#345EE6; color:#000; -->
<!-- <div class="container"> -->

<div id="tabs">
   <ul class=login >
      <li><a href="#fragment-1" ><span>일반 로그인</span></a>
      <li><a href="#fragment-2" ><span>사업자 로그인</span></a>
   </ul>
   <div id="fragment-1">
      <form action="/member/login" method="post">
      <div>
         <label for="userId">아이디</label>
         <input type="text" id="userId" name="userId" />
      </div>
      <br>
  
      <div>
         <label for="userPw">비밀번호</label>
         <input type="text" id="userPw" name="userPw" />
      </div>
      <div>
         <label><a href="<%=request.getContextPath()%>/member/finduserid">아이디찾기</a> | </label>
         <label><a href="<%=request.getContextPath()%>/member/finduserpw">비밀번호 찾기</a> | </label>
         <label><a href="<%=request.getContextPath()%>/member/join">회원가입</a></label>
      </div>
   
      <div class="text-center">
         <label for="btnLogin"></label>
         <div><button type="button" id="btnLogin" name="login">로그인</button></div>
      </div>
      </form>
   </div>
   

   <div id="fragment-2">
      <form action="/member/businesslogin" method="post">
      <div>
         <label for="userId">아이디</label>
         <input type="text" id="userId" name="userId" />
      </div>
      <br>
  
      <div>
         <label for="userPw">비밀번호</label>
         <input type="text" id="userPw" name="userPw" />
      </div>
      <div>
         <label><a href="<%=request.getContextPath()%>/member/finduserid">아이디찾기</a> | </label>
         <label><a href="<%=request.getContextPath()%>/member/finduserpw">비밀번호 찾기</a> | </label>
         <label><a href="<%=request.getContextPath()%>/member/businessjoin">회원가입</a></label>
      </div>
   
      <div class="text-center">
         <label for="btnLogin"></label>
         <div><button type="button" id="btnLogin" name="login">로그인</button></div>
      </div>
      </form>
   </div>
</div><!-- .tabs -->

<script>
$( "#tabs" ).tabs();
</script>

<!-- .container -->
<!-- </div> -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />