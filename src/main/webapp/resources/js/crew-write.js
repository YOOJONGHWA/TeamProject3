/**
 * 크루 게시판 글쓰기
 */
 

$(document).ready(function() {
	
	// 지역을 선택 => 카테고리 선택 => 체험 선택
	
	$('#actLocation').change(function() {
		
		var actLocation = $('#actLocation :selected').val();
		
		$.ajax({
			type: "GET",
			url: "../crew/categoryList",
			data: {
				actLocation: actLocation
			},
			dataType: 'json',
			success: function(actLocationList) {
// 				$('#actCategory :option').remove();
				// act_category를 가져와야 한다!
				var str = '';
// 				str += '<td>체험</td>';
// 				str =+ '<td>';
				str += '<select class="form-select" id="actCategory" name="actCategory" onchange="actSelect()" style="padding: 0.5em; width: 33%">';
				str += '<option selected>카테고리를 선택해 주세요.</option>';
				$.each(actLocationList, function(index, item){
					str += '<option value="'+ item.actCategory +'">'+ item.actCategory +'</option>';
				})
				str += '</select>';
				str += '&nbsp;';
// 				str += '<br>';
				str += '<select class="form-select" id="actTitle" name="actTitle" style="padding: 0.5em; width: 33%">';
				str += '<option selected>체험을 선택해 주세요.</option>';
				str += '</select>';
// 				str += '</td>';
				
				document.getElementById('selectbox').innerHTML = str;
			},
			error: function() {
				
			}
			
		})// ajax

	}); // #actLocation

	
	$('#writeBtn').click(function(){
		var actLocation = $('#actLocation :selected').val();
		var actCategory = $('#actCategory :selected').val();
		var actTitle = $('#actTitle :selected').val();
		var crewSubject = $('#crewSubject').val();
		var crewContent = $('#crewContent').val();
		
		// 지역
		if(actLocation == "지역을 선택해 주세요.") {
			alert('지역을 선택해 주세요.');
			return false;
		}
		
		// 카테고리
    	if (actCategory == "카테고리를 선택해 주세요."){
			alert('카테고리를 선택해 주세요.');
			return false;
    	}
		
		// 카테고리
    	if (actTitle == "체험을 선택해 주세요."){
			alert('체험을 선택해 주세요.');
			return false;
    	}
		
		// 글 제목
    	if (crewSubject == ""){
			alert('제목을 입력해 주세요.');
			return false;
    	}
		
		// 글 내용
    	if (crewContent == ""){
			alert('내용을 입력해 주세요.');
			return false;
    	}

	}); //

	$('#back').click(function(){
		const result = confirm("작성중인 내용은 저장되지 않습니다. 목록으로 이동하시겠습니까?");
		if(result){} else{return false;};
	}); //
	
// 	<textarea style="padding: 0.5em; width: 99.7%; resize: none;" id="crewContent" 
// 	name="crewContent" rows="15" placeholder="내용을 입력해 주세요."></textarea>
// 	<div class="count text-right"><span>0</span>/2000&nbsp;</div>
	
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


function actSelect() {
	
	var actLocation = $('#actLocation :selected').val();
	var actCategory = $('#actCategory :selected').val();

	console.log(actLocation);
	console.log(actCategory);
	
	var activityDTO = {
			'actLocation': actLocation,
			'actCategory': actCategory
	}

	$.ajax({
		
		url: "../crew/actList",
		data: {
			'actLocation': actLocation,
			'actCategory': actCategory
		},
		success: function(actList) {
// 			$('#actTitle :selected').remove();
			// act_title 가져와야 한다!
			var str = '';
// 			str += '<td>체험</td>';
// 			str += '<td><select class="form-select" id="actTitle" name="actTitle">';
			str += '<option selected>체험을 선택해 주세요.</option>';
			$.each(actList, function(index, item){
				str += '<option value="'+ item.actTitle +'">'+ item.actTitle +'</option>';
			})
// 			str += '</select>';
// 			str += '</td>';
// 			document.getElementById('act-title-selectbox').innerHTML = str;
			document.getElementById('actTitle').innerHTML = str;
		},
		error: function() {
			
		}
		
	}) // ajax
	
}//

