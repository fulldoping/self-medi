<%@page import="com.fulldoping.member.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
<% Member member = (Member)request.getAttribute("member");
String userId = member;
if(userId != null) { %>
<% } %> --%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="container">

<div class="text-center">

<form action="/member/finduserid" method="post" >


<c:if test="${(empty member.userName and member.userName == null) or (empty member.userEm and member.userEm == null)}">
   <strong>아이디 찾기에 실패했습니다</strong><br>
   <input type="button" value="돌아가기"
         onClick="history.back()">
</c:if>


<c:if test="${(not empty member.userName and member.userName != null) or (not empty member.userEm and member.userEm != null)}">
   
<strong>회원님 아이디는 <c:out value="${member.userId }" ></c:out> 입니다</strong><br>

   <button type="button" onclick='location.href="/member/login";'>로그인</button>
   <button type="button" onclick='location.href="/member/finduserpw";'>비밀번호 찾기</button>
</c:if>

</form>

</div>

<!-- .container -->
</div>


<%-- <c:choose> --%>
<%--     <c:when test="${param.userId == null}"> --%>
<!--       <p>회원 정보를 찾을 수 없습니다.</p> -->
<%--     </c:when> --%>
<%--     <c:when test="${param.userId == ''}"> --%>
<!--     <p style="text-align:center; margin-bottom: 4rem;"> -->
<!--       <span style="font-size: 23px;"> -->
<!--       회원 정보를 찾을 수 없습니다.</span><br> -->
<!--       <span>입력하신 정보를 확인하시길 바랍니다.</span> -->
<!--     </p> -->
<%--     </c:when> --%>
<%--     <c:when test="${param.userId != null}"> --%>
<!--       <p style="text-align:center;"> -->
<!--       회원님의 비밀번호는<br>  -->
<%--       <span style="font-size: 23px; font-weight: bold;">[${param.userId}]</span> 입니다. --%>
<%--       <span style="font-size: 23px; font-weight: bold;">#(${param.userId})</span> 입니다. --%>
<!--       </p> -->
<%--     </c:when> --%>
<%--   </c:choose> --%>


<c:import url="/WEB-INF/views/layout/footer.jsp" />