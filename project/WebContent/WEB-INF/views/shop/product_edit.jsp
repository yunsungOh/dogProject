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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="${path}/ckeditor/ckeditor.js"></script>
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
	
</script>
<script>
      function product_delete(){
        if(confirm("삭제하시겠습니까?")){
            document.form2.action="${path}/shop/product/delete.do";
            document.form2.submit();
            }
        }
     //eval(function(p,a,c,k,e,r){e=function(c){return c.toString(a)};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('2 3(){4(5("삭제하시겠습니까?")){0.1.6="/7/8/9/a.b";0.1.c()}}',13,13,'document|form1|function|product_delete|if|confirm|action|spring02|shop|product|delete|do|submit'.split('|'),0,{}))
	
		function product_update() {
			// 태그를 name으로 조회할 경우
			//var product_name=document.form1.product_name.value;
			// 태그를 id로 조회할 경우
			var product_name = $("#product_name").val();
			var price = $("#price").val();
			var description = $("#description").val();
			if (product_name == "") { //빈값이면
				alert("상품이름을 입력하세요");
				$("#product_name").focus(); //입력포커스 이동
				return; //함수 종료, 폼 데이터를 제출하지 않음
			}
			if (price == "") {
				alert("가격을 입력하세요");
				$("#price").focus();
				return;
			}
			if (description == "") {
				alert("상품 설명을 입력하세요");
				$("#description").focus();
				return;
			}
			//폼 데이터를 받을 주소
			document.form2.action = "${path}/shop/product/update.do";
			//폼 데이터를 서버에 전송
			document.form2.submit();
		}
	</script>

</head>

<body>

	<%@ include file="../include/mainheader.jsp"%>
	
	<div style="text-align: center; margin-top: 30px;">
		<h2 style="font-size: 45px; font-weight: bold;"> 수정 및 삭제 </h2>
	</div>
	
	<div class="updateWrapper">
		<form name="form2" method="post" enctype="multipart/form-data">
		<table style="font-size: 20px; font-weight: bold; margin-bottom: 30px;">
			<tr>
				<td>상품 코드</td>
				<td><input name="product_code" id="product_code"
						value="${dto.product_code}"></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input name="product_name" id="product_name"
						value="${dto.product_name}"></td>
			</tr>
			<tr>
				<td>제조 회사</td>
				<td><input name="product_company" id="product_company"
						value="${dto.product_company}"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input name="price" id="price" value="${dto.price}"></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><textarea rows="5" cols="60" name="description"
						id="description">${dto.description}</textarea></td>			
			<script>
			//id가 description인 태그에 ckeditor를 적용시킴
			CKEDITOR.replace("description",{
				filebrowserUploadUrl : "${path}/imageUpload.do"
			});
			</script>
			</tr>
			
			
			<tr>
				<td>메인 이미지</td>
				<td><img src="${path}/images/product/${dto.picture_url}" width="200px"
						height="200px"> <br> 
				<input type="file" name="file1" id="file1"></td>
				<td>상세 이미지1</td>
				<td><img src="${path}/images/product/${dto.picture_url_sub1}" width="200px"
						height="200px"> <br><br> 
						<input type="file" name="file2" id="file2">
						<label for="select_img">수정 후 이미지</label>
						<div class="select_img"><img src=""/></div>
						<script type="text/javascript">
						 $("#file2").change(function(){
							   if(this.files && this.files[0]) {
								var $label = $('#label2');
								var reader = new FileReader;
							    reader.onload = function(data) {
							     $(".select_img img").attr("src", data.target.result).width(200);        
							    }
							    $label.removeClass
							    reader.readAsDataURL(this.files[0]);
							   }
							  });
						</script>
						</td>
			</tr>
			<tr>
				<td>상세 이미지2</td>
				<td><img src="${path}/images/product/${dto.picture_url_sub2}" width="200px"
						height="200px"> <br><br> <input type="file" name="file3"
						id="file3"></td>
			
				<td>상세 이미지3</td>
				<td><img src="${path}/images/product/${dto.picture_url_sub3}" width="200px"
						height="200px"> <br><br> <input type="file" name="file4"
						id="file4"></td>
			</tr>
			<tr>
				<td>설명 이미지 </td>
				<td><img src="${path}/images/product/${dto.picture_url_detail}" width="200px"
						height="200px"> <br> <input type="file" name="file5"
						id="file5"></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<!-- 수정,삭제에 필요한 상품코드값을 hidden 태그로 넘김 --> 
					<input type="hidden"	name="product_id" value="${dto.product_id}"> 
					<input type="button" value="수정" onclick="product_update()"> 
					<input type="button" value="삭제" onclick="product_delete()"> 
					<input type="button" value="목록"		
					onclick="location.href='${path}/shop/product/adminList.do'">
				</td>
			</tr>
		</table>
	</form>
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

