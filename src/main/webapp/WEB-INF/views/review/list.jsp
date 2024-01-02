<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reviewlist</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/crewList.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
<style>
    #pic {
    	height: 200px;
 		width: 200px;
    }
    #star {
    	width: 100%;
    }
</style>
</head>
<body class="goto-here">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->

<!-- 여기에 작성 -->
<section class="ftco-section" style="padding: 4em 0 0;">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10 mb-5 text-center">
				<ul class="product-category">
				</ul>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section ftco-degree-bg testimony-section ftco-no-pt">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="container">			
					<table class="col-lg-12 table table-hover text-center c-bl">
						 <thead class="table-dark">
						<tr>
							 <th style="width: 45px;">번호</th>
						        <th style="width: 10px;">아이디</th>
						        <th style="width: 90px;">체험명</th>
						        <th style="width: 90px;">체험 사진</th>
						        <th style="width: 90px;">제목</th>
						        <th style="width: 124px;">별점</th>
						        <th style="width: 124px;">등록일 및 조회수</th></tr>
						 </thead>
						<c:if test="${empty reviewList}">
							<tr height="400"><td colspan="6">작성된 리뷰가 없습니다🥲🥲</td></tr>
						</c:if>		
							
					<c:forEach var="reviewList" items="${reviewList}"> 
								<tr><td>${reviewList.reviewNum} </td>
								 	<td>${reviewList.userId} </td>
								 	<td>${reviewList.actCategory} </td>
								 	<td><img id="pic"src="${pageContext.request.contextPath}/resources/upload/${reviewList.imgNameKey}" alt="logo" class="logo"></td>
								    <td>
								    <a href="${pageContext.request.contextPath }/review/content?review_Num=${reviewList.reviewNum}">
								    ${reviewList.reviewTitle}</a>
								    </td>
								    <c:if test="${reviewList.reviewScore == 1.0}"><td class="starImg"><img id="star" src="${pageContext.request.contextPath}/resources/images/star1.png"></td></c:if>
								    <c:if test="${reviewList.reviewScore == 2.0}"><td class="starImg"><img id="star" src="${pageContext.request.contextPath}/resources/images/star2.png"></td></c:if>
								    <c:if test="${reviewList.reviewScore == 3.0}"><td class="starImg"><img id="star" src="${pageContext.request.contextPath}/resources/images/star3.png"></td></c:if>
								    <c:if test="${reviewList.reviewScore == 4.0}"><td class="starImg"><img id="star" src="${pageContext.request.contextPath}/resources/images/star4.png"></td></c:if>
								    <c:if test="${reviewList.reviewScore == 5.0}"><td class="starImg"><img id="star" src="${pageContext.request.contextPath}/resources/images/star5.png"></td></c:if>
								   <td><fmt:formatDate value="${reviewList.reviewDate }" type="both" pattern="yy-MM-dd"/><div>조회수 : ${reviewList.readcount}</div></td>
<%-- 								   <td>${reviewList.readcount} </td></tr>   --%>
								</c:forEach>       
					</table>
<!-- 					<div class="text text-right"> -->
<%-- 						<c:if test="${ ! empty sessionScope.userId }"> --%>
<%-- 							<p><a href="${pageContext.request.contextPath}/crew/write" id="writeBtn" class="btn btn-primary">글쓰기</a></p> --%>
<%-- 						</c:if> --%>
<!-- 					</div> -->
	
	
					<!-- 페이징 -->
					<!-- 10페이지 이전 -->
					<div class="text text-center" style="padding: 0px 0px 60px">
						<c:if test="${RePageDTO.startPage > RePageDTO.pageBlock}">
							<a href="${pageContext.request.contextPath}/review/list?pageNum=${RePageDTO.startPage-RePageDTO.pageBlock}">[10페이지 이전]</a>
						</c:if>
						
						<!-- 1페이지 이전 -->
						<c:if test="${RePageDTO.currentPage > 1}">
							<a href="${pageContext.request.contextPath}/review/list?pageNum=${RePageDTO.currentPage-1}">[1페이지 이전]</a>
						</c:if>
						
						
						<c:forEach var="i" begin="${RePageDTO.startPage}" end="${RePageDTO.endPage}" step="1">
							<a href="${pageContext.request.contextPath}/review/list?pageNum=${i}">${i}</a>
						</c:forEach>
						
						<!-- 1페이지 다음 -->
						<c:if test="${RePageDTO.currentPage < RePageDTO.pageCount}">
							<a href="${pageContext.request.contextPath}/review/list?pageNum=${RePageDTO.currentPage+1}">[1페이지 다음]</a>
						</c:if>
						
						
						<!-- 10페이지 다음 -->
						<c:if test="${RePageDTO.endPage < RePageDTO.pageCount}">
							<a href="${pageContext.request.contextPath}/review/list?pageNum=${RePageDTO.startPage+RePageDTO.pageBlock}">[10페이지 다음]</a>
						</c:if>
				
					</div>
				</div>
			</div> 
		</div>
	</div>
</section>

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
</body>
</html>