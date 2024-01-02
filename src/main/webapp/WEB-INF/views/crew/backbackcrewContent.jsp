<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/crew-reply.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	// CrewReplyDTO
	
	// private int crNum; 			// 댓글 고유번호
	// private int crewNum; 		// crew 게시판 고유번호
	// private String userId; 		// user_info 댓글 작성자
	// private String crContent;	// 댓글 내용
	// private Timestamp crDate; 	// 댓글 작성일
	// private int crParent;		// 부모
	// private int crDepth;			// 깊이
	// private int crOrder;			// 순서 (대댓글 insert => 부모 crOrder + 1)
	
	// 1. 댓글 리스트 불러오기
	// 넘겨야 하는 값: crewNum(게시글 번호)
		
	// 게시글 번호 
	// var crewNum= $('#crewNum').val();
	
	// TODO
	// 1. 댓글 작성 제어(로그인 한 사람만 쓸 수 있게)
	// 2. 댓글 수정, 삭제 제어: 댓글userId eq sessionScope.userId
	// 3. 자식댓이 있는 부모댓이 삭제 되었을 때 -> (update) crContent = ""; -> 출력 <div>삭제된 댓글 입니다.</div>
	//								  -> (delete) 부모댓의 crContent = "" and crOrder = 1 일 때 
	// 4. 댓글 글자수 제어 crContent varchar(350)
	// 5. crContent에 입력된 것이 없으면 -> alert('댓글 내용을 작성하세요.') return;

	// 댓글 리스트 호출
	replyList();

	// 댓글 등록 클릭
	$('#addReply').click(function(){
		var crewNum= $('#crewNum').val();
		var crContent = $("#crContent").val();

		// 로그인 확인
		if(${ empty sessionScope.userId }) {
			alert('댓글은 로그인 후 작성하실 수 있습니다.');
			return false;
		}
		
		// 댓글 작성 확인
    	if (crContent == ""){
			alert("댓글을 작성하세요.");
			return false;
    	}
		
		addReply({
			crewNum: crewNum, 
			crContent: crContent
		})
	}); //

	$('.replyInput textarea').keyup(function() {
		var revText = $(this).val();
		$('.replyInput .count span').html(revText.length);
		if (revText.length>300){
			alert("최대 300자까지 입력 가능합니다.");
			$(this).val(revText.substring(0, 300));
			$('.replyInput .count span').html(300);
		}
	});
	
}); // $(document).ready


// 댓글 등록
function addReply(crewReplyDTO) {
	$.ajax({
		type: "POST",
		url: "${pageContext.request.contextPath}/reply/write",
		data: JSON.stringify(crewReplyDTO),
		contentType: "application/json; charset=utf-8",
		success: function() {
			// 댓글 등록 성공
			$("#crContent").val('');
			replyList(); //등록후 댓글 목록 불러오기 함수 실행
		},
		error: function() {
			// 댓글 등록 실패
			alert('댓글 등록 실패');
		}
	})
	
} //addReply끝

// 대댓글 등록 폼 열기
function rereplyForm(crNum){

	var userId = document.getElementById('replyId').innerText; // 대댓글 아이디

	var str = '';
		str += '<div class="col-12">';
		str += '<div><b> ㄴ ' + userId + '</b></div>';
		str += '<textarea style="resize: none;" rows="3" cols="115" name="reContent" id="reContent"></textarea>';
		str += '<button class="btn btn-primary" id="addReReply" onclick="addReReply(' + crNum + ')">등록</button>';
		str += '<button class="btn btn-primary" onclick="updateCancle()">취소</button>';
		str += '</div>';
		
	$('.reply' + crNum + '').append(str);
	


} //rereplyForm

// 대댓달아~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function addReReply(crNum){
	var crewNum = $('#crewNum').val(); // 게시글 번호
	var crParent = crNum; // 부모 댓글 번호
	var reContent = $('#reContent').val(); // 댓글 내용

	if (reContent == ""){
		alert("댓글을 작성하세요.");
		return false;
	}
	
	var crewReplyDTO = {
		crewNum: crewNum, 
		crContent: reContent,
		crParent: crParent
	}
	
	$.ajax({
		type: "post",
		url: "${pageContext.request.contextPath}/reply/rewrite",
		data: JSON.stringify(crewReplyDTO),
		contentType: "application/json; charset=utf-8",
		success: function() {
			// 댓글 등록 성공
			replyList(); //등록후 댓글 목록 불러오기 함수 실행
		},
		error: function() {
			// 댓글 등록 실패
			alert('댓글 등록 실패');
		}
	})	
} //addReReply


// 댓글 삭제!!!!!!!!!!!!!!!!!!!!!
function deleteReply(crNum) {

	var crOrder = $('#crOrder'+crNum+'').val();
	var crParent = $('#crParent'+crNum+'').val();

	var crewReplyDTO = {
		crNum: crNum,
		crOrder: crOrder,
		crParent: crParent
	}
	
	if(crParent == 0) { // 부모댓글 삭제 컨트롤러로
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/reply/delete",
			data: JSON.stringify(crewReplyDTO),
			contentType: "application/json; charset=utf-8",
//	 		dataType: 'json',
			success: function() {
				// 댓글 삭제 성공
				replyList(); //등록후 댓글 목록 불러오기 함수 실행
			},
			error: function(error) {
				// 댓글 삭제 실패
				alert('댓글 삭제 실패' + '에러 이유' +  error);
			}
		})
	} else {
		$.ajax({ // 자식댓글 삭제 컨트롤러로
			type: "POST",
			url: "${pageContext.request.contextPath}/reply/redelete",
			data: JSON.stringify(crewReplyDTO),
			contentType: "application/json; charset=utf-8",
//	 		dataType: 'json',
			success: function() {
				// 댓글 삭제 성공
				replyList(); //등록후 댓글 목록 불러오기 함수 실행
			},
			error: function(error) {
				// 댓글 삭제 실패
				alert('댓글 삭제 실패' + '에러 이유' +  error);
			}
		})
	}


	
	
} /// 댓삭뜼ㅌ

//댓글 수정!!!!!!!!!!!!!!!!!!!!!폼 열기
function updateReply(crNum) {
	var content = document.getElementById('content'+crNum+'').innerText;
	var upUserId = document.getElementById('upUserId'+crNum+'').innerText;
	
	var str = '';
		str += '<div>';
		str += '<div><b>' + upUserId + '</b></div>';
		str += '<textarea style="resize: none;" rows="3" cols="115" name="upContent" id="upContent">' + content + '</textarea>';
		str += '<button class="btn btn-primary" id="updateForm" onclick="realUpdate(' + crNum + ')">수정</button>';
		str += '<button class="btn btn-primary" onclick="updateCancle()">취소</button>';
		str += '</div>';
	
	document.getElementById('reUpdate'+crNum+'').innerHTML = str;
	
	var upContent =  $('#upContent').val();

} // 댓수정

// 댓글 수정 취소
function updateCancle() {
	replyList();
}


// 수정입력
function realUpdate(crNum){
	
	var upContent =  $('#upContent').val();	
	
	if (upContent == ""){
		alert("댓글을 작성하세요.");
		return false;
	}
	
	var crewReplyDTO = {
			crNum: crNum,
			crContent: upContent
	};
	
	$.ajax({
		type: "POST",
		url: "${pageContext.request.contextPath}/reply/update",
		data: JSON.stringify(crewReplyDTO),
		contentType: "application/json; charset=utf-8",
		success: function() {
			// 댓글 등록 성공
			replyList(); //등록후 댓글 목록 불러오기 함수 실행
		},
		error: function() {
			// 댓글 등록 실패
			alert('댓글 등록 실패');
		}
	})
	
}


//댓글 리스트
function replyList(){	
	
	var crewNum= $('#crewNum').val();
	var sessonId = document.getElementById('replyId').innerText;
	
	$.ajax({
		type : "GET",
//		url: "${pageContext.request.contextPath}/reply/list", => 이 주소 에러남 [/myweb/crew/$%7BpageContext.request.contextPath%7D/reply/list]
		url: "${pageContext.request.contextPath}/reply/list",
		data: {
			crewNum: crewNum
		},
		dataType: 'json',
		success: function(replylist){
			var str = '';
			$.each(replylist, function(index,item){
				var dt = new Date(item.crDate);
				// 날짜 포맷 YYYY.MM.DD HH:MM:SS
				var crDate = dt.getFullYear() + "." + ('0' + (dt.getMonth() + 1)).slice(-2) + "." + ('0' + dt.getDate()).slice(-2)
							+ "&nbsp;" + ('0' + dt.getHours()).slice(-2) + ":" + ('0' + dt.getMinutes()).slice(-2) + ":" + ('0' + dt.getSeconds()).slice(-2); 
							
				if(item.crContent == "") {
					
					str += '<ul class="reply' + item.crNum + '" style="word-break:break-all">'; 
					str += '<li id="reUpdate'+ item.crNum +'">';
					str += '<div>작성자가 삭제한 댓글입니다.</div>';
					str += '</li>';
					str += '</ul>';
					
				} else {
					
					// 부모댓글			
					if(item.crParent == 0) {
						
						str += '<ul class="reply' + item.crNum + '" style="word-break:break-all">'; 
						str += '<li id="reUpdate'+ item.crNum +'">';
						str += '<div id="upUserId'+ item.crNum +'"><b>' + item.userId + '</b></div>';
						str += '<input type="hidden" id="crOrder' + item.crNum + '" value="'+ item.crOrder +'">';
						str += '<input type="hidden" id="crParent' + item.crNum + '" value="'+ item.crParent +'">'; 
						str += '<p id="content' + item.crNum + '">' + item.crContent + '</p>';
						str += '<div style="font-size: 0.8em; color: #bbb;">'+ crDate +'&nbsp;';
							if(sessonId != "") {
								if(item.userId == sessonId) {
									str += '<button class="btn btn-primary" id="updateForm" onclick="updateReply(' + item.crNum + ')">수정</button>';
									str += '<button class="btn btn-primary" onclick="deleteReply(' + item.crNum + ')">삭제</button>';
								}
								str += '<button class="btn btn-primary" onclick="rereplyForm(' + item.crNum + ')">답글달기</button>';	
							}
						str += '</div>';
						str += '</li>';
						str += '</ul>';
					
					// 자식댓글	
					}else {
						
						str += '<ul class="reply' + item.crNum + ' col-10" style="word-break:break-all">'; 
						str += '<li id="reUpdate'+ item.crNum +'">';
						str += '<div id="upUserId'+ item.crNum +'"><b>' + item.userId + '</b></div>';
						str += '<input type="hidden" id="crOrder' + item.crNum + '" value="'+ item.crOrder +'">';
						str += '<input type="hidden" id="crParent' + item.crNum + '" value="'+ item.crParent +'">'; 
						str += '<p id="content' + item.crNum + '">' + item.crContent + '</p>';
						str += '<div style="font-size: 0.8em;">'+ crDate +'&nbsp;';
							if(item.userId == (" ㄴ "+sessonId)) {
								str += '<button class="btn btn-primary" id="updateForm" onclick="updateReply(' + item.crNum + ')">수정</button>';
								str += '<button class="btn btn-primary" onclick="deleteReply(' + item.crNum + ')">삭제</button>';
							}
						str += '</div>';
						str += '</li>';
						str += '</ul>';
						
					}
					
				}			
							

				
			})
			
			// 댓글이 있을 때
			document.getElementById('listDiv').innerHTML = str;
//				$('#listDiv').html(str);
			
			// 댓글이 없을 때 
	        if(typeof replylist=="undefined" || replylist == null || replylist == ""){
	            $("#listDiv").append('<p class="text-center">등록된 댓글 없음</p><br>');
	        }
			
    	}
  	});
} // replyList 끝	
</script>
</script>
<style>
.table tbody tr td{
	padding: 10px 10px;
}
</style>
<style>
.table tbody tr td{
	padding: 10px 10px;
}
ul{
	list-style:none;
	padding-left:0px;
}
</style>

</head>
<body class="goto-here">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->

<!-- 여기에 작성 -->

<!-- MEMO 카테고리 넣어야함 cb_category -->
<section class="ftco-section">
	<div class="col-lg-12">
		<div class="container">
			<div class="row">
				
				<div class="col-lg-2 sidebar"> <!-- 카테고리 사이드바 -->
					<div class="sidebar-box">
            			<h3 class="heading">community</h3>
              			<ul class="categories">
                			<li><a href="#">crew</a></li>
                			<li><a href="#">photo</a></li>
              			</ul>
           			</div>        
				</div> <!-- 카테고리 사이드바 -->     
				
				
				
				<div class="col-lg-10"> <!-- 글 상세보기 -->
					<div class="container" style="border: 1px;">
						<div class="text-right">
							<input type="button" value="이전글" class="btn btn-primary" onclick="location.href='#'">
							<input type="button" value="다음글" class="btn btn-primary" onclick="location.href='#'">
							<input type="button" value="목록" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/crew/list'">
				    	</div>
   					</div>
    		
   					<p class="text-left" style="color: #FF5500;"><span class="icon-chat_bubble"></span>&nbsp;커뮤니티 > <b>함께 운동해요!</b></p>
   					<input type="hidden" id="crewNum" value="${crewDTO.crewNum}">
   					<h4><span style="color: #FF5500">[${crewDTO.crewCategory}]</span>&nbsp;<span><b>${crewDTO.crewSubject}</b></span></h4>
  					<div>
    					<div>
							<p class="text-left" style="margin-bottom: 0;"><span class="mr-2" style="color: #000;"><b>${crewDTO.userId}</b></span></p>
						</div>
						<div class="rating d-flex">
							<p class="text-left">
								<span class="mr-2" style="color: #bbb;"><fmt:formatDate value="${crewDTO.crewDate}" pattern="yyyy.MM.dd HH:mm:ss"/>&nbsp;조회수&nbsp;${crewDTO.crewReadcount}</span>
							</p>
						</div>
						<div>
							<p class="text-left">
								<span class="icon-chat_bubble"></span>댓글(댓글 수)
							</p>
						</div>
					</div>
						
					<p style="color: #000;">${crewDTO.crewContent}</p>
					
					<div class="row mt-4">
         					<div class="col-md-12">
         						<p style="color: #000;"><span class="icon-heart"></span>좋아요<span class="icon-chat"></span>댓글(댓글수)</p>
         					</div>
        				</div>
        				
        				<!-- 댓글 -->
					<div class="col-lg-12">
						<div class="container bg-light">
							<div><p><a href="#replyWriteForm"><b>댓글</b></a></p></div>	
							<div id="listDiv" style="color: #000000;">

							</div>
						</div>
					</div>
						


					<!-- 댓글 작성 -->
<!-- 					<div class="col-lg-12"> -->
<!-- 						<div class="container bg-light"> -->
<%-- 							<div><label><b>${sessionScope.userId}</b></label></div> --%>
<!-- 							<div><textarea id="reContent" style="resize: none;" rows="3" cols="115" placeholder="댓글은 로그인 후 작성 가능합니다."></textarea></div> -->
<!-- 							<div class="text-right"><input id="addReply" type="button" class="btn btn-primary" value="등록" ></div> -->
<!-- 						</div> -->
<!-- 					</div> -->
					
					<div class="col-lg-12">
						<table class="container bg-light">
							<tr><td class="col-7"><b style="color: #000;" >${sessionScope.userId}</b></td></tr>
							<tr><td class="text-center"><textarea style="resize: none;" rows="3" cols="115" placeholder="댓글은 로그인 후 작성 가능합니다."
											  name="reContent" id="reContent" required="required"></textarea></td></tr>
							<tr><td class="text-right"><button class="btn btn-primary" id="addReply">등록하기</button></td></tr>
						</table>
					</div>
					<!-- 댓글 작성 -->
         				
         			<!-- 게시글 수정 -->
         			<div class="col-lg-12 ftco-animate text-center">
						<div class="container" style="padding: 0px 0px 60px">
							<input type="button" value="목록" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/crew/list'">
							<c:if test="${crewDTO.userId eq sessionScope.userId}">
								<input type="button" value="수정" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/crew/update?num=${crewDTO.crewNum}'">
								<input type="button" value="삭제" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/crew/delete?num=${crewDTO.crewNum}'">
							</c:if>
						</div>
					</div>
         			

         				
				</div> <!-- 글 상세보기 -->
				</div>
			</div>
		</div>
</section>




<!-- 여기에 작성 -->


<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->

<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> --%>
<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<%-- <script src="${pageContext.request.contextPath}/resources/js/google-map.js"></script> --%>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>