<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- views/include/menu.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
<title>Dog Project</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${path}/include/css/menubar.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
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
		$("#btnLogin").click(function() {
			var userid = $("#userid").val(); //태그의 value 속성값
			var passwd = $("#passwd").val();
			if(userid == "admin"){
				document.form2.action = "${path}/admin/login_check.do";
				document.form2.submit();
				return; 
				}
			if (userid == "") {
				alert("아이디를 입력하세요.");
				$("#userid").focus(); //입력 포커스 이동
				return; //함수 종료
			}
			if (passwd == "") {
				alert("비밀번호를 입력하세요.");
				$("#passwd").focus();
				return;
			}
			//폼 데이터를 서버로 제출
			document.form2.action = "${path}/member/login_check.do";
			document.form2.submit();
		});
	});
	$(function() {
		$("#btnAdmin").click(function() {
			var userid = $("#userid").val(); //태그의 value 속성값
			var passwd = $("#passwd").val();
			if (userid == "") {
				alert("아이디를 입력하세요.");
				$("#userid").focus(); //입력 포커스 이동
				return; //함수 종료
			}
			if (passwd == "") {
				alert("비밀번호를 입력하세요.");
				$("#passwd").focus();
				return;
			}
			//폼 데이터를 서버로 제출
			document.form2.action = "${path}/admin/login_check.do";
			document.form2.submit();
		});
	});
</script>

<style>
.memberContainer {
	font-size: 25px;
	font-weight: bold;
	width: 500px;
	margin: 150 auto;
	border: 6px solid black;
	border-radius: 50px;
	padding: 20px;
}

.btn-block {
	margin-top: 50px;
}

.login-tag {
	position: relative;
	transform: translateY(-30%);
}

.form-control {
	font-size: 20px;
}
</style>

</head>

<body>

	<%@ include file="../include/mainheader.jsp"%>
	<div class="memberContainer">
		<img alt="" src="${path}/images/Logo/logo4.jpg"
			style="width: 200px; margin: 0 30%; position: relative; transform: translate(-5%, -70%);"><br>
		<form name="form2" method="post">
			<div class="form-group login-tag">
				아이디<input class="form-control" name="userid" id="userid">
			</div>
			<div class="form-group login-tag">
				비밀번호<input class="form-control" type="password" name="passwd"
					id="passwd">
			</div>
			<div class="form-group login-tag">
				<input type="button" class="btn btn-lg btn-success btn-block"
					id="btnLogin" value="로그인">
				<c:if test="${param.message == 'nologin' }">
					<div style="color: red; text-align: center;">로그인 하신 후 사용하세요.</div>
				</c:if>
				<c:if test="${message == 'error' }">
					<div style="color: red; text-align: center;">아이디 또는 비밀번호가
						일치하지 않습니다.</div>
				</c:if>
				<c:if test="${message == 'logout' }">
					<div style="color: blue; text-align: center;">로그아웃 처리되었습니다.</div>
				</c:if>
			</div>
		</form>
	</div>
	<!-- FOOTER 시작점 -->
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

