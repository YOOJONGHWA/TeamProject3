// var cnt = 2;
// function fn_addImage(){
// 		if(cnt<7){
// 		$("#d_file").append("<div class='input-group mb-3'>"
// 						   +"<span class='input-group-text2' id='file'>이미지</span><input type='file' class='form-control' id='formFile' name='files"+cnt+"' />"
// 						   +"</div>");
// 		cnt++;
// 		}
// 	}

/* operationTime 가져오기 */
$(document).ready(function() {
	$.ajax({
		url:'./otList',
		dataType:'json',
		data:{
			'actNum':$('#actNum').val()
		},
		success:function(arr){
			$.each(arr,function(index,item){
				$('#ot'+index).val(item).prop("selected",true);
				if(index>2){
					$('.otmf').attr('disabled', false);
					$('.otss').attr('disabled', true);
				}
				if(index>6){
					$('#oprtm').show();
					$('.otss').attr('disabled', false);
				}
			});
			
		}
	});
});

// 주말 영업시간 otmf(ot1~4) otss(ot5~9)
$(function() {
	var result=$('#ot0 option:selected').val();
	if(result == '24시간영업'){
    	$('.otmf').attr('disabled', true);
    }
   	$('.otss').attr('disabled', true);
    $('#oprtm').hide();
    
    $('#ot0').change(function() {
    	var result=$('#ot0 option:selected').val();
    	if(result == '주말' || result == '매일') {
    		$('.otmf').attr('disabled', false);
    		$('.otss').attr('disabled', true);
    		$('#oprtm').hide();
    	}
    	if(result == '24시간영업'){
    		$('.otmf').attr('disabled', true);
    		$('.otss').attr('disabled', true);
    		$('#oprtm').hide();
    	}
    	
    	if(result == '평일'){
    		$('.otmf').attr('disabled', false);
    	}
    	
    });
    
    $('#addOt').click(function() {
    	result=$('#ot0 option:selected').val();
        $('#oprtm').show();
        if(result=='평일'){
        	$('.otss').attr('disabled', false);
        }
    });
    
    $('#minOt').click(function() {
        $('#oprtm').hide();
	    $('.otss').attr('disabled', true);
    });
}); 


// 이미지 추가
$(function() {
    $('#actImg2').hide();
    $('#actImg3').hide();
    $('#actImg4').hide();
    $('#actImg5').hide();
    $('#actImg6').hide();
    
    $('#addImg1').click(function() {
        $('#actImg2').show();
    });
    $('#addImg2').click(function() {
        $('#actImg3').show();
    });
    $('#addImg3').click(function() {
        $('#actImg4').show();
    });
    $('#addImg4').click(function() {
        $('#actImg5').show();
    });
    $('#addImg5').click(function() {
        $('#actImg6').show();
    });
}); 

$('#actForm').submit(function(){
	if($('#actTitle').val()==""){
		alert("체험명을 입력하시오");
		$('#actTitle').focus();
		return false;
	}
	if($('select[name=actCategory]').val()=="카테고리를 선택하시오"){
		alert("카테고리를 선택하시오");
		$('select[name=actCategory]').focus();
		return false;
	}
	if($('#actPrice').val()==""){
		alert("가격을 입력하시오");
		$('#actPrice').focus();
		return false;
	}
	if($('#actPhone').val()==""){
		alert("문의번호를 입력하시오");
		$('#actPhone').focus();
		return false;
	}
	if($('select[name=actLocation]').val()==""){
		alert("위치를 입력하시오");
		$('select[name=actLocation]').focus();
		return false;
	}
	if($('select[name=actContent]').val()==""){
		alert("내용 입력하시오");
		$('select[name=actContent]').focus();
		return false;
	}

var checkYes = $('#dayoff-yes').is(':checked');
var checkNo = $('#dayoff-no').is(':checked');
var check1 = $('#dayoff2').is(':checked');
var check2 = $('#dayoff3').is(':checked');
var check3 = $('#actDayoff4').is(':checked');
var check4 = $('#actDayoff5').is(':checked');
var check5 = $('#actDayoff6').is(':checked');
var check6 = $('#actDayoff7').is(':checked');
var checkMon = $('#actDayoff-mon').is(':checked');
var checkTue = $('#actDayoff-tue').is(':checked');
var checkWed = $('#actDayoff-wed').is(':checked');
var checkThu = $('#actDayoff-thu').is(':checked');
var checkFri = $('#actDayoff-fri').is(':checked');
var checkSat = $('#actDayoff-sat').is(':checked');
var checkSun = $('#actDayoff-sun').is(':checked');
		
	if(checkYes && !check1 && !check2){
		alert("매주/매월 선택하시오");
		$('#dayoff2').focus();
		return false;
	}
	
	if(!checkNo && check2 && 
	   !check3 && !check4 &&
	   !check5 && !check6){
		alert("주 선택하시오");
		$('#dayoff4').focus();
		return false;
	}
	
	if(!checkYes && !checkNo && !checkMon && !checkTue && !checkWed && !checkThu &&
	   !checkFri && !checkSat && !checkSun){
		alert("요일 선택하시오");
		$('#dayoff-mon').focus();
		return false;
	}
	
	if($('input[name=files1]').val()==""){
		alert("사진을 1장 이상 등록하시오");
		$('input[name=files1]').focus();
		return false;
	}
	
});


