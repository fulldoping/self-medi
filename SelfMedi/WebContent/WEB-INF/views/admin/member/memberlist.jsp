<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/admin/layout/header.jsp" />

<%-- 여기 header와 paging, footer사이가 본문코드 작성영역입니다. --%>
<div class="container">
<div class="boardtitle">
<h1 style= "text-align :center; color: #3D3D3D;" >회원관리</h1>
<hr>
</div>

	<table class="table table-striped table-hover table-condensed">

<!-- 		<thead> -->
			<tr>
				<th style= "text-align: center;">회원번호</th>
				<th style= "text-align: center;">이름</th>
				<th style= "text-align: center;">닉네임</th>
				<th style= "text-align: center;">가입 날짜</th>
			</tr>
<!-- 		</thead> -->
		<tbody>
			<c:forEach items="${memberList }" var="member">
				<tr>
					<td>${member.userNo }</td>
					<td><a href="/ad/member/view?userNo=${member.userNo }">
							${member.userName } </a></td>
					<%-- 	<td>${member.userid }</td> --%>
					<td>${member.userNick }</td>
					<td>${member.joinDate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<c:import url="/WEB-INF/views/layout/pagingMember.jsp" />


<c:import url="/WEB-INF/views/layout/footer.jsp" />