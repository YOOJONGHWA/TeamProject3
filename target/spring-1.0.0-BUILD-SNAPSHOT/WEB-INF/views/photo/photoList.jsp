<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Photo</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.timepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/photoList.css">
</head>
<body class="goto-here">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->

<section class="ftco-section" style="padding: 4em 0 0;">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10 mb-5 text-center">
				<ul class="product-category">
					<li><a href="${pageContext.request.contextPath}/photo/list" class="active">ALL</a></li>
					<c:forEach var="cityList" items="${cityList}">
						<li><a href="${pageContext.request.contextPath}/photo/list?loc=${cityList}" id="${cityList}">${cityList}</a></li>
					</c:forEach>

				</ul>
			</div>
		</div>
	</div>
</section>


<div class="col-lg-12 ftco-animate">
<div class="container">

	<div class="text text-right">

<c:if test="${ ! empty sessionScope.userId }">
		<p><a href="${pageContext.request.contextPath}/photo/write" class="btn btn-primary">글쓰기</a></p>
		</c:if>
	</div>
	<div class="row">
		<c:forEach items="${photoList}" var="dto">
			<div class="col-6 col-md-4 p15">
				<div class="card border-light mb-3 h-100">
					<div class="card-header">
						<input type="hidden" value="${dto.photoNum}">
						<span class="text-left"><b>${dto.userId}</b></span>
					</div>
					<a href="${pageContext.request.contextPath}/photo/content?num=${dto.photoNum}">
						<img src="${pageContext.request.contextPath}/resources/upload/${dto.photoImage}" class="card-img-top img-list-size">
					</a>
					<ul class="list-group list-group-flush">
						<li class="list-group-item text-center" >
							<span class="ion-md-heart col-md-3 c-r"><span class="c-bl"> ${dto.likeCount}</span></span>
							<span class="icon-chat col-md-3 c-bl"> ${dto.replyCount}</span>
							<span class="icon-eye col-md-3 c-bl"> ${dto.photoReadcount}</span>
							<span class="icon-map-marker col-md-3 c-bl"> ${dto.photoLocation}</span>
						</li>
					</ul>
					<div class="card-body">
						<p class="card-text photoword">
							<a href="${pageContext.request.contextPath}/photo/content?num=${dto.photoNum}">${dto.photoContent}</a>
						</p>
					</div>
					<div class="card-footer text-right">
						<small class="text-muted"><fmt:formatDate value="${dto.photoDate}" pattern="yyyy.MM.dd HH:mm:ss"/></small>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>





		<!-- 페이징 -->

		<div class="row mt-5" style="padding: 0 0 6em;">
			<div class="col text-center">
				<div class="block-27">
					<ul>
					
						<!-- 1페이지 이전 -->
						<c:if test="${pageDTO.currentPage > 1}">
							<li><a href="${pageContext.request.contextPath}/photo/list?pageNum=${pageDTO.currentPage-1}">&lt;</a></li>
						</c:if>
					
						<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
							<li><a href="${pageContext.request.contextPath}/photo/list?pageNum=${i}">${i}</a></li>
						</c:forEach>
						
						<!-- 1페이지 다음 -->
						<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
							<li><a href="${pageContext.request.contextPath}/photo/list?pageNum=${pageDTO.currentPage+1}">&gt;</a></li>
						</c:if>
						
              		</ul>
            	</div>
          	</div>
        </div>


	</div> 
</div>



<!-- 여기에 작성 -->


<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->

<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>