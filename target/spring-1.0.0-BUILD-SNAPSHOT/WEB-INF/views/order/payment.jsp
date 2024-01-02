<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
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
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript"
			src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<body>
<script type="text/javascript">
    $('document').ready(function(){
    	var date = new Date;
		var now = date.getTime();
        var IMP = window.IMP; // 생략가능
        
        IMP.init('imp70420210');  // "가맹점 식별코드"를 사용
        
        $('#order').click(function() { // 성공 시 값 처리해주기
			var usedpt = $(".userPoint").val();

			if (usedpt * 1 > $('pointDTO.pointBalance') * 1) {
				alert("사용 포인트 > 보유포인트");
				console.log("조건실행");
				return false;
			}
			if (usedpt < 0) {
				alert("사용 포인트 < 0")
				return false;
			}
        
        IMP.request_pay( {
            pg: 'html5_inicis', 
            pay_method: $('.payMethod'),
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: 'ACTIVITY',
            //결제창에서 보여질 이름
            amount: $('.price').val() - usedpt, 
            //가격 
            buyer_name: "$('sessionId')",
            buyer_tel: "$('.ordGetPhone')",

        }, function (rsp) {
            console.log(rsp);
            
            if (rsp.success) {
            	
				$.ajax({
					url : "",
					data : {
						ord_num : rsp.merchant_uid,
						act_num : $('.actNum').val(),
						ord_date : $('.stime').val(),
						res_time : $('.time').val(),
						price : $('.price').val(),
						usePoint : usept
					}, // 결제에 들어갈 정보들
					success : function(data) {
						alert("결제가 완료되었습니다.");
						location.href = "/"; // 완료페이지
					}
				
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
        });
    });
</script>








 <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#FF6600"/></svg></div>

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

    <!-- 푸터 들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- 푸터 들어가는 곳 -->
</body>
</html>