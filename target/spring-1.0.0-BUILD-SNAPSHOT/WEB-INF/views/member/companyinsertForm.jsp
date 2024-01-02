<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 회원가입</title>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/insertForm.css" >
<!-- css -->

<!-- script -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/companyinsert.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- script -->

<script type="text/javascript">

let checkComIdResult = false;
let checkComResult = false;
let checkComPassResult = false;
let checkComNameResult = false;
let checkComNumResult = false;
let checkComEmailResult = false;
let checkComTelResult = false;



function checkComPass(companyPass) {
	// 패스워드 검사를 위한 정규표현식 패턴 작성 및 검사 결과에 따른 변수값 변경
	var span = document.getElementById('checkComPassResult');
	
	// 정규표현식 패턴 정의
	var lengthRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/; // 길이 및 사용 가능 문자 규칙
	var engUpperRegex = /[A-Z]/; // 대문자 규칙
	var engLowerRegex = /[a-z]/; // 소문자 규칙
	var numRegex = /[0-9]/;		 // 숫자 규칙
	var specRegex = /[!@#$%^&*]/;	 // 특수문자 규칙	
	
// 	var count = 0; // 각 규칙별 검사 결과를 카운팅 할 변수
	
	if(lengthRegex.exec(companyPass)){
		checkComResult = true;
		span.innerHTML = '사용 가능한 패스워드입니다.';
		span.style.color = 'GREEN';
		
	} else {
		checkComResult = false;
		span.innerHTML = '8 ~ 16 자리 영문자, 숫자, 특수문자(@$!%*#?&)는 필수 입력 값입니다.';
		span.style.color = 'RED';
	}
// 	checkRetypePass();
}

function checkComRetypePass() {
	var span = document.getElementById('checkComRetypePassResult');
	
	var companyPass = document.getElementById('companyPass').value;
	var companyPass2 = document.getElementById('companyPass2').value;
	
	if(companyPass == companyPass2){
		checkComPassResult = true;
		span.innerHTML = '비밀번호가 일치합니다.';
		span.style.color = 'GREEN';
		
	} else {
		span.innerHTML = '비밀번호를 다시 확인해 주세요';
		span.style.color = 'RED';
		checkComPassResult = false;
	}
}

function CheckComName(){
	
	var name = $('#companyName').val();
	var span = document.getElementById('checkComName');
	var nameRegex = /^[가-힣]{2,}|[a-zA-Z]{2,}\s[a-zA-Z]{2,}$/;
	
	if(nameRegex.exec(name)){
		checkComNameResult = true;
		span.innerHTML = '';
		
	} else {
		span.innerHTML = '이름 형식이 잘못되었습니다.';
		span.style.color = 'RED';
		checkComNameResult = false;
	}
}

function CheckComNum(){
	
	var num = $('#companyNum').val();
	var span = document.getElementById('checkComNum');
	var numRegex =  /^[0-9]{3}-[0-9]{2}-[0-9]{5}$/;
	
	if(numRegex.exec(num)){
		checkComNumResult = true;
		span.innerHTML = '';
		
	} else {
		span.innerHTML = '숫자 형식이 잘못되었습니다.';
		span.style.color = 'RED';
		checkComNumResult = false;
	}
}

function CheckComEmail(){
	
	var email = $('#companyEmail').val();
	var span = document.getElementById('checkComEmailResult');
	var emailRegex = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
	
	if(emailRegex.exec(email)){
		checkComEmailResult = true;
		span.innerHTML = '';
	} else {
		span.innerHTML = '이메일 형식이 잘못되었습니다.';
		span.style.color = 'RED';
		checkComEmailResult = false;
	}
}

function CheckComTel(){
	
	var tel = document.getElementById('companyTel').value;
	var telElem = document.getElementById('companyTel');
	var telRegex = /^(010|011|016|017|018|019)[0-9]{3,4}[0-9]{4}$/;
	var span = document.getElementById('checkComTelResult');

	telElem.value = tel.replaceAll('-', '');		
	
	if(telRegex.exec(tel)){
		checkComTelResult = true;
		span.innerHTML = '';
		
	} else {
		span.innerHTML = '휴대전화 형식이 잘못되었습니다.';
		span.style.color = 'RED';
		checkComTelResult = false;
	}
}

function checkComSubmit(){
	
	if($('#companyId').val() == "" ){
		alert("아이디 입력하세요");
		$('#companyId').focus();
		return false;
	}
	
	// pass 제어
	if($('#companyPass').val()==""){
		alert("비밀번호 입력하세요");
		$('#companyPass').focus();
		return false;
	}
	
	// pass2 제어
	if($('#companyPass2').val()=="" || $('#companyPass2').val() != $('#companyPass').val()){
		alert("비밀번호를 재확인 해주세요");
		$('#companyPass2').focus();
		return false;
	}
	
	// name 제어
	if($('#companyName').val()==""){
		alert("이름 입력하세요");
		$('#companyName').focus();
		return false;
	}
	
	// 전화번호 제어
	if($('#companyNum').val()==""){
		alert("사업자번호를 입력하세요");
		$('#companyNum').focus();
		return false;
	}
	
	//email 제어
	if($('#companyEmail').val()==""){
		alert("이메일 입력하세요");
		$('#companyEmail').focus();
		return false;
	}
	
	// email 인증 제어
	if($('#emailNo').val()==""){
		alert("인증번호를 입력하세요");
		$('#emailNo').focus();
		return false;
	}
	
	// 전화번호 제어
	if($('#companyTel').val()==""){
		alert("전화번호를 입력하세요");
		$('#companyTel').focus();
		return false;
	}
	
	// 주소 제어
	if($('#comaddr2').val()==""){
		alert("주소를 입력하세요");
		$('#comaddr2').focus();
		return false;
	}
	
	// null 체크 끝
	if(!checkComResult) {	// 비밀번호 유효성 체크
		alert('비밀번호에 영문, 숫자, 특수문자를 혼합하여 입력하세요.');
		$('#companyPass').focus();
		return false;
	}
	
	if(!checkComNameResult){
		alert("이름을 다시 입력하세요.");
		$('#companyName').focus();
		return false;
	}
	
	if(!checkComNumResult){
		alert("사업자번호를 다시 입력하세요.");
		$('#companyName').focus();
		return false;
	}
	
	if(!checkComEmailResult){ // 이메일 유효성 체크
		alert('이메일을 다시 입력하세요.');
		$('#companyEmail').focus();
		return false;
	}
	
	if(!checkComTelResult){ // 휴대전화 유효성 체크
		alert('휴대전화를 다시 입력하세요.');
		$('#companyPhone').focus();
		return false;
	}
	alert("회원가입이 완료되었습니다.");
}

$(document).ready(function() {

	$('.dup').click(function(){
		
		const comid = document.getElementById('companyId').value;
		const checkComIdResult = document.getElementById('checkComId');
		const idLength = comid.length;
		const exp = /^[a-z]+[a-z0-9]{5,19}$/g;
		
		if(!comid.match(exp)){
			checkComIdResult.innerHTML = '영문 또는 숫자 포함 6~18자 이내로 작성해 주세요'
			checkComIdResult.style.color = 'red';
	    } 
		
	    else if(comid.match(exp)) {
		
		//대상 가상주소 => 자바파일에 메서드
			$.ajax({
				url:'${pageContext.request.contextPath }/member/companyidCheck',
				data:{'companyId':$('#companyId').val()},
				success: function(rdata){
					if(rdata == 'iddup'){
						rdata = "이미 사용중인 아이디 입니다.";
						
						$('#checkComId').html(rdata).css('color', 'red');
					} else {
						rdata = "사용가능한 아이디 입니다.";
						$('#checkComId').html(rdata).css('color', 'green');
					}
				}
			});
	    }
		
   });	
	
	$('#companyinsertForm').submit(checkComSubmit);
	
});
 
</script>

<script type="text/javascript">
var code = "";
$(document).ready(function() {
	$('#mail_check_button').click(function(){
		
		var email = $('#companyEmail').val(); // 입력한 이메일
		var checkBox = $('#emailNo');	   // 인증번호 입력란
		var boxWrap = $('#emailNoBox');	   // 인증번호 입력란 박스
		
		if(email == ''){
			alert("이메일을 입력해 주세요.");
		} else {
			alert("인증번호가 전송되었습니다.");
		}
		
		$.ajax({
			type:'GET',
			url:'${pageContext.request.contextPath }/member/mailCheck?email=' + email,
			success : function(data){
// 				console.log("data : " + data);
// 				checkBox.attr("disabled", false);
// 				boxWrap.atter("id" , "emailNoBox_true");
				code = data;
			}
		});
		
	});
	
	$('#emailNo').blur(function(){
		
		var inputCode = $('#emailNo').val();	// 입력코드
		var span = $('#checkEmailNumResult');
		
		if(inputCode == code && inputCode != ''){
			span.html('인증번호가 일치합니다.');
			span.attr('class', 'correct');
		} else if(inputCode == ''){
			span.html('인증번호를 입력해 주세요.');
			span.attr('class', 'incorrect');
		} else {
			span.html('인증번호를 다시 확인해주세요.');
			span.attr('class', 'incorrect');
		}
		
	});
	
});
</script>
</head>

<body>
<a class="navbar-brand" href="${pageContext.request.contextPath}/main/main" style="font-size: 60px;">😍team 2😍</a>

	<form action="${pageContext.request.contextPath}/member/companyinsertPro" method="post" id="companyinsertForm" onsubmit="return CheckSubmit1()">
	
		
		  <!-- 아이디 -->
		  <div class="join_row">
             <h3 class="join_title"><label for="id">아이디</label></h3>
             <span class="ps_box int_id">
		    	<input type="text" id="companyId" name="companyId" class="int" title="ID" 
		    	maxlength="20" placeholder="영어와 숫자로 6~20자">
             </span>
             <a href="#" class="dup" id="btnSend" role="button">
              <span class="">중복체크</span>
             </a>
             <label></label>
             <div><span id="checkComId" class="live-validation"></span></div><br>
          </div>
          <!-- 아이디 -->
          
		  <!-- 비밀번호 -->
		  <div class="join_row">
             <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
             <span class="ps_box int_pass" id="pswd1Img">
		        <input type="password" id="companyPass" name="companyPass" class="int" title="비밀번호 입력" aria-describedby="pswd1Msg" 
		        placeholder="영문과 특수문자를 포함한 최소 8자" onkeyup="checkComPass(this.value)" >
                <span class="lbl"><span id="pswd1Span" class="step_txt"></span></span>
			 </span>
			 <div><span id="checkComPassResult" class="live-validation"></span></div>	
			 <!-- 비밀번호 -->
			
			<!-- 비밀번호 재확인 -->
             <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
             <span class="ps_box int_pass_check" id="pswd2Img">
			    <input type="password" id="companyPass2" name="companyPass2" class="int" title="비밀번호 재확인 입력" aria-describedby="pswd2Blind" 
			    placeholder="영문과 특수문자를 포함한 최소 8자" onkeyup="checkComRetypePass()"><br>
			 </span>
			 <div><span id="checkComRetypePassResult" class="live-validation"></span></div>	
           </div>
           <!-- 비밀번호 재확인 -->
           
		
		<!-- 이름 -->
		<div class="join_row">
           <h3 class="join_title"><label for="name">회사 이름</label></h3>
           <span class="ps_box box_right_space">
	          <input type="text" id="companyName" name="companyName" title="이름" class="int" maxlength="40" onkeyup="CheckComName()">
		   </span>
		   <div><span id="checkComName" class="live-validation"></span></div>	
        </div>
        <!-- 이름 -->
        
        <!-- 사업자등록번호 -->
		<div class="join_row">
           <h3 class="join_title"><label for="companynum">사업자 등록번호</label></h3>
           <span class="ps_box box_right_space">
	          <input type="text" id="companyNum" name="companyNum" title="사업자등록번호" class="int" maxlength="40" onkeyup="CheckComNum()">
		   </span>
		   <div><span id="checkComNum" class="live-validation"></span></div>	
        </div>
        <!-- 사업자등록번호 -->
        
        <!-- 이메일 -->
		 <div class="join_row join_mobile" id="mobDiv">
            <h3 class="join_title"><label for="email">이메일<span class="terms_choice"></span></label></h3>
            <div class="int_mobile_area">
              <span class="ps_box int_mobile">
		      	<input type="text" id="companyEmail" name="companyEmail" placeholder="이메일 입력" aria-label="이메일 입력" class="int" 
		      		onkeyup="CheckComEmail()">
		      </span>
		   		<a href="#" class="btn_verify btn_primary" id="mail_check_button"  role="button" onclick="return false;">
              	<span class="">인증번호 받기</span>
           		</a>
           </div>
         </div>
         <div><span id=checkComEmailResult class="live-validation"></span></div>
         <!-- 이메일 -->
         
         <!-- 이메일 인증 -->
         <div class="ps_box_disable box_right_space" id="emailNoBox">
               <input type="text" id="emailNo" name="emailNo" placeholder="인증번호 입력하세요" aria-label="인증번호 입력하세요" 
               aria-describedby="wa_verify" class="int">
               <label id="wa_verify" for="authNo" class="lbl"></label>
         </div>
         <div><span id="checkEmailNumResult" class="live-validation" ></span></div>
         <!-- 이메일 인증 -->             
                    
        
        <!-- 휴대전화 번호, 인증번호 입력 -->
          <div class="join_row join_email">
             <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
              <div class="int_mobile_area">
				<span class="ps_box int_mobile">
			      <input type="tel" id="companyTel" name="companyTel" placeholder="전화번호 입력" aria-label="전화번호 입력" class="int" 
			      onkeyup="CheckComTel()">
				  <label for="phoneNo" class="lbl"></label>
			    </span>
              </div>
              <div><span id="checkComTelResult" class=""></span></div>
        </div>
        <!-- 휴대전화 번호, 인증번호 입력 -->
                
		
         <!-- 주소 -->       
		 <div class="join_row join_mobile" id="mobDiv">
             <h3 class="join_address"><label for="address">주소</label></h3>
              <div class="int_mobile_area">
				<span class="ps_box int_address">
			      <input type="text" id="comaddr1" name="comaddr1" placeholder="주소 입력" aria-label="주소 입력" class="int" 
			      readonly="readonly">
				  <label for="phoneNo" class="lbl"></label>
			    </span>
                  <a href="#" class="btn_verify btn_primary" id="btnSend" role="button" onclick="execPostCode(); return false;" >
                      <span class="">주소 찾기</span>
                  </a>
              </div>
              <div class="ps_box_disable box_right_space" id="authNoBox">
                  <input type="text" id="comaddr2" name="comaddr2" placeholder="주소를 입력 하세요" aria-label="주소를 입력 하세요" 
                  		aria-describedby="wa_verify" class="int"  readonly="readonly">
                  <label id="wa_verify" for="authNo" class="lbl"></label>
            </div>
            <div class="ps_box_disable box_right_space" id="authNoBox">
                  <input type="text" id="comaddr3" name="comaddr3" placeholder="상세주소를 입력 하세요" aria-label="상세주소를 입력 하세요" 
                  		aria-describedby="wa_verify" class="int" >
                  <label id="wa_verify" for="authNo" class="lbl"></label>
            </div>
        </div>
		
		<input type="hidden" id="companyAddress" name="companyAddress" value="">
		<!-- 주소 --> 
		<br>
		
		
	
	<div class="btn_area">	
		<button type="submit" id="btnJoin" class="btn_type btn_primary"><span>가입하기</span></button>
	</div>
	<br>
</form>


</body>
</html>




