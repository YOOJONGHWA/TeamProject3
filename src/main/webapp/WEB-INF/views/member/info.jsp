<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html lang="en">

<head>

<title _msttexthash="14914302" _msthash="0">나의 정보 조회</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&amp;display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/update.css">

<body class="img js-fullheight" style="background:linear-gradient(to top,rgba(0,0,0,.3),rgba(0,0,0,.3)), 
url('https://preview.colorlib.com/theme/bootstrap/login-form-20/images/bg.jpg.webp') repeat center / cover !important; height:150vh;">

<section class="ftco-section">
<div class="container">
<div class="row justify-content-center">
<div class="col-md-6 text-center mb-5">
<h2 class="heading-section" _msttexthash="14920113" _msthash="1">나의 정보 조회</h2>
</div>
</div>
<div class="row justify-content-center">
<div class="col-md-6 col-lg-4">
<div class="login-wrap p-0">
 <div class="mypage">
<div class="form-group">

<!-- 아이디 -->
<input type="text" class="form-control" placeholder="아이디" _mstplaceholder="113997" _msthash="3" value="${dto.userId}" readonly>
</div>

<!-- 이름 -->
<div class="form-group">
<input type="text" class="form-control"_mstplaceholder="113997" _msthash="3" value="${dto.userName}" readonly>
</div>

<!-- 생년 월일 -->
<div class="form-group">
<input type="text" class="form-control" _mstplaceholder="113997" _msthash="3" value="${dto.userBirth}" readonly>
</div>

<!-- 성별 -->
<div class="form-group">
<input type="text" class="form-control" _mstplaceholder="113997" _msthash="3" value="${dto.userGender}" readonly>
</div>

<!-- 이메일 -->
<div class="form-group">
<input type="text" class="form-control" _mstplaceholder="113997" _msthash="3" value="${dto.userEmail}" readonly>
</div>

<!-- 휴대 전화 -->
<div class="form-group">
<input type="text" class="form-control" _mstplaceholder="113997" _msthash="3" value="${dto.userPhone}" readonly>
</div>

<!-- 거주지 -->
<div class="form-group">
<input type="text" class="form-control" _mstplaceholder="113997" _msthash="3" value="${dto.userAddress}" readonly>
</div>

<!-- 관심사 -->
<div class="form-group">
<input type="text" class="form-control" _mstplaceholder="113997" _msthash="3" value="${dto.userSport}" readonly>
</div>

<!-- 관심 지역 -->
<div class="form-group">
<input type="text" class="form-control" _mstplaceholder="113997" _msthash="3" value="${dto.userArea}" readonly>
</div>

<!-- POINT -->
<div class="form-group">
<input type="text" class="form-control" _mstplaceholder="113997" _msthash="3" value="${dto.userPoint}" readonly>
</div>

<div class="form-group">
<button onclick = "location.href = '${pageContext.request.contextPath }/member/mypage' " class="form-control btn btn-primary submit px-3" _msttexthash="29554512" _msthash="5">마이페이지 이동</button>
</div>
</div>
<div class="form-group d-md-flex">
<div class="w-50">
</div>
<div class="w-50 text-md-right">
</div>
</div>
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