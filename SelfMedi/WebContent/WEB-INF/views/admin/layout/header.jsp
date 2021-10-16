<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> : : : Self-Medi Admin : : : </title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
// 	//메인
// 	$("#btnMain").click( function() { $(location).attr("href", "/main"); });
	//회원 관리
	$("#btnMember").click( function() { $(location).attr("href", "/ad/member/list"); });
	//공지사항 관리
	$("#btnNotice").click( function() { $(location).attr("href", "/ad/notice/list"); });
	//자유게시판 관리
	$("#btnFree").click( function() { $(location).attr("href", "/ad/free/list"); });
	//QnA 관리
	$("#btnQnA").click( function() {	$(location).attr("href", "/ad/qna/list"); });
	//신고된 게시글 관리
	$("#btnDeclare").click( function() { $(location).attr("href", "/ad/declare/list"); });
	//신고된 게시글 관리
	$("#btnProduct").click( function() { $(location).attr("href", "/ad/product/list"); });
});
</script>

<style type="text/css">
body {
  width: auto;
  margin: auto;
}

#sidebar {
  background: #768d87;
  float: left;
  width: 20%;
  height: 800px;
  border: 1px solid black;
}

#maincontent {
  background: #fff;
  height: 800px;
  border: 1px solid black;
}

.myButton {
	box-shadow:inset 0px 0px 0px 0px #91b8b3;
	background:linear-gradient(to bottom, #768d87 5%, #6c7c7c 100%);
	background-color:#768d87;
/* 	border-radius:6px; */
	border:1px solid #566963;
	display:block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:8px 31px;
	margin: 5px;
	text-decoration:none;
	text-shadow:1px 1px 0px #2b665e;
}
.myButton:hover {
	background:linear-gradient(to bottom, #eee 5%, #eee 100%);
/* 	background:linear-gradient(to bottom, #6c7c7c 5%, #768d87 100%); */
	background-color:#eee;
/* 	background-color:#6c7c7c; */
	color: menutext;
}
.myButton:active {
	position:relative;
	top:1px;
}

</style>

</head>
<body>

<div id="header">
	<h1><a href="/">Self-Medi</a></h1>
</div>

<div id="sidebar">
<!-- <button type="button" id="btnMain" >메인</button><br><br> -->
<!-- <button type="button" id="btnMember" >회원관리</button><br><br> -->
<!-- <button type="button" id="btnNotice" >공지사항</button><br> -->
<!-- <button type="button" id="btnFree" >자유게시판</button><br> -->
<!-- <button type="button" id="btnQnA" >QnA</button><br> -->
<!-- <button type="button" id="btnDeclare" >신고된 게시글</button><br><br> -->
<!-- <button type="button" id="btnProduct" >상품 관리</button><br> -->
<br>
<%-- <a href="<%=request.getContextPath() %>/main" class="myButton">메인</a><br><br><br> --%>
<a href="<%=request.getContextPath() %>/ad/member/list" class="myButton">회원 관리</a><br><br>
<a href="<%=request.getContextPath() %>/ad/notice/list" class="myButton">공지사항</a>
<a href="<%=request.getContextPath() %>/ad/free/list" class="myButton">자유게시판</a>
<a href="<%=request.getContextPath() %>/ad/qna/list" class="myButton">QnA</a>
<a href="<%=request.getContextPath() %>/ad/declare/list" class="myButton">신고된 게시글</a><br><br>
<a href="<%=request.getContextPath() %>/ad/product/list" class="myButton">상품 관리</a>
</div>