// 휴무일 나타나기
$(function() {
	var checkYes = $('#dayoff-yes').is(':checked');
	var checkNo = $('#dayoff-no').is(':checked');
	var check1 = $('#dayoff2').is(':checked');
	var check2 = $('#dayoff3').is(':checked');
	var check3 = $('#actDayoff4').is(':checked');
	var check4 = $('#actDayoff5').is(':checked');
	var check5 = $('#actDayoff6').is(':checked');
	var check6 = $('#actDayoff7').is(':checked');
	var checkMon = $('#actDayoff-mon').is(':checked');
	var checkTue = $('#actDayoff-tue').is(':checked');
	var checkWed = $('#actDayoff-wed').is(':checked');
	var checkThu = $('#actDayoff-thu').is(':checked');
	var checkFri = $('#actDayoff-fri').is(':checked');
	var checkSat = $('#actDayoff-sat').is(':checked');
	var checkSun = $('#actDayoff-sun').is(':checked');
	
	if(checkYes){
		$('#dayoff-cb1').show();
	}else {
		$('#dayoff-cb1').hide();
	}
    $('#dayoff-yes').click(function() {
        $('#dayoff-cb1').show();
    });
    $('#dayoff-no').click(function() {
        $('#dayoff-cb1').hide();
        $('#dayoff-cb2').hide();
        $('#dayoff-cb3').hide();
    });
}); 
     
$(function() {
    $('#dayoff-cb2').hide();
    $('#dayoff-cb3').hide();
    $('#dayoff2').click(function() {
    	$('#dayoff-cb2').hide();
        $('#dayoff-cb3').show();
    });
    $('#dayoff3').click(function() {
        $('#dayoff-cb2').show();
        $('#dayoff-cb3').show();
     });
});   

//$(function() {
//	var checkYes = $('#dayoff-yes').is(':checked');
//    $('#dayoff-cb2').hide();
//    $('#dayoff-cb3').hide();
//    $('#dayoff2').click(function() {
//    	$('#dayoff-cb2').hide();
//        $('#dayoff-cb3').show();
//    });
//    $('#dayoff3').click(function() {
//        $('#dayoff-cb2').show();
//        $('#dayoff-cb3').show();
//   });
//});  


$(function() {
	var checkDayoffs=null;
	for (let i=0; i < $('#dayoffCount').val(); i++) {
		checkDayoffs= $('#divDayoff').children('.checkDayoff').eq(i).val();
		if(checkDayoffs=="매주"){
			$('#dayoff-cb2').hide();
       		$('#dayoff-cb3').show();
			$('#dayoff2').prop("checked",true);
		}		
		if(checkDayoffs=="매월"){
			$('#dayoff-cb2').show();
	        $('#dayoff-cb3').show();
			$('#dayoff3').prop("checked",true);
		}
		if(checkDayoffs=="첫번째"){
			$('#actDayoff4').prop("checked",true);
		}
		if(checkDayoffs=="두번째"){
			$('#actDayoff5').prop("checked",true);
		}
		if(checkDayoffs=="세번째"){
			$('#actDayoff6').prop("checked",true);
		}
		if(checkDayoffs=="네번째"){
			$('#actDayoff7').prop("checked",true);
		}
		if(checkDayoffs=="월요일"){
			$('#actDayoff-mon').prop("checked",true);
		}
		if(checkDayoffs=="화요일"){
			$('#actDayoff-tue').prop("checked",true);
		}
		if(checkDayoffs=="수요일"){
			$('#actDayoff-wed').prop("checked",true);
		}
		if(checkDayoffs=="목요일"){
			$('#actDayoff-thu').prop("checked",true);
		}
		if(checkDayoffs=="금요일"){
			$('#actDayoff-fri').prop("checked",true);
		}
		if(checkDayoffs=="토요일"){
			$('#actDayoff-set').prop("checked",true);
		}
		if(checkDayoffs=="일요일"){
			$('#actDayoff-sun').prop("checked",true);
		}
		
	}
});

/* 라벨에 이미지 이름 넣기 */
$("#files1").on('change',function(){
  var fileName = $("#files1").val();
  $('#lbFile1').text(fileName);
  $('#lb1').val(fileName);
});

$("#files2").on('change',function(){
  var fileName = $("#files2").val();
  $('#lbFile2').text(fileName);
  $('#lb2').val(fileName);
});

$("#files3").on('change',function(){
  var fileName = $("#files3").val();
  $('#lbFile3').text(fileName);
  $('#lb3').val(fileName);
});

$("#files4").on('change',function(){
  var fileName = $("#files4").val();
  $('#lbFile4').text(fileName);
  $('#lb4').val(fileName);
});

$("#files5").on('change',function(){
  var fileName = $("#files5").val();
  $('#lbFile5').text(fileName);
  $('#lb5').val(fileName);
});

$("#files6").on('change',function(){
  var fileName = $("#files6").val();
  $('#lbFile6').text(fileName);
  $('#lb6').val(fileName);
});


/* 이미지 이름 가져오기 */
$(document).ready(function() {
	$.ajax({
		url:'./updateImgList',
		dataType:'json',
		data:{
			'actNum':$('#actNum').val()
		},
		success:function(arr){
			$.each(arr,function(index,item){
				$('#lbFile'+(index+1)).text(item.imgName);
				$('#lb'+(index+1)).val(item.imgName);
				$('#ogName'+(index+1)).val(item.imgName);
				// $('#files'+(index+1)).attr('disabled', true);
				$('#actImg'+(index+1)).show();
			});
		}
	});
});

$('.delBtn').click(function(){
	$.ajax({
		url:'./deleteImgBtn',
		dataType:'json',
		data:{
			'actNum':$('#actNum').val(),
			'index':$(this).val()
		},
		success:function(index){
			console.log(index);
			$('#lbFile'+index).text("첨부파일");
			$('#lb'+index).val("");
		}
	});
});
