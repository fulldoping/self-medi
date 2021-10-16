<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">


</script>
<h1>비교페이지</h1>

<%-- ${nik.ni.nutContent.replaceAll("[^0-9]", "") / nik.nk.rcmAdult.replaceAll("[^0-9]", "") * 100} --%>
<%-- ${nik.ni.nutContent.replaceAll("[^0-9]", "")} --%>
<%-- ${nik.ni.nutContent.replaceAll("[^0-9]", "") } --%>

		<c:forEach items="${productList }" var="pro">
		<table>
		<tr>
		<td>${pro.productId }</td>
		</tr>		
		</table>
		</c:forEach>
		
		<c:forEach items="${nikList }" var="nik">
		<table>
		<tr>
		<td>${nik.ni.nutContent }</td>
		</tr>
		</table>
		</c:forEach>


	

</body>
</html>