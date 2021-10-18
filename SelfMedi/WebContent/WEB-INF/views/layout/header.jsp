<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> : : : Self-Medi : : : </title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/se2/js/service/httpRequest.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
 
 
<style type="text/css">
@font-face { /* 글꼴 적용:NotoSans */
    font-family: 'notoBlack';
    src: url('../resources/font/NotoSansKR-Black.otf') format('truetype');
    font-family: 'notoBold';
    src: url('../resources/font/NotoSansKR-Bold.otf') format('truetype');
    font-family: 'notoLight';
    src: url('../resources/font/NotoSansKR-Light.otf') format('truetype');
    font-family: 'notoMedium';
    src: url('../resources/font/NotoSansKR-Medium.otf') format('truetype');
    font-family: 'notoRegular';
    src: url('../resources/font/NotoSansKR-Regular.otf') format('truetype');
    font-family: 'notoThin';
    src: url('../resources/font/NotoSansKR-Thin.otf') format('truetype');
}
* {margin: 0; padding: 0; box-sizing: border-box;    
	-webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    font-family: 'notoRegular';/* 글꼴 적용:NotoSans */}
#footer{ text-align: center;background: #A0AFFF; }
#container, table{text-align: center; }
/* ------------------------------------------------------- */
.head {display: table;width:100%;table-layout:fixed; margin:0 30px;}
.head-row {display:table-cell;vertical-align: middle;}
.head-center { display:table-cell;padding:0 auto;}
.head-right {text-align:center;text-decoration: none;}
.head-right > a{text-decoration:none;color:black;}
.head-right > a:hover{text-decoration:none;color:#3E8DDA;}
.img-overlay {opacity:1; display:inline-block;object-fit: cover;width:100%;height:100%;background:rgba(0, 0, 0, 0); text-align:center; position:relative;padding: 10px 15px;}
.clearfix {clear: both; width: 0; height: 0; /* 컨텐츠 영역 없애기 */
	overflow: hidden; /* 넘쳐서 흘러나온 내용물을 보이지 않게 설정한다 */}
/* ------------------------------------------------------- */
ul.nav {position:relative;margin:0 auto;padding: 0;list-style-type: none;display: table;}
/* ul.nav > div > li {border: 1px solid black;text-align:center;position:relative;display:table-cell;background:aqua;padding:0;line-height:20px;} */
ul.nav > div > li > a {color:black;text-decoration:none;font-size:16px;padding:0;margin-bottom:10px;vertical-align: middle;}
ul.nav > div > li > a:hover {color:tomato;text-decoration:none;vertical-align:middle;}
ul.nav > div > li > ul {z-index:9999;position: absolute;list-style-type: none;padding: 0;margin: 0;width:auto;line-height: 0;}
ul.nav > div > li > ul > li {/* border-radius:20px; */background:#345EE6;padding:0;height:0;font-size:0;}
ul.nav > div > li:hover > ul > li {height:40px;font-size:13px;line-height:40px;vertical-align: middle;text-align:center;transition: height 500ms;}
ul.nav > div > li.all > ul > li > a {background: #345EE6;color:#fff;text-decoration:none;width:130px;display:inline-block;text-align:left;}
ul.nav > div > li > ul > li > a {/* border-radius:20px; */background: #345EE6;color:#fff;text-decoration:none;width:130px;display:inline-block;text-align:center;}
ul.nav > div > li.all > ul > li > a:hover {color:tomato;background: #345EE6;width:100%;vertical-align: middle;text-align:left;}
ul.nav > div > li > ul > li > a:hover {color:tomato;background: #345EE6;width:100%;vertical-align: middle;text-align:center;}
span {display: table-cell;}
.fixed {position: fixed;
	border: 1px solid #213983;
	bottom: 30px;
	right: 50px;
	font-size: 15px;
	font-weight:bolder;
	text-align: center;
	color: black;}
.menu {display:table;width:100%;table-layout:fixed;border-top:1px solid #ccc;border-bottom:1px solid #ccc;}	
.menu-bar {display:table-cell;width:130px;height:40px;table-layout:fixed;list-style-type:none;text-align:center;vertical-align: middle;}
.menu-bar-logo {display:table-cell;width:130px;height:40px;table-layout:fixed;list-style-type:none;text-align:center;vertical-align: middle;}
.center {text-align:center;vertical-align: middle;}
hr {color:#ccc;}	
	
</style>
</head>

<body>

	<div class="head">

		<div class="head-row head-left"></div>

		<div class="head-row head-center">
			<div class="img-overlay">
				<a href="/"><img
					style="width: 300px; height: 112px;object-fit: cover;"
					alt="logo" src="../resources/img/selfmedi.png"></a>
			</div>
		</div>

		<div class="head-row head-right">
			<c:if test="${empty login or not login }">
				<a href="<%=request.getContextPath()%>/member/login">
				<img style="width:14px;height:14px;object-fit:cover;margin-bottom:5px;margin-right:2px;"
					alt="login" src="../resources/img/user.png">로그인</a> &Iota; 
				<a href="<%=request.getContextPath()%>/member/join">회원가입</a>
			</c:if>
			<c:if test="${not empty login and login and userKind ne 0 }">
				<a href="<%=request.getContextPath()%>/member/logout">
				<img style="width:14px;height:14px;object-fit:cover;margin-bottom:5px;margin-right:2px;"
					alt="login" src="../resources/img/user.png">로그아웃</a> &Iota; 
				<a href="<%=request.getContextPath()%>/mypage">마이페이지</a>
			</c:if>
			<c:if test="${not empty login and login and userKind eq 0}">
				<a href="<%=request.getContextPath()%>/member/logout">
				<img style="width:14px;height:14px;object-fit:cover;margin-bottom:5px;margin-right:2px;"
					alt="login" src="../resources/img/user.png">로그아웃</a> &Iota; 
				<a href="<%=request.getContextPath()%>/ad/member/list">관리페이지</a>
			</c:if>
		</div>

	</div>


	<div class="clearfix"></div>
<%-- ------------------------------------------------ --%>

	<div class="menu">
		<ul class="nav">

			<div class="menu-bar menu-bar-logo">
				<li class="all">
				<img
					style="width: 18px; height: 18px;object-fit: cover;"
					alt="menu_icon" src="../resources/img/menu.png">
					<ul>
						<li><a href="#">&nbsp;&nbsp;보관함</a></li>
						<li><a href="#">&nbsp;&nbsp;상품</a></li>
						<li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&raquo; 대상별</a></li>
						<li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&raquo; 증상별</a></li>
						<li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&raquo; 영양소별</a></li>
						<li><a href="#">&nbsp;&nbsp;게시판</a></li>
						<li><a href="<%=request.getContextPath() %>/free/list">&nbsp;&nbsp;&nbsp;&nbsp;&raquo; 자유게시판</a></li>
						<li><a href="<%=request.getContextPath() %>/qna/list">&nbsp;&nbsp;&nbsp;&nbsp;&raquo; QnA</a></li>
						<li><a href="<%=request.getContextPath() %>/notice/list">&nbsp;&nbsp;공지사항</a></li>
					</ul>
				</li>
			</div>

			<div class="menu-bar">
				<li>
				<a href="#"><span>상품</span></a>
					<ul>
						<li><a href="#">대상별</a></li>
						<li><a href="#">증상별</a></li>
						<li><a href="#">영양소별</a></li>
					</ul>
				</li>
			</div>

			<div class="menu-bar">
				<li>
				<a href="#"><span>보관함</span></a>
					<ul>
					</ul>
				</li>
			</div>

			<div class="menu-bar">
				<li>
				<a href="#"><span>게시판</span></a>
					<ul>
						<li><a href="<%=request.getContextPath() %>/free/list">자유게시판</a></li>
						<li><a href="<%=request.getContextPath() %>/qna/list">QnA</a></li>
					</ul>
				</li>
			</div>

			<div class="menu-bar">
				<li>
				<a href="<%=request.getContextPath() %>/notice/list"><span>공지사항</span></a>
				</li>
			</div>
			
		</ul>
		
	</div>

<br>

<div class="box fixed">
<a  href="#">
&nbsp;&Delta;TOP&nbsp;
</a>
</div>




