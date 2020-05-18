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
<link rel="stylesheet" href="${path}/include/css/board.css">
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

	$(function() { //자동으로 실행되는 코드
		//댓글 목록 출력
		//listReply();
		listReply2();

		//댓글 쓰기
		$("#btnReply").click(function() {
			var replytext = $("#replytext").val(); //댓글 내용
			var bno = "${dto.bno}"; //게시물 번호
			var param = {
				"replytext" : replytext,
				"bno" : bno
			};
			//var param="replytext="+replytext+"&bno="+bno;
			$.ajax({
				type : "post",
				url : "${path}/reply/insert.do",
				data : param,
				success : function() {
					alert("댓글이 등록되었습니다.");
					//listReply();
					listReply2(); //댓글 목록 출력
				}
			});
		});

		$(".fileDrop").on("dragenter dragover", function(e) {
			//기본 효과 막음
			e.preventDefault();
		});
		$(".fileDrop")
				.on(
						"drop",
						function(e) {
							e.preventDefault();
							//첫번째 첨부파일
							var files = e.originalEvent.dataTransfer.files;
							var file = files[0];
							//폼 데이터에 첨부파일 추가
							var formData = new FormData();
							formData.append("file", file);
							$
									.ajax({
										url : "${path}/upload/uploadAjax",
										data : formData,
										dataType : "text",
										processData : false,
										contentType : false,
										type : "post",
										success : function(data) {
											//console.log(data);
											//data : 업로드한 파일 정보와 Http 상태 코드
											var fileInfo = getFileInfo(data);
											//console.log(fileInfo);
											var html = "<a href='"+fileInfo.getLink+"'>"
													+ fileInfo.fileName
													+ "</a><br>";
											html += "<input type='hidden' class='file' value='"
					+fileInfo.fullName+"'>";
											$("#uploadedList").append(html);
										}
									});
						});

		//목록 버튼
		$("#btnList").click(function() {
			location.href = "${path}/board/list.do";
		});
		//수정 버튼
		$("#btnUpdate").click(
				function() {
					//첨부파일 이름들을 폼에 추가
					var str = "";
					$("#uploadedList .file").each(
							function(i) {
								//#id이름(공백).클래스이름 : id가 uploadeList인 태그의 자식태그 중에서 class가 file인 태그들
								str += "<input type='hidden' name='files[" + i
										+ "]' value='" + $(this).val() + "'>";
							});
					$("#form1").append(str);
					document.form1.action = "${path}/board/update.do";
					document.form1.submit();
				});
		//삭제 버튼
		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "${path}/board/delete.do";
				document.form1.submit();
			}
		});

		listAttach();

		//첨부파일 삭제
		//id가 uploadedList인 태그의 class가 file_del인 태그 클릭
		$("#uploadedList").on("click", ".file_del", function(e) {
			var that = $(this); //클릭한 태그
			//data: {fileName: $(this).attr("data-src") },		
			$.ajax({
				type : "post",
				url : "${path}/upload/deleteFile",
				data : "fileName=" + $(this).attr("data-src"),
				dataType : "text",
				success : function(result) {
					if (result == "deleted") {
						//화면에서 태그 제거
						that.parent("div").remove();
					}
				}
			});
		});
		$("#btnSave").click(
				function() {
					var str = "";
					// uploadedList 내부의 .file 태그 각각 반복
					$("#uploadedList .file").each(
							function(i) {
								console.log(i);
								//hidden 태그 구성
								str += "<input type='hidden' name='files[" + i
										+ "]'	value='" + $(this).val() + "'>";
							});
					//폼에 hidden 태그들을 붙임
					$("#form1").append(str);
					document.form1.submit();
				});

	});
	//댓글 목록 출력 함수
	function listReply() {
		$.ajax({
			type : "get",
			url : "${path}/reply/list.do?bno=${dto.bno}",
			success : function(result) {
				//result : responseText 응답텍스트(html)
				$("#listReply").html(result);
			}
		});
	}
	//타임스탬프값(숫자형)을 문자열 형식으로 변환
	function changeDate(date) {
		date = new Date(parseInt(date));
		year = date.getFullYear();
		month = date.getMonth();
		day = date.getDate();
		hour = date.getHours();
		minute = date.getMinutes();
		second = date.getSeconds();
		strDate = year + "-" + month + "-" + day + " " + hour + ":" + minute
				+ ":" + second;
		return strDate;
	}
	function listReply2() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "${path}/reply/list_json.do?bno=${dto.bno}",
			success : function(result) {
				//view를 만들지 않는 대신에 자바스크립트로 table등을 만들어야 한다.
				console.log(result);
				var output = "<table>";
				for ( var i in result) {
					var repl = result[i].replytext;
					// /정규식/(규칙) => 정규표현식
					// 규칙 g: global 전역검색, i: 대소문자 무시
					// ex) /java/gi => JAVA 또는 java를 모두 찾음
					repl = repl.replace(/  /gi, "&nbsp;&nbsp;");//공백처리
					repl = repl.replace(/</gi, "&lt;"); //태그문자 처리
					repl = repl.replace(/>/gi, "&gt;");
					repl = repl.replace(/\n/gi, "<br>"); //줄바꿈 처리

					output += "<tr><td>" + result[i].username;
					date = changeDate(result[i].regdate);
					output += "(" + date + ")";
					output += "<br>" + repl + "</td></tr>";
				}
				output += "</table>";
				$("#listReply").html(output);
			}
		});
	}
	//첨부파일 리스트를 출력하는 함수
	function listAttach() {
		$
				.ajax({
					type : "post",
					url : "${path}/board/getAttach/${dto.bno}",
					success : function(list) {
						// Controller에서 List<String>타입으로 넘어온 값을 처리하기 위해 json으로 처리
						// list : json
						//console.log(list);
						$(list)
								.each(
										function() {
											var fileInfo = getFileInfo(this);
											//console.log(fileInfo);
											var html = "<div><a href='"+fileInfo.getLink+"'>"
													+ fileInfo.fileName
													+ "</a>&nbsp;&nbsp;";
											<c:if test="${sessionScope.userid == dto.writer}">
											html += "<a href='#' class='file_del' data-src='"
					+this+"'>[삭제]</a></div>";
											</c:if>
											$("#uploadedList").append(html);
										});
					}
				});
	}

	$(function() {
		$("#btnEdit").click(function() {
			location.href = "${path}/board/edit/${dto.bno}";
		});
	});
