<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  
  <link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png">

  <meta name="apple-mobile-web-app-title" content="CodePen">

  <link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">

  <link rel="mask-icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-b4b4269c16397ad2f0f7a01bcdf513a1994f4c94b8af2f191c09eb0d601762b1.svg" color="#111">

  <title>CodePen - PortFolio</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Play" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=PT+Sans:700" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lora:400italic" rel="stylesheet" type="text/css">

  
<style>
body,
html {
  width: 100%;
  height: 100%;
  font-family: 'Play', sans-serif;
}

.btn-default {
    color: #333;
    background-color: #fff;
    border-color: #ccc;
    opacity: 0.5;
}


/**** Header names CSS */


.asog-r1 {
  text-transform: capitalize;
  font-size: 6em;
  font-weight: 700;
  line-height: 1.1em;
}

.asog-r2 {
  font-family: Lora, serif;
  font-style: italic;
  font-weight: 400;
  font-size: 2.7em;
  display: inline-block;
  position: relative;
  mix-blend-mode: overlay;
}

.asog-r2:before,
.asog-r2:after {
  background: url(http://tobiasahlin.com/images/typesource/leaves.svg) no-repeat center center/2.5em 0.7em;
  content: "";
  left: -3em;
  top: -0.3em;
  position: absolute;
  width: 2.5em;
  height: 1.5em;
}

.asog-r2:after {
  left: auto;
  right: -3em;
  -webkit-transform: scaleX(-1);
  transform: scaleX(-1);
}
/* ENDs */

.myHeader {
  padding-top: 200px; 
  text-align: center;
  color: #f8f8f8;
  background: url(http://tobiasahlin.com/images/typesource/mountains.jpg) no-repeat center fixed;
  background-size: cover;
  background-position: absolute;
  min-height: 100%;
}

/* .myAbout {
   background-image:url("http://1-background.com/images/silk/white-silk-fabric-website-background.jpg");
  background-repeat: no-repeat;
  background-size: cover;
  background-position: absolute;
  min-height: 100%;
} */

.LoveU {
  
  margin-bottom: 100px;
  
}

/*About me */

.carousel-control.right, .carousel-control.left {
    background-image: none;
    color: #262626;
    
      
}

.carousel-indicators li {
    border-color: #b3b3b3;
  
}

.carousel-indicators li.active {
    background-color: #bfbfbf;
   
   }

.item h4 {
    font-size: 19px;
    line-height: 1.375em;
    font-weight: 300;
    font-style: italic;
    max-width: 800px;
    margin: 150px auto;
    
}

.item span {
    font-style: normal;
}

/*ENDS*/

/*Portfolio*/

/* .Portfolio2 {
  background-image:url("https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQUBCBaE5xO8YZn6SgVPPnqsHV_xq3aFjHFFEtfxQ_PLyaZzuq-");
  background-repeat: no-repeat;
  background-size: cover;
  background-position: absolute;
  min-height: 100%;
} */

.contact3 {
  background-size: cover;
  background-position: absolute;
  min-height: 100%;
  margin-bottom: 40px;
}
</style>

  <script>
  window.console = window.console || function(t) {};
</script>

  
  
  <script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>


</head>

<body translate="no">

<!--  팝업 -->
<jsp:include page="../member/popup.jsp"></jsp:include>


  <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand">마이페이지</a>
    </div>
    <div>
      <ul class="nav navbar-nav collapse navbar-collapse navbar-right myNavStyle" id="myNavbar">
        <li><a href="#Home0">상단으로</a></li>
      </ul>
    </div>
  </div>
</nav>
<p id="Home0" style="margin-top:20px;"></p>
<div class="container-fluid text-center myHeader">
  <div class="asog">
    <h1 class="asog-r1">마이페이지</h1>
    <h1 class="asog-r2">${sessionScope.userId}님 반갑습니다</h1>
  </div>
  <ul class="list-inline">
    <li>
      <a href="${pageContext.request.contextPath }/member/info" target="_blank" class="btn btn-default btn-lg"><span>나의정보조회</span></a>
    </li>
    <li>
      <a href="${pageContext.request.contextPath }/member/update" target="_blank" class="btn btn-default btn-lg"><span>나의정보수정</span></a>
      </li><li>
        <a href="${pageContext.request.contextPath }/member/delete" target="_blank" class="btn btn-default btn-lg"><span>회원탈퇴</span></a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath }/calendar/calendar" target="_blank" class="btn btn-default btn-lg"><span>캘린더</span></a>
      </li>
       <li>
        <a href="${pageContext.request.contextPath }/member/reviewlist" target="_blank" class="btn btn-default btn-lg"><span>내가 쓴 리뷰</span></a>
      </li>
  </ul>
</div>
<p id="About1" style="padding-top: 20px;"></p>
<div class="container-fluid myAbout text-center">
  <h2>About Me</h2>
  <h4 class="LoveU">"Sometimes it takes a whole life time to know someone. Sometimes all it takes is just a look"...</h4>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class=""></li>
      <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="2" class=""></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item">
        <h4>"I am Ravindra Wani. I live in one of the most beautiful cities of West India, Mumbai. I have been using and doing this computer stuff from around 4 years if memory serves correctly."<br><span style="font-style:normal;">A Future Developer</span></h4>
      </div>
      <div class="item active">
        <h4>"You can find me sitting in front of my pc surfing the net. I love to stumble upon sites of my interest. Mostly they all are related to tech, mobile blogs, or random articles about web technologies. I love to read so it’s a good way for me of spending my time."<br><span style="font-style:normal;"></span></h4>
      </div>
      <div class="item">
        <h4>"By all this while, I have come to know about you too something. You have a lot of patience that you read till this line. Hope I didn’t bore you. Thanks a lot for stopping by."<br><span style="font-style:normal;"></span></h4>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<p id="Portfolio2" style="padding-top: 20px;"></p>
<div class="container-fluid text-center Portfolio2">
  <h2>Portfolio</h2>
  <h4>What I have created</h4>
  <div class="row text-center">
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="http://www.worldsoundsevents.in/images/MySite.png" alt="Paris">
        <p><strong>World Sounds</strong></p>
        <p>Yes, we built :)</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="http://eslhiphop.com/images/fcc/sanfrancisco.jpg" alt="New York">
        <p><strong>New York</strong></p>
        <p>We built New York</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="http://eslhiphop.com/images/fcc/sanfrancisco.jpg" alt="San Francisco">
        <p><strong>San Francisco</strong></p>
        <p>Yes, San Fran is ours</p>
      </div>
    </div>
  </div>
