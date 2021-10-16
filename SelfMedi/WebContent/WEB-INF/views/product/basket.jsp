<%@page import="com.fulldoping.product.dto.NutrientInfo"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<meta charset="utf-8">
<title>: : : Self-Medi : : :</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

    
<style>
body {
	margin: 0;
	
	height:2000px;
}

#footer {
   width:100%;
   background:#5eaeff;
  text-align: center;
  color: white;
}
.container { }

.tablebody{
	width: 1024px; margin:0 auto; text-align: center;
}
.tablewrap{width:45%; float: left; background-color: #ccc; border: 10px solid #fff;}

span{
	width:150px;
}

.btn{width: 1024px; margin:0 auto; text-align: center;}

</style>

</head>
<body>

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);


  (function ($) {
	    $.fn.jstars = function (options) {
	        options = options || {};

	        var defaults = {
	            size: '1.5rem',
	            value: 4.5,
	            stars: 5,
	            color: '#4285F4',
	            emptyColor: '#dddddd'
	        };
	        var settings = $.extend(defaults, options);

	        var unselectable = function ($element) {
	            $element.css('user-select', 'none')
	                .css('-moz-user-select', 'none')
	                .css('-khtml-user-select', 'none')
	                .css('-webkit-user-select', 'none')
	                .css('-o-user-select', 'none');
	        };

 	        var repeat = function (str, total) {
	            var last = '';
	            for (var i = 0; i < total; i++) last += str;
	            return last;
	        }; 

	        this.each(function () {
	            var $container = $(this);
	            var value = $container.data('value') || settings.value;
	            var totalStars = $container.data('total-stars') || settings.stars;
	            var color = $container.data('color') || settings.color;
	            var emptyColor = $container.data('empty-color') || settings.emptyColor;
	            var size = $container.data('size') || settings.size;

	            var $emptyStars = $(document.createElement('div'))
	                .addClass('jstars-empty')
	                .css('position', 'relative')
	                .css('display', 'inline-block')
	                .css('font-size', size)
	                .css('line-height', size)
	                .css('color', emptyColor)
	                .append(repeat("&starf;", totalStars));

	            unselectable($emptyStars);

	            var $filledStars = $(document.createElement('div'))
	                .addClass('jstars-filled')
	                .css('top', 0)
	                .css('left', 0)
	                .css('position', 'absolute')
	                .css('display', 'inline-block')
	                .css('font-size', size)
	                .css('line-height', size)
	                .css('width', ((value / totalStars) * 100) + '%')
	                .css('overflow', 'hidden')
	                .css('white-space', 'nowrap')
	                .css('color', color)
	                .append(repeat("&starf;", totalStars));

	            unselectable($filledStars);

	            $emptyStars.append($filledStars);
	            $container.append($emptyStars);
	        });
	        return this;
	    };
	    $(function () {
	        $('.jstars').jstars();
	    });
	})(jQuery);
  
  $(document).ready(function() {
		$("input[name=productId]:checkbox").change(function() {// 체크박스들이 변경됬을때
				var cnt = 2;
			if (cnt == $("input[name=productId]:checkbox:checked").length) {
				$(":checkbox:not(:checked)").attr("disabled","disabled");
			} else {
				$("input[name=productId]:checkbox").removeAttr("disabled");
					}
		});

		$("#selCnt").change(function() {
			$("input[name=productId]:checkbox").removeAttr("checked");
			$("input[name=productId]:checkbox").removeAttr("disabled");
		});

		
		//글쓰기 버튼 누르면 이동
		$("#compbtn").click(function() {

		/* 	//방법1. 선택된 productId들을 , 로 구분하는 한 문자열로 합쳐서 보낸다  -> 컨트롤러에서 split() 필요
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
			
			var form = $("<form>").attr("action","/merge").attr("method", "get");
			
			$("input[name='productId']:checked").each(function() {
				//			console.log( $(this).val() )
				form.append($(this)).appendTo($(document.body));
			})
				form.submit();
		});

					
		$("[name='deletebtn']").click(function() {
			
		    if(confirm("정말 삭제하시겠습니까 ?") == true){
		        alert("삭제 되었습니다");
				var form = $("<form>").attr("action","/delete/basket").attr("method", "get");
				
				form.append($(this)).appendTo($(document.body));
			
				form.submit;
				
		    }else{
		        return ;
		    }
				/* 	console.log( $(this).prev().prev()); */
		});

	});
</script>

<div id="header">
	<h1>
		<a href="/">Self-Medi</a>
	</h1>
</div>

<div class="container">

<!--     <h3>Advanced Usage</h3>
    <div class="jstars" data-value="6.4" data-total-stars="10" data-color="#22D118" data-empty-color="black" data-size="30px"></div>
    <br/> -->

<!-- 비로그인상태 -->
<c:if test="${empty login or not login }">
	<strong>로그인이 필요합니다</strong><br>
	<button onclick='location.href="/member/login";'>로그인</button>
	<button onclick='location.href="/member/join";'>회원가입</button>
</c:if>

 	<div class="basketlist">
		<!-- 로그인상태 -->
		<c:if test="${not empty login and login }">
			<div class="title">
				<h1>보관함에 담은 목록</h1>
				<hr style="color: blue">
			</div>
			<div class="tablebody">
				<c:forEach items="${productInfo }" var="productInfo">
					<div class="tablewrap">
	   					<span class="product"><input type="checkbox" value="${productInfo.productId }" name= "productId" /></span>
	   					<span class="product"><img src="${productInfo.image }" width="250" height="150" name="image"></span>
	    				<span class="product"><button name="deletebtn" value="${productInfo.productId }" >제거</button></span>
	   					<span class="product">${productInfo.productName }</span>
	   					<span class="product">${productInfo.manuCom }</span>
	   					<div class="jstars" data-value="${productInfo.starScore }" data-size="10px" data-color="black"></div>
	   					<div>(${productInfo.starScore }/5)</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
		<div class="btn">
				<c:if test="${not empty login and login }">
					<div class="btn"id="btn1"><button id="compbtn">비교</button></div>
					<div id="btn2"><button id="mergebtn">합산</button></div>
				</c:if>
		</div>
</div>
</body>
	<div id="footer">
		<h1 id="footer">Footer</h1>
	</div>
</html>
