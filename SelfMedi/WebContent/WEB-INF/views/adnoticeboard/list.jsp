<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	
	//글쓰기 버튼 누르면 이동
	$("#btnWrite").click(function() {
		location.href="/ad/notice/write";
	});
	
});
</script>

<style>
.btnBox {
	background-color:#7892c2;
	border-radius:10px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Trebuchet MS;
	font-size:15px;
	font-weight:bold;
	padding:5px 10px;
	text-decoration:none;
}
.btnBox {
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color:#ffffff;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:12px;
	font-weight:bold;
	padding:6px 12px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.btnBox:hover {
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color:#f6f6f6;
}
.btnBox:active {
	position:relative;
	top:1px;
}
.btn{
	position : relative;
	left: 880px;
}

</style>

<div class="container">

<h1 >공지사항 관리자</h1>
<hr>

<table class="table table-striped table-hover table-condensed">
<tr>
	<th>글번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>조회수</th>
	<th>작성일</th>
</tr>

<c:forEach items="${adNoticeList }" var="adNotice">
<tr>
	<td>${adNotice.boardNo }</td>
	<td>
		<a href="/ad/notice/view?boardNo=${adNotice.boardNo }">
		${adNotice.boardTitle }
		</a>
	</td>
<%-- 	<td>${adNotice.userId }</td> --%>
	<td>${adNotice.userNick }</td>
	<td>${adNotice.hit }</td>
	<td>${adNotice.boardDate }</td>
</tr>
</c:forEach>

</table>


<div id="btnBox" class="btn">
	<button id="btnWrite" class="btnBox" style="margin-right: 50%;">글작성</button>
</div>

<!-- .container -->
</div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />

<c:import url="/WEB-INF/views/layout/footer.jsp" />