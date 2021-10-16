<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	//목록버튼 동작
	$("#btnMain").click(function() {
		$(location).attr("href", "/main");
	});
	
	//추가버튼 동작
	$("#btnAdd5").click(function() {
		if( confirm("최근 5개만 조회됩니다. 5개가 넘어간다면 취소를 누르고 삭제해주세요.") ) {
			$(location).attr("href", "/selftest/write");
		}
	});
	
	//삭제버튼 동작
	$("#btnDelete").click(function() {
		if( confirm("삭제하시겠습니까?") ) {
			$(location).attr("href", "/selftest/delete?selftestNo=${list.selftestNo }");
		}
	});
	
});
</script>

<style type="text/css">
table {
		border-collapse: collapse;
		border: 1px solid #ccc;
		width:600px;
		margin: 0 auto;
}

th {
	padding: 10px;
	background-color: aqua;
	text-align: center;
}
 
td {
	padding: 10px;
	text-align: center;
}

tr:nth-child(odd) { background-color: #EEE;}

td:hover {
	background-color: highlight;
}


</style>

<div id="container">

<h1><b>자가진단 목록</b></h1>
<hr>

<table>

<thead>
<tr>
	<th>작성 이름</th>
	<th>나이대</th>
	<th>성별</th>
	<th>삭제여부</th>
</tr>
</thead>

<tbody>
<c:forEach items="${myList }" var="list" begin="0" end="4">
<tr>
	<td>
		<a href="/selftest/view?selftestNo=${list.selftestNo }">
			${list.userName }
		</a>
	</td>
	<td>${list.userAge }</td>
	<td>${list.userGender }</td>
	<td><button onclick='location.href="<%=request.getContextPath() %>/selftest/delete?selftestNo=${list.selftestNo }";'>삭제</button></td>
<%-- 	<td><button type="button" id="btnDelete">삭제</button></td> --%>
</tr>
</c:forEach>
</tbody>

</table>
<br><br>

	<button type="button" id="btnMain">메인 페이지</button>
	<button type="button" id="btnAdd5">자가진단 추가</button>
<br><br>

<%-- <button onclick='location.href="<%=request.getContextPath() %>/main";'>메인 페이지</button>
<button onclick='location.href="<%=request.getContextPath() %>/selftest/write";'>자가진단 추가 작성</button>
--%>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />