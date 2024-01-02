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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/photoContent.css">
</head>
<body class="goto-here">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->

<!-- 여기에 작성 -->

<section class="ftco-section" style="padding-top: 0.8em; padding-bottom: 0.8em;">
	<div class="container">
		<div class="row">
			<div class="container">
				<div class="text-right">
					<input type="button" value="목록" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/photo/list'">
					<c:if test="${photoDTO.userId eq sessionScope.userId}">
						<input type="button" value="수정" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/photo/update?num=${photoDTO.photoNum}'">
						<a href="${pageContext.request.contextPath}/photo/delete?num=${photoDTO.photoNum}" id="deleteBtn" class="btn btn-primary">삭제</a>
					</c:if>
				</div>
				<hr>
			</div>
				
	
			<input type="hidden" id="photoNum" value="${photoDTO.photoNum}">
			<div class="col-lg-6 ftco-animate">
				<a href="${pageContext.request.contextPath}/resources/upload/${photoDTO.photoImage}" class="image-popup"><img src="${pageContext.request.contextPath}/resources/upload/${photoDTO.photoImage}" class="img-fluid img-size"></a>
			</div>
			<div class="col-lg-6 product-details ftco-animate">

				<span class="icon-map-marker c-bl"> ${photoDTO.photoLocation}</span>
				<h3>${photoDTO.userId}</h3>
				<div class="rating d-flex">
					<p class="text-left mr-4">
						<a href="#" class="mr-2 c-bl">작성일 <span class="c-gr"><fmt:formatDate value="${photoDTO.photoDate}" pattern="yyyy.MM.dd"/></span></a>
					</p>
					<p class="text-left">
						<a href="#" class="mr-2 c-bl">조회수 <span class="c-gr">${photoDTO.photoReadcount}</span></a>
					</p>
				</div>
				<hr class="hr-mtn">
				<p class="p-hg c-bl">${photoDTO.photoContent}</p>
				
				<div class="col-lg-12">
					<div class="row">
						<div class="col-md-12">
						<!-- 하트 -->
						<c:choose>
							<c:when test="${ ! empty sessionScope.userId }">
								<div id="heart-click" class="rpy">
									<c:choose>
										<c:when test="${plCheck eq 0 or empty plCheck}">
											<span class="icon-heart-o cur-p"></span>
										</c:when>
										<c:otherwise>
											<span class="icon-heart cur-p-r"></span>
										</c:otherwise>
									</c:choose>
								</div>
							</c:when>
							<c:otherwise>
							<!-- 로그인 안한 사람 =_=+ -->
								<div id="heart-click-nologin" class="rpy">
									<span class="icon-heart-o cur-p"></span>
								</div>
							</c:otherwise>
						</c:choose>
						<!-- 하트 카운트 -->
						<div id="likeCnt" class="rpy">${photoDTO.likeCount}</div>
						<!-- 댓글 카운트 -->
						<div class="rpy"><span class="icon-chat"></span></div>
						<div id="replyCount" class="rpy">${photoDTO.replyCount}</div>
						</div>
					</div>
				</div>
				
				<hr>

			
			</div> <!-- right -->
			
		</div>
		
	</div>
</section>

	
<!-- 댓글 -->
<div class="col-lg-12">
	<div class="container bg-light">
		<div><p><a href="#replyWriteForm"><b>댓글</b></a></p></div>
		<hr>
		<div id="listDiv" class="c-bl"></div>
	</div>
</div>

<!-- 댓글 작성 -->
<div class="col-lg-12 pb-4em">
	<table class="container bg-light replyInput">
		<tr><td class="col-7" id="replyId"><b class="c-bl">${sessionScope.userId}</b></td></tr>
		<tr><td class="text-center">
			<c:choose>
				<c:when test="${ ! empty sessionScope.userId }">
					<textarea class="txt-a" rows="3"
							  name="prContent" id="prContent" required="required"></textarea>
				</c:when>
				<c:otherwise>
				<textarea class="txt-a" rows="3" placeholder="댓글은 로그인 후 작성 가능합니다."
						  name="prContent" id="prContent" required="required"></textarea>
				</c:otherwise>
			</c:choose>
			<div class="count text-right">
				<span>0</span>/300&nbsp;
				<button class="btn btn-primary" id="addReply">등록하기</button>&nbsp;&nbsp;&nbsp;</div>
			</td>
		</tr>
	</table>
</div>
<!-- 댓글 작성 -->

	

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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/photo-content.js"></script>
</body>
</html>