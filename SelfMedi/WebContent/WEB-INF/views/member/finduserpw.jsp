<%@page import="com.fulldoping.member.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	Member member = (Member)request.getAttribute("member");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />    

<style>
	*{
		text-align : center;
	}
</style>

<section>

<div id="div1">
<h3>비밀번호 찾기</h3>
	<form action="/member/finduserpw" method="post" >
		<table class="table" style="margin:0 auto; width:700px;">
			<tr>
				<td><input type="text" name="userId" class="form-control" placeholder="아이디를 입력하세요"></td>
			</tr>
			<tr>
				<td><input type="text" name="userName" class="form-control" placeholder="이름을 입력하세요"></td>
			</tr><br>
			<tr>
				<td><input type="text" name="userEm" class="form-control" placeholder="이메일을 입력하세요"></td>
			</tr>
		</table>
	<button type="submit" class="btn btn-outline-info btn sm">검색</button>
	</form>
</div>

</section>
	

<c:import url="/WEB-INF/views/layout/footer.jsp" />