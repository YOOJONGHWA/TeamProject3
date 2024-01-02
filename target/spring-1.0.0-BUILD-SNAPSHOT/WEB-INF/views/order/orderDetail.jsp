<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Order Detail</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
  </head>
  
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->

	<script type="text/javascript">
		function point(p){
			document.getElementById('usedPoint2').innerHTML = p+"원";
			document.getElementById('total2').innerHTML=(${total}-p)+"원"; 		
			
		}
	</script>
	
	<script type="text/javascript">
		function clearPoint(){
			document.getElementById('textUsePoint').value = "";
			document.getElementById('usePoint2').innerHTML = "0"+"원";
			document.getElementById('total2').innerHTML = ${total} + "원"; 
		}
	</script>

	<script type="text/javascript">
		function pointUseAll(){ // 포인트사용
			document.getElementById('textUsePoint').value = ${pointDTO2.pointNow};
			document.getElementById('usePoint2').innerHTML = ${pointDTO2.pointNow}+"원";
			document.getElementById('total2').innerHTML = (${total}-${pointDTO2.pointNow})+"원"; 
		}
	</script>

	<script type="text/javascript">
		var path = "${pageContext.request.contextPath}";
		$(function() { 
			$("#resTb tbody").append($("#resInfoTr").html()); 
		});
	</script>

	<script type="text/javascript">
	
	function iamport(){
        var amount = '${total}'-$('#textUsePoint').val();
        var discount = "";
        discount += $('#textUsePoint').val();
        var nowPoint = '${pointDTO2.pointBalance}' - $('#textUsePoint').val();
        
        
        IMP.init('imp70420210'); //가맹점 식별코드
        IMP.request_pay({
            pg : 'html5_inicis',
            pay_method : 'card',
            merchant_uid : '${memberDTO.userId}' + new Date().getTime(),
            name : '라이크핏' , 	//결제창에서 보여질 이름
            amount : amount, 	//실제 결제되는 가격
        }
        
        , function(rsp) {
           console.log(rsp);
           
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
				
                alert(msg);
              
                $.ajax({
                    url: "orderComplete",
                   type: "POST",
                   data: { 'ordUser'    		:'${memberDTO.userId}',
	                       'ordGetName'   		:'${memberDTO.userName}',
	                       'ordGetPhone'    	:'${memberDTO.userPhone}',
	                       'ordTotalPrice'		:'${total}',
	                       'pointBalance'		: nowPoint,
	                       'pointUsed'			: $('#textUsePoint').val(),
	                       'ordPayPrice'		: amount,
                       },
                   dataType:"json",
                })
              
                location.href = '${pageContext.request.contextPath}/main/main';
            } else {
              var msg = rsp.error_msg;
              alert(msg);
            }
        });
     }
  </script>

	<script type="text/javascript"> 
		var point2 = '${pointDTO2.pointBalance}'; 
		
	      $(function() { 
	         $('#textUsePoint').change(function() { 
	            if($('#textUsePoint').val() - point2 > 0) { 
	              alert('사용 가능 포인트를 초과하였습니다.') 
	               $('#textUsePoint').val(point2); 
	              document.getElementById('usePoint2').innerHTML=point2+"원";
				  document.getElementById('total2').innerHTML=${total}-point2+"원"; 
	            }else if($('#textUsePoint').val() < 1000) {
	              alert('최소 사용 가능 포인트는 1000P 입니다.') 
	              document.getElementById('usePoint2').innerHTML="1000원";
				  document.getElementById('total2').innerHTML=${total}-1000+"원"; 
	               $('#textUsePoint').val(1000); 
	            }
	         }) 
	      }) 
	   </script>
	   
  <body class="goto-here">
        <section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    				<div class="cart-list">
	    				<table class="table">
						    <thead class="thead-primary">
						      <tr class="text-center">
						        <th>&nbsp;</th>
						        <th>&nbsp;</th>
						        <th>상품</th>
						        <th>가격</th>
						        <th>수량</th>
						        <th>합계</th>
						      </tr>
						    </thead>
						    
						    <tbody>
						    <c:forEach var="orderDTO" items="${orderDetail}">
						      <tr class="text-center">
						        <td class="image-prod"><div class="img" style="background-image:url(${pageContext.request.contextPath}/images/);"></div></td>
						        <td class="product-name">
						        	<h3>${orderDTO.actNum}</h3>
						        	<p>${orderDTO.actNum}</p>
						        </td>
						        <td class="price">${dto.actPrice}</td>
						        <td class="quantity" value="${orderDTO.ordQuantity}" min="1" max="10"></td>
						        <td class="total">${orderDTO.ordPayPrice}</td>
						      </tr><!-- END TR-->
						      </c:forEach>
						    </tbody>
						  </table>
					  </div>
    			</div>
    		</div>
    		
    		<section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-7 ftco-animate">
						<form action="#" class="billing-form">
							<h3 class="mb-4 billing-heading">Billing Details</h3>
	          	<div class="row align-items-end">
	          		<div class="col-md-6">
	                <div class="form-group">
	                	<label for="firstname">이름</label>
	                  <input type="text" class="form-control" placeholder="">
	                </div>
	              </div>
	              <div class="col-md-6">
	                <div class="form-group">
	                	<label for="lastname">이름</label>
	                  <input type="text" class="form-control" placeholder="">
	                </div>
                </div>
               
		            <div class="w-100"></div>
		            <div class="col-md-6">
	                <div class="form-group">
	                	<label for="phone">Phone</label>
	                  <input type="text" class="form-control" placeholder="">
	                </div>
	              </div>
	            </div>
	          </form><!-- END -->
					</div>
					<div class="col-xl-5">
	          <div class="row mt-5 pt-3">
	          	<div class="col-md-12 d-flex mb-5">
	          		<div class="cart-detail cart-total p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">Cart Total</h3>
	          			<p class="d-flex">
		    						<span>Subtotal</span>
		    						<span>$20.60</span>
		    					</p>
		    					<p class="d-flex">
		    						<span>Delivery</span>
		    						<span>$0.00</span>
		    					</p>
		    					<p class="d-flex">
		    						<span>Discount</span>
		    						<span>$3.00</span>
		    					</p>
		    					<hr>
		    					<p class="d-flex total-price">
		    						<span>Total</span>
		    						<span>$17.60</span>
		    					</p>
								</div>
								
						
	          		<div class="cart-detail p-3 p-md-4">
									<div class="form-group">
										<div class="col-md-12">
											<div class="checkbox">
											   <label><input type="checkbox" value="" class="mr-2"> 주문할 체험상품의 가격, 정보를 확인하였으며 이에 동의합니다.</label>
											</div>
										</div>
									</div>
									<p><a href="#"class="btn btn-primary py-3 px-4">결제하기</a></p>
								</div>
	          	</div>
	          	</div>
	          </div>
          </div> <!-- .col-md-8 -->
        </div>
      </div>
			<!-- 쿠폰적용 -->
    		<div class="row justify-content-end">
    			<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
    				<div class="cart-total mb-3">
    					<h3>Coupon Code</h3>
    					<p>쿠폰 코드를 입력해 주세요</p>
  				<form action="${pageContext.request.contextPath}//" class="">
	              <div class="form-group">
	              	<label for=""></label>
	                <input type="text" class="form-control text-left px-3" placeholder="Coupon Code">
	              </div>
	            </form>
    				</div>
    				<p><a href="" class="btn btn-primary py-3 px-4">Apply Coupon</a></p>
    			</div>
    			
    			<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
    				<div class="cart-total mb-3">
    					<h3></h3>
    					<p> </p>
  						<form action="" class="info"></form>
    		</div>
			</div>
	    </section> <!-- .section -->
	    
  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#FF6600"/></svg></div>

  <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/resources/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

  <script>
	</script>
	
    <!-- 푸터 들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- 푸터 들어가는 곳 -->
  </body>
</html>