<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:import url="/WEB-INF/views/admin/layout/header.jsp" />

<%-- 여기 header와 paging, footer사이가 본문코드 작성영역입니다. --%>
<style type="text/css">

.tg  {border-collapse:collapse;
	border-spacing:0;}

.tg td{ border-color:black;
	border-style:solid;
	border-width:1px;
	font-family:Arial,
	sans-serif;
	font-size:14px;
  	overflow:hidden;
  	padding:10px 20px;
  	word-break:normal;}
  
.tg th{border-color:black;
	border-style:solid;
	border-width:1px;
	font-family:Arial, sans-serif;
	font-size:14px;
  	font-weight:normal;
  	overflow:hidden;
  	padding:10px 20px;
  	word-break:normal;}
  
.tg .tg-18bt{background-color:#dae8fc;
	border-color:#dae8fc;
	text-align:left;
	vertical-align:top;
	font-style: fon}

.tg .tg-xphl{border-color:#dae8fc;
	text-align:left;
	vertical-align:top;
	color: steelblue;}

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
.btnBox:hover {
	background-color:#476e9e;
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

<div id="maincontent">

<div class="container">

<h1 style="text-align :center; color: cornflowerblue; margin-top: 50px;" >자유게시판 관리</h1>
<hr>

<table class="tg" style="undefined;table-layout: fixed; width: 800px; margin:0 auto;">
<colgroup>
	<col style="width: 15%">
	<col style="width: 35%">
	<col style="width: 15%">
	<col style="width: 15%">
	<col style="width: 20%">
</colgroup>
<thead>
  <tr>
    <th class="tg-18bt">글번호</th>
    <th class="tg-18bt">제목</th>
    <th class="tg-18bt">작성자</th>
    <th class="tg-18bt">조회수</th>
    <th class="tg-18bt">작성일</th>
  </tr>
</thead>
<tbody>
<c:forEach items="${freeList }" var="free">
  <tr>
    <td class="tg-xphl">${free.boardNo }</td>
    <td class="tg-xphl"><a href="/ad/free/view?boardNo=${free.boardNo }">
		${free.boardTitle }
		</a></td>
    <td class="tg-xphl">${free.userId }</td>
    <td class="tg-xphl">${free.hit }</td>
    <td class="tg-xphl">${free.boardDate }</td>
  </tr>
</c:forEach>
</tbody>
</table>

<c:import url="/WEB-INF/views/admin/layout/paging.jsp" />
<!-- .container -->
</div>


</div>

<c:import url="/WEB-INF/views/admin/layout/footer.jsp" />