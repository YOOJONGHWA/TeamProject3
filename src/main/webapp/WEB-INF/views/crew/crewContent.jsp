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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/crewContent.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/crew-content.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var isChecked = $('#secret').prop('checked');
	

	// idChecked => true	=> "Y" 비밀글 O
	// unChecked => false	=> "N" 비밀글 X
	
})


</script>
</head>
<body class="goto-here">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->

<!-- 여기에 작성 -->

<!-- MEMO 카테고리 넣어야함 cb_category -->
<section class="ftco-section" style="padding: 3em 0;">
	<div class="col-lg-12">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="container">
						<div class="text-right">
							<input type="button" value="목록" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/crew/list'">
							<c:if test="${crewDTO.userId eq sessionScope.userId}">
								<input type="button" value="수정" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/crew/update?num=${crewDTO.crewNum}'">
								<a href="${pageContext.request.contextPath}/crew/delete?num=${crewDTO.crewNum}" id="deleteBtn" class="btn btn-primary">삭제</a>
							</c:if>
				    	</div>
   					</div>
   					
					<hr>

   					<div class="col-lg-12">
   						<input type="hidden" id="crewNum" value="${crewDTO.crewNum}">
	   					<div class="col-lg-12 c-or"><span class="icon-chat_bubble"></span>&nbsp;${crewDTO.actLocation} > ${crewDTO.actCategory}</div>
							<div class="col-lg-12">
								<div class="row">
									<div class="col-lg-12 d-flex">
									   	<div class="col-lg-10 hg60-le">
											<c:choose>
												<c:when test="${crewDTO.crewStatus eq 'Y'}">
													&nbsp;<span id="subject" class="c-bl fs-30"><b>${crewDTO.crewSubject}</b></span>
												</c:when>
												<c:otherwise>
													&nbsp;<span id="subject" class="lith fs-30"><b>${crewDTO.crewSubject}</b></span>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="col-lg-2 text-right hg60-ri">
											<span>	
												<c:if test="${crewDTO.userId eq sessionScope.userId}">
													<select class="form-select" id="status" name="status">
														<c:forEach var="statusMap" items="${statusMap}" >
															<c:choose>
																<c:when test="${statusMap.key eq crewDTO.crewStatus}">
																	<option selected>${statusMap.value}</option>
																</c:when>
																<c:otherwise>
																	<option value="${statusMap.value}">${statusMap.value}</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</select>
												</c:if>
												<c:choose>
													<c:when test="${crewDTO.crewStatus eq 'Y'}">
														<c:if test="${crewDTO.userId ne sessionScope.userId}"><span class="status-y">모집중</span ></c:if>
													</c:when>
													<c:otherwise>
														<c:if test="${crewDTO.userId ne sessionScope.userId}"><span class="status-n">모집완료</span></c:if>
													</c:otherwise>
												</c:choose>
						   					</span>
										</div>
									</div>
								</div>
							</div>
   						</div>
   					

   					
   					<div class="container">
						<div class="row">
							<div class="col-lg-12 d-flex">
							   	<div class="col-lg-6 hg40-le">
									<span class="mr-2 c-bl"><b>${crewDTO.userId}</b></span>
									<span class="mr-2 c-gr"><fmt:formatDate value="${crewDTO.crewDate}" pattern="yyyy.MM.dd HH:mm:ss"/>&nbsp;조회수&nbsp;${crewDTO.crewReadcount}</span>
								</div>
								<div class="col-lg-6 text-right hg40-ri">
								<!-- 하트 -->
		       					<!-- 하트 카운트 -->
								<div id="likeCnt" class="hrt-cnt">${crewDTO.likeCount}</div>
		       						
		       						<c:choose>
		       							<c:when test="${ ! empty sessionScope.userId }">
		       								<div id="heart-click">
				       							<c:choose>
				       							<c:when test="${clCheck eq 0 or empty clCheck}">
				       								<span class="icon-heart-o hrt"></span>
				       							</c:when>
				       							<c:otherwise>
				       								<span class="icon-heart hrt"></span>
				       							</c:otherwise>
				       							</c:choose>
		       								</div>
		       							</c:when>
		       							<c:otherwise>
		       							<!-- 로그인 안한 사람 =_=+ -->
		       							   <div id="heart-click-nologin">
				       								<span class="icon-heart-o hrt"></span>
		       								</div>
		       							</c:otherwise>
		       						</c:choose>

								</div>
							</div>
						</div>

						<hr style="margin-top: 0;">
					
						<div class="col-lg-12 link-2">
							<span class="topper"><span class="icon-check c-or"></span>Activity</span>

							<a href="${pageContext.request.contextPath}/activity/actContent?actNum=${crewDTO.actNum}">
							<b>${crewDTO.actTitle}</b></a> | ${crewDTO.companyName}
						
						</div>

						<hr>

						<div class="col-lg-12">
							<p class="col-10 c-bl" style="margin-top: 2em;">${crewDTO.crewContent}</p>
						</div>

						
						<div class="row mt-4">
	         				<div class="col-lg-12 c-bl">
	       						<div class="col-lg-12 rpy"><span class="icon-chat"></span></div>
	       						<div id="replyCount rpy">&nbsp;${crewDTO.replyCount}</div>
	         				</div>
	        			</div>
        				
        				<!-- 댓글 -->
						<div class="col-lg-12">
							<div class="container bg-light">
								<div><p><a href="#replyWriteForm"><b>댓글</b></a></p></div><hr>	
								<div id="listDiv" class="c-bl">
	
								</div>
							</div>
						</div>
					
						<!-- 댓글 작성 -->
						<div class="col-lg-12">
							<table class="container bg-light replyInput">
								<tr><td class="col-7" id="replyId"><b class="c-bl">${sessionScope.userId}</b></td></tr>
								<tr><td class="text-center">
									<c:choose>
									    <c:when test="${ ! empty sessionScope.userId }">
											<textarea class="txt-a" rows="3" name="crContent" id="crContent" required="required"></textarea>
									    </c:when>
									    <c:otherwise>
											<textarea class="txt-a" rows="3" placeholder="댓글은 로그인 후 작성 가능합니다." name="crContent" id="crContent" required="required"></textarea>
									    </c:otherwise>
									</c:choose>
									<div class="count text-right">
										<span>0</span>/300&nbsp;						
										<button class="btn btn-primary" id="addReply">등록하기</button>&nbsp;&nbsp;&nbsp;
									</div>
								</td></tr>
							</table>
						</div>
						<!-- 댓글 작성 -->
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
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<script src="${pageContext.request.contextPath}/resources/js/google-map.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>


</body>
</html>