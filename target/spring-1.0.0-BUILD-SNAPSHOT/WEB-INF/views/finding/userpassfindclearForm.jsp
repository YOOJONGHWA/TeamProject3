<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 비밀번호 확인</title>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/passfind.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/insertForm.css" >

<style type="text/css">
body {
padding-top: 100px;
}
</style>
<!-- css -->

</head>
<body>

<a class="navbar-brand" href="${pageContext.request.contextPath}/main/main" style="font-size: 60px;">😍team 2😍</a>
<div id="container" class="container">

    <form id="fm" name="fm" action="${pageContext.request.contextPath}/member/userlogin" method="get">
    
        <div class="content">
            <div class="find_wrap">
                <div class="find_inner">
                    <div class="title_wrap">
                        <div class="title">
                            회원님의 비밀번호는<br><br>
                            <span>"${dto.userPass}"</span>입니다.
                        </div>
                    </div>
<!--                     <div id="idInputRow" class="input_row"> -->
<!--                         <span id="idIcon" class="icon_name"><span class="blind">아이디</span></span> -->
<!--                         <input type="text" placeholder="네이버 아이디 또는 단체 아이디" id="idInput" class="input_name" name="userId" maxlength="40"> -->
<!--                         <button type="button" id="bulletDelete" class="bullet_delete" style="display: none"> -->
<!--                         <span class="blind">삭제</span></button> -->
<!--                     </div> -->
                    <button type="submit" class="btn_check" ><span class="text">로그인 창으로</span></button>

                    <div class="link_wrap">
                        <span class="text">
                            아이디가 기억나지 않는다면? <a href="${pageContext.request.contextPath}/finding/useridfind" class="link" ><div class="txt">아이디 찾기</div></a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>





</body>
</html>

