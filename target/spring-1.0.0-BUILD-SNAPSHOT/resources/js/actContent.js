
$('.mini_img img').on('click', function () {
	$('.mini_img .pt__item').removeClass('active');
	$(this).addClass('active');
	var imgurl = $(this).data('imgbigurl');
	var bigImg = $('.big_img').attr('src');
 	if (imgurl != bigImg) {
		$('.big_img').attr({
			src: imgurl
        });
    }
});

$('#btnBuy').click(function() {
	var userId = $('#user_id').val();
	if(userId == null){
		alert('로그인 후 구매 가능합니다.');
		return false;
	}
});

/* 위시리스트 입력/삭제 */
$(function(){
	var userId=$('#userId').val();
	$('#wish-yes').hide();
	$('#wishBtn-no').click(function() {
		if(userId==""){
			alert('로그인이 필요한 기능입니다.');
		} else {
			$('#wish-no').hide();
			$('#wish-yes').show();
			$.ajax({
				url:'./insertWishList',
				dataType:'json',
				data:{
					'actNum':$('#actNum').val(),
					'userId':$('#userId').val()
				},
				success:function(){
				}
			});
		}
	});
	$('#wishBtn-yes').click(function() {
		$('#wish-no').show();
		$('#wish-yes').hide();
		$.ajax({
			url:'./deleteWishList',
			dataType:'json',
			data:{
				'actNum':$('#actNum').val(),
				'userId':$('#userId').val()
			},
			success:function(){
			}
		});
	});
});

/* 위시리스트 불러오기 */
$(function(){
	$.ajax({
		url:'./checkWishList',
		dataType:'text',
		data:{
			'actNum':$('#actNum').val(),
			'userId':$('#userId').val()
		},
		success:function(rData){
			if(rData=='yes'){
				$('#wish-no').hide();
				$('#wish-yes').show();
			}
			if(rData=='no'){
				$('#wish-no').show();
				$('#wish-yes').hide();
			}
		}
	});
});

$(document).ready(function(){
	var quantitiy=0;
	$('.quantity-right-plus').click(function(e){
		e.preventDefault();
		var quantity = parseInt($('#ordQuantity').val());
        
		if(quantity<10){
			$('#ordQuantity').val(quantity + 1);
		}
        
    });

	$('.quantity-left-minus').click(function(e){
		e.preventDefault();
        var quantity = parseInt($('#ordQuantity').val());
		if(quantity>1){
			$('#ordQuantity').val(quantity - 1);
		}
    });
    
});

/*
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
*/

$(function(){
	var actLocation=$('#actLocation').val();
	$.ajax({
		url:'https://dapi.kakao.com/v2/local/search/address.json?query='+encodeURIComponent(actLocation),
		type:'GET',
		headers: {'Authorization' : 'KakaoAK d50a74d7127bba5b2b8fbb16bcd818f8'},
		success:function(data){
	       console.log(data);
	       console.log(data.documents[0].road_address.region_2depth_name);
	       var x = data.documents[0].x;
	       var y = data.documents[0].y;
	       
	       var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(y, x), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(y, x); 
			
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
		},
		error : function(e){
			console.log(e);
	   }
	});
});	


$(function(){
	var sessionId=$('#userId').val();
	if(sessionId != 'admin'){
		$('#btnUpdate').hide();
		$('#btnDelete').hide();
	}
	getCompanyName(sessionId);
});	

function getCompanyName(sessionId){
	$.ajax({
		url: "./getCompanyName",
		dataType:'text',
		data:{
			'companyId':sessionId,
		},
		success:function(rData){
			var companyName=$('#companyName').val();
			console.log(rData);
	    	if(rData==companyName){
	    		$('#btnUpdate').show();
				$('#btnDelete').show();	
	    	}
	    }
	});
};


