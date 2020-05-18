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
		$("#btnDelete").click(function() {
			if (confirm("장바구니를 비우시겠습니까?")) {
				location.href = "${path}/shop/petcart/petdeleteAll.do";
			}
		});
		$("#btnBuy").click(function() {
			if (confirm("결제가 완료되었습니다.")) {
				location.href = "${path}/shop/petcart/buy.do";
			}
		});
	});
</script>


</head>

<body>

	<%@ include file="../include/mainheader.jsp"%>

	<!--content 시작-->
	<!-- 장바구니기능 -->
	<div class="cart-top" style="text-align: center;">
		<h2>
			<img src="${path}/images/Logo/장바구니.JPG"
				style="width: 300px; height: 250px; margin: 0;">
		</h2>
		<c:choose>
			<c:when test="${map.count == 0}">
				<h2>장바구니가 비었습니다.</h2>
			</c:when>
			<c:otherwise>
				<form name="form2" method="post"
					action="${path}/shop/petcart/petupdate.do">
					<table border="1" width="1100px">
						<tr style="font-size: 25px;" class="cart-tr">
							<th>상품</th>
							<th>상품명</th>
							<th>가격</th>
							<th>수량</th>
							<th>총 가격</th>
							<th>&nbsp;&nbsp;&nbsp;</th>
						</tr>
						<c:forEach var="row" items="${map.list}">
							<tr class="cart">
								<td><img src="${path}/images/product/${row.picture_url}"
									width="250px" height="280px"></td>
								<td>${row.product_name}</td>
								<td>${row.price}원</td>
								<td><input type="number" name="amount"
									value="${row.amount}"> <input type="hidden"
									name="cart_id" value="${row.cart_id}"></td>
								<td>${row.money}원</td>
								<td><c:if test="${sessionScope.userid != null}">
										<a	href="${path}/shop/petcart/petdelete.do?cart_id=${row.cart_id}"
											style="color: black;">삭제</a>
									</c:if></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="6" align="right">장바구니 금액 합계: ${map.pet_Money} 원<br>
								배송료 : ${map.fee} 원<br> 총합계 : ${map.sum} 원
							</td>
						</tr>
					</table>
				</form>
					<div
						style="margin: 10 auto; display: block; width: 1130px; text-align: right; position: relative; transform: translateX(-12px);">
						<button id="btnBuy" class="btn btn-lg btn-success btn-block"
							style="width: 300px; display: inline-block;">결제하기</button>
						<button id="btnDelete" class="btn btn-lg btn-success btn-block"
							style="width: 300px; display: inline-block; margin-top: 0;">장바구니
							비우기</button>
					</div>
			</c:otherwise>
		</c:choose>
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