</div>

<p id="Contact3" style="padding-top: 20px;"></p>
<div class="container-fluid text-center contact3">
  <h2 class="text-center">CONTACT</h2>
  <div class="row">
    <div class="col-sm-5">
      <p>Contact me and we'll get back to you within 24 hours.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span> Mumbai, INDIA</p>
      <p><span class="glyphicon glyphicon-phone"></span> +00 9898989898</p>
      <p><span class="glyphicon glyphicon-envelope"></span> RavindraWani@awesome.com</p>
    </div>
    <div class="col-sm-7">
        <input class="form-control" id="name" name="name" placeholder="Name" type="text" required=""><br>
        <input class="form-control" id="email" name="email" placeholder="Email" type="email" required=""><br>
        <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea>
        <br>
        <button class="btn btn-default pull-right" type="submit">Send</button><br>
      </div>
    </div>
  </div>

<footer class="footer">
  <div class="navbar navbar-inverse navbar-fixed-bottom nav-b">
    <div class="navbar-inner">
      <div class="container ">
        <div class="col-sm-12 navbar-text text-center" style="color: #FFFFFF; ">
          <p>Copyright © <a href="#">RavindraWani</a> 2015. All Rights Reserved</p>
        </div>
      </div>
    </div>
  </div>
</footer>
    <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-2c7831bb44f98c1391d6a4ffda0e1fd302503391ca806e7fcc7b9b87197aec26.js"></script>

  
      <script id="rendered-js">
$(document).ready(function () {
  // Initialize Tooltip
  $('[data-toggle="tooltip"]').tooltip();

  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function (event) {

    // Prevent default anchor click behavior
    event.preventDefault();

    // Store hash
    var hash = this.hash;

    // Using jQuery's animate() method to add smooth page scroll
    // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
    $('html, body').animate({
      scrollTop: $(hash).offset().top },
    900, function () {

      // Add hash (#) to URL when done scrolling (default click behavior)
      window.location.hash = hash;
    });
  });
});
//# sourceURL=pen.js
    </script>

  




 
</body></html>