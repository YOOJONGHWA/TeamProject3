<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en"><head>
<title _msttexthash="14914302" _msthash="0">회원 탈퇴</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&amp;display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/update.css">
<body class="img js-fullheight" style="background:linear-gradient(to top,rgba(0,0,0,.3),rgba(0,0,0,.3)), 
url('https://preview.colorlib.com/theme/bootstrap/login-form-20/images/bg.jpg.webp') repeat center / cover !important; height:150vh;">

<script type="text/javascript">
	function deletes() {
		if(!confirm("진짜 진짜 진짜 탈퇴하시겠어예 ? ")){
			alert("취소(아니요)를 누르셨습니다");
			return false;
		}else {
			alert("확인(예)를 누르셨습니다");
		}
	}

</script>
<section class="ftco-section">
<div class="container">
<div class="row justify-content-center">
<div class="col-md-6 text-center mb-5">
<h2 class="heading-section" _msttexthash="14920113" _msthash="1">회원 탈퇴</h2>
</div>
</div>
<div class="row justify-content-center">
<div class="col-md-6 col-lg-4">
<div class="login-wrap p-0">
<form action="${pageContext.request.contextPath }/member/deletePro" class="signin-form"
      method="POST" onsubmit="return deletes()">
 <div class="mypage">
<div class="form-group">
<!-- 아이디 -->
<input type="text" class="form-control" placeholder="아이디"
  _mstplaceholder="113997" _msthash="3" name="userId" value="${sessionScope.userId }" readonly>
</div>

<!-- 현재 비밀번호 -->
<div class="form-group">
<input type="password" class="form-control" placeholder="현재 비밀번호" _mstplaceholder="113997" _msthash="3"
 name="userPass">
</div>


<!-- 탈퇴하기 -->
<div class="form-group">
<button type="submit" class="form-control btn btn-primary submit px-3" _msttexthash="29554512" _msthash="5">회원 탈퇴</button><br>
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