<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- views/include/menu.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
<title>Dog Project</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="../include/header.jsp"%>
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
</script>


</head>

<body>

	<%@ include file="../include/mainheader.jsp"%>
	<script>
		function product_write() {
			// 태그를 name으로 조회할 경우(계층구조로 접근)
			//var product_name=document.form1.product_name.value;
			// 태그를 id로 조회할 경우
			var product_name = $("#product_name").val();
			var price = $("#price").val();
			var description = $("#description").val();
			if (product_name == "") { //빈값이면
				//문자열 비교 : java는 a.equal(b), javascript는 a==b
				alert("상품이름을 입력하세요");
				$("#product_name").focus(); //입력포커스 이동
				return; //리턴값없이 함수 종료, 폼 데이터를 제출하지 않음
			}
			if (price == "") {
				alert("가격을 입력하세요");
				$("#price").focus();
				return;
			}
			/* 	if(description==""){
			 alert("상품 설명을 입력하세요");
			 $("#description").focus();
			 return;
			 } */
			//폼 데이터를 받을 주소
			document.form2.action = "${path}/shop/product/insert.do";
			//폼 데이터를 서버에 전송
			document.form2.submit();
		}
	</script>
	<h2
		style="text-align: center; font-size: 50px; margin-top: 30px; margin-bottom: 20px; font-weight: bold;">상품
		등록</h2>
	<form name="form2" method="post" enctype="multipart/form-data"
		style="margin-bottom: 50px;">
		<table border="1"
			style="font-size: 20px; font-weight: bold; text-align: center;">
			<tr>
				<td>종류</td>
				<td><select name="product_code" id="product_code">
						<option value="사료">사료</option>
						<option value="간식">간식</option>
						<option value="급수기 급식기">급수기&급식기</option>
						<option value="배변패드">배변패드</option>
						<option value="외출용품">외출용품</option>
						<option value="하우스">하우스</option>
						<option value="애견 Toy">애견 Toy</option>
						<option value="애견 의류">애견 의류</option>
				</select></td>
			</tr>
			<tr>
				<td>물품 명</td>
				<td><input name="product_name" id="product_name"
					style="width: 100%"></td>
			</tr>
			<tr>
				<td>물품 회사</td>
				<td><input name="product_company" id="product_company"
					style="width: 100%"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input name="price" id="price" style="width: 100%"></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><textarea rows="5" cols="60" name="description"
						id="description"></textarea> <script type="text/javascript">
							CKEDITOR.replace("description", {
								filebroserUploadUrl : "${path}/imageUpload.do"
							});
						</script></td>
			</tr>
			<tr>
				<td>상품이미지</td>
				<td>메인이미지<input type="file" name="file1" id="file1">
					서브이미지1<input type="file" name="file2" id="file2"> 서브이미지2<input
					type="file" name="file3" id="file3"> 서브이미지3<input
					type="file" name="file4" id="file4"> 설명 이미지<input
					type="file" name="file5" id="file5">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="등록"
					onclick="product_write()" class="btn btn-lg btn-success btn-block"
					style="width: 250px; display: inline-block; margin-bottom: 10px; margin-top: 10px;">
					<input type="button" value="목록"
					onclick="location.href='${path}/shop/product/adminList.do'"
					class="btn btn-lg btn-success btn-block"
					style="width: 250px; display: inline-block; margin-bottom: 10px; margin-top: 10px;">
				</td>
			</tr>
		</table>
	</form>



	<!-- 	<!-- Footer 시작점 -->
	<!-- 	<footer class="container-fluid text-center"> -->
	<!-- 		<p>Online Store Copyright</p> -->
	<!-- 		<form class="form-inline"> -->
	<!-- 			Get deals: <input type="email" class="form-control" size="50" -->
	<!-- 				placeholder="Email Address"> -->
	<!-- 			<button type="button" class="btn btn-danger">Sign Up</button> -->
	<!-- 		</form> -->
	<!-- 	</footer> -->


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

