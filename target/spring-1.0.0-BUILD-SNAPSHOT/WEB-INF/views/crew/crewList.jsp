<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crew</title>
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
					<li><a href="${pageContext.request.contextPath}/crew/list" class="active">ALL</a></li>
					<c:forEach var="categoriesDTO" items="${categoryList}">
						<li><a href="${pageContext.request.contextPath}/crew/list?act=${categoriesDTO.category}" id="${categoriesDTO.category}" class="">${categoriesDTO.category}</a></li>
					</c:forEach>

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
						<tr><td></td>
							<td>모집정보</td>
							<td>모집자</td>
							<td>작성일</td>
							<td>조회수</td>
							<td>관심수</td></tr>
						
						<c:if test="${empty crewList}">
							<tr height="400"><td colspan="6">작성된 모집글이 없습니다🥲🥲</td></tr>
						</c:if>		
							
						<c:forEach items="${crewList}" var="dto">
																						
							<tr><td>
									<c:choose>
										<c:when test="${dto.crewStatus eq 'Y'}">
											<input type="button" value="모집중" class="btn btn-primary topper btn-75" style="	background: #FF6600; border: #FF6600;">
										</c:when>
										<c:otherwise>
											<input type="button" value="모집완료" class="btn btn-primary topper btn-75" disabled>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${dto.crewStatus eq 'Y'}">
											<div class="text-left topper">
												<span><a href="#" class="c-or">[${dto.actLocation}]</a></span>
												<span><a href="#" class="c-or">[${dto.actCategory}]</a></span>
												<span><a href="#" class="c-or">[${dto.actTitle}]</a></span>
											</div>
											<div class="text-left">
												<a href="${pageContext.request.contextPath}/crew/content?num=${dto.crewNum}">${dto.crewSubject}</a>
												<b class="c-or">[${dto.replyCount}]</b>
											</div>
										</c:when>
										<c:otherwise>
											<div class="text-left topper c-gr">
												<span>[${dto.actLocation}]</span>
												<span>[${dto.actCategory}]</span>
												<span>[${dto.actTitle}]</span>
											</div>
											<div class="text-left c-gr">
												<a href="${pageContext.request.contextPath}/crew/content?num=${dto.crewNum}">${dto.crewSubject}</a>
												<b>[${dto.replyCount}]</b>
											</div>
										</c:otherwise>
									</c:choose>
								</td>
								<td>${dto.userId}</td>
								<td><fmt:formatDate value="${dto.crewDate}" pattern="yyyy.MM.dd"/></td>
								<td>${dto.crewReadcount}</td>
								<td>${dto.likeCount}</td></tr>
							

								
						</c:forEach>
					</table>
					<div class="text text-right">
						<c:if test="${ ! empty sessionScope.userId }">
							<p><a href="${pageContext.request.contextPath}/crew/write" id="writeBtn" class="btn btn-primary">글쓰기</a></p>
						</c:if>
					</div>

					<!-- 페이징 -->
					<div class="row mt-5">
						<div class="col text-center">
							<div class="block-27">
								<ul>
								
									<!-- 1페이지 이전 -->
									<c:if test="${pageDTO.currentPage > 1}">
										<li><a href="${pageContext.request.contextPath}/crew/list?pageNum=${pageDTO.currentPage-1}">&lt;</a></li>
									</c:if>
								
									<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
										<li><a class="paging" href="${pageContext.request.contextPath}/crew/list?pageNum=${i}">${i}</a></li>
									</c:forEach>
									
									<!-- 1페이지 다음 -->
									<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
										<li><a href="${pageContext.request.contextPath}/crew/list?pageNum=${pageDTO.currentPage+1}">&gt;</a></li>
									</c:if>
									
			              		</ul>
			            	</div>
			          	</div>
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