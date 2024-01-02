<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/actList.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<meta charset="UTF-8">
<title>list.jsp</title>
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ac12fe9c4f31e8dd54afd3eea4e1c48"></script>
</head>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<body>
<input type="hidden" value="${sessionScope.userId}" id="userId" class="userId" name="userId">
<section class="shop spad">
	 <div class="hero-wrap hero-bread" style="background-image: url(${pageContext.request.contextPath}/resources/images/bg_tennis.jpg);">
		<div class="container">
			<div class="latest-news mt-150 mb-150">
				
			</div>
		</div>
	</div>		
</section>
<div class="container">
	<div class="shop__option">
		<div class="row">
	   		<div class="col-lg-7 col-md-7">
	    		<div class="shop__option__search">
	            	<form>
						<div class="nice-select like-content" tabindex="0">
	<!-- ----------------- 검색창 -------------------------------- -->
							<select style="display: block;" name="scType" id="scType" class="searchForm">
	                			<option value="체험명" selected>체험명</option>
	                			<option value="업체명">업체명</option>
	                		</select>
						</div>	                	
	                	<input type="text" placeholder="Search" class="searchForm" name="keyword" id="keyword" value="${actPageDto.scKeyword}">
		                <img id="btnSearch" alt="" src="${pageContext.request.contextPath}/resources/images/search.png" width=13px height=13px >
	            	</form>
	            	<label for="btnShowFilter" class="label-btnShowFilter" style="cursor: pointer;">
	            		<img alt="" src="${pageContext.request.contextPath}/resources/images/filter.png" width=13px height=13px > 검색 필터
	            	</label>
	            	<button id="btnShowFilter">필터</button>
	        	</div>
	    	</div>
	    </div>
	</div>
	<!-- ----------------- 검색조건 산택창 -------------------------------- -->
	<div class="filter-backGround">
		<div class="filter-window">
			<div class="filter-content">
				<header class="filter-header">
					<h1 class="filter-header-text">검색 조건</h1>
					<img id="btnHideFilter" alt="" src="${pageContext.request.contextPath}/resources/images/cross.png" width=13px height=13px >
				</header>
				<div class="filter-option">
					<section class="section-option">
						<h2>지역</h2>
						<div class="option-detail">
							<div class="options">
								<label for="location_">
									<input type="checkbox" name="location" id="location_" value="" checked="">전체
								</label>
							</div>
							<c:forEach var="activityDto" items="${activityLocation}" varStatus="status" >
								<div class="options">
		                    		<label for="location_${status.index}">
										<input class="location-options" type="checkbox" name="location" id="location_${status.index}" value="${activityDto.actLocation}">${activityDto.actLocation} (${activityDto.actLocationCount})
									</label>
								</div>
	                    	</c:forEach>
						</div>
					</section>
				</div>
				<div class="filter-option">
					<section class="section-option">
						<h2>카테고리</h2>
						<div class="option-detail">
							<div class="options">
								<label for="categoty_">
									<input type="checkbox" name="category" id="categoty_" value="" checked="">전체
								</label>
							</div>
							<c:forEach var="categoriesDto" items="${categoryList}" varStatus="status" >
								<div class="options">
		                    		<label for="categoty_${status.index}">
										<input class="category-options" type="checkbox" name="category" id="categoty_${status.index}" value="${categoriesDto.category}">${categoriesDto.category}
									</label>
								</div>
	                    	</c:forEach>
						</div>
					</section>
				</div>
				<div class="filter-option">
					<section class="section-option">
						<h2>위시리스트</h2>
						<div class="option-detail">
							<div class="options">
								<label for="wishListCheck">
									<input type="checkbox" value="${sessionScope.userId}" id="wishListCheck" name="sessionId">위시리스트만 보기
								</label>
							</div>
						</div>
					</section>
				</div>
				<footer class="filter-footer">
					<button type="button" id="btnResetOption">초기화</button>
					<button type="button" id="btnApplyOption">적용</button>
				</footer>
			</div>
		</div>	
	</div>
		
	<!-- ----------------- 상품 리스트 ------------------------------------- -->
	<div class="row" id="actList">
		<!-- 리스트 들어가는 곳 -->
	</div>
</div>
<div class="row">
	<div class="container" id="writeActivity">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="pagination-wrap" id="actListPage">
					<!-- 페이지 들어가는 곳 -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- <br> -->
<br><br><br><br>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> --%>
<script src="${pageContext.request.contextPath}/resources/js/actList.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> --%>
<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="${pageContext.request.contextPath}/resources/js/google-map.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>


</body>
</html>