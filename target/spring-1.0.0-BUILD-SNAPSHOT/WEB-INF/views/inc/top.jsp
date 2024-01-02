<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>

<!-- 회원가입 | 로그인 | 로그아웃 | 마이페이지 | 관리자페이지 -->
<div class="py-1 bg-primary">
	<div class="container">
		<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
			<div class="col-lg-12 d-block">
				<div class="row d-flex">
					<div class="d-flex topper align-items-right text-lg-right">
					
						<!-- 로그인 X -->
						<c:if test="${ empty sessionScope.userId }">
							<span class="text">
								<a href="${pageContext.request.contextPath}/member/userlogin" style="color: #fff;">로그인</a>
							</span>
						</c:if>

						<!-- 로그인 O -->
						<c:if test="${ ! empty sessionScope.userId }">
							<span class="text"> ${sessionScope.userId} 님 (●'◡'●)✨ | 
								<c:if test="${sessionScope.userId eq 'admin'}">
									<a href="${pageContext.request.contextPath}/main/adminMy" style="color: #fff;">관리자</a>  |
								</c:if>
								<a href="${pageContext.request.contextPath}/member/logout" style="color: #fff;">로그아웃</a>
							</span> 
						</c:if>					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 상단 메뉴바 -->
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/main/main" style="font-size: 25px;"><img alt="로고" src="${pageContext.request.contextPath}/resources/images/로고.png" width="120px"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu </button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="${pageContext.request.contextPath}/activity/list" class="nav-link" style="font-size: 16px;">activity</a></li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/crew/list" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 16px;">community</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/crew/list">Crew</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/photo/list">Photo</a>
						</div>
					</li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/qna/list" class="nav-link" style="font-size: 16px;">Q&A</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/review/write" class="nav-link" style="font-size: 16px;">review</a></li>
					<li class="nav-item"><a href="#" class="nav-link" style="font-size: 16px;">notice</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/member/mypage" class="nav-link" style="font-size: 16px;">Mypage</a></li>
					
				</ul>
			</div>
		</div>
	</nav>
<!-- END nav -->
</header>