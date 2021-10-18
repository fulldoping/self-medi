<%@page import="com.fulldoping.member.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	//목록버튼 동작
	$("#btnList").click(function() {
		$(location).attr("href", "/ad/member/list");
	});
	
// 	//수정버튼 동작
// 	$("#btnUpdate").click(function() {
// 	});

	//삭제버튼 동작
	$("#btnDelete").click(function() {
		$(location).attr("href", "/ad/member/delete?userNo=${viewMember.userNo }");
	});
	
});
</script>

<div class="container">

<h1>게시글 상세보기</h1>
<hr>

<table class="table table-bordered">
<tr>
<td class="info">회원번호</td><td colspan="3">${viewMember.userNo }</td>
</tr>

<tr>
<td class="info">이름</td><td colspan="3">${viewMember.userName }</td>
</tr>

<tr>
<td class="info">닉네임</td><td>${viewMember.userNick }</td>
<!-- <td class="info">닉네임</td><td>[ 추후 추가 ]</td> -->
</tr>

<tr>
<td class="info">가입날짜</td><td>${viewMember.joinDate }</td>
<!-- <td class="info">추천수</td><td>[ 추후 추가 ]</td> -->
</tr>

<!-- <tr> -->
<%-- <td class="info">작성일</td><td colspan="3">${viewBoard.writeDate }</td> --%>
<!-- </tr> -->

<!-- <tr><td class="info"  colspan="4">본문</td></tr> -->

<%-- <tr><td colspan="4">${viewMember.content }</td></tr> --%>

</table>

<div class="text-center">	
	<button id="btnList" class="btn btn-primary">목록</button>
<!-- 	<button id="btnUpdate" class="btn btn-info">수정</button> -->
	<button id="btnDelete" class="btn btn-danger">삭제</button>
</div>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />