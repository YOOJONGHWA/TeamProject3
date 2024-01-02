<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/content.jsp</title>
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	  
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
			
				<meta name="viewport" content="initial-scale=1.0; maximum-scale=1.0; width=device-width;">

<style type="text/css">
body {
  background-color: #f5f5f5;
  font-family: "Roboto", helvetica, arial, sans-serif;
  font-size: 16px;
  font-weight: 400;
  text-rendering: optimizeLegibility;
}

div.table-title {
  display: block;
  margin: auto;
  max-width: 600px;
  padding:5px;
  width: 90%;
}

.table-title h3 {
   color: #fafafa;
   font-size: 30px;
   font-weight: 400;
   font-style:normal;
   font-family: "Roboto", helvetica, arial, sans-serif;
   text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
   text-transform:uppercase;
}


/* Table Styles */
.table-fill {
  background: white;
  border-radius:3px;
  border-collapse: collapse;
  margin: auto;
  padding:5px;
  width: 100%;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  animation: float 5s infinite;
  height: 320px;
  max-width: 600px;
}
 
th {
  color:white;
  background:#1b1e24;
  border-bottom:4px solid #9ea7af;
  border-right: 1px solid #343a45;
  font-size:23px;
  font-weight: 100;
  padding:24px;
  text-align:left;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
  vertical-align:middle;
}

th:first-child {
  border-top-left-radius:3px;
}
 
th:last-child {
  border-top-right-radius:3px;
  border-right:none;
}
  
tr {
  border-top: 1px solid #C1C3D1;
  border-bottom-: 1px solid #C1C3D1;
  color:#666B85;
  font-size:16px;
  font-weight:normal;
  text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}
 
tr:hover td {
  background:#4E5066;
  color:#FFFFFF;
  border-top: 1px solid #22262e;
}
 
tr:first-child {
  border-top:none;
}

tr:last-child {
  border-bottom:none;
}
 
tr:nth-child(odd) td {
  background:#EBEBEB;
}
 
tr:nth-child(odd):hover td {
  background:#4E5066;
}

tr:last-child td:first-child {
  border-bottom-left-radius:3px;
}
 
tr:last-child td:last-child {
  border-bottom-right-radius:3px;
}
 
td {
  background:#FFFFFF;
  padding:20px;
  text-align:left;
  vertical-align:middle;
  font-weight:300;
  font-size:16px;
  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
  border-right: 1px solid #C1C3D1;
}

td:last-child {
  border-right: 0px;
}

th.text-left {
  text-align: left;
  width: 20%
}

th.text-center {
  text-align: center;
}

th.text-right {
  text-align: right;
}

td.text-left {
  text-align: left;
}

td.text-center {
  text-align: center;
}

td.text-right {
  text-align: right;
}	

/* 2번 버튼 */
.frame {
  width: 90%;
  margin: 40px auto;
  text-align: center;
}
button {
  margin: 10px;
}
.custom-btn {
  width: 130px;
  height: 40px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}
.btn-2 {
  background: rgb(96,9,240);
  background: linear-gradient(0deg, rgba(96,9,240,1) 0%, rgba(129,5,240,1) 100%);
  border: none;
}
.btn-2:before {
  height: 0%;
  width: 2px;
}
.btn-2:hover {
  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.5),
              -4px -4px 6px 0 rgba(116, 125, 136, .5), 
    inset -4px -4px 6px 0 rgba(255,255,255,.2),
    inset 4px 4px 6px 0 rgba(0, 0, 0, .4);
}



</style>
</head>


<body class="goto-here">  
														<!-- 헤더파일들어가는 곳 -->
														<jsp:include page="../inc/top.jsp"></jsp:include>
														<!-- 헤더파일들어가는 곳 -->
														<br>

<div class="container">
	<h1 style="font-size: 2rem; padding-left: 13em">1대1 고객센터 글목록</h1>
<!-- 		<div class="eight"><h1 style="font-size: 2rem;">글내용</h1></div> -->
														<br>
<!-- 			  <th colspan="2"></th> -->
	<div id="content">
		<table border="1" class="table-fill" style="width:500em;">
			<thead>
				<tr>
					<th class="text-left" style="height: 0.1em;">글번호</th>
					<td style="height: 0.1em;">${qnaDto.qnaNum }</td>
					<th class="text-left" style="height: 0.1em;">등록일</th>
					<td style="height: 0.1em;"><fmt:formatDate value="${qnaDto.qnaDate}" pattern="yyyy.MM.dd"/></td>
				</tr>
				<tr>
			  		<th class="text-left">작성자</th>
			  		<td>${qnaDto.qnaName }</td>
					<th class="text-left">조회수</th>
					<td>${qnaDto.qnaReadcount }</td>
				</tr>
				<tr>
					<th class="text-left">제목</th>
					<td colspan="3">${qnaDto.qnaSubject }</td>
				</tr>
				<tr>
					<td colspan="4" style="height: 10em;">${qnaDto.qnaContent }</td>
				</tr>
		    </thead>		
		  </table>
		  
		  	<div class="btn_place" style="padding-left: 15.5em;">
		    	  <c:if test="${sessionScope.userId eq 'admin'}">
				      <button class="custom-btn btn-2" onclick="location.href='${pageContext.request.contextPath }/qna/reWrite?qnaNum=${qnaDto.qnaNum }'">답글쓰기</button>
			  	  </c:if>
			  	  
				  <c:if test="${sessionScope.userId eq qnaDto.qnaName}">
				      <button class="custom-btn btn-2" onclick="location.href='${pageContext.request.contextPath }/qna/update?qnaNum=${qnaDto.qnaNum }'">글수정</button>
				      <button class="custom-btn btn-2" onclick="location.href='${pageContext.request.contextPath }/qna/delete?qnaNum=${qnaDto.qnaNum }'">글삭제</button>
			      </c:if>	
			      
			      <button class="custom-btn btn-2" onclick="location.href='${pageContext.request.contextPath }/qna/list'">글목록</button>
		  	</div>
		  </div> <!-- id="content" -->
</div> <!-- class="container" -->
														<br><br>


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


