function getContextPath() {
	return sessionStorage.getItem("contextpath");
}

$('input[type="text"]').keydown(function() {
  if (event.keyCode === 13) {
    event.preventDefault();
    getList();
  };
});
/* ---------------------- 구(주소) 알아내기 ---------------------- */
function getLocation(actLocation){
	var actLocation = actLocation;
	$.ajax({
		url:'https://dapi.kakao.com/v2/local/search/address.json?query='+encodeURIComponent(actLocation),
		type:'GET',
		headers: {'Authorization' : 'KakaoAK d50a74d7127bba5b2b8fbb16bcd818f8'},
		success:function(data){
	       var location = data.documents[0].road_address.region_2depth_name;
	       console.log(location);
	       
	       return location;
		},
		error : function(e){
			console.log(e);
	   }
	});
};

/* ---------------------- 리스트 불러오기 ---------------------- */
function getList(pageNum){
	getActListPage(pageNum);
	var ctx = getContextPath();
	$('#actList').empty();
	var category=',';
	var location=',';
	var sessionId='';
	$("input[name='category']:checked").each(function() {
		category += $(this).val()+',';
	});
	$("input[name='location']:checked").each(function() {
		location += $(this).val()+',';
	});
	$("#wishListCheck:checked").each(function() {
		sessionId = $('#wishListCheck').val();
	});
	$.ajax({
		url: "./slist",
		dataType:'json',
		data:{
			'category':category,
			'location':location,
			'scType':$('#scType').val(),
			'keyword':$('#keyword').val(),
			'sessionId':sessionId,
			'pageNum':pageNum
		},
		success:function(arr){
			$.each(arr,function(index,item){
				
				var list = '';
				list += '<div class="col-lg-4 col-md-6">'
				list += 	'<div class="single-latest-news">'
				list +=			'<a href="'+ctx+'/activity/actContent?actNum='+item.actNum+'">'
				list +=			'<div class="latest-news-bg news-bg-1">'
				list +=				'<img alt="" src="'+ctx+'/resources/upload/'+item.imgNameKey+'" width=500px height=250px/>'		
				list +=			'</div>'
				list +=			'</a>'
				list +=			'<div class="news-text-box">'
				list +=				'<h3><a href="'+ctx+'/activity/actContent?actNum='+item.actNum+'">'+item.actTitle+'</a></h3>'
				list +=				'<p class="blog-meta">'
				list +=					'<span class="author"><img alt="" src="'+ctx+'/resources/images/building.png" width=13px height=13px/>'+item.companyName+'</span>'
				list +=					'<span class="date"><img alt="" src="'+ctx+'/resources/images/marker.png" width=13px height=13px/>'+item.actLocation+'</span>'
				list +=				'</p>'
				list +=				'<p class="excerpt">'+item.actPrice+' 원</p>'
				list +=				'<a href="'+ctx+'/activity/actContent?actNum='+item.actNum+'" class="read-more-btn">read more</a>'
				list +=			'</div>'
				list += 	'</div>'
				list += '</div>'
				$('#actList').append(list);
				
			});
		}
	});
};
/* ---------------------- 페이지 불러오기 ---------------------- */
function getActListPage(pageNum){
	var ctx = getContextPath();
	$('#actListPage').empty();
	var category=',';
	var location=',';
	var sessionId='';
	$("input[name='category']:checked").each(function() {
		category += $(this).val()+',';
	});
	$("input[name='location']:checked").each(function() {
		location += $(this).val()+',';
	});
	$("#wishListCheck:checked").each(function() {
		sessionId = $('#wishListCheck').val();
	});
	$.ajax({
		url: "./page",
		dataType:'json',
		data:{
			'category':category,
			'location':location,
			'scType':$('#scType').val(),
			'keyword':$('#keyword').val(),
			'sessionId':sessionId,
			'pageNum':pageNum
		},
		success:function(data){
			var pageNum= data.pageNum;
			var currentPage = data.currentPage;
			var page = '';
			page += '<ul>'
			page +=		'<li><a id="prevPage">Prev</a></li>'
			for (let i = data.startPage; i <= data.endPage; i++) {
			page +=			'<li><a class="actPage" id="actPageBlock_'+i+'" value="'+i+'">'+i+'</a></li>'		
			}
			page +=		'<li><a id="nextPage">Next</a></li>'
			page += '</ul>'
			$('#actListPage').append(page);
			
			$('.actPage').click(function() {
				pageNum=this.getAttribute('value');
				getList(pageNum);
				
			});
			
			$('#prevPage').click(function() {
				currentPage-=1;
				if(pageNum != '1'){
					getList(currentPage);
				} else {
					getList(data.startPage);
				}
			});
			
			$('#nextPage').click(function() {
				if(currentPage < data.pageCount){
					currentPage+=1;
					getList(currentPage);
				} else {
					getList(data.endPage);
				}
			});
			$('html, body').animate({scrollTop : 350}, 400);
		}
	});
};


