<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- views/member/write.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
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

<title>회원가입</title>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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

	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[name=addr1]").val(data.zonecode);
				$("[name=addr2]").val(fullRoadAddr);

				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
			}
		}).open();
	}

	function check() {
		//아이디 체크
		var userid = document.getElementById("userid");
		if (userid.value == "") {
			alert("아이디는 필수 입력입니다.");
			userid.focus();
			return;
		}

		//비밀번호 체크
		var passwd = document.getElementById("passwd");
		if (passwd.value == "") {
			alert("비밀번호는 필수 입력입니다.");
			passwd.focus();
			return;
		}

		//이름 체크
		var name = document.getElementById("username");
		if (name.value == "") {
			alert("이름을 입력하세요.");
			username.focus();
			return;
		}

		//휴대폰번호 체크
		var hp = document.getElementById("hp");
		if (hp.value == "") {
			alert("휴대폰 번호를 입력하세요.");
			hp.focus();
			return;
		}

		//이메일 체크
		var email = document.getElementById("email");
		if (email.value == "") {
			alert("이메일을 입력하세요.");
			email.focus();
			return;
		}

		//주소 체크
		var addr1 = document.getElementById("addr1");
		if (addr1.value == "") {
			alert("우편번호 찾기를 누르세요.");
			addr1.focus();
			return;
		}
		document.form2.submit();
	}
</script>
<style type="text/css">

.memberContainer {
	font-size: 16px;
	font-weight: bold;
	width: 500px;
	margin: 0 auto;
	zoom: 1.3;
}

.container h2 {
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="../include/mainheader.jsp"%>

	<div class="memberContainer">
		<img alt="" src="${path}/images/Logo/logo3.png"
			style="width: 200px; margin: 0 30%;">
		<form name="form2" method="post" action="${path}/member/insert.do">
			<div class="form-group">
				아이디 <input class="form-control id" placeholder="아이디" name="userid"
					id="userid" type="text" />
			</div>

			<div class="form-group">
				비밀번호 <input class="form-control" placeholder="비밀번호" name="passwd"
					id="passwd" type="password" />
			</div>

			<div class="form-group">
				이름 <input class="form-control" placeholder="이름" name="username"
					id="username" type="text" />
			</div>

			<div class="form-group">
				휴대폰 번호 <input class="form-control" placeholder="휴대폰 번호" name="hp"
					id="hp" type="text" />
			</div>

			<div class="form-group">
				이메일 <input class="form-control" placeholder="이메일" name="email"
					id="email" type="text" />
			</div>
			<div class="form-group">
				주소<br> <input class="form-control"
					style="width: 40%; display: inline;" placeholder="우편번호"
					name="addr1" id="addr1" type="text" readonly="readonly">
				<button type="button" class="btn btn-default"
					onclick="execPostCode();">
					<i class="fa fa-search"></i> 우편번호 찾기
				</button>
			</div>
			<div class="form-group">
				<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
					name="addr2" id="addr2" type="text" readonly="readonly" />
			</div>
			<div class="form-group">
				<input class="form-control" placeholder="상세주소" name="addr3"
					id="addr3" type="text" />
			</div>


			<!-- <input type="submit" class="btn btn-lg btn-success btn-block" value="확인"> -->
			<input type="button" class="btn btn-lg btn-success btn-block"
				onclick=check() value="확인" style="margin-bottom: 30px;">
		</form>
	</div>
	<%@ include file="../include/footer.jsp" %>

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
</body>
</html>
