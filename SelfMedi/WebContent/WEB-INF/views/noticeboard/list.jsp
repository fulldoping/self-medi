<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="container">

<h1 >공지사항</h1>
<hr>

<table class="table table-striped table-hover table-condensed">
<tr>
	<th>글번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>조회수</th>
	<th>작성일</th>
</tr>

<c:forEach items="${noticeList }" var="notice">
<tr>
	<td>${notice.boardNo }</td>
	<td>
		<a href="/notice/view?boardNo=${notice.boardNo }">
		${notice.boardTitle }
		</a>
	</td>
	<td>${notice.userId }</td>
	<td>${notice.hit }</td>
	<td>${notice.boardDate }</td>
</tr>
</c:forEach>

</table>

<!-- .container -->
</div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />

<c:import url="/WEB-INF/views/layout/footer.jsp" />
