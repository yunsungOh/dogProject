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
		$("#btnWrite").click(function() {
			location.href = "${path}/board/write.do";
		});
	});
	function list(page) {
		location.href = "${path}/board/list.do?curPage=" + page;
	}
</script>
<style type="text/css">
table {
	width: 100%;
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
	color: #353535;
	font-size: 16px;
	line-height: 140%;
	font-weight: bold;
}

th, td {
	border: 0;
	vertical-align: top;
}

table td {
	padding: 6px 3px 4px;
	height: 32px;
	border-bottom: 1px solid #ededed;
	text-align: center;
	vertical-align: middle;
}

table th {
	border-top: 1px solid #e7e7e7;
	border-bottom: 1px solid #e7e7e7;
	padding: 7px 0 7px;
	background: #fdfdfd;
	color: #8f8d8d;
	font-size: 20px;
	text-align: center;
}

#wrap {
	position: relative;
	width: 1100px;
	margin: 0 auto;
	margin-top: 16px;
}

#title {
	margin: 25px 0 25px;
	text-align: center;
}

#title h2 {
	font-size: 50px;
	font-weight: bold;
}

td img {
	border-radius: 50%;
	width: 75px;
	height: 75px;
}

table .subject {
	word-break: break-all;
	text-align: left;
	padding-left: 35px;
}

table .txtLess {
	color: #939393;
	font-size: 11px;
}

#boardSearchForm {
	text-align: center;
}

#write {
	float: right;
}

select {
	height: 24px;
	border: 1px solid #d5d5d5;
}

input, select, textarea {
	font-size: 100%;
	font-family: Malgun Gothic, "돋움", Dotum;
	color: #353535;
	vertical-align: middle;
}

#keyword {
	padding: 3px;
	border: 1px solid #d5d5d5;
	color: #2e2e2e;
}

.boardWrapper a {
	color: black;
}
</style>

</head>

<body>

	<%@ include file="../include/mainheader.jsp"%>
	<div id="wrap">

		<div id="title">
			<h2>
				<img alt="" src="${path}/images/Logo/상품리뷰.JPG"
					style="width: 350px; height: 200px; margin: -40px 0 -25px 0;">
			</h2>
		</div>
		<div class="boardWrapper">
			<div id="content">

				<table border="1" width="100%">

					<colgroup>
						<col style="width: 70px;" />
						<col style="width: 75px;" />
						<col style="width: 450px;" />
						<col style="width: 84px;" />
						<col style="width: 77px;" />
						<col style="width: 55px;" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">사진</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">조회</th>
						</tr>

					</thead>
					<tbody>
						<c:forEach var="row" items="${map.list}">
							<tr>
								<td>${row.bno}</td>
								<td><img src="${path}/images/board/${row.picture_url}"
									border="0"></td>
								<td class="subject"><a
									href="${path}/board/view.do?bno=${row.bno}">${row.title}</a> <c:if
										test="${row.cnt > 0}">
										<span style="color: red;">(${row.cnt})</span>
									</c:if></td>
								<td>${row.username}</td>
								<td class="txtLess"><fmt:formatDate value="${row.regdate}"
										pattern="yyyy-MM-dd hh:mm:ss" /></td>
								<td class="txtLess">${row.viewcnt}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div id="write">
				<button type="button" id="btnWrite"
					class="btn btn-lg btn-success btn-block" style="margin-top: 15px;">글쓰기</button>
			</div>

			<div id="board-paging">
				<!-- 페이지 네비게이션 출력 -->
				<table>
					<tr>
						<td><c:if test="${map.pager.curBlock > 1}">
								<a href="#" onclick="list('1')">[처음]</a>
							</c:if> <c:if test="${map.pager.curBlock > 1}">
								<a href="#" onclick="list('${map.pager.prevPage}')"> [이전]</a>
							</c:if> <c:forEach var="num" begin="${map.pager.blockBegin}"
								end="${map.pager.blockEnd}">
								<c:choose>
									<c:when test="${num == map.pager.curPage}">
										<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
										<span style="color: red;">${num}</span>
									</c:when>
									<c:otherwise>
										<a href="#" onclick="list('${num}')">${num}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach> <c:if test="${map.pager.curBlock < map.pager.totBlock}">
								<a href="#" onclick="list('${map.pager.nextPage}')">[다음]</a>
							</c:if> <c:if test="${map.pager.curPage < map.pager.totPage}">
								<a href="#" onclick="list('${map.pager.totPage}')">[끝]</a>
							</c:if></td>
					</tr>
				</table>

			</div>

			<!-- 검색폼 -->
			<div class="search-bar" style="margin-bottom: 30px;">
				<form id="boardSearchForm" name="form1" method="post"
					action="${path}/board/list.do">
					<p>
						<select id="search_option" name="search_option" class="option">
							<option value="title"
								<c:if test="${map.search_option == 'title'}">selected</c:if>>제목</option>
							<option value="username"
								<c:if test="${map.search_option == 'username'}">selected</c:if>>작성자</option>
							<option value="content"
								<c:if test="${map.search_option == 'content'}">selected</c:if>>내용</option>
						</select> <input id="keyword" name="keyword" value="${map.keyword}"
							class="search-text">
						<button class="search-button">
							<img alt="" src="${path}/images/icon/search.svg">
						</button>
					</p>
				</form>
			</div>
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

