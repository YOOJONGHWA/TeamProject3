<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="${pageContext.request.contextPath}/resources/css/actContent.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.timepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ac12fe9c4f31e8dd54afd3eea4e1c48"></script>
</head>
<body class="goto-here">
<input type="hidden" value="${activityDto.actNum}" id="actNum" class="actNum" name="actNum">
<input type="hidden" value="${sessionScope.userId}" id="userId" class="userId" name="userId">
<input type="hidden" value="${activityDto.actLocation}" id="actLocation" name="actLocation">
<input type="hidden" value="${activityDto.companyName}" id="companyName" class="companyName" name="companyName">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
    <div class="hero-wrap hero-bread" style="background-image: url(${pageContext.request.contextPath}/resources/images/bg_tennis.jpg);">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}/activity/image">Detail</a></span> <span class="mr-2"><a href="index.html">상품</a></span> <span>상세</span></p>
            <h1 class="mb-0 bread">Detail</h1>
          </div>
        </div>
      </div>
    </div>
    
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="product__details__img">
                        <div class="detail_big_img">
							<img class="big_img" src="${pageContext.request.contextPath}/resources/upload/${activityDto.imgNameKey}" height="500">
                        </div>
                        <div class="mini_img" tabindex="1" style="overflow: hidden; outline: none;">
                        	<c:forEach var="activityDto" items="${actImgList}">
	                            <div class="pt__item active">
	                                <img data-imgbigurl="${pageContext.request.contextPath}/resources/upload/${activityDto.imgNameKey}" src="${pageContext.request.contextPath}/resources/upload/${activityDto.imgNameKey}" alt="" width="50" height="70">
	                            </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="product_details_text">
                        <div class="product_label">${activityDto.actCategory}
                        </div>
                        <div class="like-content no" id="wish-no">
                        	<button class="btn-secondary like-review" id="wishBtn-no">
							    <img alt="" src="${pageContext.request.contextPath}/resources/images/emptyHeart.png" height="30" width="30"> 
							</button>
                        </div>
						<div class="like-content yes" id="wish-yes">
                        	<button class="btn-secondary like-review" id="wishBtn-yes">
							    <img alt="" src="${pageContext.request.contextPath}/resources/images/redHeart.png" height="30" width="30"> 
							</button>
                        </div>                        
                        <h4>${activityDto.actTitle}</h4>
                        <h5>${activityDto.actPrice} 원</h5>
                        <ul>
                            <li>문의 전화: <span>${activityDto.actPhone}</span></li>
                            <li>예약 필요 여부: 
                            	<c:choose>
                            		<c:when test="${activityDto.actReservation eq 'Y'}">
                       					<span>방문 전 예약전화 필수</span>
                    				</c:when>
                       				<c:otherwise>
                       					<span>예약 없이 방문</span>
                       				</c:otherwise> 
                       			</c:choose>
                            </li>
                            <li>주차 가능 여부: 
                            	<c:choose>
                            		<c:when test="${activityDto.actParking eq 'Y'}">
                       					<span>주차 가능</span>
                    				</c:when>
                       				<c:otherwise>
                       					<span>주차 불가</span>
                       				</c:otherwise> 
                       			</c:choose>
                            </li>
                            <li>
                            	운영시간 : <span>${activityDto.actOperationTime}</span>
                            </li>
                            <li>
                            	휴무일 : <span>${activityDto.actDayoff}</span>
                            </li>
                        </ul>
                        <form action="${pageContext.request.contextPath}/order/orderDetail" name="actForm" method="post" >
			                <div class="row mt-4">
								<div class="w-100"></div>
								<div class="input-group col-md-6 d-flex mb-3">
		           					<span class="input-group-btn mr-2">
		              					<button type="button" class="quantity-left-minus btn" data-type="minus" data-field="">
		                 					<i class="ion-ios-remove"></i>
		              					</button>
		          					</span>
		           					<input type="text" id="ordQuantity" name="ordQuantity" class="form-control input-number" value="1" min="1" max="100">
		           					<span class="input-group-btn ml-2">
		              					<button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
		                   					<i class="ion-ios-add"></i>
		               					</button>
		           					</span>
		        				</div>
			 				</div>
			 				<div>
			 					<input type="hidden" value="${activityDto.actNum}" name="actNum">
			 					<input type="hidden" value="${sessionScope.userId}" name="user_id">
			 					<input type="hidden" value="${activityDto.actPrice}" name="ordPayPrice">
			       				<p><input type="submit" value="Buy" class="btn btn-black py-3 px-5" id="btnBuy"></p>
			       			</div>
		       			</form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-3 pb-3">
				<div class="col-md-12 heading-section text-center ftco-animate" id="content">
					<span class="subheading">상품상세</span>
            		<h2 class="mb-4">내용</h2>
            		<p align="left">${activityDto.actContent}</p>
			</div>
		</div> 
        <!-- 지도 api -->
        <div id="map" style="width:100%;height:350px;"></div>
        <p>위치 : ${activityDto.actLocation}</p>
        	<input type="button" value="수정" class="btn btn-black py-3 px-5" id="btnUpdate"
        		onclick="location.href='${pageContext.request.contextPath }/activity/update?actNum=${activityDto.actNum}'"> 
        	<input type="button" value="삭제" class="btn btn-black py-3 px-5" id="btnDelete"
        		onclick="location.href='${pageContext.request.contextPath }/activity/delete?actNum=${activityDto.actNum}'"> 
    	</div>
<!--     	<div class="container"> -->
<!--     		<div class="row"> -->
<!--     			<div class="col-md-6 col-lg-3 ftco-animate"> -->
<!--     				<div class="product"> -->
<!--     					<a href="#" class="img-prod"><img class="img-fluid" src="images/product-1.jpg" alt="Colorlib Template"> -->
<!--     						<span class="status">30%</span> -->
<!--     						<div class="overlay"></div> -->
<!--     					</a> -->
<!--     					<div class="text py-3 pb-4 px-3 text-center"> -->
<!--     						<h3><a href="#">Bell Pepper</a></h3> -->
<!--     						<div class="d-flex"> -->
<!--     							<div class="pricing"> -->
<!-- 		    						<p class="price"><span class="mr-2 price-dc">$120.00</span><span class="price-sale">$80.00</span></p> -->
<!-- 		    					</div> -->
<!-- 	    					</div> -->
<!-- 	    					<div class="bottom-area d-flex px-3"> -->
<!-- 	    						<div class="m-auto d-flex"> -->
<!-- 	    							<a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center"> -->
<!-- 	    								<span><i class="ion-ios-menu"></i></span> -->
<!-- 	    							</a> -->
<!-- 	    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1"> -->
<!-- 	    								<span><i class="ion-ios-cart"></i></span> -->
<!-- 	    							</a> -->
<!-- 	    							<a href="#" class="heart d-flex justify-content-center align-items-center "> -->
<!-- 	    								<span><i class="ion-ios-heart"></i></span> -->
<!-- 	    							</a> -->
<!--     							</div> -->
<!--     						</div> -->
<!--     					</div> -->
<!--     				</div> -->
<!--     			</div> -->
<!--     		</div> -->
<!--     	</div> -->
    </section>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/actContent.js"></script>
  
<script>
		
</script>
    
  </body>
</html>