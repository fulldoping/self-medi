<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	//목록버튼 동작
	$("#btnList").click(function() {
		$(location).attr("href", "/free/list");
	});
	
	//신고버튼 동작
	$("#btndeclare").click(function() {
		$(location).attr("href", "/free/declare?boardNo=${viewFree.boardNo }");
	});
	
	//수정버튼 동작
	$("#btnUpdate").click(function() {
		$(location).attr("href", "/free/update?boardNo=${viewFree.boardNo }");
	});

	//삭제버튼 동작
	$("#btnDelete").click(function() {
		if( confirm("게시글을 삭제하시겠습니까?") ) {
			$(location).attr("href", "/free/delete?boardNo=${viewFree.boardNo }");
		}
	});
	
});
</script>

<div class="container">

<table >
<tr>
<td class="info">글번호</td><td colspan="3">${viewFree.boardNo }</td>
</tr>

<tr>
<td class="info">제목</td><td colspan="3">${viewFree.boardTitle }</td>
</tr>

<tr>
<td class="info">아이디</td><td>${viewFree.userId }</td>
<td class="info">닉네임</td><td>${userNick }</td>
</tr>

<tr>
<td class="info">조회수</td><td>${viewFree.hit }</td>
</tr>

<tr>
<td class="info">작성일</td><td colspan="3">${viewFree.boardDate }</td>
</tr>

<tr><td class="info"  colspan="4">본문</td></tr>

<tr><td colspan="4">${viewFree.boardContent }</td></tr>

</table>

<!-- 첨부파일 -->
<div>
<c:if test="${not empty freeFile }">
<a href="/upload/${freeFile.storedName }" download="${freeFile.originName }">${freeFile.originName }</a>
</c:if>
</div>

<div class="text-center">	
	<button id="btnList" >목록</button>
	<button id="btndeclare" >신고</button>
	<button id="btnUpdate" >수정</button>
	<button id="btnDelete" >삭제</button>
</div>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
