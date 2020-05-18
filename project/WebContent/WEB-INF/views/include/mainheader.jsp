
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Header 시작점 -->
	<header id="main-header">
		<div class="headermenu">
			<a href="/project/"><img src="${path}/images/Logo/Logo.png"
				width="100px" height="35px" id="logo"></a>
			<form name="form1" method="post"
				action="${path}/shop/product/list.do">
				<select name="search_option" class="h-search-bar h-option">
					<option value="all"
						<c:if test="${map.search_option == 'all'}">selected</c:if>>전체</option>
					<option value="product_code"
						<c:if test="${map.search_option == 'product_code'}">selected</c:if>>상품
						종류</option>
					<option value="product_name"
						<c:if test="${map.search_option == 'product_name'}">selected</c:if>>상품
						이름</option>
					<option value="product_company"
						<c:if test="${map.search_option == 'product_company'}">selected</c:if>>회사명</option>
				</select> <input name="keyword" value="${map.keyword}"
					class="h-search-bar h-text">
				<button class="h-search-button">
					<img alt="" src="${path}/images/icon/search.svg">
				</button>
			</form>


			<c:choose>
				<c:when test="${sessionScope.userid == null }">
					<ul style="text-align: right;">
						<!-- 로그인하지 않은 상태 -->
						<li><a href="${path}/member/write.do">회원가입&nbsp&nbsp&nbsp&nbsp/</a></li>
						<li><a href="${path}/member/login.do">로그인&nbsp&nbsp&nbsp&nbsp/</a></li>
						<li><a href="${path}/shop/petcart/petlist.do">장바구니</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<!-- 로그인한 상태 -->
					<ul style="text-align: right;">
						<li><a>${sessionScope.username}님 반갑습니다.</a></li>
						<li><a href="${path}/member/logout.do">로그아웃&nbsp&nbsp&nbsp&nbsp/</a></li>
						<li><a href="${path}/shop/petcart/petlist.do">장바구니</a></li>
						<c:if test="${sessionScope.admin_userid != null }">
						<li><a href="${path}/shop/product/write.do">/&nbsp&nbsp&nbsp&nbsp물품 업로드</a></li>
						</c:if>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- end headermenu -->
	</header>
	<!-- end main-header -->

	<div class="jumbotron">
		<div class="container text-center">
			<a href="/project/"><img src="${path}/images/Logo/Logo.png"
				width="430px" height="180px"> </a>
			<p>Best Quality & Best Service</p>
			<div class="search-bar">
				<form name="form1" method="post"
					action="${path}/shop/product/list.do">
					<select name="search_option" class="option">
						<option value="all"
							<c:if test="${map.search_option == 'all'}">selected</c:if>>전체</option>
						<option value="product_code"
							<c:if test="${map.search_option == 'product_code'}">selected</c:if>>상품
							종류</option>
						<option value="product_name"
							<c:if test="${map.search_option == 'product_name'}">selected</c:if>>상품
							이름</option>
						<option value="product_company"
							<c:if test="${map.search_option == 'product_company'}">selected</c:if>>회사명</option>
					</select> <input name="keyword" value="${map.keyword}" class="search-text">
					<button class="search-button">
						<img alt="" src="${path}/images/icon/search.svg">
					</button>
				</form>
			</div>
		</div>
		<!-- end container text-center-->
	</div>
	<!-- end  jumbotron-->

	<!-- 네비게이션 바 시작점 -->
	<nav class="navbar navbar-inverse">
		<div class="wrapper">
			<div class="menubar">
				<ul>
					<li><a href="${path}/shop/product/bestList.do">Best 상품</a></li>
					<li><a href="#">애견 먹거리</a>
						<ul>
							<li><a href="${path}/shop/product/list_A.do">사료</a></li>
							<li><a href="${path}/shop/product/list_B.do">간식</a></li>
						</ul></li>
					<li><a href="#">애견 용품</a>
						<ul>
							<li><a href="${path}/shop/product/list_C.do">급수기 & 급식기</a></li>
							<li><a href="${path}/shop/product/list_D.do">배변 패드</a></li>
							<li><a href="${path}/shop/product/list_E.do">외출 용품</a></li>
							<li><a href="${path}/shop/product/list_F.do">하우스</a></li>
						</ul></li>
					<li><a href="#">애견 Toy & 의류</a>
						<ul>
							<li><a href="${path}/shop/product/list_G.do">애견 Toy</a></li>
							<li><a href="${path}/shop/product/list_H.do">애견 의류</a></li>
						</ul></li>
					<li><a href="#">커뮤니티</a>
						<ul>
							<li><a href="#">공지 사항 (미구현)</a></li>
							<li><a href="${path}/board/list.do">상품 이용 후기</a></li>
							<li><a href="${path}/qnaboard/list.do">1 : 1 고객 센터</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>