<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	
	//페이지 첫 접속 시 입력창으로 포커스 이동
	$("input").eq(0).focus();

	//로그인 버튼 클릭 시 form submit
	$("#btnJoin").click(function() {
		var p1 = document.getElementById('userPw').value;
	    var p2 = document.getElementById('userPw2').value;
		    if( p1 != p2 ) {
		       alert("비밀번호가 일치 하지 않습니다");
		       return false;
		     } else {
		       $(this).parents("form").submit();
		     }   
	})
});
</script>

<style type="text/css">
form {
	width: 500px;
	margin: 0 auto;
}

.icon {
	color: red;
}

</style>

<div class="container">

<h2 class="text-center">회원가입</h2>
<h6 class="text-right"><span class="icon">* </span>필수입력사항</h6>
<hr>

<form action="/member/businessjoin" method="post">

	<div>
		<label for="userId">아이디
			<span class="icon">*</span>
		</label>
		<div>
			<input type="text" id="userId" name="userId" />
			<button type="submit">중복확인</button>
		</div>
	</div>

	<div>
		<label for="userPw">비밀번호
			<span class="icon">*</span>
		</label>
		<div>
			<input type="password" id="userPw" name="userPw" />
		</div>
	</div>
	
		<div>
		<label for="userPw2">비밀번호확인
			<span class="icon">*</span>
		</label>
		<div>
			<input type="password" id="userPw2" name="userPw2" />
		</div>
	</div>

	<div>
		<label for="userName">이름
			<span class="icon">*</span>
		</label>
		<div>
			<input type="text" id="userName" name="userName" />
		</div>
	</div>

	<div>
		<label for="userNick">닉네임
			<span class="icon">*</span>
		</label>
		<div>
			<input type="text" id="userNick" name="userNick" />
			<button type="submit">중복확인</button>
		</div>
	</div>


	<div>
		<label for="userPh">휴대폰
			<span class="icon">*</span>
		</label>
		<div>
			<input type="text" id="userPh" name="userPh" />
		</div>
	</div>

	<div>
		<label for="userEm">이메일<span class="icon">*</span>
		</label>
		<div>
			<input type="text" id="userEm" name="userEm" />
			<button type="submit">중복확인</button>
		</div>
	</div>

	<div>
		<label for=userGen>성별</label>
		<label>
		<input type="radio" name="userGen" id="userGen" value="F" checked> 남성 </label> 
		<label>
		<input type="radio" name="userGen" id="userGen" value="M" checked> 여성 </label>
	</div>

	<div>
		<label for="userBirth">생년월일</label>
		<div>
			<input type="text" id="userBirth" name="userBirth" />
		</div>
	</div>

	<div>
		<label for="businessNo">사업자번호</label>
		<div>
			<input type="text" id="businessNo" name="businessNo" />
		</div>
	</div>
	
	<div>
		<label for="join_btn"></label>
		<div>
			<button type="button" id="btnJoin">가입하기</button>
		</div>
	</div>
	
</form>

	<!-- .container -->
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
