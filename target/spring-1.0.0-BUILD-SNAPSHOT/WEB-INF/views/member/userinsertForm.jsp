<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 회원가입</title>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/insertForm.css" >
<!-- css -->

<!-- script -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/userinsert.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script type="text/javascript">

let checkIdResult = false;
let checkResult = false;
let checkPassResult = false;
let checkYearResult = false;
let checkDayResult = false;
let checkEmailResult = false;
let checkPhoneResult = false;
let checkNameResult = false;



function checkPass(userPass) {
	// 패스워드 검사를 위한 정규표현식 패턴 작성 및 검사 결과에 따른 변수값 변경
	var span = document.getElementById('checkPassResult');
	
	// 정규표현식 패턴 정의
	var lengthRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/; // 길이 및 사용 가능 문자 규칙
	var engUpperRegex = /[A-Z]/; // 대문자 규칙
	var engLowerRegex = /[a-z]/; // 소문자 규칙
	var numRegex = /[0-9]/;		 // 숫자 규칙
	var specRegex = /[!@#$%^&*]/;	 // 특수문자 규칙	
	
// 	var count = 0; // 각 규칙별 검사 결과를 카운팅 할 변수
	
	if(lengthRegex.exec(userPass)){
		checkResult = true;
		span.innerHTML = '사용 가능한 패스워드입니다.';
		span.style.color = 'GREEN';
		
	} else {
		checkResult = false;
		span.innerHTML = '8 ~ 16 자리 영문자, 숫자, 특수문자(@$!%*#?&)는 필수 입력 값입니다.';
		span.style.color = 'RED';
	}
// 	checkRetypePass();
}

function checkRetypePass() {
	var span = document.getElementById('checkRetypePassResult');
	
	var userPass = document.getElementById('userPass').value;
	var userPass2 = document.getElementById('userPass2').value;
	
	if(userPass == userPass2){
		checkPassResult = true;
		
		span.innerHTML = '비밀번호가 일치합니다.';
		span.style.color = 'GREEN';
		
	} else {
		span.innerHTML = '비밀번호를 다시 확인해 주세요';
		span.style.color = 'RED';
		checkPassResult = false;
	}
}

function nameCheck(){
	
	var name = $('#userName').val();
	var span = document.getElementById('checkName');
	var nameRegex = /^[가-힣]{2,}|[a-zA-Z]{2,}\s[a-zA-Z]{2,}$/;
	
	if(nameRegex.exec(name)){
		checkNameResult = true;
		span.innerHTML = '';
		
	} else {
		span.innerHTML = '이름형식이 잘못되었습니다.';
		span.style.color = 'RED';
		checkNameResult = false;
	}
}

function yearCheck(){
	var year = $('#yy').val();
	var span = document.getElementById('checkYearResult');
	var yearElem = document.getElementById('yy');
	var yearRegex = /^(19[0-9][0-9]|20\d{2})$/;
		 
	if(yearRegex.exec(year)){
		checkYearResult = true;
		span.innerHTML = '';
			 
	} else {
		span.innerHTML = '년도 형식을 맞춰 주세요 (예)1994';
		span.style.color = 'RED';
		checkYearResult = false;
	
	}
}

function dayCheck(){
	var day = $('#dd').val();
	var span = document.getElementById('checkDayResult');
	var dayElem = document.getElementById('dd');
	var dayRegex = /^(0[1-9]|[1-2][0-9]|3[0-1])$/;
		 
	if(dayRegex.exec(day)){
		checkDayResult = true;
		span.innerHTML = '';
			 
	} else {
		span.innerHTML = '날짜 형식을 맞춰 주세요 (예) 01~31';
		span.style.color = 'RED';
		checkDayResult = false;
	
	}
}

function emailCheck(){
	
	var email = $('#userEmail').val();
	var span = document.getElementById('checkEmailResult');
	var emailRegex = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
	
	if(emailRegex.exec(email)){
		checkEmailResult = true;
		span.innerHTML = '';
	} else {
		span.innerHTML = '이메일 형식이 잘못되었습니다.';
		span.style.color = 'RED';
		checkEmailResult = false;
	}
}



function phoneCheck(){
	
	var phone = document.getElementById('userPhone').value;
	var phoneElem = document.getElementById('userPhone');
	var phoneRegex = /^(010|011|016|017|018|019)[0-9]{3,4}[0-9]{4}$/;
	var span = document.getElementById('checkPhoneResult');

	phoneElem.value = phone.replaceAll('-', '');		
	
	if(phoneRegex.exec(phone)){
		checkPhoneResult = true;
		span.innerHTML = '';
		
	} else {
		span.innerHTML = '휴대전화 형식이 잘못되었습니다.';
		span.style.color = 'RED';
		checkPhoneResult = false;
	}
}

function checkSubmit(){
	
	// Id제어
	if($('#userId').val() == "" ){
		alert("아이디 입력하세요");
		$('#userId').focus();
		return false;
	}
	
	// pass 제어
	if($('#userPass').val()==""){
		alert("비밀번호 입력하세요");
		$('#userPass').focus();
		return false;
	}
	
	// pass2 제어
	if($('#userPass2').val()=="" || $('#userPass2').val() != $('#userPass').val()){
		alert("비밀번호를 재확인 해주세요");
		$('#userPass2').focus();
		return false;
	}
	
	// name 제어
	if($('#userName').val()==""){
		alert("이름 입력하세요");
		$('#userName').focus();
		return false;
	}
	
	// 태어난 년도 제어
	if($('#yy').val()==""){
		alert("태어난 년도를 입력하세요");
		$('#yy').focus();
		return false;
	}
	
	// 태어난 달 제어
	if($('#mm').val()==""){
		alert("태어난 달을 선택하세요");
		$('#mm').focus();
		return false;
	}
	
	// 태어난 날짜 제어
	if($('#dd').val()==""){
		alert("태어난 날짜를 입력하세요");
		$('#dd').focus();
		return false; 
	}
	
	//성별 제어
	if($('#userGender').val()==""){
		alert("성별을 선택하세요");+
		$('#userGender').focus();
		return false;
	}
	
	//email 제어
	if($('#userEmail').val()==""){
		alert("이메일 입력하세요");
		$('#userEmail').focus();
		return false;
	}
	
	// email 인증 제어
	if($('#emailNo').val()==""){
		alert("인증번호를 입력하세요");
		$('#emailNo').focus();
		return false;
	}
	
	
	// 전화번호 제어
	if($('#userPhone').val()==""){
		alert("전화번호를 입력하세요");
		$('#userPhone').focus();
		return false;
	}
	
	// 주소 제어
	if($('#addr2').val()==""){
		alert("주소를 입력하세요");
		$('#addr2').focus();
		return false;
	}
	
	
	// 관심 스포츠 제어
	if($('input:checkbox[name=sport]:checked').length == 0){
		alert("관심스포츠를 선택 해주세요");
		return false;
	}
	
	// 관심지역 제어
	if($('input:checkbox[name=city]:checked').length == 0){
		alert("관심지역을 선택 해주세요");
		return false;
	}
	
	// null 체크 끝
	if(!checkResult) {	// 비밀번호 유효성 체크
		alert('비밀번호에 영문, 숫자, 특수문자를 혼합하여 입력하세요.');
		$('#userPass').focus();
		return false;
	}
	
	if(!checkNameResult){
		alert("이름을 다시 입력하세요.");
		$('#userName').focus();
		return false;
	}
	
	if(!checkYearResult){ // 생년월일 유효성 체크
		alert('태어난 년도를 다시 입력하세요.');
		$('#yy').focus();
		return false;
	}
	
	if(!checkDayResult){ // 생년월일 유효성 체크
		alert('태어난 날짜를 다시 입력하세요.');
		$('#dd').focus();
		return false;
	}
	
	if(!checkEmailResult){ // 이메일 유효성 체크
		alert('이메일을 다시 입력하세요.');
		$('#userEmail').focus();
		return false;
	}
	
	if(!checkPhoneResult){ // 휴대전화 유효성 체크
		alert('휴대전화를 다시 입력하세요.');
		$('#userPhone').focus();
		return false;
	}
	alert("회원가입이 완료되었습니다.");
}

$(document).ready(function() {

	$('.dup').click(function(){
		
		const id = document.getElementById('userId').value;
		const checkIdResult = document.getElementById('checkid');
		const idLength = id.length;
		const exp = /^[a-z]+[a-z0-9]{5,19}$/g;
		
		if(!id.match(exp)){
			checkIdResult.innerHTML = '영문 또는 숫자 포함 6~18자 이내로 작성해 주세요'
			checkIdResult.style.color = 'red';
	    } 
		
	    else if(id.match(exp)) {
		
		//대상 가상주소 => 자바파일에 메서드
			$.ajax({
				url:'${pageContext.request.contextPath }/member/useridCheck',
				data:{'userId':$('#userId').val()},
				success: function(rdata){
					if(rdata == 'iddup'){
						rdata = "이미 사용중인 아이디 입니다.";
						
						$('#checkid').html(rdata).css('color', 'red');
					} else {
						rdata = "사용가능한 아이디 입니다.";
						$('#checkid').html(rdata).css('color', 'green');
					}
				}
			});
	    }
		
   });	
	
	$('#userinsertForm').submit(checkSubmit);
	
});
 
</script>

<script type="text/javascript">
var code = "";
$(document).ready(function() {
	$('#mail_check_button').click(function(){
		
		var email = $('#userEmail').val(); // 입력한 이메일
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
<!-- script -->

</head>

<body>
<a class="navbar-brand" href="${pageContext.request.contextPath}/main/main" style="font-size: 60px;">😍team 2😍</a>

	<form action="${pageContext.request.contextPath}/member/userinsertPro" method="post" id="userinsertForm" onsubmit="return CheckSubmit()">
		
		<!-- 	<input type="hidden" id="token_sjoin" name="token_sjoin" value="ZSPFbHT9utEvh3l2"> -->
		  <!-- 아이디 -->
		  <div class="join_row">
             <h3 class="join_title"><label for="id">아이디</label></h3>
             <span class="ps_box int_id">
		    	<input type="text" id="userId" name="userId" class="int" title="ID" 
		    	maxlength="20" placeholder="영어와 숫자로 6~20자">
             </span>
             <a href="#" class="dup" id="btnSend" role="button">
              <span class="">중복체크</span>
             </a>
			 <label></label>
             <div><span id="checkid" class="live-validation"></span></div><br>
          </div>
          <!-- 아이디 -->
          
		  <!-- 비밀번호 -->
		  <div class="join_row">
             <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
             <span class="ps_box int_pass" id="pswd1Img">
		        <input type="password" id="userPass" name="userPass" class="int" title="비밀번호 입력" aria-describedby="pswd1Msg"
		        placeholder="영문과 특수문자를 포함한 최소 8자" onkeyup="checkPass(this.value)" >
                <span class="lbl"><span id="pswd1Span" class="step_txt"></span></span>
			 </span>
			 <div><span id="checkPassResult" class="live-validation"></span></div>	
		  <!-- 비밀번호 -->
				
		  <!-- 비밀번호 재확인 -->		
             <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
             <span class="ps_box int_pass_check" id="pswd2Img">
			    <input type="password" id="userPass2" name="userPass2" class="int" title="비밀번호 재확인 입력"  aria-describedby="pswd2Blind"
			    placeholder="영문과 특수문자를 포함한 최소 8자" onkeyup="checkRetypePass()"><br>
			 </span>
			 <div><span id="checkRetypePassResult" class="live-validation"></span></div>	
           </div>
          <!-- 비밀번호 재확인 -->	
           
           
		
		<!-- 이름 -->
		<div class="join_row">
           <h3 class="join_title"><label for="name">이름</label></h3>
           <span class="ps_box box_right_space">
	          <input type="text" id="userName" name="userName" title="이름" class="int" maxlength="40" onkeyup="nameCheck()">
		   </span>
		   <div><span id="checkName" class="live-validation"></span></div>
        </div>
        <!-- 이름 -->
		
		<!-- 생년월일 -->
        
        <div class="join_row join_birthday">
           <h3 class="join_title"><label for="yy">생년월일</label></h3>
            <div class="bir_wrap">
            
              <div class="bir_yy">
			    <span class="ps_box">
			       <input type="text" id="yy" placeholder="년(4자)" aria-label="년(4자)" class="int" maxlength="4" value="" onkeyup="yearCheck()">
			    </span>
			    
              </div>
              
              <div class="bir_mm">
			    <span class="ps_box">
				<select id="mm" class="sel" aria-label="월">
					<option value="">월</option>
		  	 			<option value="01"> 1 </option>
		  	 			<option value="02"> 2 </option>
		  	 			<option value="03"> 3 </option>
		  	 			<option value="04"> 4 </option>
		  	 			<option value="05"> 5 </option>
		  	 			<option value="06"> 6 </option>
		  	 			<option value="07"> 7 </option>
		  	 			<option value="08"> 8 </option>
		  	 			<option value="09"> 9 </option>
		  	 			<option value="10"> 10 </option>
		  	 			<option value="11"> 11 </option>
		  	 			<option value="12"> 12 </option>
				</select>
			    </span>
              </div>
              
              <div class=" bir_dd">
				<span class="ps_box">
					<input type="text" id="dd" placeholder="일" aria-label="일" class="int" maxlength="2" onkeyup="dayCheck()">
					<label for="dd" class="lbl"></label>
				</span>
              </div>
              <input type="hidden" id="userBirth" name="userBirth" value="">
            </div>
            <div><span id="checkYearResult" class="live-validation"></span></div>
            <div><span id="checkDayResult" class="live-validation"></span></div>
          </div>
        <!-- 생년월일 -->
		
		<!-- 성별 -->
		<div class="join_row join_sex">
		   <h3 class="join_title"><label for="gender">성별</label></h3>
		   
		   <div class="ps_box gender_code">
               <select id="userGender" name="userGender" class="sel" aria-label="성별">
                   <option value="" selected="">성별</option>
                           <option value="남자">남자</option>
                           <option value="여자">여자</option>
               </select>
           </div>
        </div>
        <!-- 성별 -->
		
		<!-- 이메일 -->
		 <div class="join_row join_mobile" id="mobDiv">
            <h3 class="join_title"><label for="email">이메일<span class="terms_choice"></span></label></h3>
            <div class="int_mobile_area">
              <span class="ps_box int_mobile">
		      	<input type="text" id="userEmail" name="userEmail" placeholder="이메일 입력" aria-label="이메일 입력" class="int" 
		      		onkeyup="emailCheck()">
		      </span>
		   		<a href="#" class="btn_verify btn_primary" id="mail_check_button" role="button" onclick="return false;">
              	<span class="">인증번호 받기</span>
           		</a>
           </div>
         </div>
         <div><span id="checkEmailResult" class="live-validation"></span></div>
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
			      <input type="tel" id="userPhone" name="userPhone" placeholder="전화번호 입력" aria-label="전화번호 입력" class="int" 
			      onkeyup="phoneCheck()">
				  <label for="phoneNo" class="lbl"></label>
			    </span>
              </div>
              <div><span id="checkPhoneResult" class=""></span></div>
        </div>
        <!-- 휴대전화 번호, 인증번호 입력 -->
            

        <!-- 주소 -->       
		 <div class="join_row join_mobile" id="mobDiv">
             <h3 class="join_address"><label for="address">주소</label></h3>
              <div class="int_mobile_area">
				<span class="ps_box int_address">
			      <input type="text" id="addr1" name="addr1" placeholder="주소 입력" aria-label="주소 입력" class="int" 
			      readonly="readonly">
				  <label for="phoneNo" class="lbl"></label>
			    </span>
                  <a href="#" class="btn_verify btn_primary" id="btnSend" role="button" onclick="execPostCode(); return false;" >
                      <span class="">주소 찾기</span>
                  </a>
              </div>
              <div class="ps_box_disable box_right_space" id="authNoBox">
                  <input type="text" id="addr2" name="addr2" placeholder="주소를 입력 하세요" aria-label="주소를 입력 하세요" 
                  		aria-describedby="wa_verify" class="int"  readonly="readonly">
                  <label id="wa_verify" for="authNo" class="lbl"></label>
            </div>
            <div class="ps_box_disable box_right_space" id="authNoBox">
                  <input type="text" id="addr3" name="addr3" placeholder="상세주소를 입력 하세요" aria-label="상세주소를 입력 하세요" 
                  		aria-describedby="wa_verify" class="int" >
                  <label id="wa_verify" for="authNo" class="lbl"></label>
            </div>
        </div>
		
		<input type="hidden" id="userAddress" name="userAddress" value="">
		<!-- 주소 --> 
		<br>
		
		
		<!-- 관심 체험  -->
		<fieldset id="dev_sch_form_dterm" class="itemSet dev_add_default">
		<div class="join_row">
		  <h3 class="join_interest"><label for="interest">나의 관심 체험</label></h3>
		  
		  <ul class="list">
			  <c:forEach items="${categoryList }" var="list" >
				<li><input type="checkbox" name="sport" value="${list.category }"><label for="leisure Sports"> ${list.category }</label></li>
			  </c:forEach>
		  </ul>
		  
		</div><br>
		</fieldset>
		<input type="hidden" id="userSport" name="userSport" value="">
		<br>
		<!-- 관심 체험  -->

		<!-- 관심 지역  -->
		<fieldset id="dev_sch_form_dterm1" class="itemSet dev_add_default">
		<div class="join_row">
			<h3 class="join_city"><label for="city">나의 관심 지역</label></h3>
			
			<ul class="list">
				<c:forEach items="${commonAreaList }" var="list">
				  <li><input type="checkbox" name="city" value="${list.area }"><label for="check">${list.area }</label></li> 
			</c:forEach>
			</ul>	
			
		</div><br>
		</fieldset>
		<input type="hidden" id="userArea" name="userArea" value="">
		<br>
		<!-- 관심 지역  -->
	
	<div class="btn_area">	
		<button type="submit" id="btnJoin" class="btn_type btn_primary" ><span>가입하기</span></button>
	</div>
	<br>

</form>

</body>
</html>




