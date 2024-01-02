<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReviewReply</title>
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
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>board</title>
<style>
body {
  padding-top: 70px;
  padding-bottom: 30px;
}
</style>

<script>
$(document).ready(function() {
 		
		
		$('#form').submit(function(){
			if($('#replyContent').val()==""){
				alert("내용을 입력하세요");
				$('#replyContent').focus();
				return false;
			}
			
		});
		
 	});
 
</script>
</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>답변하기</h2>
			<form name="form" id="form" role="form" method="post" action="${pageContext.request.contextPath}/board/rerewritePro">
				<div class="mb-3">
				<input type="hidden" name="reply_re_ref" value="${replyDTO.replyReRef }">
				<input type="hidden" name="reply_re_lev" value="${replyDTO.replyReLev }">
				<input type="hidden" name="reply_re_seq" value="${replyDTO.replyReSeq }">
				
				<input type="hidden" name="replyReRef" value="${replyDTO.replyReRef }">
				<input type="hidden" name="replyReLev" value="${replyDTO.replyReLev }">
				<input type="hidden" name="replyReSeq" value="${replyDTO.replyReSeq }">
				
				<input type="hidden" name="review_Num" value="${ReviewDTO.reviewNum}">
				<input type="hidden" name="reviewNum" value="${ReviewDTO.reviewNum}">
					<label for="reg_id">작성자</label>
					<input type="text" class="form-control" name="userId" value="${sessionScope.userId}" id="reg_id" >
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="replyContent"  id="replyContent" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
					<input type="submit" value="답글쓰기"  class="btn btn-primary">
			</form>
			<div >
		
			</div>
		</div>
	</article>
</body>
</html>