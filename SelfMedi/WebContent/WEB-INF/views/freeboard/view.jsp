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
		$(location).attr("href", "/free/list");
	});
	
	//신고버튼 동작
	$("#btndeclare").click(function() {
		$(location).attr("href", "/free/declare?boardNo=${viewFree.boardNo }");
	});
	
	//수정버튼 동작
	$("#btnUpdate").click(function() {
		$(location).attr("href", "/free/update?boardNo=${viewFree.boardNo }");
	});

	//삭제버튼 동작
	$("#btnDelete").click(function() {
		if( confirm("게시글을 삭제하시겠습니까?") ) {
			$(location).attr("href", "/free/delete?boardNo=${viewFree.boardNo }");
		}
	});

});

//댓글 관련
$(document).ready(function() {
	$(document.body).on("click", ".commentDelete", function() {
		var th = $(this);
		console.log("--",th.parent().children(".newComment").val())
		//----- 전달 파라미터 구성 -----
		var boardNo = ${viewFree.boardNo};
		var commentNo = th.parent().attr("data-commentNo")
		var params = "&boardNo=" + boardNo + "&commentNo=" + commentNo;

		console.log(params)
		
		//----- URL 구성 ----
		var url = "/free/comment/delete";

		//----- AJAX 요청 전송 -----
		sendRequest("GET", url, params, callback);
	});
	
	$(document.body).on("click", ".commentUpdate", function() {
//		console.log($(this).parent().attr('data-commentNo'))
		
		$(this).parent().children(".oldComment").toggle()
		
		$(this).parent().children(".newComment").toggle()
		$(this).parent().children(".btnCommentUpdate").toggle()
		$(this).parent().children(".btnCommentUpdateCancel").toggle()
	});
	
	$(document.body).on("click", ".btnCommentUpdate", function() {
		
		var th = $(this);
		console.log("--",th.parent().children(".newComment").val())
		
		//----- 전달 파라미터 구성 -----
		var boardNo = ${viewFree.boardNo};
		var commentNo = th.parent().attr("data-commentNo")
		var commentContent = th.parent().children(".newComment").val()
		var params = "&boardNo=" + boardNo + "&commentNo=" + commentNo + "&commentContent=" + commentContent;

		console.log(params)
		
		//----- URL 구성 ----
		var url = "/free/comment/update";
		//----- AJAX 요청 전송 -----
		sendRequest("GET", url, params, callback);
	})
	
	$(document.body).on("click", ".btnCommentUpdateCancel", function() {
		$(this).parent().children(".oldComment").toggle()
		
		$(this).parent().children("[name='newComment']").toggle()
		$(this).parent().children(".btnCommentUpdate").toggle()
		$(this).parent().children(".btnCommentUpdateCancel").toggle()
		
	})
	
});


//AJAX 요청 보내는 메소드, 댓글

function send() {	
	//----- 전달 파라미터 구성 -----
	var boardNo = ${viewFree.boardNo};
	var c = content.value;
	var params = "&boardNo=" + boardNo + "&content=" + c;

	//----- URL 구성 ----
	var url = "/free/comment/write";

	//----- AJAX 요청 전송 -----
	sendRequest("POST", url, params, callbacksend);
	
}

//AJAX 응답 처리하는 콜백함수
function callback() {
	if (httpRequest.readyState == 4) {
		if (httpRequest.status == 200) {
			console.log("AJAX 정상 응답")

			//정상응답 처리 함수
			appendResult();

		} else {
			console.log("AJAX 요청/응답 에러")
		}
	}
}

//AJAX 응답 처리하는 콜백함수
function callbacksend() {
	if (httpRequest.readyState == 4) {
		if (httpRequest.status == 200) {
			console.log("AJAX 정상 응답")

			//정상응답 처리 함수
			appendsendResult();

		} else {
			console.log("AJAX 요청/응답 에러")
		}
	}
}

//정상 응답 후 응답데이터 처리하는 함수
function appendResult() {
	commentList.innerHTML = httpRequest.responseText;
}

//정상 응답 후 응답데이터 처리하는 함수
function appendsendResult() {
	commentList.innerHTML = httpRequest.responseText;
	content.value = "";
}

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
	<button id="btndeclare" >신고</button>
	<c:if test="${viewFree.userNo eq userNo }">
		<button id="btnUpdate" >수정</button>
		<button id="btnDelete" >삭제</button>
	</c:if>
</div>

<h4>댓글</h4>
	<hr>

	<div id="commentList">
		<c:forEach items="${commentList }" var="comment">
		<div data-commentNo="${comment.commentNo }">
			<label>${comment.userNick }</label><br>
			<label class="oldComment">${comment.commentContent }</label>
			<input type="text" class="newComment" name="newComment" style="display:none;" value="${comment.commentContent }" />
			<button class="btnCommentUpdate" style="display:none;">확인</button>
			<button class="btnCommentUpdateCancel" style="display:none;">취소</button><br>
			<label>${comment.commentDate }</label><br>
			
			<c:if test="${comment.userNo eq userNo}">
				<span class="commentDelete">삭제</span>
				<span class="commentUpdate">수정</span>
			</c:if>
			
			<hr>
		</div>
		</c:forEach>
	</div>

	<div>
		<c:if test="${not empty userNo }">
			<label>${nick }<br> <textarea id="content"></textarea>
				</label>
				<br>
			<button onclick="send();">댓글 달기</button>
		</c:if>
	</div>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
