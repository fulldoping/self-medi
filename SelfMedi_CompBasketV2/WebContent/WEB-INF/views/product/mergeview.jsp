<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.tg td {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg th {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg .tg-zv4m {
	border-color: #ffffff;
	text-align: left;
	vertical-align: top
}

.tg .tg-baqh {
	text-align: center;
	vertical-align: top
}

.tg .tg-8jgo {
	border-color: #ffffff;
	text-align: center;
	vertical-align: top
}

.tg .tg-lqy6 {
	text-align: right;
	vertical-align: top
}

.tg .tg-0lax {
	text-align: left;
	vertical-align: top
}

table {
	margin: auto
}

meter {
    -webkit-writing-mode: horizontal-tb !important;
    appearance: auto;
    box-sizing: border-box;
    display: inline-block;
    height: 3em;
    width: 25em;
    vertical-align: -0.2em;
    -webkit-user-modify: read-only !important;
}

.detail{
	display: none;
}
</style>

</head>
<body>

<div id="header">
	<h1>
		<a href="/">Self-Medi</a>
	</h1>
</div>

<h3>제품비교</h3>

<div>
	<c:forEach items="${productInfo }" var="productInfo">
		<table class="tg" style="table-layout: fixed; width: 960px">
			<colgroup>
				<col style="width: 480px">
				<col style="width: 240px">
				<col style="width: 240px">
			</colgroup>
			<thead>
				<tr>
					<td class="tg-0lax" rowspan="3"><img src="${productInfo.image }"
						width="470" height="300"></td>
					<td class="tg-baqh">${productInfo.productName }</td>
					<td class="tg-lqy6">별점 : ${productInfo.starScore }점</td>
				</tr>
				<tr>
					<td class="tg-baqh">제조사 : ${productInfo.manuCom }</td>
					<td class="tg-baqh">타입 : ${productInfo.type }</td>
				</tr>
			</thead>
		</table>
	</c:forEach>
</div>

<div></div>

<table class="tg" style="table-layout: fixed; width: 960px">
	<colgroup>
		<col style="width: 120px">
		<col style="width: 310px">
		<col style="width: 90px">
		<col style="width: 170px">
		<col style="width: 170px">
		<col style="width: 100px">
	</colgroup>
	<c:forEach items="${nikList }" var="nik">
		<thead>
			<tr>
				<th class="tg-baqh">${nik.nk.nutKind }</th>
				<th class="tg-baqh" colspan="2"><meter
						low='${nik.nk.rcmAdult.replaceAll("[^0-9]", "")*0.85 }'
						high='${nik.nk.rcmAdult.replaceAll("[^0-9]", "")*1.15 }' min='0'
						max='${nik.nk.rcmAdult.replaceAll("[^0-9]", "")*1.3 }'
						optimum='${nik.nk.rcmAdult.replaceAll("[^0-9]", "") }'
						value='${nik.ni.nutContent.replaceAll("[^0-9]", "") }'> </meter></th>

				<th class="tg-baqh">${nik.ni.nutContent }</th>
				<th class="tg-baqh">${nik.nk.rcmAdult }</th>
			</tr>
		</thead>
		<tbody id="detail${nik.ni.nutId }" class="detail">
			<tr>
				<td class="tg-baqh" colspan="5" style="width: 860px">${nik.nk.effect }</td>
				<td class="tg-zv4m"></td>
			</tr>
			<tr>
				<td class="tg-baqh" colspan="2">${nik.nk.deficiency }</td>
				<td class="tg-baqh" colspan="3">${nik.nk.hyperact }</td>
				<td class="tg-zv4m"></td>
			</tr>
		</tbody>
	</c:forEach>
</table>

</body>
</html></html>