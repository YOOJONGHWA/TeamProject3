<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/list.jsp</title>
</head>
<body>
<h1>회원 목록</h1>

<c:if test="${ empty sessionScope.userId }">
	<c:redirect url="${pageContext.request.contextPath }/member/login"/>
</c:if>

<c:if test="${ ! empty sessionScope.userId }">
	<c:if test="${sessionScope.userId ne 'admin'}">
		<c:redirect url="${pageContext.request.contextPath }/member/main" />
	</c:if>
</c:if>

<table border="1">
<tr>
	<td>아이디</td>
	<td>이름</td>
	<td>생년월일</td>
	<td>성별</td>
	<td>이메일</td>
	<td>Phone</td>
	<td>사는곳</td>
	<td>관심사</td>
	<td>관심지역</td>
	<td>포인트</td>
</tr>
	
<c:forEach var="dto" items="${memberList }">
<tr>
	<td>${dto.userId}</td>
	<td>${dto.userName}</td>
	<td>${dto.userBirth}</td>
	<td>${dto.userGender}</td>
	<td>${dto.userEmail}</td>
	<td>${dto.userPhone}</td>
	<td>${dto.userAddress}</td>
	<td>${dto.userInterest}</td>
	<td>${dto.userArea}</td>
	<td>${dto.userPoint}</td>
</tr>
</c:forEach>
</table>

</body>
</html>