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
<script src="${path}/include/js/common.js"></script>
<!-- ckeditor의 라이브러리 -->
<script src="${path}/ckeditor/ckeditor.js"></script>
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

<style type="text/css">
.fileDrop {
	width: 600px;
	height: 100px;
	border: 1px dotted gray;
	background-color: gray;
}
</style>

</head>

<body>

	<%@ include file="../include/mainheader.jsp"%>


	<script type="text/javascript">
		function qnaboard_write() {
			// 태그를 name으로 조회할 경우(계층구조로 접근)
			//var product_name=document.form1.product_name.value;
			// 태그를 id로 조회할 경우
			var title = $("#title").val();
			var content = $("#content").val();

			if (title == "") { //빈값이면
				//문자열 비교 : java는 a.equal(b), javascript는 a==b
				alert("제목을 입력하세요");
				$("#title").focus(); //입력포커스 이동
				return; //리턴값없이 함수 종료, 폼 데이터를 제출하지 않음
			}
			/* if (content == "") {
				alert("내용을 입력하세요");
				$("#content").focus();
				return;
			} */
			/* 	if(description==""){
			 alert("상품 설명을 입력하세요");
			 $("#description").focus();
			 return;
			 } */
			//폼 데이터를 받을 주소
			document.form2.action = "${path}/qnaboard/insert.do";
			//폼 데이터를 서버에 전송
			document.form2.submit();
		}
	</script>
	<div
		style="text-align: center; margin: 30px 0 30px 0; font-size: 18px; font-weight: bold;">
		<div style="display: inline-block; text-align: left;">
			<!-- content -->
			<div style="text-align: center;">
				<h2>
					<img alt="" src="${path}/images/Logo/글쓰기.JPG"
						style="width: 350px; height: 200px; margin: -40px 0 -5px 0;">
				</h2>
			</div>
			<form id="form2" name="form2" method="post"
				enctype="multipart/form-data">
				<div>
					제목 <input name="title" id="title" size="80" placeholder="제목을 입력하세요">
				</div>
				<div>
					내용
					<textarea id="content" name="content" rows="3" cols="80"
						placeholder="내용을 입력하세요">
			</textarea>
					<script type="text/javascript">
						// ckeditor 적용
						CKEDITOR.replace("content", {
							filebrowserUploadUrl : "${path}/imageUpload.do"
						});// ImageUploadController.java 에서 처리
					</script>

				</div>
				<div>
					첨부파일을 등록하세요 <input type="file" name="file1" id="file1"> <label
						for="select_img">수정 후 이미지</label>
					<div class="select_img">
						<img src="" />
					</div>
					<script type="text/javascript">
						$("#file1").change(
								function() {
									if (this.files && this.files[0]) {

										var reader = new FileReader;
										reader.onload = function(data) {
											$(".select_img img").attr("src",
													data.target.result).width(
													200);
										}

										reader.readAsDataURL(this.files[0]);
									}
								});
					</script>
				</div>
				<div style="text-align: center;">
					<input type="button" value="등록" onclick="qnaboard_write()"
						class="btn btn-lg btn-success btn-block"
						style="width: 250px; display: inline-block; margin-bottom: 10px; margin-top: 10px;">
				</div>
			</form>
		</div>
	</div>

	<%@ include file="../include/footer.jsp"%>


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

