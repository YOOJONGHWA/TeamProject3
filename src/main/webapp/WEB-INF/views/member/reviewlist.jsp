<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/reviewlist.jsp</title>
</head>
<body>
<h1>내가 작성한 리뷰</h1>

<c:if test="${ empty sessionScope.userId }">
	<c:redirect url="${pageContext.request.contextPath }/member/login"/>
			<c:redirect url="${pageContext.request.contextPath }/member/mypage" />
</c:if>

<script type="text/javascript">

alert('jsp 들어옴');
</script>

<c:if test="${ ! empty sessionScope.userId }">
	<c:if test="${sessionScope.userId ne 'admin'}">
		<c:redirect url="${pageContext.request.contextPath }/member/mypage" />
	</c:if>
</c:if>

<table border="1">
<tr>
	<td>글번호</td>
	<td>아이디</td>
	<td>별점</td>
	<td>제목</td>
	<td>내용</td>
	<td>첨부파일</td>
	<td>입력시간</td>
	<td>체험 번호</td>
	<td>조회수</td>
</tr>
	
<c:forEach var="dto" items="${getReviewList }">
<tr>
	<td>${dto.reviewNum}</td>
	<td>${dto.userId}</td>
	<td>${dto.reviewScore}</td>
	<td>${dto.reviewTitle}</td>
	<td>${dto.reviewContext}</td>
	<td>${dto.reviewFile}</td>
	<td>${dto.reviewDate}</td>
	<td>${dto.actNum}</td>
	<td>${dto.readcount}</td>
</tr>
</c:forEach>
</table>

</body>
</html>