/* ---------------------- 검색 조건 ---------------------- */
$(function(){
	getList();
	getCompanyMember();
	$('.filter-backGround').hide();
	$('.filter-window').hide();
});

$('#btnSearch').click(function() {
	getList();
});

$('#btnShowFilter').click(function() {
	$('.filter-backGround').show();
	$('.filter-window').show();
});

$('#btnHideFilter').click(function() {
	$('.filter-backGround').hide();
	$('.filter-window').hide();
});

$('#categoty_').click(function() {
	$('.category-options').prop("checked",false);
});

$('.category-options').click(function() {
	var optionsCheck = $('.category-options').is(':checked');
	$('#categoty_').prop("checked",false);
	if(!optionsCheck){
		$('#categoty_').prop("checked",true);
	};
});

$('#location_').click(function() {
	$('.location-options').prop("checked",false);
});

$('.location-options').click(function() {
	var optionsCheck = $('.location-options').is(':checked');
	$('#location_').prop("checked",false);
	if(!optionsCheck){
		$('#location_').prop("checked",true);
	};
});

$('.category-options').click(function() {
	var optionsCheck = $('.category-options').is(':checked');
	$('#categoty_').prop("checked",false);
	if(!optionsCheck){
		$('#categoty_').prop("checked",true);
	};
});

$('.category-options').click(function() {
	var optionsCheck = $('.category-options').is(':checked');
	$('#categoty_').prop("checked",false);
	if(!optionsCheck){
		$('#categoty_').prop("checked",true);
	};
});

$('#wishListCheck').click(function() {
	var sessionId= $('#userId').val();
	if(sessionId == ''){
		alert('로그인이 필요한 기능입니다');
		$('#wishListCheck').prop("checked",false);
	};
});

/* ---------------------- 검색조건 초기화 ---------------------- */
$('#btnResetOption').click(function() {
	$('.category-options').prop("checked",false);
	$('.location-options').prop("checked",false);
	$('#wishListCheck').prop("checked",false);
	$('#categoty_').prop("checked",true);
	$('#location_').prop("checked",true);
});

/* ---------------------- 검색조건 적용 ---------------------- */
$('#btnApplyOption').click(function() {
	getList();
	$('.filter-backGround').hide();
	$('.filter-window').hide();
});

/* ---------------------- 상품등록 버튼 ---------------------- */

function getCompanyMember(){
	var sessionId=$('#userId').val();
	$.ajax({
		url: "./getCompanyMember",
		dataType:'text',
		data:{
			'sessionId':sessionId,
		},
		success:function(rData){
			var btn='';
	    	if(rData=='Y'){
	    		btn += '<input type="button" id="btnWriteActivity" class="btn btn-primary" value="상품 등록"/>'
	    		$('#writeActivity').append(btn);
	    	}
	    	$('#btnWriteActivity').click(function() {
				var ctx = getContextPath();
				location.href=ctx+'/activity/write';
			});
	    }
	});
};




