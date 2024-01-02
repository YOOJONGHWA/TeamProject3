<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/photoWrite.css">
</head>
<body class="goto-here">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->

<!-- 여기에 작성 -->

<div id="write" class="col-lg-12 ftco-animate">
	<div class="container" style="padding: 0px 0px 60px">
		<form action="${pageContext.request.contextPath}/photo/writePro" method="POST" enctype="multipart/form-data">

		<div style="margin-top: 1em;">
			<div class="left-box">글쓰기</div>
			<div class="right-box">
				<a href="${pageContext.request.contextPath}/photo/list" id="back" class="btn btn-primary">목록</a>
				<input type="submit" class="btn btn-primary" id="writeBtn" value="글쓰기">
			</div>
		</div>
		
		<hr>
		
		<div>
			<div class="left-b-box">
				<img src="${pageContext.request.contextPath}/resources/images/no-pictures.png" class="image-box"/>
				<input type="file" name="file" id="file" accept="image/*">
			</div>
			<div class="right-b-box">
				<input type="hidden" name="userId" value="${sessionScope.userId}">
				<span class="icon-map-marker"></span>
				<select class="form-select" id="photoLocation" name="photoLocation">
				<option selected>장소를 선택해 주세요.</option>
				<c:forEach var="cityList" items="${cityList}" >
					<option value="${cityList}">${cityList}</option>
				</c:forEach>
				</select>
				<label for="file" class="btn btn-primary"><span class="text-center">사진 올리기</span></label>
				<div class="content" style="margin-top: 0.5em;">
					<textarea name="photoContent" id="photoContent" class="txt-a" rows="18" placeholder="내용을 입력해 주세요."></textarea>
					<div class="count text-right"><span>0</span>/2000&nbsp;</div>
				</div>
			</div>
			
			
		</div>
		</form>
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
<script src="${pageContext.request.contextPath}/resources/js/photo-write.js"></script>
</body>
</html>