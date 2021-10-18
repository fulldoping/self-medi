<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	
	//작성버튼 동작
	$("#btnWrite").click(function() {
	
		$("form").submit();
	});
	
	//취소버튼 동작
	$("#btnCancel").click(function() {
		history.go(-1);
	});
	
});
</script>






<div class="container">

<h1 style= "text-align :center; color: cornflowerblue;" >신고사유</h1>
<hr>


<div>
<form action="/free/declare" method="post" enctype="multipart/form-data">


<table class="table table-bordered">

<tr><td class="info">게시글 번호</td><td>${declareFree.boardNo }</td></tr>
	<tr><td><input type="hidden" name="boardNo" value="${declareFree.boardNo }" /></td><tr>
<%-- <tr><td class="info">아이디</td><td>${declareFree.userId }</td> --%>
	<tr><td><input type="hidden" name="userId" value="${declareFree.userId }"/></td></tr>
	
<%-- <tr><td class="info">회원번호</td><td>${declareFree.userNo }</td> --%>
	<tr><td><input type="hidden" name="userNo" value="${declareFree.userNo }"/></td></tr>

<tr><td class="info">닉네임</td><td>${declareFree.userNick }</td>
	<td><input type="hidden" name="userNick" value="${declareFree.userNick }"/></td></tr>
	
<tr><td class="info">조회수</td><td>${declareFree.hit }</td>
	<td><input type="hidden" name="hit" value="${declareFree.hit }"/></td></tr>

<tr><td class="info" >제목</td><td>${declareFree.boardTitle }</td>
	<td><input type="hidden" name="boardTitle" value="${declareFree.boardTitle }"/></td></tr>
	
<tr><td class="info" colspan="2">본문</td></tr>
<tr><td colspan="2" >${declareFree.boardContent }</td>
	<td><input type="hidden" name="boardContent" value="${declareFree.boardContent }"/></td></tr>
	
<tr><td class="info" colspan="2">신고사유</td></tr>
<tr><td colspan="2"><input type="text" id="reason" name="reason" class="reason" size="100px"/></td></tr>
</table>


<div>
	<div id="beforeFile">
		기존 첨부파일: 
		<a href="/upload/${freeFile.storedName }" download="${freeFile.originName }">${freeFile.originName }</a>
		<span id="delFile" style="color:red; font-weight: bold; cursor: pointer;">X</span>
	</div>
</div>

</form>
</div>


<div class="text-center">	
	<button type="button" id="btnWrite" class="btn btn-info">작성</button>
	<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
</div>


</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />