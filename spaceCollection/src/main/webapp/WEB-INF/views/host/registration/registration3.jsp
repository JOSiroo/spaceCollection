<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/hostTop.jsp"%>

<style type="text/css">
	body {background: #f6f6f6;}

	article {
		margin: 140px 0 150px 0; 
		font-size: 16px;
    	line-height: 20px;
		display: flex;
		justify-content: center;
	}

	.main {width: 1000px; display: inline-block;}
	
	.heading {
		border-bottom: 4px solid #704de4;
		padding-bottom: 24px;
	}
	
	.hd1 {
		font-size: 26px;
		color: black;
	}
	
	.hd2 {
		float: right;
		color: red;
	}
	
	.boxForm {
		margin-top: 80px;
	}
	
	.boxTitle {
		font-size: 20px;
		font-weight: bold;
		color: black;
		margin-bottom: 15px;
	}
	
	.boxIcon {
		width: 20px;
		height: 20px;
		margin: 0 0 4px 15px;
	}

	.btBar {
		display: flex;
		justify-content: center;
		margin: 100px 0 0 0;
	}
	
	.btBar button {
		border-radius: 0.5rem;
		width: 100%;
		height: 80px;
		margin: 0 10px 60px 10px;
		color: white;
		font-size: 20px;
		font-weight: bold;
	}
	
	.boxnoti {
		margin: 20px 0 0 0;
		display: inline-block;
		width: 100%;
	}
	
	.boxnoti p {
		font-size: 14px;
		color: #7b7b7b;
	}
	
	.boxnoti img {
		width: 18px;
		height: 18px;
		float: left;
		margin-right: 5px;
	}
	
	.txtHour {
		padding: 30px 10px 0 10px;
	}
	
	.openTime, .closeTime, .floor, .parking {
		width: 35%;
		height: 50px;
		border: 1px solid #b7b7b7;
		font-size: 17px;
		margin-top: 15px;
		padding: 8px 8px 8px 8px;
		resize: none;
	}
	
	.timeCheck {
		display: inline-block;
		margin-left: 10px;
	}
	
	.form-check-input {
		padding-top: 20px;
	}
	
	.eleve {
		width: 400px;
		height: 65px;
		font-size: 19px;
		background: white;
		color: #656565;
		border: 1px solid #b7b7b7;
	}
	
	.checked {
		background: #704de4;
		color: white;
	}
	
</style>

<article>
	<div class="main">
		<form name="frmRegi3" method="post" action="<c:url value='/host/registration/registration4' />">
			<div class="heading">
				<span class="hd1">이용 정보를 입력해주세요.</span>
				<span class="hd2">* 필수입력</span>
			</div>
			<!-- 이용시간 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>이용시간 <span style="color: red;">*</span></span>
					<div class="form-check timeCheck">
					  	<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
					  	<label class="form-check-label" for="flexCheckChecked">
					    	24시 운영
					  	</label>
					</div>
				</div>
				<div class="boxContents">
					<div class="spTime">
						<select class="form-select openTime" aria-label="Default select example" style="float: left;">
						  	<option selected>00시</option>
						  	<option value="1">01시</option>
						  	<option value="2">02시</option>
						  	<option value="3">03시</option>
						  	<option value="4">04시</option>
						  	<option value="5">05시</option>
						  	<option value="6">06시</option>
						  	<option value="7">07시</option>
						  	<option value="8">08시</option>
						  	<option value="9">09시</option>
						  	<option value="10">10시</option>
						  	<option value="11">11시</option>
						  	<option value="12">12시</option>
						  	<option value="13">13시</option>
						  	<option value="14">14시</option>
						  	<option value="15">15시</option>
						  	<option value="16">16시</option>
						  	<option value="17">17시</option>
						  	<option value="18">18시</option>
						  	<option value="19">19시</option>
						  	<option value="20">20시</option>
						  	<option value="21">21시</option>
						  	<option value="22">22시</option>
						  	<option value="23">23시</option>
						  	<option value="24">24시</option>
						</select>
						<span class="txtHour" style="float: left;">부터</span>
						<select class="form-select closeTime" aria-label="Default select example" style="float: left;">
						  	<option selected>24시</option>
						  	<option value="1">01시</option>
						  	<option value="2">02시</option>
						  	<option value="3">03시</option>
						  	<option value="4">04시</option>
						  	<option value="5">05시</option>
						  	<option value="6">06시</option>
						  	<option value="7">07시</option>
						  	<option value="8">08시</option>
						  	<option value="9">09시</option>
						  	<option value="10">10시</option>
						  	<option value="11">11시</option>
						  	<option value="12">12시</option>
						  	<option value="13">13시</option>
						  	<option value="14">14시</option>
						  	<option value="15">15시</option>
						  	<option value="16">16시</option>
						  	<option value="17">17시</option>
						  	<option value="18">18시</option>
						  	<option value="19">19시</option>
						  	<option value="20">20시</option>
						  	<option value="21">21시</option>
						  	<option value="22">22시</option>
						  	<option value="23">23시</option>
						  	<option value="24">00시</option>
						</select>
						<span class="txtHour"  style="float: left;">까지</span>
					</div>
					<div class="boxnoti"  style="float: inherit;">
						<img src="<c:url value='/images/pngwing.com.png' />" >
						<p>실제 공간 예약이 가능한 시간을 입력해주세요.</p>
					</div>
				</div>
			</div>
			<!-- 공간 층수 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>공간 층수 <span style="color: red;">*</span></span>
				</div>
				<div class="boxContents">
					<div class="spaceText">
						<input type="text" class="floor" value="" style="width: 80%;"
							placeholder="층수 여부를 입력하세요. ex. 지상 1층, 지하 2층">
					</div>
				</div>
			</div>
			<!-- 주차 여부 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>주차 여부 <span style="color: red;">*</span></span>
				</div>
				<div class="boxContents">
					<div class="spaceText">
						<input type="text" class="parking" value="" style="width: 80%;"
							placeholder="주차 여부를 입력하세요. ex. 주차 불가, 1대, 2대">
					</div>
				</div>
			</div>
			<!-- 엘리베이터 여부 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>엘리베이터 여부 <span style="color: red;">*</span></span>
				</div>
				<div class="boxContents">
					<div class="eleveator">
						<input type="button" class="eleve Y" value="있음">
						<input type="button" class="eleve N" value="없음">
					</div>
				</div>
			</div>
			
			<div class="btBar">
				<button type="button" class="btn btn-secondary" id="back" >이전</button>
				<button type="button" class="btn btn-warning" id="next" >다음</button>
			</div>
			
		</form>
	</div>
</article>

<script type="text/javascript">
	$(function() {
		// 체크박스 상태가 변경될 때 처리
        $('#flexCheckChecked').change(function () {
            if ($(this).is(':checked')) {
                // 체크박스가 체크되면 openTime과 closeTime을 설정
                $('.openTime').val('00시');
                $('.closeTime').val('24시');
            } else {
                // 체크박스가 체크 해제되면 select 엘리먼트를 초기화
                $('.openTime').val('00시');
                $('.closeTime').val('24');
            }
        });

        // select 엘리먼트가 변경될 때 처리
        $('.openTime, .closeTime').change(function () {
            // select 엘리먼트가 변경되면 체크박스를 체크 해제
            $('#flexCheckChecked').prop('checked', false);
        });
        
        $('.eleve').click(function() {
			$(this).addClass('checked');
			
			// 다른 버튼에서 'checked' 클래스를 제거
		    $('.eleve').not(this).removeClass('checked');
		});
        
      	//하단 버튼
		$('#back').click(function() {
			history.back();
		});
        
      	$('#next').click(function() {
			//공간 층수
			if ($('.floor').val().length < 1) {
				alert('공간 층수를 입력하세요.');
				$('.floor').focus();
				
				scrollMove($('.floor'));
				
				return false;
			}
		
			//주차 여부
			if ($('.parking').val().length < 1) {
				alert('주차 여부를 입력하세요.');
				$('.parking').focus();
				
				scrollMove($('.parking'));
				
				return false;
			}
			
			//엘레베이터 여부
			if (!$('.eleve.Y').hasClass('checked') && !$('.eleve.N').hasClass('checked')) {
		        alert('엘리베이터 여부를 선택하세요.');
		        $('.eleveator').focus();
		        
		        scrollMove($('.eleveator'));
		        
		        return false;
		    }
			
			$('form[name=frmRegi3]').prop('action', "<c:url value='/host/registration/registration4' />");
			$('form[name=frmRegi3]').submit();
		
		});
      	
	});
	
	//스크롤이동
	function scrollMove(val) {
		var offset = $(val).offset();	//해당 위치 반환
		$("html, body").animate({scrollTop: offset.top - 150}, 200);	//선택한 위치로 이동. 두번째 인자는 시간 0.2초
	}

</script>

</body>
</html>