<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>운동 체험 츄라이츄라이~~</title>
  
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
  
</head>

<body class="goto-here">  
  	<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 헤더파일들어가는 곳 -->
<%-- 	<jsp:include page="../member/popup.jsp"></jsp:include> --%>
	<!-- 메인 이미지 -->
    <section id="home-section" class="hero">
		<div class="home-slider owl-carousel">
		
	      <div class="slider-item" style="background-image: url(${pageContext.request.contextPath}/resources/images/bg_tennis.jpg);">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

	            <div class="col-md-12 ftco-animate text-right">
	              <h2 class="mb-2" style="color:#fff;">마이페이지</h2>
	              <h3>${sessionScope.user_id}님 로그인 하셨습니다.</h3>
	              <p><a href="${pageContext.request.contextPath}/member/logout" class="btn btn-primary">로그아웃</a></p>
	            </div>

	          </div>
	        </div>
	      </div>
		</div>
    </section>
	<!-- 메인 이미지 -->
	
<!-- 	 마이페이지 링크 -->
	<c:if test="${empty sessionScope.user_id}">
		<c:redirect url="/member/login"></c:redirect>
	</c:if>
	<section class="ftco-section">
			<div class="container">
				<div class="row no-gutters ftco-services">
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
            <div class="media block-6 services mb-md-0 mb-4">
              <div onclick="location.href='${pageContext.request.contextPath }/member/info' " class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-shipped"></span>
              </div>
              <div  class="media-body">
                <h3 class="heading">나의 정보 조회</h3>
              </div>
            </div>      
          </div>
          
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
            <div class="media block-6 services mb-md-0 mb-4">
              <div onclick="location.href='${pageContext.request.contextPath }/member/update' " class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-diet"></span>
              </div>
              <div  class="media-body">
                <h3 class="heading">나의 정보 수정</h3>
              </div>
            </div>    
          </div>
          
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
            <div class="media block-6 services mb-md-0 mb-4">
              <div onclick="location.href='${pageContext.request.contextPath }/member/delete' " class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-award"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">회원 탈퇴</h3>
              </div>
            </div>      
          </div>
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
            <div class="media block-6 services mb-md-0 mb-4">
              <div onclick="location.href='${pageContext.request.contextPath }/board/write' " class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-customer-service"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">글쓰기</h3>
              </div>
            </div>      
          </div>
        </div>
			</div>
		</section>

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
    
  </body>
</html>