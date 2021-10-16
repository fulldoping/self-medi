<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<style type="text/css">

body{margin:0;}

.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.content{
	width:1050px;
	margin:auto;
}

.producttb{
	width:50%;
	float: left;
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

.producttb{
	width:50%;
	height: 500px;
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
    width: 200px;
    vertical-align: -0.2em;
    -webkit-user-modify: read-only !important;
}

.detail{
	display: none;
}
</style>

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
</script>

</head>
<body>

<div id="header">
	<h1>
		<a href="/">Self-Medi</a>
	</h1>
</div>

<h3>제품비교</h3>
<div class="content" style="width: 1050px;">
	<c:forEach items="${productInfo }" var="productInfo">
		<div class="producttb">;
			<table class="tg" style="table-layout: fixed; width: 400; float:left;">
				<thead>
					<tr>
						<td class="tg-0lax" rowspan="3" colspan="5"><img src="${productInfo.image }"
							width="470" height="300"></td>
					</tr>
				</thead>
					<tr>
						<td class="tg-baqh" colspan="5">${productInfo.productName }</td>
					</tr>
					<tr>
						<td class="tg-baqh" colspan="5">제조사 : ${productInfo.manuCom }</td>
					</tr>
					<tr>
						<td class="type" colspan="3">타입 : ${productInfo.type }</td>
						<td colspan="2"><span class="jstars" data-value="${productInfo.starScore }" 
						data-size="10px" data-color="blue"></span>(${productInfo.starScore }점)</td>
					</tr>
					<tr><td style="border-right: none;"></td><td></td><td></td><td></td><td></td></tr>
			</table>
		</div>
	</c:forEach>
		<table>
			<tr class="tg-baqh">
				<td class="tg-baqh">함유 영양소</td>
				<td class="tg-baqh" colspan="2">권장량 비교 그래프</td>
				<td class="tg-baqh">함량</td>
				<td class="tg-baqh">권장량</td>	
			</tr>
		</table>
	
</div>
	<div class="nutwrap">		
		 <c:forEach items="${nikList1 }" var="nik">
			<div class="nuttb" style="width:50%;">
				<tr>
					<td class="tg-baqh">${nik.nk.nutKind }</td>
					<td class="tg-baqh" colspan="2"><meter
						low='${nik.nk.rcmAdult.replaceAll("[^0-9]", "")*0.85 }'
						high='${nik.nk.rcmAdult.replaceAll("[^0-9]", "")*1.15 }' min='0'
						max='${nik.nk.rcmAdult.replaceAll("[^0-9]", "")*1.3 }'
						optimum='${nik.nk.rcmAdult.replaceAll("[^0-9]", "") }'
						value='${nik.ni.nutContent.replaceAll("[^0-9]", "") }'> </meter></td>
					<td class="tg-baqh">${nik.ni.nutContent }</td>
					<td class="tg-baqh">${nik.nk.rcmAdult }</td>
				</tr>
			</div>
		</c:forEach>
	</div>
	<div class="nutwrap">		
		 <c:forEach items="${nikList2 }" var="nik">
			<div class="nuttb" style="width:50%;">
				<!-- <table class="tg" style="table-layout: fixed; width: 1050px"> -->
					<tr>
						<td class="tg-baqh">${nik.nk.nutKind }</td>
						<td class="tg-baqh" colspan="2"><meter
							low='${nik.nk.rcmAdult.replaceAll("[^0-9]", "")*0.85 }'
							high='${nik.nk.rcmAdult.replaceAll("[^0-9]", "")*1.15 }' min='0'
							max='${nik.nk.rcmAdult.replaceAll("[^0-9]", "")*1.3 }'
							optimum='${nik.nk.rcmAdult.replaceAll("[^0-9]", "") }'
							value='${nik.ni.nutContent.replaceAll("[^0-9]", "") }'> </meter></td>
						<td class="tg-baqh">${nik.ni.nutContent }</td>
						<td class="tg-baqh">${nik.nk.rcmAdult }</td>
					</tr>
				<!-- </table> -->
			</div>
		</c:forEach>
	</div>
</body>
</html>