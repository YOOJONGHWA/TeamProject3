<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업회원정보</title>

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

<style type="text/css">

h1 {
padding-top: 20px;
margin-left: 800px;
font-family: "Poppins", Arial, sans-serif;
}
</style>

<script type="text/javascript">

function test() {
	
    if (!confirm("이 회원을 강제 탈퇴 시키시겠습니까?")) {
        alert("회원 강제 탈퇴를 취소합니다.");
    } else {
        alert("회원을 강제 탈퇴 시키셨습니다.");
    }
}

</script>

</head>
<body>

<div>
  	<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 헤더파일들어가는 곳 -->
</div>

<!-- 메인 이미지 -->
    <section id="home-section" class="hero">
		<div class="home-slider owl-carousel">
		
	      <div class="slider-item" style="background-image: url(${pageContext.request.contextPath}/resources/images/bg_tennis.jpg);">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

	            <div class="col-md-12 ftco-animate text-right">
	              <h2 class="mb-2" style="color:#fff;">메인1... 사진추천받음..</h2>
	              <h2 class="subheading mb-4">We deliver organic vegetables &amp; fruits</h2>
	              <p><a href="#" class="btn btn-primary">View Details</a></p>
	            </div>

	          </div>
	        </div>
	      </div>

	      <div class="slider-item" style="background-image: url(${pageContext.request.contextPath}/resources/images/bg_badminton.jpg);">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

	            <div class="col-sm-12 ftco-animate text-left">
	              <h2 class="mb-2" style="color:#fff;">메인2.. 사진추천받음...</h2>
	              <h2 class="subheading mb-4">We deliver organic vegetables &amp; fruits</h2>
	              <p><a href="#" class="btn btn-primary">View Details</a></p>
	            </div>

	          </div>
	        </div>
	      </div>
	      
		</div>
    </section>
	<!-- 메인 이미지 -->
	
	<h1>기업 회원 정보</h1>
	
<div class="col-lg-12">
<table border="1" class="table table-hover">
<thead>
<tr><th>아이디</th><th>회사명</th><th>이메일</th><th>전화번호</th><th>주소</th>
    <th>사업자번호</th><th>	</th></tr>
</thead>    
<tbody>
<c:forEach var="dto" items="${companyList }">

<tr><th>${dto.companyId}</th>
<%--     <th>${dto.companyPass}</th> --%>
    <th>${dto.companyName}</th>
    <th>${dto.companyEmail}</th>
    <th>${dto.companyTel}</th>
    <th>${dto.companyAddress}</th>
    <th>${dto.companyNum}</th> 
    <th><a href="${pageContext.request.contextPath }/member/companydelete?companyId=${dto.companyId}" id="companydelete" onclick="test()">강제탈퇴</a></th></tr>
</c:forEach>
</tbody>
</table>

</div>
<div class="pageNum">
	<c:if test="${pageDto.startPage > pageDto.pageBlock }">
	<a href="${pageContext.request.contextPath }/member/companyinfo?pageNum=${pageDto.startPage - pageDto.pageBlock}">[10페이지 이전] </a>
	</c:if>
	
	<c:forEach var="i" begin="${pageDto.startPage }" end="${pageDto.endPage }" step="1">
	<a href="${pageContext.request.contextPath }/member/companyinfo?pageNum=${i}">${i}</a> 
	</c:forEach>
	
	<c:if test="${pageDto.endPage < pageDto.pageCount}">
	<a href="${pageContext.request.contextPath }/member/companyinfo?pageNum=${pageDto.startPage + pageDto.pageBlock}">[10페이지 다음] </a>
	</c:if>
</div>
<br><br>

<div>
	<!-- 푸터 들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- 푸터 들어가는 곳 -->
</div>	
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



