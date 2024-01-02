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


$("#files1").on('change',function(){
  var fileName = $("#files1").val();
  $('#lbFile1').text(fileName);
});

$("#files2").on('change',function(){
  var fileName = $("#files2").val();
  $('#lbFile2').text(fileName);
});

$("#files3").on('change',function(){
  var fileName = $("#files3").val();
  $('#lbFile3').text(fileName);
});

$("#files4").on('change',function(){
  var fileName = $("#files4").val();
  $('#lbFile4').text(fileName);
});

$("#files5").on('change',function(){
  var fileName = $("#files5").val();
  $('#lbFile5').text(fileName);
});

$("#files6").on('change',function(){
  var fileName = $("#files6").val();
  $('#lbFile6').text(fileName);
});

$('.delBtn').click(function(){
	console.log('클릭됨');
	console.log($(this).val());
	
	$('#lbFile'+$(this).val()).text("첨부파일");
	$('#lb'+$(this).val()).val("");
	$('#files'+$(this).val()).val("");
});



$(document).ready(function() {
	var companyId= $('#companyId').val();
	console.log(companyId);
	$.ajax({
		url:'./getCompanyName',
		contentType:'text',
		data:{
			'companyId':$('#companyId').val()
		},
		success:function(rData){
			console.log(rData);
			$('#companyName').val(rData);
		}
	});
});
