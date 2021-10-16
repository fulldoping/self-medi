<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:import url="/WEB-INF/views/admin/layout/header.jsp" />

<div id="maincontent">
<h1>회원 관리</h1>
<%-- 여기 header와 paging, footer사이가 본문코드 작성영역입니다. --%>
<c:import url="/WEB-INF/views/admin/layout/paging.jsp" />
</div>



<c:import url="/WEB-INF/views/admin/layout/footer.jsp" />