<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	//목록버튼 동작
	$("#btnList").click(function() {
		$(location).attr("href", "/QnA/list");
	});
	
	//수정버튼 동작
	$("#btnUpdate").click(function() {
		
		$(location).attr("href", "/QnA/update?boardNo=${viewBoard.boardNo }");
	});

	//삭제버튼 동작
	$("#btnDelete").click(function() {
		if( confirm("게시글을 삭제하시겠습니까?") ) {
			$(location).attr("href", "/QnA/delete?boardNo=${viewBoard.boardNo }");
		}
	});	
});
	

</script>

<div class="container">

<h1>게시글 상세보기</h1>
<hr>


<table class="table table-bordered">
<tr>
<td class="info">글번호</td><td colspan="3">${viewBoard.boardNo }</td>
</tr>

<tr>
<td class="info">제목</td><td colspan="3">${viewBoard.boardTitle }</td>
</tr>

<tr>
<td class="info">아이디</td><td>${viewBoard.userId }</td>
<td class="info">닉네임</td><td>${nick }</td>
</tr>

<tr>
<td class="info">조회수</td><td>${viewBoard.hit }</td>
<td class="info">신고</td><td></td>
</tr>

<tr>
<td class="info">작성일</td><td colspan="3">${viewBoard.boardDate }</td>
</tr>

<tr><td class="info"  colspan="4">본문</td></tr>

<tr><td colspan="4">${viewBoard.boardContent }</td></tr>

</table>

<!-- 첨부파일 -->
<div>
<c:if test="${not empty boardFile }">
<li class="photo">
	<img src="/upload/${boardFile.storedName }" style="max-width:100%; height: auto"/>
</li>
<a href="/upload/${boardFile.storedName }" download="${boardFile.originName }">${boardFile.originName }</a>
</c:if>
</div>

<c:import url="/WEB-INF/views/QnAboard/comment.jsp" />

<div class="text-center">	
	<button id="btnList" class="btn btn-primary">목록</button>
	<c:if test="${viewBoard.userNo eq userNo }">
		<button id="btnUpdate" class="btn btn-info">수정</button>
		<button id="btnDelete" class="btn btn-danger">삭제</button>
	</c:if>
</div>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
