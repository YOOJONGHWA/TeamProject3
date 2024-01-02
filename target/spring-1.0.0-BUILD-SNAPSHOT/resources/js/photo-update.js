/**
 * 포토 게시판 수정
 */
 
$(document).ready(function() {
	
	$('#writeBtn').click(function(){
		var photoLocation = $('#photoLocation :selected').val();
		var photoContent = $('#photoContent').val();
		var file = $("#file").val();
		// 장소
		if(photoLocation == "장소를 선택해 주세요.") {
			alert('장소를 선택해 주세요.');
			return false;
		}
		
		// 글 내용
    	if (photoContent == ""){
			alert('내용을 입력해 주세요.');
			return false;
    	}
    	
    	if(!file){
    		alert('사진을 첨부해 주세요.');
    		return false;
    	}

	}); //

	$('#back').click(function(){
		const result = confirm("변경사항이 저장되지 않습니다. 목록으로 이동하시겠습니까?");
		if(result){} else{return false;};
	}); //
		
	// 글자수 카운트
	$('.content textarea').keyup(function() {
		var revText = $(this).val();	
		$('.content .count span').html(revText.length);
		if (revText.length>2000){
			alert("최대 2000자까지 입력 가능합니다.");
			$(this).val(revText.substring(0, 2000));
			$('.content .count span').html(2000);
		}
	}); //
		
	
}); 

const fileDOM = document.querySelector('#file');
const previews = document.querySelectorAll('.image-box');

fileDOM.addEventListener('change', () => {
  const reader = new FileReader();
  reader.onload = ({ target }) => {
    previews[0].src = target.result;
  };
  reader.readAsDataURL(fileDOM.files[0]);
});