</script>

<style type="text/css">
</style>

</head>

<body>

	<%@ include file="../include/mainheader.jsp"%>


	<!-- content -->
	<div id="wrap">
		<div id="title">
			<h2>
				<img alt="" src="${path}/images/Logo/상품리뷰.JPG"
					style="width: 350px; height: 200px; margin: -40px 0 -25px 0;">
			</h2>
		</div>
		<div id="content">
			<table border="1" width="100%">
				<tbody>
					<tr>
						<th scope="row">제목</th>
						<td>${dto.title}</td>
						<th scope="row">작성자</th>
						<td>${dto.username}</td>
					</tr>
					<tr>

					</tr>
					<tr>
						<th scope="row">작성일</th>
						<td><fmt:formatDate value="${dto.regdate}"
								pattern="yyyy-MM-dd   hh:mm:ss" /></td>
						<th scope="row">조회수</th>
						<td>${dto.viewcnt}</td>
					</tr>
					<tr class="main">
						<td colspan="4">
							<div class="detail">
								<img src="${path}/images/board/${dto.picture_url}" border="0">
								<br>
								<!-- iframe에 업로드 결과 출력 -->
								<div name="iframe1"></div>
								<br>
								<p>${dto.content}</p>
							</div>
						</td>
					</tr>

					<tr>
						<td><c:choose>
						<c:when test="${sessionScope.userid == dto.writer || sessionScope.admin_userid != null}">
								<input type="button" id="btnEdit"
									class="btn btn-lg btn-success btn-block" value="수정하기">
							</c:when> 
							<%-- <c:when test="${sessionScope.admin_userid != null}">
								<input type="button" id="btnEdit"
									class="btn btn-lg btn-success btn-block" value="수정하기">
							</c:when>--%>
							</c:choose> </td>

					</tr>
				</tbody>
			</table>
		</div>


		<!-- 댓글 작성 -->
		<div style="width: 1100px; text-align: center;">
			<c:if test="${sessionScope.userid != null }">
				<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성하세요"
					style="resize: none; font-size: 20px; font-weight: bold;"></textarea>
				<br>
				<button type="button" id="btnReply"
					class="btn btn-lg btn-success btn-block"
					style="width: 400px; margin: 20px 0px 20px 0px; float: right;">댓글쓰기</button>
			</c:if>
		</div>
		<!-- 댓글 목록 -->
		<div id="listReply"></div>
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

