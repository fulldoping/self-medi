<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
.tg  {border-collapse:collapse;
	border-spacing:0;}
.tg td{border-color:black;
	border-style:solid;
	border-width:1px;
	font-family:Arial, sans-serif;
	font-size:14px;
  	overflow:hidden;
  	padding:10px 5px;
  	word-break:normal;}
  	
.tg th{border-color:black;
	border-style:solid;
	border-width:1px;
	font-family:Arial, sans-serif;
	font-size:14px;
  	font-weight:normal;
  	overflow:hidden;
  	padding:10px 5px;
  	word-break:normal;}
  	

.tg .tg-a{text-align:left;
	vertical-align:top;
	border-right: none;}	
	
.tg .tg-b{text-align:left;
	vertical-align:top;
	border-left: none;}	
	
.tg .tg-c{text-align:left;
	vertical-align:top;
	border-left: none;
	border-right: none;}	
</style>

<script type="text/javascript">
$(document).ready(function() {
	//목록버튼 동작
	$("#btnList").click(function() {
		$(location).attr("href", "/ad/free/list");
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

<table class="tg" style="undefined;table-layout: fixed; width: 640px">
<colgroup>
<col style="width: 61px">
<col style="width: 71px">
<col style="width: 71px">
<col style="width: 71px">
<col style="width: 71px">
<col style="width: 51px">
<col style="width: 71px">
<col style="width: 51px">
<col style="width: 71px">
<col style="width: 51px">
</colgroup>

  <tr>
    <td class="tg-0lax">제목</td>
    <td class="tg-0lax" colspan="9">${viewFree.boardTitle }</td>
  </tr>

  <tr>
    <td class="tg-a">No.</td>
    <td class="tg-c">${viewFree.boardNo }번</td>
    <td class="tg-c">작성자</td>
    <td class="tg-c">${viewFree.userNick }</td>
    <td class="tg-c">조회</td>
    <td class="tg-c">${viewFree.hit }회</td>
    <td class="tg-c"></td>
    <td class="tg-c"></td>
    <td class="tg-b" colspan="2">${viewFree.boardDate }</td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="10" rowspan="8">${viewFree.boardContent }</td>
  </tr>

</table>

<!-- 첨부파일 -->
<div>
<c:if test="${not empty freeFile }">
<li class="photo">
	<img src="/upload/${freeFile.storedName }" style="max-width:50%; height: auto"/>
</li>
</c:if>
</div>

<br>
<div class="text-center">	
	<button id="btnList" >목록</button>
	<button id="btnDelete" >삭제</button>
	
</div>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
