<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
	<!-- 회원아니면 글쓰기 못하게 -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
	<script type="text/javascript">
		$('#btnWriteQna').click(function() {
			var userId = $('#userId').val();
			console.log(sessionScope.userId);
			if(sessionScope.userId == null){
				alert('로그인 하세요');
			}
		});
	</script>
<meta charset="UTF-8">
<title>qna/list.jsp</title>
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

<style>
.table-fill {
  background: white;
  border-radius:3px;
  border-collapse: collapse;
  margin: auto;
  padding:5px;
  width: 100%;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  animation: float 5s infinite;
  height: 250px;
  max-width: 80%;
}
 
th {
  color:#fff;
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
  color: black;
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
  padding:16px;
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
  
@media all and (max-width: 768px) {
	  table, thead, tbody, th, td, tr {
	    display: block;
	  }
	  
	  th {
	    text-align: right;
	  }
	  
	  table {
	    position: relative; 
	    padding-bottom: 0;
	    border: none;
	    box-shadow: 0 0 10px rgba(0,0,0,.2);
	  }
	  
	  thead {
	    float: left;
	    white-space: nowrap;
	  }
	  
	  tbody {
	    overflow-x: auto;
	    overflow-y: hidden;
	    position: relative;
	    white-space: nowrap;
	  }
	  
	  tr {
	    display: inline-block;
	    vertical-align: top;
	  }
	  
	  th {
	    border-bottom: 1px solid #a39485;
	  }
	  
	  td {
	    border-bottom: 1px solid #e5e5e5;
	  }
}  
</style>
</head>


<!-- 날짜 => 모양 문자열 변경 -->
<!-- SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd"); -->


<body class="goto-here">  
														<!-- 헤더파일들어가는 곳 -->
														<jsp:include page="../inc/top.jsp"></jsp:include>
														<!-- 헤더파일들어가는 곳 -->
														<br>


<div id="contentWrap" style="text-align: center !important;">
<h1 style="font-size: 2rem;">1대1 고객센터 글목록</h1>
														<br>


														<!-- 버튼 기능 -->					
<div class="btn-group">
<c:if test="${! empty sessionScope.userId }">
	<input type="button" id="btnWriteQna" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/qna/write'" value="글쓰기"/>

</c:if>
</div>
														<!-- 버튼 기능 END -->					
														<br><br><br>		
	

														<!-- 글목록판 -->
<input type="hidden" value="${sessionScope.userId}" id="userId">
<table border="1" class=table-fill style="margin: 0 auto;"> <!-- responsive-table -->
    	<thead>	
			<tr>
			    <th>번호</th>
		        <th>작성자</th>
		        <th>제목</th>
		        <th>등록일</th>
		        <th>조회수</th>
			</tr>
  	 	</thead>
  	 	 <c:set var="num" value="${pageDto.qpCount - ((pageDto.qpCurrentPage-1) * 10) }"/>
			<c:forEach var="qnaDto" items="${qnaList}">
				<!-- 1. 비밀글 클릭 안되는 version -->
			<tr>
				<td>${num}</td>
				<td>${qnaDto.qnaName}</td>
				<!-- 비밀글 (이고 비밀글본인 또는 관리자이면 비밀글보이게) 또는 공개글은 보이게 -->
				<td><c:if test="${qnaDto.qnaLev > 0 }">
									   	<img src = "${pageContext.request.contextPath}/resources/images/level.gif" width="${qnaDto.qnaLev*15 }">
									   	<img src = "${pageContext.request.contextPath}/resources/images/reArrow1.gif">
									</c:if>  
				<c:choose> 
					<c:when test = "${qnaDto.qnaSecret == 1 and (sessionScope.userId eq qnaDto.qnaName or sessionScope.userId eq 'admin')
									   		or qnaDto.qnaSecret == 0}">
						<!-- 관리자 또는 sessionId와 작성자가 일치하면 -->			
						<a href="${pageContext.request.contextPath}/qna/content?qnaNum=${qnaDto.qnaNum}"> 
			 									${qnaDto.qnaSubject}</a>
					</c:when>
					<c:otherwise>
						${qnaDto.qnaSubject}	
					</c:otherwise>
				</c:choose></td>
				<td><fmt:formatDate value="${qnaDto.qnaDate}" pattern="yyyy.MM.dd"/></td>
				<td>${qnaDto.qnaReadcount}</td>
			</tr> 
		  <c:set var="num" value="${num-1}"></c:set>
		</c:forEach>
</table>
					<!-- 2. 비밀글 안보이는 version -->
<%-- 		
	<tr>
		<td>${qnaDto.qnaNum}</td>
		<td>${qnaDto.qnaName}</td>
		<td><a href="${pageContext.request.contextPath}/qna/content?qnaNum=${qnaDto.qnaNum}"> 
	 									${qnaDto.qnaSubject}</a></td>		
		<td>${qnaDto.qnaDate}</td>
		<td>${qnaDto.qnaReadcount}</td>
	</tr>
--%>	
														<!-- 글목록판 END -->
														<br>


	<div class="container">
	  	<ul class="pagination" style="justify-content: center !important;">
	  		<c:if test="${pageDto.qpStartPage > pageDto.qpPageBlock}">
			    <li class="page-item">
				    <a class="page-link" href="${pageContext.request.contextPath }/qna/list?qpPageNum=${pageDto.qpStartPage - pageDto.qpPageBlock}">Previous</a>
			    </li>
	  		</c:if>
			
		    <c:forEach var="i" begin="${pageDto.qpStartPage}" end="${pageDto.qpEndPage }" step="1">
		    	<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/qna/list?qpPageNum=${i}">${i}</a></li>
			</c:forEach>
			
			<c:if test="${pageDto.qpEndPage < pageDto.qpPageCount}">
			    <li class="page-item">
			    	<a class="page-link" href="${pageContext.request.contextPath }/qna/list?qpPageNum=${pageDto.qpStartPage + pageDto.qpPageBlock}">Next</a>
			    </li>
			</c:if>
	  	</ul>
	</div> <!-- class="container" -->
</div> <!-- contentWrap -->
															<br>
										

														<!-- 검색기능 -->
<div class="container mt-3">
<form action="${pageContext.request.contextPath}/qna/list" method="get">
  <input class="form-control" id="myInput" type="text" placeholder="제목 검색" name="qpKeyWord">
  <div id="myDIV" class="mt-3">
    <button  type="submit" class="btn btn-info" name="qpKeyWord">검색</button>
  </div>
</form>
</div>
														<!-- 검색기능 END-->
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