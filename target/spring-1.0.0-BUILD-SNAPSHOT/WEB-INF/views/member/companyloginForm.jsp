<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loginForm.css" >
<style type="text/css">
body {
padding-top: 100px;
}
</style>

</head>
<body>
<a class="navbar-brand" href="${pageContext.request.contextPath}/main/main" style="font-size: 60px;">😍team 2😍</a>

  <div class="login_wrap">
	<form action="${pageContext.request.contextPath}/member/companyloginPro" method="post">


       <ul class="menu_wrap" role="tablist">
           <li class="menu_item" role="presentation">
               <a href="${pageContext.request.contextPath}/member/userlogin" id="loinid" class="menu_id" role="tab" aria-selected="false">
                   <span class="menu_text"><span class="text">개인 로그인</span></span>
               </a>
           </li>
           <li class="menu_item" role="presentation">
               <a href="${pageContext.request.contextPath}/member/companylogin" id="ones" class="menu_ones on" role="tab" aria-selected="true">
                   <span class="menu_text"><span class="text">기업 로그인</span></span>
               </a>
           </li>
           <li class="menu_item" role="presentation">
               <a href="${pageContext.request.contextPath}/member/otherlogin" id="qrcode" class="menu_qr" role="tab" aria-selected="false">
                   <span class="menu_text"><span class="text">간편 로그인</span></span>
               </a>
           </li>
       </ul>
           <input type="hidden" id="localechange" name="localechange" value="">
           <input type="hidden" name="dynamicKey" id="dynamicKey" value="R5P3fUTgtf3usDJrWptvDJb5rgJjt4agEpXSLPt3llz62KYhVMvLsKYujWFsm03cs8lofPB7Bg-vkhJjWxKQcaVu8_8swbMJpfATxZQ7zS0">
           <input type="hidden" name="encpw" id="encpw" value="">


           <ul class="panel_wrap">
               <li class="panel_item" style="display: block;">
                   <div class="panel_inner" role="tabpanel" aria-controls="loinid">
                   	   <!-- 아이디, 비밀번호 -->
                       <div class="id_pw_wrap">
                       	   <!-- 아이디 -->
                           <div class="input_row" id="id_line">
                               <div class="icon_cell" id="id_cell">
                                   <span class="icon_id">
                                       <span class="blind">아이디</span>
                                   </span>
                               </div>
                               <input type="text" id="companyId2" name="companyId" placeholder="아이디" title="아이디" class="input_text" maxlength="41" value="">
                           </div>
                           <!-- 아이디 -->
                           
                           <!-- 비밀번호 -->
                           <div class="input_row" id="pw_line">
                               <div class="icon_cell" id="pw_cell">
                                   <span class="icon_pw">
                                       <span class="blind">비밀번호</span>
                                   </span>
                               </div>
                               <input type="password" id="companyPass" name="companyPass" placeholder="비밀번호" title="비밀번호" class="input_text" maxlength="16">
                           </div>
                       	   <!-- 비밀번호 -->
                       	   
                       </div>
					   <!-- 아이디, 비밀번호 -->
					   
                       <div class="btn_login_wrap">
                           <button type="submit" class="btn_login" id="log.login">
                               <span class="btn_text">로그인</span>
                           </button>

                       </div>
                   </div>
               </li>
           </ul>
       </form>
   </div>
   
   <ul class="find_wrap" id="find_wrap">

       <li><a href="${pageContext.request.contextPath}/finding/companypassfind" class="find_text">비밀번호 찾기</a></li>
       <li><a href="${pageContext.request.contextPath}/finding/companyidfind" class="find_text">아이디 찾기</a></li>
       <li><a href="${pageContext.request.contextPath}/member/companycheck" class="find_text">회원가입</a>
       </li>

   </ul>



</body>
</html>

