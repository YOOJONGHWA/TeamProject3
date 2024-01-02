<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>나의 주문내역</title>
    
    <meta charset="utf-8">
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
  </head>
  
  <body class="goto-here">
	<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 헤더파일들어가는 곳 -->

	<!-- 메인 이미지 -->
    <section id="home-section" class="hero">
		<div class="home-slider owl-carousel">
	      <div class="slider-item" style="background-image: url(${pageContext.request.contextPath}/resources/images/bg_tennis.jpg);">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
	            <div class="col-md-12 ftco-animate text-right">
	              <h2 class="mb-2" style="color:#fff;">나의 주문 내역</h2>
	              <h3>${sessionScope.userId}님의 주문 내역.</h3>
	              <p><a href="${pageContext.request.contextPath}/member/logout" class="btn btn-primary">LogOut</a></p>
	            </div>
	          </div>
	        </div>
	      </div>
		</div>
    </section>
	<!-- 메인 이미지 -->
	
	<c:if test="${empty sessionScope.userId}">
		<c:redirect url="/member/login"></c:redirect>
	</c:if>
	
    <section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    				<div class="cart-list">
	    				<table class="table">
						    <thead class="thead-primary">
						      <tr class="text-center">
						        <th>주문일자</th>
						        <th>&nbsp;</th>
						        <th>상품</th>
						        <th>&nbsp;</th>
						        <th>수량</th>
						        <th>금액</th>
						      </tr>
						    </thead>
						    
						    <tbody>
						    <c:forEach var="orderDTO" items="${orderList}">
						      <tr class="text-center">
						      	<td class="order-date"><fmt:formatDate value="${orderDTO.ordTime}" pattern="yyyy.MM.dd"/></td>
						        <td class="image-prod"><div class="img" style="background-image:url(images/product-1.jpg);"></div></td>
						        <td class="product-info">
						        	<h3>${dto.actTitle}</h3>
						        	<p>${dto.companyName}</p>
						        </td>
						        <td class="quantity" value="${orderDTO.ordQuantity}" min="1" max="10">
					          	</td>
						        <td class="total-price" value="${orderDTO.ordPayPrice}"></td>
						      </tr>
						      <!-- END TR-->
						      </c:forEach>
						    </tbody>
						    
						  </table>
					  </div>
    			</div>
    		</div>
			</div>
		</section>

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#FF6600"/></svg></div>

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

  <script>
	</script>
	
    <!-- 푸터 들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- 푸터 들어가는 곳 -->
	
  </body>
</html>