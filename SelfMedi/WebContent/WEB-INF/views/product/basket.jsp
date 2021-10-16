<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>: : : Self-Medi : : :</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">

div.title{
	float:left;
	width: 95%;
}

.basketlist{  
	display: grid;
 	place-items: center;
 	min-height: 100vh;
 	}
 	
div.tablewrap{
	width:1024px;
	background-color: #ccc;
	}
table.producttb{
	width:45%;
	float: left;
	}
td.productinfo{width: 250px;}

div.btn{
	width: 1024px;
	margin:0 auto;
	text-align:center;
	bakcground-color: #caf;
}

table{
	border: 1px solid #aaa;
}

div.footer{
	text-align: center;
 }
</style>
</head>
<body>

	<div id="header">
		<h1>
			<a href="/">Self-Medi</a>
		</h1>
	</div>


	<script type="text/javascript">
	$(document).ready(function() {
		$("input[name=checkbox]:checkbox").change(function() {// 체크박스들이 변경됬을때
			var cnt = 2;
			if (cnt == $("input[name=checkbox]:checkbox:checked").length) {
			$(":checkbox:not(:checked)").attr("disabled","disabled");
			} else {
				$("input[name=checkbox]:checkbox").removeAttr("disabled");
					}
		});

		$("#selCnt").change(function() {
			$("input[name=checkbox]:checkbox").removeAttr("checked");
			$("input[name=checkbox]:checkbox").removeAttr("disabled");
		});

		
		//글쓰기 버튼 누르면 이동
			$("#compbtn").click(function() {

			/* 		//방법1. 선택된 productId들을 , 로 구분하는 한 문자열로 합쳐서 보낸다  -> 컨트롤러에서 split() 필요
					var productIds = $("input[name='productId']:checked").map(function() {
					return $(this).val();
					}).get().join();
												
					console.log("-- checked --")
					console.log(productIds)
												
					location.href="/comparison?productIds=" + productIds; */

					//방법2. form태그를 생성하고 checked된 input체크박스를 submit하는 방식
					//	-> 컨트롤러에서 req.getParameterValues("productId"); 사용
					var form = $("<form>").attr("action","/comparison").attr("method", "get");

					$("input[name='productId']:checked").each(function() {
						//			console.log( $(this).val() )
						form.append($(this)).appendTo($(document.body));
						})
						form.submit();
					});

					$("#mergebtn").click(function() {
					$("input[name='productId']:checked").each(function() {
						//			console.log( $(this).val() )

						form.append($(this)).appendTo($(document.body));
						})
						form.submit();
					});

					$("#deletebtn").click(function() {
						location.href = "/delete/basket";
						});
					});
	</script>






			<!-- 비로그인상태 -->
			<c:if test="${empty login or not login }">
				<strong>로그인이 필요합니다</strong>
				<br>
				<button onclick='location.href="/member/login";'>로그인</button>
				<button onclick='location.href="/member/join";'>회원가입</button>
			</c:if>

		<div class="basketlist">
			<!-- 로그인상태 -->
				<c:if test="${not empty login and login }">
				<div class="title">
					<h1>비교함</h1>
					<hr style="color: blue">
				</div>
				<div class="tablewrap">
				<c:forEach items="${productInfo }" var="productInfo">
					<table class="producttb">
 						 <tr>
   							 <td class="product" rowspan="4"><input type="checkbox" value="${productInfo.productId }" name="checkbox" /></td>
   							 <td class="product" rowspan="4"><img src="${productInfo.image }" width="250" height="150" name="image"></td>
    						<td class="product"><input type="button" name="deletebtn" value="제거"/></td>
  						</tr>
 						 <tr>
   							 <td class="productinfo">${productInfo.productName }</td>
  						</tr>
  						<tr>
   							 <td class="productinfo">${productInfo.manuCom }</td>
  						</tr>
 						 <tr>
   							 <td class="productinfo">평점 :${productInfo.starScore }</td>
 						 </tr>
					</table>
				</c:forEach>
				</div>
			</c:if>

		</div>
		<div class="btn">
				<c:if test="${not empty login and login }">
					<button id="compbtn">비교</button>
					<button id="mergebtn">합산</button>
				</c:if>
		</div>
</body>
	<div id="footer">
		<h1 id="footer">Footer</h1>
	</div>
</html>