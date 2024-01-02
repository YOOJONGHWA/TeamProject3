<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReviewContent</title>
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
<style>
    #star {
    	width: 60%;
    }
    #ml {
    	margin-left: 200px
    }
    #right {
    	float: right;
    }
</style>
	<script>
	$(document).ready(function(){
		
		$('#deleteBtn').click(function(){
			const result = confirm("삭제된 글은 복구할 수 없습니다. 삭제하시겠습니까?");
			if(result){
			} else{
				return false;
			};
		}); 
		
		$('#button2').click(function(){
			debugger;
			const result = confirm("삭제된 글은 복구할 수 없습니다. 삭제하시겠습니까?");
			if(result){
			} else{
				return false;
			};
		}); 
		
		$('#reply').submit(function(){
			if($('#replyContent').val()==""){
				alert("댓글을 입력하세요");
				$('#replyContent').focus();
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

<!-- MEMO 카테고리 넣어야함 cb_category -->
<section class="ftco-section" style="padding: 3em 0;">
	<div class="col-lg-12">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="container">
						<div class="text-right">
							<input type="button" value="목록" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath }/review/list'">
							<c:if test="${ReviewDTO.userId eq sessionScope.userId}">
								<input type="button" value="수정" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/review/update?num=${ReviewDTO.reviewNum}'">
								<a href="${pageContext.request.contextPath}/review/delete?num=${ReviewDTO.reviewNum}" id="deleteBtn" class="btn btn-primary">삭제</a>
							</c:if>
				    	</div>
   					</div>
   					
					<hr>

   					

   					
   					<div class="container">

<!-- 						<hr style="margin-top: 0;"> -->
						<h2 class="mb-3">${ReviewDTO.reviewTitle }</h2>
							<div name="review_Title">${ReviewDTO.reviewContext }</div>
								<div class="about-author d-flex p-4 bg-light">
									<div class="desc align-self-md-center">
										<p>
											<c:if test="${ReviewDTO.reviewScore == 1.0}">
												<td class="starImg">최악 &nbsp;&nbsp; <img id="star"
													src="${pageContext.request.contextPath}/resources/images/star1.png"></td>
											</c:if>
											<c:if test="${ReviewDTO.reviewScore == 2.0}">
												<td class="starImg">별로 &nbsp; &nbsp;<img id="star"
													src="${pageContext.request.contextPath}/resources/images/star2.png"></td>
											</c:if>
											<c:if test="${ReviewDTO.reviewScore == 3.0}">
												<td class="starImg">보통 &nbsp; &nbsp;<img id="star"
													src="${pageContext.request.contextPath}/resources/images/star3.png"></td>
											</c:if>
											<c:if test="${ReviewDTO.reviewScore == 4.0}">
												<td class="starImg">좋음 &nbsp;&nbsp;<img id="star"
													src="${pageContext.request.contextPath}/resources/images/star4.png"></td>
											</c:if>
											<c:if test="${ReviewDTO.reviewScore == 5.0}">
												<td class="starImg">아주좋음 &nbsp; &nbsp;<img id="star"
													src="${pageContext.request.contextPath}/resources/images/star5.png"></td>
											</c:if>
										</p>
									</div>
								</div>
								<br><br>
						    <ul class="comment-list">
				              	<c:forEach var="boardList" items="${boardList }">
<!-- 				                <li class="comment"> -->
				                
				                  <div class="comment-body">
<!-- 				                  	<div> -->
				                      <p>
				                            <c:if test="${boardList.replyReLev > 0}">
									<c:forEach var="i" begin="1" end="${boardList.replyReLev * 5 }">
										&nbsp;
									</c:forEach>
										└
							    	</c:if>
				                      ${boardList.replyContent}</p>
				                      
				                  	 
<!-- 				                  	</div> -->
				                    <div class="form-group" id="">
									 <c:if test="${boardList.userId eq sessionScope.userId}">
										작성날짜 : <fmt:formatDate value="${boardList.replyDate}" pattern="yyyy.MM.dd"/>&nbsp;
										<input type="button" value="글수정" id="button1"
											onclick="location.href='${pageContext.request.contextPath }/board/reupdate?num=${boardList.replyNum}'"
											class="btn btn-primary" >
										<input type="button" value="글삭제" id="button2"
											onclick="location.href='${pageContext.request.contextPath }/board/redelete?num=${boardList.replyNum}&review_Num=${boardList.reviewNum}'"
											class="btn btn-primary">
									</c:if>		
									    <input type="button" value="답글" id="button3"
										    onclick="location.href='${pageContext.request.contextPath }/board/rerewrite?replyNum=${boardList.replyNum}&review_Num=${boardList.reviewNum}'"
										    class="btn btn-primary" >
								   	    
								</div>
				                  </div>
<!-- 				                </li> -->
								</c:forEach>
              				</ul>
					
						<!-- 댓글 작성 -->
				  <form action="${pageContext.request.contextPath }/board/rewritePro" id="reply" method="post" >
					 <div class="form-group"> 
<!--                     <label for="name">Name *</label> -->
                     <input type="hidden" name="reviewNum" value="${ReviewDTO.reviewNum}">
                     <input type="hidden" name="review_Num" value="${ReviewDTO.reviewNum}">
                     <input type="hidden" class="form-control" id="name" name="userId" value="${sessionScope.userId}">
                    </div>
						
                    <div class="form-group">
                     <label for="message">댓글 작성</label>
                    <textarea cols="5" rows="5" id="replyContent" class="form-control" name="replyContent"></textarea>
                    </div>
                    <div class="text-right">
                    <input type="submit" value="댓글"  class="btn btn-primary">
                    </div>
				  </form>
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