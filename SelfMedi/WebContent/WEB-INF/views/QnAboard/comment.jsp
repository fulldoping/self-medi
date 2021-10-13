<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  

<script type="text/javascript" src="/resources/js/httpRequest.js"></script>

<script type="text/javascript">
//AJAX 요청 보내는 메소드
function send() {
	//----- 전달 파라미터 구성 -----
	var boardNo = ${viewBoard.boardNo };
	var c = content.value;
	var params = "&boardNo="+ boardNo+"&content="+c;
	
	//----- URL 구성 ----
	var url = "/QnA/Comment/write";
	
	//----- AJAX 요청 전송 -----
	sendRequest("POST", url, params, callback);
}

//AJAX 응답 처리하는 콜백함수
function callback() {
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) {
			console.log("AJAX 정상 응답")
			
			//정상응답 처리 함수
			appendResult();
			
		} else {
			console.log("AJAX 요청/응답 에러")
		}
	}
}

//정상 응답 후 응답데이터 처리하는 함수
function appendResult() {
	commentList.innerHTML = httpRequest.responseText;
}
</script>

</head>
<body>

<h4>댓글</h4>
<hr>

<div id="commentList"></div>

<div>
	<label>${nick }<br>
		<textarea id="content"></textarea>
	</label><br>
	
	<button onclick="send();">댓글 달기</button>
</div>