<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="container">

<div class="text-center">

<!-- 비로그인상태 -->
<c:if test="${empty login or not login }">
   <strong>로그인이 필요합니다</strong><br>
   <button onclick='location.href="/member/login";'>로그인</button>
   <button onclick='location.href="/member/join";'>회원가입</button>
</c:if>

<!-- 로그인상태 -->
<c:if test="${not empty login and login }">
   <strong>${userNick }님, 환영합니다</strong><br>
   <button onclick='location.href="/basket/view";'>보관함</button>
   <button onclick='location.href="/free/list";'>게시판</button>
   <button onclick='location.href="/product/display";'>상품</button>
   <button onclick='location.href="/member/logout";'>로그아웃</button>
   <button onclick='location.href="/WEB-INF/views/product/uikit.jsp";'>uikit</button>
</c:if>

</div>

<!-- .container -->
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />