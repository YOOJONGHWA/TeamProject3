/**
 * 크루 게시판 content
 */
 

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
	
	// 게시글 번호 
	// var crewNum= $('#crewNum').val();

	// 댓글 리스트 호출
	replyList();

	// 댓글 등록 클릭
	$('#addReply').click(function(){
		var crewNum = $('#crewNum').val();
		var crContent = $("#crContent").val();
		var sessionId = document.getElementById('replyId').innerText;
		
		// 로그인 확인
		if(sessionId == "") {
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
		});
		
	}); //

	// 글자수 카운트
	$('.replyInput textarea').keyup(function() {

		var revText = $(this).val();	
		$('.replyInput .count span').html(revText.length);
		if (revText.length>300){
			alert("최대 300자까지 입력 가능합니다.");
			$(this).val(revText.substring(0, 300));
			$('.replyInput .count span').html(300);
		}
	}); //
	
	$('#deleteBtn').click(function(){
		const result = confirm("삭제된 글은 복구할 수 없습니다. 삭제하시겠습니까?");
		if(result){
		} else{
			return false;
		};
	}); //
	
	// 로그인 후 하트 클릭
	$('#heart-click').click(function() {
				
		var crewNum = $('#crewNum').val();
		var likeCnt = Number(document.getElementById('likeCnt').innerText);
		
		var crewLikeDTO = {
			crewNum: crewNum
		}
		
		if($(this).children('span').attr('class') == "icon-heart-o hrt") {
			
			$.ajax({
				type: "post",
				url: "../crewlike/add",
				data: JSON.stringify(crewLikeDTO),
				contentType: "application/json; charset=utf-8",
				success: function() {

					var str = '';
					str += '<span class="icon-heart hrt"></span>';
					document.getElementById('heart-click').innerHTML = str;
					
					likeCnt += 1;
					document.getElementById('likeCnt').innerHTML = likeCnt;
					
				},
				error: function() {
					// 댓글 등록 실패
					alert('좋아요 실패');
				}
			}) //
			
		}else {
			
			$.ajax({
				type: "post",
				url: "../crewlike/sub",
				data: JSON.stringify(crewLikeDTO),
				contentType: "application/json; charset=utf-8",
				success: function() {
					
					var str = '';
					str += '<span class="icon-heart-o hrt"></span>';
					document.getElementById('heart-click').innerHTML = str;
					
					likeCnt -= 1;
					document.getElementById('likeCnt').innerHTML = likeCnt;
					
				},
				error: function() {
					// 댓글 등록 실패
					alert('좋아요 취소 실패');
				}
			})
			
		}
	
	}) //
	
	
	// 로그인 안하고 클릭
	$('#heart-click-nologin').click(function() {
		alert('로그인을 하신 후 이용해 주시길 바랍니다.');
	})//
	
	
	// 모집중 모집완료
	$('#status').change(function() { 
		var status = $('#status :selected').val();
		var crewNum = $('#crewNum').val();
		
		$.ajax({
		
		url: "../crew/status",
		data: {
			'status': status,
			'crewNum': crewNum
		},
		success: function() {

			if(status == '모집완료') {
				$('#subject').attr('class','lith fs-30');

			}else{
				$('#subject').attr('class','c-bl fs-30');
			}
			
		},
		error: function() {
			
		}
		
		}) // ajax
		
	})//
	
	
}); // $(document).ready


// 댓글 등록
function addReply(crewReplyDTO) {
	$.ajax({
		type: "POST",
		url: "../crewreply/write",
		data: JSON.stringify(crewReplyDTO),
		contentType: "application/json; charset=utf-8",
		success: function() {
			// 댓글 등록 성공
			$("#crContent").val('');
			$("input:checkbox[id='secret']").prop("checked", false);
			$('#secret-icon').attr('class','icon-lock_open');
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
		str += '<textarea class="txt-a" rows="3" name="reContent" id="reContent"></textarea>';
		str += '<button class="btn btn-primary text-right" id="addReReply" onclick="addReReply(' + crNum + ')">등록</button>&nbsp;';
		str += '<button class="btn btn-primary text-right" onclick="updateCancle()">취소</button>';
		str += '</div><hr>';
		
	$('.reply' + crNum + '').append(str);
	$('#openReReply' + crNum + '').remove();


} //rereplyForm

// 대댓달기
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
		url: "../crewreply/rewrite",
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


// 댓글 삭제
function deleteReply(crNum) {

	const result = confirm("삭제된 댓글은 복구할 수 없습니다. 삭제하시겠습니까?");
	if(result){} else{return false;};

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
			url: "../crewreply/delete",
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
			url: "../crewreply/redelete",
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

} /// 댓삭끝

//댓글 수정 폼 열기
function updateReply(crNum) {
	var content = document.getElementById('content'+crNum+'').innerText;
	var upUserId = document.getElementById('upUserId'+crNum+'').innerText;
	
	var str = '';
		str += '<div>';
		str += '<div><b>' + upUserId + '</b></div>';
		str += '<textarea class="txt-a" rows="3" name="upContent" id="upContent">' + content + '</textarea>';
		str += '<button class="btn btn-primary" id="updateForm" onclick="realUpdate(' + crNum + ')">수정</button>&nbsp;';
		str += '<button class="btn btn-primary" onclick="updateCancle()">취소</button>';
		str += '</div><hr>';
	
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
		url: "../crewreply/update",
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
		url: "../crewreply/list",
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
					str += '<div>작성자가 삭제한 댓글입니다.</div><hr>';
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
						str += '<div class="c-gr" style="font-size: 0.8em;">'+ crDate +'&nbsp;';
							if(sessonId != "") {
								if(item.userId == sessonId) {
									str += '<button class="btn btn-primary" id="updateForm" onclick="updateReply(' + item.crNum + ')">수정</button>&nbsp;';
									str += '<button class="btn btn-primary" onclick="deleteReply(' + item.crNum + ')">삭제</button>&nbsp;';
								}
								str += '<button class="btn btn-primary" id="openReReply' + item.crNum + '" onclick="rereplyForm(' + item.crNum + ')">답글달기</button>';	
							}
						str += '</div><hr>';
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
						str += '<div class="c-gr" style="font-size: 0.8em;">'+ crDate +'&nbsp;';
							if(item.userId == (" ㄴ "+sessonId)) {
								str += '<button class="btn btn-primary" id="updateForm" onclick="updateReply(' + item.crNum + ')">수정</button>&nbsp;';
								str += '<button class="btn btn-primary" onclick="deleteReply(' + item.crNum + ')">삭제</button>';
							}
						str += '</div><hr>';
						str += '</li>';
						str += '</ul>';
						
					}
					
				}			
						
				
			})
			
			// 댓글이 있을 때
			document.getElementById('listDiv').innerHTML = str;
			
			// 댓글이 없을 때 
	        if(typeof replylist=="undefined" || replylist == null || replylist == ""){
	            $("#listDiv").append('<p class="text-center">등록된 댓글이 없습니다.</p><br>');
	        }
			
    	}
  	});
} // replyList 끝	