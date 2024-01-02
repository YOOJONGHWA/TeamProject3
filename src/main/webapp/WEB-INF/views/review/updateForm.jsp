<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReviewUpadte</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/crewWrite.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/crew-write.js"></script>
 <!-- 서머노트를 위해 추가해야할 부분 -->
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
  <!--  -->
  <style>
	.star-rating {
		display: flex;
		flex-direction: row-reverse;
		font-size: 2.5em;
		justify-content: space-around;
		padding: 0 .2em;
		text-align: center;
		width: 5em;
	}
	
	.star-rating input {
		display: none;
	}
	
	.star-rating label {
		color: #ccc;
		cursor: pointer;
	}
	
	.star-rating :checked ~ label {
		color: #FFFF00;
	}
	
	.star-rating label:hover, .star-rating label:hover ~ label {
		color: #FFFF00;
	}
	</style>
	<script>
	$(document).ready(function() {
 		
		
		$('#up').submit(function(){
			if($('#star-rating').children('input:checked').val()== null){
				alert("별점을 입력하세요");
				$('#star-rating').focus();
				return false;
			}
			if($('#reviewTitle').val()==""){
				alert("제목을 입력하세요");
				$('#reviewTitle').focus();
				return false;
			}
			if($('#reviewContext').val()==""){
				alert("내용을 입력하세요");
				$('#reviewContext').focus();
				return false;
			}
			
		});
		
 	});
 
</script>
</head>
<body class="goto-here">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->


<!-- 여기에 작성 -->
<div id="write" class="col-lg-12 ftco-animate">
	<div class="container" style="padding: 0px 0px 60px">

		<form action="${pageContext.request.contextPath }/review/updatePro" id ="up"method="post" enctype="multipart/form-data">
		<div style="margin-top: 1em;">
			<div class="left-box">글수정</div>
			<div class="right-box">
				<input type="submit" class="btn btn-primary" id="SendMessag" value="수정">
				<input type="hidden" name="reviewNum" value="${dto.reviewNum}">
                <input type="hidden" class="form-control" placeholder="Your id" name="userId" value="${sessionScope.userId }">
			</div>
		</div>
		
		<hr>
		<div>등록 평점 : ${dto.reviewScore}</div> 
				<span class="star-rating" id="star-rating" >
				<input type="radio" id="review_Score5" name="reviewScore"
					value="5" data-text="최고"/> <label for="review_Score5" id="star-rating" class="star" data-text="최고">&#9733;</label>
				<input type="radio" id="review_Score4" name="reviewScore" 
					value="4"  data-text="좋은"/> <label for="review_Score4"id="star-rating"  class="star" data-text="좋은">&#9733;</label>
				<input type="radio" id="review_Score3" name="reviewScore"
					value="3"  data-text="보통"/> <label for="review_Score3"id="star-rating" class="star" data-text="보통">&#9733;</label>
				<input type="radio" id="review_Score2" name="reviewScore"
					value="2"  data-text="그닥"/> <label for="review_Score2"id="star-rating" class="star" data-text="그닥">&#9733;</label>
				<input type="radio" id="review_Score1" name="reviewScore"
					value="1"  data-text="최악"/> <label for="review_Score1"id="star-rating" class="star" data-text="최악">&#9733;</label>
			</span>
		<div style="margin-top: 0.5em;">
			<input type="text" class="form-control" id="reviewTitle" name="reviewTitle" placeholder="제목을 입력하세요" value="${dto.reviewTitle }">
		</div>
		<div class="content" style="margin-top: 0.5em;">
			 <textarea  class="summernote" id="reviewContext" name="reviewContext" readonly>${dto.reviewContext }</textarea>    
				<script>
				$('.summernote').summernote({
					  height: 400,
					  lang: "ko-KR"
					});
					</script>
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
</body>
</html>