<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<title _msttexthash="14914302" _msthash="0">로그인 10</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&amp;display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/update.css">
<script type="text/javascript" src = "${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

 	$(document).ready(function() {
 		
		
		$('#join').submit(function(){
			//pass 제어
			if($('#userPass').val()==""){
				alert("비밀번호 입력하세요");
				$('#userPass').focus();
				return false;
			}
// 			pass2 제어
			if($('#userPass2').val()==""){
				alert("변경할 비밀번호를 입력하세요");
				$('#userPass2').focus();
				return false;
			}
// 			user_name 제어
			if($('#userName').val()==""){
				alert("이름을 입력하세요");
				$('#userName').focus();
				return false;
			}
			
			//user_brith 제어
			if($('#userBirth').val()==""){
				alert("생년월일을 입력하세요");
				$('#userBirth').focus();
				return false;
			}
			
			//user_gender 제어
			if($('#userGender').val()==""){
				alert("성별을 입력하세요");
				$('#userGender').focus();
				return false;
			}
			
			//user_email 제어
			if($('#userEmail').val()==""){
				alert("이메일을 입력하세요");
				$('#userEmail').focus();
				return false;
			}
			
// 			//user_phone 제어
			if($('#userPhone').val()==""){
				alert("휴대폰번호를 입력하세요");
				$('#user_phone').focus();
				return false;
			}
			
			//user_address 제어
			if($('#userAddress').val()==""){
				alert("사는곳을 입력하세요");
				$('#userAddress').focus();
				return false;
			}
			
			//user_interest 제어
			if($('#userSport').val()==""){
				alert("관심사를 입력하세요");
				$('#userSport').focus();
				return false;
			}
			
			//user_area 제어
			if($('#userArea').val()==""){
				alert("관심지역을 입력하세요");
				$('#userArea').focus();
				return false;
			}
		});
		
 	});
 
</script>
</head>
<body class="img js-fullheight" style="background:linear-gradient(to top,rgba(0,0,0,.3),rgba(0,0,0,.3)), 
url('https://preview.colorlib.com/theme/bootstrap/login-form-20/images/bg.jpg.webp') repeat center / cover !important; height:150vh;">
<section class="ftco-section">
<div class="container">
<div class="row justify-content-center">
<div class="col-md-6 text-center mb-5">
<h2 class="heading-section" _msttexthash="14920113" _msthash="1">회원 수정</h2>
</div>
</div>
<div class="row justify-content-center">
<div class="col-md-6 col-lg-4">
<div class="login-wrap p-0">
<form action="${pageContext.request.contextPath }/member/updatePro" class="signin-form"
      method="POST" id="join">
 <div class="mypage">
<div class="form-group">
<!-- 아이디 -->
<input type="text" class="form-control" placeholder="아이디" _mstplaceholder="113997" _msthash="3"
 name="userId" id="userId" value="${dto.userId}" readonly>
</div>

<!-- 현재 비밀번호 -->
<div class="form-group">
<input type="password" class="form-control" placeholder="현재 비밀번호" _mstplaceholder="113997" _msthash="3"
 name="userPass" id="userPass">
</div>

<!-- 변경할 비밀번호 -->
<div class="form-group">
<input type="password" class="form-control" placeholder="변경할 비밀번호" _mstplaceholder="113997" _msthash="3"
 name="userPass2" id="userPass2">
</div>


<!-- 이름 -->
<div class="form-group">
<input type="text" class="form-control"_mstplaceholder="113997" _msthash="3"
 name="userName" id="userName" value="${dto.userName}">
</div>


<!-- 생년 월일 -->
<div class="form-group">
<input type="text" class="form-control" _mstplaceholder="113997" _msthash="3"
 name="userBirth" id="userBirth" value="${dto.userBirth}">
</div>

<!-- 성별 -->
<div class="form-group">
<input type="text" class="form-control" _mstplaceholder="113997" _msthash="3"
 name="userGender" id="userGender" value="${dto.userGender}">
</div>

<!-- 이메일 -->
<div class="form-group">
<input type="text" class="form-control" _mstplaceholder="113997" _msthash="3"
 name="userEmail" id="userEmail" value="${dto.userEmail}">
</div>

<!-- 휴대 전화 -->
<div class="form-group">
<input type="text" class="form-control" _mstplaceholder="113997" _msthash="3"
 name="userPhone" id="userPhone" value="${dto.userPhone}">
</div>

<!-- 거주지 -->
<div class="form-group">
<input type="text" class="form-control" _mstplaceholder="113997" _msthash="3"
 name="userAddress" id="userAddress" value="${dto.userAddress}">
</div>

<!-- 관심사 -->
<div class="form-group">
<input type="text" class="form-control" _mstplaceholder="113997" _msthash="3"
 name="userSport" id="userSport" value="${dto.userSport}">
</div>

<!-- 관심 지역 -->
<div class="form-group">
<input type="text" class="form-control" _mstplaceholder="113997" _msthash="3"
 name="userArea" id="userArea" value="${dto.userArea}">
</div>

<!-- POINT -->
<div class="form-group">
<input type="text" class="form-control" _mstplaceholder="113997" _msthash="3"
 name="userPoint" id="userPoint" value="${dto.userPoint}">
</div>


<!-- 수정하기 -->
<div class="form-group">
<button type="submit" class="form-control btn btn-primary submit px-3" _msttexthash="29554512" _msthash="5">회원정보수정</button><br>
</div>
<div class="form-group">
<a href= "${pageContext.request.contextPath }/member/main" class="form-control btn btn-primary submit px-3" _msttexthash="29554512" _msthash="5">마이페이지 이동</a>
</div>
</div>
<div class="form-group d-md-flex">
<div class="w-50">
</div>
<div class="w-50 text-md-right">
</div>
</div>
</form>
</div>
</div>
</div>
</div>
</section>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>