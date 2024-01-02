<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>포인트 내역</title>
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
<script type="text/javascript">
$(document).ready(function() {
	
}
</script>
<style>
.table tbody tr td{
	padding: 5px 5px;
}
</style>
</head>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->

		<!-- 메인이미지 -->
		  <body class="goto-here">
		    <div class="hero-wrap hero-bread" style="background-image: url('images/pointpage.jpg');">
		      <div class="container">
		        <div class="row no-gutters slider-text align-items-center justify-content-center">
		          <div class="col-md-9 ftco-animate text-center">
		          	<p class="breadcrumbs"><span class="mr-2">My Point List</span></p>
		            <h1 class="mb-0 bread">My Point List</h1>
		          </div>
		        </div>
		      </div>
		    </div>
	















		<!-- 페이징 -->
		<!-- 10페이지 이전 -->
		<div class="text text-center" style="padding: 0px 0px 60px">
			<c:if test="${ptPageDTO.startPage > ptPageDTO.pageBlock}">
				<a href="${pageContext.request.contextPath}/point/list?pageNum=${ptPageDTO.startPage-ptPageDTO.pageBlock}">[10페이지 이전]</a>
			</c:if>
			
				<!-- 1페이지 이전 -->
				<c:if test="${ptPageDTO.currentPage > 1}">
					<a href="${pageContext.request.contextPath}/point/list?pageNum=${ptPageDTO.currentPage-1}">[1페이지 이전]</a>
				</c:if>
				
				<c:forEach var="i" begin="${ptPageDTO.startPage}" end="${ptPageDTO.endPage}" step="1">
					<a href="${pageContext.request.contextPath}/point/list?pageNum=${i}">${i}</a>
				</c:forEach>
				
				<!-- 1페이지 다음 -->
				<c:if test="${ptPageDTO.currentPage < ptPageDTO.pageCount}">
					<a href="${pageContext.request.contextPath}/point/list?pageNum=${ptPageDTO.currentPage+1}">[1페이지 다음]</a>
				</c:if>
			
			<!-- 10페이지 다음 -->
			<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
				<a href="${pageContext.request.contextPath}/crew/list?pageNum=${pageDTO.startPage+pageDTO.pageBlock}">[10페이지 다음]</a>
			</c:if>
		</div>
</body>
</html>