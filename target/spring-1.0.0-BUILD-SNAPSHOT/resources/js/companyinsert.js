/**
 * 
 */
 
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

function CheckSubmit1(){
	// 주소
	var comaddr2 = document.getElementById('comaddr2').value;
	var comaddr3 = document.getElementById('comaddr3').value;
	
	var comaddr4 = comaddr2 + " " + comaddr3;
	
	document.getElementById('companyAddress').value = comaddr4;
	// 주소
}

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
           
           document.getElementById('comaddr1').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('comaddr2').value = fullRoadAddr;
           
//            $("[name=comaddr1]").val(data.zonecode);
//            $("[name=comaddr2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
// 주소
