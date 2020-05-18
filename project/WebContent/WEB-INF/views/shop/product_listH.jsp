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
		$("#btnOption").click(function() {
			/* $("#selectOption option:selected").val();
			var index = $("#selectOption option").index($("#selectOption option:selected")); */

			location.href = $("#selectOption option:selected").val();
		});
	});
</script>


</head>

<body>

	<%@ include file="../include/mainheader.jsp"%>

	<div class="content-wrapper">
		<div style="width: 1200px; margin: 0 auto;">
			<h2>
				<img alt="" src="${path}/images/Logo/H.JPG">
			</h2>
			<div class="selectWrapper">
			<select id="selectOption">
				<option value="${path}/shop/product/list_Hp.do">높은 가격순</option>
				<option value="${path}/shop/product/list_Hp2.do">낮은 가격순</option>
				<option value="${path}/shop/product/list_Hc.do">회사별</option>
				<option value="${path}/shop/product/list_Hn.do">이름순</option>
			</select>
			<button id="btnOption">정렬</button>
			</div>
		</div>
		<div class="list-view">
			<c:forEach var="row" items="${list}">
				<div class="list-view-child" style="">
					<div>
						<a href="${path}/shop/product/detail/${row.product_id}"><img
							src="${path}/images/product/${row.picture_url}"></a>
					</div>
					<div style="height: 50px;">
						<a href="${path}/shop/product/detail/${row.product_id}">
							${row.product_name}</a>
					</div>
					<div style="margin-top: 10px;">
						<fmt:formatNumber value="${row.price}" pattern="￦ #,###원" />
					</div>
				</div>
				<!-- 관리자에게만 편집 버튼 표시 -->
				<%-- 	 <c:if	test="${sessionScope.admin_userid != null }">
							
							<a href="${path}/shop/product/edit/${row.product_id}">[편집]</a>
						</c:if> --%>
			</c:forEach>

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

