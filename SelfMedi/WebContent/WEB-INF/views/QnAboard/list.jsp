<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	
	//글쓰기 버튼 누르면 이동
	$("#btnWrite").click(function() {
		location.href="/qna/write";
	});
	
});
</script>

<div class="container">

<h1>게시글 목록</h1>
<hr>

<table class="table table-striped table-hover table-condensed">
<tr>
	<th>글번호</th>
	<th>작성자</th>
	<th>제목</th>
	<th>작성일</th>
	<th>조회수</th>
</tr>

<c:forEach items="${boardList }" var="board">
<tr>
	<td>${board.boardNo }</td>
	<td>${board.userNick }</td>
	<td>
		<a href="/qna/view?boardNo=${board.boardNo }">
		${board.boardTitle }
		</a>
	</td>
	<td>${board.boardDate }</td>
	<td>${board.hit }</td>
</tr>
</c:forEach>

</table>

<div id="btnBox" class="pull-left">
	<button id="btnWrite" class="btn btn-primary">글쓰기</button>
</div>

<!-- .container -->
</div>

<c:import url="/WEB-INF/views/layout/pagingqna.jsp" />

<c:import url="/WEB-INF/views/layout/footer.jsp" />
