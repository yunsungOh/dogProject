<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- views/include/menu.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
<title>Dog Project</title>
<meta charset="utf-8">
<%@ include file="../include/header.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${path}/include/css/menubar.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${path}/include/css/master.css">
<link rel="stylesheet" href="${path}/include/css/searchbutton.css">
<link rel="stylesheet" href="${path}/include/css/footer.css">
<link rel="stylesheet" href="${path}/include/css/detail.css">
<link rel="stylesheet" href="${path}/include/css/totalLayout.css">
<script type="text/javascript">
	$(document).ready(function() {
		$(".menu>a").click(function() {
			$(this).next("div").toggleClass("hide");
		});

		var $nav = $('nav');
		$(window).scroll(function() {
			if ($(document).scrollTop() > 180) {
				$nav.addClass('scroll');
			} else {
				$nav.removeClass('scroll');
			}
		});
	});
	$(function() {
		$("#btnUpdate").click(function() {
			location.href = "${path}/shop/product/edit/${product_id}";
		});
	});
</script>


</head>

<body>

	<%@ include file="../include/mainheader.jsp"%>

	<div class="content-wrapper">

		<div class="detail_top">
			<div class="detail_top_img">
				<img class="img_main"
					src="${path}/images/product/${dto.picture_url}" width="600px">
				<img class="img_sub" alt="다른사진"
					src="${path}/images/product/${dto.picture_url_sub1}"> <img
					class="img_sub" alt="다른사진"
					src="${path}/images/product/${dto.picture_url_sub2}"> <img
					class="img_sub" alt="다른사진"
					src="${path}/images/product/${dto.picture_url_sub3}">
			</div>
			<div class="detail_top_text">
				<div class="text_com">
					<a href="#">${dto.product_company}</a>
				</div>
				<hr>
				<div class="text_name">
					<a href="#">제품명: ${dto.product_name}</a>
				</div>
				<div class="text_price">
					<a href="#">가격: ${dto.price} 원</a>
				</div>
				<form name="form2" method="post"
					action="${path}/shop/petcart/petinsert.do">
					<input type="hidden" name="product_id" value="${dto.product_id}">
					<p style="font-size: 25px; display: inline;">수량:</p>
					<select name="amount" style="width: 100px; font-size: 20px;">
						<c:forEach begin="1" end="10" var="i">
							<option value="${i}">${i}개</option>
						</c:forEach>
					</select>
					<button value="장바구니에 담기" class="btn btn-lg btn-success btn-block">장바구니에
						담기</button>
				</form>
				<div>
					<button id="buy" class="btn btn-lg btn-success btn-block"
						style="margin-top: 5px;" value="구매하기">구매하기</button>

				</div>
				<br>
				<c:if test="${sessionScope.admin_userid != null }">
					<button id="btnUpdate" class="btn btn-lg btn-success btn-block">수정하기</button>

				</c:if>
			</div>
			<div class="detail_line">
				<div class=menu>
					<a>상세보기</a>
					<div class="hide">
						<img width="700px"
							src="${path}/images/product/${dto.picture_url_detail}">
					</div>
				</div>
			</div>
		</div>

	</div>




	<%@ include file="../include/footer.jsp" %>

	<!-- 헤더 스크롤 에니메이션 스크립트 -->
	<script type="text/javascript">
		var $window = $(window), $mainHeader = $('#main-header'), $defaultLogo = '${path}/images/Logo/Logo.png', $smallLogo = '${path}/images/Logo/Logo.png';
		$window.scroll(function() {
			if ($(this).scrollTop() > 180) {
				if (!$mainHeader.hasClass('shrink')) {
					$mainHeader.addClass('shrink');

					switchImages($smallLogo);
				}
			} else {
				if ($mainHeader.hasClass('shrink')) {
					$mainHeader.removeClass('shrink');
					$HeaderSearch.addClass('hidden');
					switchImages($defaultLogo);
				}
			}
		});
		//switchImage 함수 
		function switchImages(newPath) {
			var $logo = $('#logo');
			$mainHeader.fadeOut(10, function() {
				$logo.attr('src', newPath);
				$mainHeader.fadeIn(10);
			});
		}
		var $HeaderSearch = $('hsearchbar');
		$window.scroll(function() {
			if ($(this).scrollTop() > 300) {
				if (!$HeaderSearch.hasClass('.hidden')) {
					$HeaderSearch.addClass('hidden');

				}
			} else {
				if (!$HeaderSearch.hasClass('.hidden')) {
					$HeaderSearch.removeClass('hidden');
				}
			}
		});
		/*맨위로가기  */
		$(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > 500) {
					$('.top').fadeIn();
				} else {
					$('.top').fadeOut();
				}
			});

			$(".top").click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 400);
				return false;
			});
		});
	</script>

	<!-- 위로가기버튼 -->
	<div>
		<a href="#" class="top"><img src="${path}/images/top.png"
			width="80px" height="80px"></a>
	</div>

</body>
</html>

