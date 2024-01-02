<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/actWriteForm.css" rel="stylesheet" type="text/css">

<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.timepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../inc/top.jsp"></jsp:include>
</head>
<body>
<div class="write-form">
	<div class="container">
		<div class="write-form2">
			<form action="${pageContext.request.contextPath }/activity/updatePro" name="actForm" method="post" enctype="multipart/form-data" >
				<!-- 작성자 -->
				<div class="input-group mb-3">
					<input type="hidden" value="${activityDto.actNum}" id="actNum" class="actNum" name="actNum">
					<span class="input-group-text2" id="inputGroup-sizing-default">회사명</span>
<!-- sessionID -> 회사명 넘어오는 값으로 바꿔야됨 -->
				<input type="text" class="form-control" value="${activityDto.companyName}" name="companyName" readonly>
				</div>
				<!-- 체험명 -->
				<div class="input-group mb-3">
					<span class="input-group-text2" id="inputGroup-sizing-default">체험명</span>
					<input type="text" class="form-control" id="actTitle" name="actTitle" value="${activityDto.actTitle}">
				</div>
				<!-- 카테고리 -->
				<div class="input-group mb-3">
					<span class="input-group-text2" id="inputGroup-sizing-default">카테고리</span>
					<select class="form-select" id="form-control" name="actCategory">
						<option value="">카테고리를 선택하시오</option>
						<c:forEach var="categoriesDto" items="${categoryList}">
							<option value="${categoriesDto.category}" <c:if test="${categoriesDto.category eq activityDto.actCategory}">selected</c:if>>${categoriesDto.category}</option>
						</c:forEach>
					</select>
				</div>
				<!-- 가격 -->
				<div class="input-group mb-3">
					<span class="input-group-text2" id="inputGroup-sizing-default">가격</span>
				<input type="text" class="form-control" name="actPrice" value="${activityDto.actPrice}">
				</div>
				<!-- 문의변호 -->
				<div class="input-group mb-3">
					<span class="input-group-text2" id="inputGroup-sizing-default">문의번호</span>
				<input type="text" class="form-control" name="actPhone" value="${activityDto.actPhone}">
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text2" id="inputGroup-sizing-default">위치</span>
				<input type="text" class="form-control" name="actLocation" id="address_kakao" value="${activityDto.actLocation}" readonly>
				</div>
				<!-- 내용 -->
				<div class="input-group mb-3">
					<span class="input-group-text2" id="inputGroup-sizing-default">내용</span>
				<textarea name="actContent" class="form-control" rows="10" cols="20">${activityDto.actContent}</textarea>
				</div>				
				<!-- 운영시간 -->
				<div class="input-group mb-3" >
					<span class="input-group-text2" id="inputGroup-sizing-default">운영시간</span>
					<select class="form-select" id="ot0" name="actOperationTime">
					  <option value="24시간영업" id="opt1" selected>24시간 영업</option>
					  <option value="매일" id="opt2">매일</option>
					  <option value="평일" id="opt3">평일</option>
					  <option value="주말" id="opt4">주말</option>
					</select>
					<select class="form-select otmf" id="ot1" name="actOperationTime">
						<option value="0" selected>00시</option>
						<c:forEach begin="1" end="23" var="i">
							<c:choose>
								<c:when test="${i <10 }">
									<option value="<c:out value="${i}"/>">0<c:out value="${i}"/>시</option>
								</c:when>
								<c:otherwise>
									<option value="<c:out value="${i}"/>"><c:out value="${i}"/>시</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<select class="form-select otmf" id="ot2" name="actOperationTime">
						<option value="0" selected>00분</option>
						<c:forEach begin="10" end="50" var="i" step="10">
							<option value="<c:out value="${i}"/>"><c:out value="${i}"/>분</option>
						</c:forEach>
					</select>
					<span class="span-select">~</span>
					<select class="form-select otmf" id="ot3" name="actOperationTime">
						<option value="0" selected>00시</option>
						<c:forEach begin="1" end="23" var="i">
							<c:choose>
								<c:when test="${i <10 }">
									<option value="<c:out value="${i}"/>">0<c:out value="${i}"/>시</option>
								</c:when>
								<c:otherwise>
									<option value="<c:out value="${i}"/>"><c:out value="${i}"/>시</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<select class="form-select otmf" id="ot4" name="actOperationTime">
						<option value="0" selected>00분</option>
						<c:forEach begin="10" end="50" var="i" step="10">
							<option value="<c:out value="${i}"/>"><c:out value="${i}"/>분</option>
						</c:forEach>
					</select>
					<input type="button" class="btn btn-primary" id="addOt" value="+"/>
				</div>
				<div id="oprtm">
					<div class="input-group mb-3" >
						<span class="input-group-text2" id="inputGroup-sizing-default">운영시간</span>
						<select class="form-select otss" id="ot5" name="actOperationTime">
						  <option value="주말" selected>주말</option>
						</select>
						<select class="form-select otss" id="ot6" name="actOperationTime">
							<option value="0" selected>00시</option>
							<c:forEach begin="1" end="23" var="i">
								<c:choose>
									<c:when test="${i <10 }">
										<option value="<c:out value="${i}"/>">0<c:out value="${i}"/>시</option>
									</c:when>
									<c:otherwise>
										<option value="<c:out value="${i}"/>"><c:out value="${i}"/>시</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
						<select class="form-select otss" id="ot7" name="actOperationTime">
							<option value="0" selected>00분</option>
							<c:forEach begin="10" end="50" var="i" step="10">
								<option value="<c:out value="${i}"/>"><c:out value="${i}"/>분</option>
							</c:forEach>
						</select>
						<span class="span-select">~</span>
						<select class="form-select otss" id="ot8" name="actOperationTime">
							<option value="0" selected>00시</option>
							<c:forEach begin="1" end="23" var="i">
								<c:choose>
									<c:when test="${i <10 }">
										<option value="<c:out value="${i}"/>">0<c:out value="${i}"/>시</option>
									</c:when>
									<c:otherwise>
										<option value="<c:out value="${i}"/>"><c:out value="${i}"/>시</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
						<select class="form-select otss" id="ot9" name="actOperationTime">
							<option value="0" selected>00분</option>
							<c:forEach begin="10" end="50" var="i" step="10">
								<option value="<c:out value="${i}"/>"><c:out value="${i}"/>분</option>
							</c:forEach>
						</select>
						<input type="button" class="btn btn-primary" id="minOt" value="-"/>
					</div>
				</div>
				<!-- 휴무일 -->
					<div class="input-group mb-3" id="divDayoff">
						<c:set var="count" value="1"/>
						<c:forEach var="dayoffs" items="${dayoffs}">
							<input type="hidden" value="<c:out value="${dayoffs}"/>" class="checkDayoff"/>
							<c:set var="count" value="${count + 1}"/>
						</c:forEach>
					<input type="hidden" value="<c:out value="${count-1}"/>" id="dayoffCount">
					
						<span class="input-group-text2" id="inputGroup-sizing-default">휴무일</span>
						<input type="radio" class="btn-check" name="actDayoff" id="dayoff-yes"
						<c:if test="${activityDto.actDayoff ne '연중무휴'}">checked="checked"</c:if>>
						<label class="btn btn-outline-secondary" for="dayoff-yes">있어요</label>
						<input type="radio" class="btn-check" value="연중무휴" name="actDayoff" id="dayoff-no" 
						<c:if test="${activityDto.actDayoff eq '연중무휴'}">checked="checked"</c:if>>
						<label class="btn btn-outline-secondary" for="dayoff-no">없어요</label>
					</div>
				<div id="dayoff-cb1">
					<div class="input-group mb-3">
						<span class="input-group-text2" id="inputGroup-sizing-default">매주/매월</span>
						<input type="radio" class="btn-check" value="매주" name="actDayoff" id="dayoff2">
						<label class="btn btn-outline-secondary" for="dayoff2">매주</label>
						<input type="radio" class="btn-check" value="" name="actDayoff" id="dayoff3">
						<label class="btn btn-outline-secondary" for="dayoff3">매월</label>
					</div>
				</div>
				
				
				<div id="dayoff-cb2">
					<div class="input-group mb-3">	
						<span class="input-group-text2" id="inputGroup-sizing-default">주</span>
						<input type="checkbox" class="btn-check" id="actDayoff4" value="첫번째" name="actDayoff">
						<label class="btn btn-outline-secondary" for="actDayoff4">첫번째</label>
						<input type="checkbox" class="btn-check" id="actDayoff5" value="두번째" name="actDayoff">
						<label class="btn btn-outline-secondary" for="actDayoff5">두번째</label>
						<input type="checkbox" class="btn-check" id="actDayoff6" value="세번째" name="actDayoff">
						<label class="btn btn-outline-secondary" for="actDayoff6">세번째</label>
						<input type="checkbox" class="btn-check" id="actDayoff7" value="네번째" name="actDayoff">
						<label class="btn btn-outline-secondary" for="actDayoff7">네번째</label>
					</div>
				</div>
				<div id="dayoff-cb3">
					<div class="input-group mb-3">	
						<span class="input-group-text2" id="inputGroup-sizing-default">요일</span>
						<input type="checkbox" class="btn-check" id="actDayoff-mon" value="월요일" name="actDayoff">
						<label class="btn btn-outline-secondary" for="actDayoff-mon">월</label>
						<input type="checkbox" class="btn-check" id="actDayoff-tue" value="화요일" name="actDayoff">
						<label class="btn btn-outline-secondary" for="actDayoff-tue">화</label>
						<input type="checkbox" class="btn-check" id="actDayoff-wed" value="수요일" name="actDayoff">
						<label class="btn btn-outline-secondary" for="actDayoff-wed">수</label>
						<input type="checkbox" class="btn-check" id="actDayoff-thu" value="목요일" name="actDayoff">
						<label class="btn btn-outline-secondary" for="actDayoff-thu">목</label>
						<input type="checkbox" class="btn-check" id="actDayoff-fri" value="금요일" name="actDayoff">
						<label class="btn btn-outline-secondary" for="actDayoff-fri">금</label>
						<input type="checkbox" class="btn-check" id="actDayoff-set" value="토요일" name="actDayoff">
						<label class="btn btn-outline-secondary" for="actDayoff-set">토</label>
						<input type="checkbox" class="btn-check" id="actDayoff-sun" value="일요일" name="actDayoff">
						<label class="btn btn-outline-secondary" for="actDayoff-sun">일</label>
					</div>
				</div>
				<!-- 주차가능여부 -->
				<div class="input-group mb-3">
					<span class="input-group-text2" id="inputGroup-sizing-default">주차 여부</span>
					<input type="checkbox" class="btn-check" id="actParking" name="actParking" value="Y" 
					<c:if test="${activityDto.actParking eq 'Y'}">checked="checked"</c:if>>
					<label class="btn btn-outline-secondary" for="actParking">주차 가능</label>
				</div>
				<!-- 예약필요여부 -->
				<div class="input-group mb-3">
					<span class="input-group-text2" id="inputGroup-sizing-default">예약 여부</span>
					<input type="checkbox" class="btn-check" id="actReservation" value="Y" name="actReservation"
					<c:if test="${activityDto.actReservation eq 'Y'}">checked="checked"</c:if>>
					<label class="btn btn-outline-secondary" for="actReservation">예약 필요</label>
				</div>
				<!-- 이미지 첨부 -->
					
				<div class="input-group mb-3 filebox" id="actImg1">
					<span class="input-group-text2" id="file">이미지</span>
					<label class="form-control input-group-text2" for="files1" id="lbFile1">
						첨부파일
					</label>
					<input id="files1" name="files1" type="file" class="files">
					<input type="hidden" name="lb1" value="" id="lb1"/>
					<input type="hidden" name="ogName1" value="" id="ogName1"/>
					<label class="btn btn-primary" for="delImg1" >ⅹ</label>
					<input type="button" class="delBtn" id="delImg1" name="delImg1" value="1"/>
					<input type="button" class="btn btn-primary" id="addImg1" value="+"/>
				</div>
				
				<div class="input-group mb-3 filebox" id="actImg2">
					<span class="input-group-text2" id="file">이미지</span>
					<label class="form-control input-group-text2" for="files2" id="lbFile2">
						첨부파일
					</label>
					<input id="files2" name="files2" type="file" class="files">
					<input type="hidden" name="lb2" value="" id="lb2"/>
					<input type="hidden" name="ogName2" value="" id="ogName2"/>
					<label class="btn btn-primary" for="delImg2" >ⅹ</label>
					<input type="button" class="delBtn" id="delImg2" name="delImg2" value="2"/>
					<input type="button" class="btn btn-primary" id="addImg2" value="+"/>
				</div>
				
				<div class="input-group mb-3 filebox" id="actImg3">
					<span class="input-group-text2" id="file">이미지</span>
					<label class="form-control input-group-text2" for="files3" id="lbFile3">
						첨부파일
					</label>
					<input id="files3" name="files3" type="file" class="files">
					<input type="hidden" name="lb3" value="" id="lb3"/>
					<input type="hidden" name="ogName3" value="" id="ogName3"/>
					<label class="btn btn-primary" for="delImg3" >ⅹ</label>
					<input type="button" class="delBtn" id="delImg3" name="delImg3" value="3"/>
					<input type="button" class="btn btn-primary" id="addImg3" value="+"/>
				</div>
				
				<div class="input-group mb-3 filebox" id="actImg4">
					<span class="input-group-text2" id="file">이미지</span>
					<label class="form-control input-group-text2" for="files4" id="lbFile4">
						첨부파일
					</label>
					<input id="files4" name="files4" type="file" class="files">
					<input type="hidden" name="lb4" value="" id="lb4"/>
					<input type="hidden" name="ogName4" value="" id="ogName4"/>
					<label class="btn btn-primary" for="delImg4" >ⅹ</label>
					<input type="button" class="delBtn" id="delImg4" name="delImg4" value="4"/>
					<input type="button" class="btn btn-primary" id="addImg4" value="+"/>
				</div>
				
				<div class="input-group mb-3 filebox" id="actImg5">
					<span class="input-group-text2" id="file">이미지</span>
					<label class="form-control input-group-text2" for="files5" id="lbFile5">
						첨부파일
					</label>
					<input id="files5" name="files5" type="file" class="files">
					<input type="hidden" name="lb5" value="" id="lb5"/>
					<input type="hidden" name="ogName5" value="" id="ogName5"/>
					<label class="btn btn-primary" for="delImg5" >ⅹ</label>
					<input type="button" class="delBtn" id="delImg5" name="delImg5" value="5"/>
					<input type="button" class="btn btn-primary" id="addImg5" value="+"/>
				</div>
				
				<div class="input-group mb-3 filebox" id="actImg6">
					<span class="input-group-text2" id="file">이미지</span>
					<label class="form-control input-group-text2" for="files6" id="lbFile6">
						첨부파일
					</label>
					<input id="files6" name="files6" type="file" class="files">
					<input type="hidden" name="lb6" value="" id="lb6"/>
					<input type="hidden" name="ogName6" value="" id="ogName6"/>
					<label class="btn btn-primary" for="delImg6" >ⅹ</label>
					<input type="button" class="delBtn" id="delImg6" name="delImg6" value="6"/>
				</div>
				
				<div>
					<input type="submit" value="업로드" class="btn btn-primary" id="submitBtn">
				</div>
				<br>
			</form>
		</div>
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/actUpdateForm.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> --%>
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
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

</body>
</html>