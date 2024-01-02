
/* 사진 게시판 댓글 기능 */
 
$(document).ready(function(){
	
	// PhotoReplyDTO
	
	// private int prNum; 			// 댓글 고유번호
	// private int photoNum; 		// photo 게시판 고유번호
	// private String userId; 		// user_info 댓글 작성자
	// private String prContent;	// 댓글 내용
	// private Timestamp prDate; 	// 댓글 작성일
	// private int prParent;		// 부모
	// private int prDepth;			// 깊이
	// private int prOrder;			// 순서 (대댓글 insert => 부모 prOrder + 1)
	
	// 1. 댓글 리스트 불러오기
	// 넘겨야 하는 값: photoNum(게시글 번호)
		
	// 게시글 번호 
	// var photoNum= $('#photoNum').val();
	
	// TODO
	// 1. 댓글 작성 제어(로그인 한 사람만 쓸 수 있게)
	// 2. 댓글 수정, 삭제 제어: 댓글userId eq sessionScope.userId
	// 3. 자식댓이 있는 부모댓이 삭제 되었을 때 -> (update) prContent = ""; -> 출력 <div>삭제된 댓글 입니다.</div>
	//								  -> (delete) 부모댓의 prContent = "" and prOrder = 1 일 때 
	// 4. 댓글 글자수 제어 prContent varchar(350)
	// 5. prContent에 입력된 것이 없으면 -> alert('댓글 내용을 작성하세요.') return;

	

	// 댓글 리스트 호출
	replyList();

	// 댓글 등록 클릭
	$('#addReply').click(function(){
		var photoNum = $('#photoNum').val();
		var prContent = $("#prContent").val();
		var sessionId = document.getElementById('replyId').innerText;
		
		// 로그인 확인
		if(sessionId == "") {
			alert('댓글은 로그인 후 작성하실 수 있습니다.');
			return false;
		}
		
		// 댓글 작성 확인
    	if (prContent == ""){
			alert("댓글을 작성하세요.");
			return false;
    	}
		
		addReply({
			photoNum: photoNum, 
			prContent: prContent
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
		
		// 빈하트 클릭 insert
		// photoNum 게시글 번호
		// userId 회원 아이디 => session값으로 가져오니까 안넘겨도 돼~~
		
		// 1.
		// db에 좋아요번호 ㅇ / 게시글번호 ㅇ / 좋아요체크여부 = 0
		// 예전에 좋아요를 눌렀다가 취소한 사람
		// update 좋아요여부 + 1
		
		// 2.
		// 처음 좋아요를 클릭한 사람
		// 좋아요 번호, 게시글 번호, 좋아요 체크여부(1) 모두 insert
	
		
		var photoNum = $('#photoNum').val();
		var likeCnt = Number(document.getElementById('likeCnt').innerText);
		
		var photoLikeDTO = {
			photoNum: photoNum
		}
		
		if($(this).children('span').attr('class') == "icon-heart-o cur-p") {
			
			$.ajax({
				type: "post",
				url: "../photolike/add",
				data: JSON.stringify(photoLikeDTO),
				contentType: "application/json; charset=utf-8",
				success: function() {
					
					// 3. 
					// 작업 후 빨강 하트로 변결
					// 전체 좋아요수 + 1 결과 반영
					
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
				url: "../photolike/sub",
				data: JSON.stringify(photoLikeDTO),
				contentType: "application/json; charset=utf-8",
				success: function() {
					
					// 3. 
					// 작업 후 빨강 하트로 변결
					// 전체 좋아요수 + 1 결과 반영
					
					var str = '';
					str += '<span class="icon-heart-o cur-p"></span>';
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
	
	
}); // $(document).ready


// 댓글 등록
function addReply(photoReplyDTO) {
	$.ajax({
		type: "POST",
		url: "../photoreply/write",
		data: JSON.stringify(photoReplyDTO),
		contentType: "application/json; charset=utf-8",
		success: function() {
			// 댓글 등록 성공
			$("#prContent").val('');
			replyList(); //등록후 댓글 목록 불러오기 함수 실행
		},
		error: function() {
			// 댓글 등록 실패
			alert('댓글 등록 실패');
		}
	})
	
} //addReply끝

// 대댓글 등록 폼 열기
function rereplyForm(prNum){

	var userId = document.getElementById('replyId').innerText; // 대댓글 아이디

	var str = '';
		str += '<div class="col-12">';
		str += '<div><b> ㄴ ' + userId + '</b></div>';
		str += '<textarea class="txt-a" rows="3" name="reContent" id="reContent"></textarea>';
		str += '<button class="btn btn-primary text-right" id="addReReply" onclick="addReReply(' + prNum + ')">등록</button>&nbsp;';
		str += '<button class="btn btn-primary text-right" onclick="updateCancle()">취소</button>';
		str += '</div><hr>';
		
	$('.reply' + prNum + '').append(str);
	$('#openReReply' + prNum + '').remove();


} //rereplyForm

// 대댓달아~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function addReReply(prNum){
	var photoNum = $('#photoNum').val(); // 게시글 번호
	var prParent = prNum; // 부모 댓글 번호
	var reContent = $('#reContent').val(); // 댓글 내용

	if (reContent == ""){
		alert("댓글을 작성하세요.");
		return false;
	}
	
	var photoReplyDTO = {
		photoNum: photoNum, 
		prContent: reContent,
		prParent: prParent
	}
	
	$.ajax({
		type: "post",
		url: "../photoreply/rewrite",
		data: JSON.stringify(photoReplyDTO),
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
function deleteReply(prNum) {

	const result = confirm("삭제된 댓글은 복구할 수 없습니다. 삭제하시겠습니까?");
	if(result){} else{return false;};

	var prOrder = $('#prOrder'+prNum+'').val();
	var prParent = $('#prParent'+prNum+'').val();

	var photoReplyDTO = {
		prNum: prNum,
		prOrder: prOrder,
		prParent: prParent
	}
	
	if(prParent == 0) { // 부모댓글 삭제 컨트롤러로
		$.ajax({
			type: "POST",
			url: "../photoreply/delete",
			data: JSON.stringify(photoReplyDTO),
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
			url: "../photoreply/redelete",
			data: JSON.stringify(photoReplyDTO),
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
function updateReply(prNum) {
	var content = document.getElementById('content'+prNum+'').innerText;
	var upUserId = document.getElementById('upUserId'+prNum+'').innerText;
	
	var str = '';
		str += '<div>';
		str += '<div><b>' + upUserId + '</b></div>';
		str += '<textarea class="txt-a" rows="3" name="upContent" id="upContent">' + content + '</textarea>';
		str += '<button class="btn btn-primary" id="updateForm" onclick="realUpdate(' + prNum + ')">수정</button>&nbsp;';
		str += '<button class="btn btn-primary" onclick="updateCancle()">취소</button>';
		str += '</div><hr>';
	
	document.getElementById('reUpdate'+prNum+'').innerHTML = str;
	
	var upContent =  $('#upContent').val();

} // 댓수정

// 댓글 수정 취소
function updateCancle() {
	replyList();
}


// 수정입력
function realUpdate(prNum){
	
	var upContent =  $('#upContent').val();	
	
	if (upContent == ""){
		alert("댓글을 작성하세요.");
		return false;
	}
	
	var photoReplyDTO = {
			prNum: prNum,
			prContent: upContent
	};
	
	$.ajax({
		type: "POST",
		url: "../photoreply/update",
		data: JSON.stringify(photoReplyDTO),
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
	
	var photoNum= $('#photoNum').val();
	var sessionId = document.getElementById('replyId').innerText;
	
	$.ajax({
		type : "GET",
		url: "../photoreply/list",
		data: {
			photoNum: photoNum
		},
		dataType: 'json',
		success: function(replylist){
			var str = '';
			$.each(replylist, function(index,item){
				var dt = new Date(item.prDate);
				// 날짜 포맷 YYYY.MM.DD HH:MM:SS
				var prDate = dt.getFullYear() + "." + ('0' + (dt.getMonth() + 1)).slice(-2) + "." + ('0' + dt.getDate()).slice(-2)
							+ "&nbsp;" + ('0' + dt.getHours()).slice(-2) + ":" + ('0' + dt.getMinutes()).slice(-2) + ":" + ('0' + dt.getSeconds()).slice(-2); 
							
				if(item.prContent == "") {
					
					str += '<ul class="reply' + item.prNum + '" style="word-break:break-all">'; 
					str += '<li id="reUpdate'+ item.prNum +'">';
					str += '<div>작성자가 삭제한 댓글입니다.</div><hr>';
					str += '</li>';
					str += '</ul>';
					
				} else {
					
					// 부모댓글			
					if(item.prParent == 0) {
						
						str += '<ul class="reply' + item.prNum + '" style="word-break:break-all">'; 
						str += '<li id="reUpdate'+ item.prNum +'">';
						str += '<div id="upUserId'+ item.prNum +'"><b>' + item.userId + '</b></div>';
						str += '<input type="hidden" id="prOrder' + item.prNum + '" value="'+ item.prOrder +'">';
						str += '<input type="hidden" id="prParent' + item.prNum + '" value="'+ item.prParent +'">'; 
						str += '<p id="content' + item.prNum + '">' + item.prContent + '</p>';
						str += '<div class="f8e-c-gr">'+ prDate +'&nbsp;';
							if(sessionId != "") {
								if(item.userId == sessionId) {
									str += '<button class="btn btn-primary" id="updateForm" onclick="updateReply(' + item.prNum + ')">수정</button>&nbsp;';
									str += '<button class="btn btn-primary" onclick="deleteReply(' + item.prNum + ')">삭제</button>&nbsp;';
								}
								str += '<button class="btn btn-primary" id="openReReply' + item.prNum + '" onclick="rereplyForm(' + item.prNum + ')">답글달기</button>';	
							}
						str += '</div><hr>';
						str += '</li>';
						str += '</ul>';
					
					// 자식댓글	
					}else {
						
						str += '<ul class="reply' + item.prNum + ' col-10" style="word-break:break-all">'; 
						str += '<li id="reUpdate'+ item.prNum +'">';
						str += '<div id="upUserId'+ item.prNum +'"><b>' + item.userId + '</b></div>';
						str += '<input type="hidden" id="prOrder' + item.prNum + '" value="'+ item.prOrder +'">';
						str += '<input type="hidden" id="prParent' + item.prNum + '" value="'+ item.prParent +'">'; 
						str += '<p id="content' + item.prNum + '">' + item.prContent + '</p>';
						str += '<div class="f8e-c-gr">'+ prDate +'&nbsp;';
							if(item.userId == (" ㄴ "+sessionId)) {
								str += '<button class="btn btn-primary" id="updateForm" onclick="updateReply(' + item.prNum + ')">수정</button>&nbsp;';
								str += '<button class="btn btn-primary" onclick="deleteReply(' + item.prNum + ')">삭제</button>';
							}
						str += '</div><hr>';
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
	            $("#listDiv").append('<p class="text-center">등록된 댓글이 없습니다.</p><br>');
	        }
			
    	}
  	});
} // replyList 끝	