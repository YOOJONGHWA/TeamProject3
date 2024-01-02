/**
 * 
 */
// 이용약관 script----------------------------------------

// 체크박스
 $(document).ready(function() {
	$("#chk_all").click(function() {
		if($("#chk_all").is(":checked")) $("input[class=chk]").prop("checked", true);
		else $("input[class=chk]").prop("checked", false);
	});
	
	$("input[class=chk]").click(function() {
		var total = $("input[class=chk]").length;
		var checked = $("input[class=chk]:checked").length;
		
		if(total != checked) $("#chk_all").prop("checked", false);
		else $("#chk_all").prop("checked", true); 
	});
});
// 체크박스


// 정보수집
function checked(){

	var click = document.getElementById("termsService");
	var click2 = document.getElementById("termsPrivacy");
	
	if(click.checked == false) {
		alert("이용약관에 동의 해주세요.");
		return false;
	}
	
	if(click2.checked == false) {
		alert("개인정보 수집 및 이용에 동의 해주세요.");
		return false;
	}
	
}
// 정보수집

// 이용약관 script----------------------------------------

// insert script-----------------------------------------

function CheckSubmit(){
	
	// 생년월일
	var yy = document.getElementById('yy');
	var mm = document.getElementById('mm');
	var dd = document.getElementById('dd');
	
	userBirth.value = yy.value + mm.value + dd.value;
	// 생년월일
	
	// 주소
	var addr2 = document.getElementById('addr2').value;
	var addr3 = document.getElementById('addr3').value;
	
	var addr4 = addr2 + " " + addr3;
	
	document.getElementById('userAddress').value = addr4;
	// 주소
	
	// 나의 관심 스포츠
	   // 선택된 목록 가져오기
 	   const query = 'input[name="sport"]:checked';
 	   const selectedEls = document.querySelectorAll(query);
 	    
 		// 선택된 목록에서 value 찾기
 	    let result = '';
 	    selectedEls.forEach((el) => {
 	      result += el.value + ' ';
 	    });

 	    // 출력
 	    document.getElementById('userSport').value = result.trim();
 	// 나의 관심 스포츠
 	
 	// 나의 관심 지역
 	
 	// 선택된 목록 가져오기
 	   const city = 'input[name="city"]:checked';
 	   const selectedcity = document.querySelectorAll(city);
 	    
 		// 선택된 목록에서 value 찾기
 	    let cityresult = '';
 	    selectedcity.forEach((el) => {
 	       cityresult += el.value + ' ';
 	    });

 	    // 출력
 	    document.getElementById('userArea').value = cityresult.trim();
 	// 나의 관심 지역
}


// 체크박스 제어
$(document).ready(function(){

	$('input:checkbox[name=sport]').click(function(){ //고용형태 최대 3개까지
	  	var checked = $('input:checkbox[name=sport]:checked').length;   //체크갯수 확인
	 
	  	if(checked>3){
	  	 alert('최대 3개까지 선택 가능합니다.')
	   	 $(this).prop('checked', false);
	  	}
	});
	
	$('input:checkbox[name=city]').click(function(){
		var checked1 = $('input:checkbox[name=city]:checked').length;
		
		if(checked1>3){
		  	alert('최대 3개까지 선택 가능합니다.')
		   	$(this).prop('checked', false);
		  }
	});
});
// 체크박스 제어

// 주소

function execPostCode() {
	
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }
           
           document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('addr2').value = fullRoadAddr;
           
//            $("[name=addr1]").val(data.zonecode);
//            $("[name=addr2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
// 주소

// insert script-----------------------------------------


