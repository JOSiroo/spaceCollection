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
		font-size: 18px;
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
	
	.boxIcon {
		width: 20px;
		height: 20px;
		margin: 0 0 4px 15px;
	}
	
	.tooltip-text {
	    display: none;
	    position: absolute;
	    background-color: #7b7b7b;
	    color: white;
	    padding: 5px;
	    border-radius: 4px;
	    z-index: 999;
	    font-size: 13px;
	}
	
	.boxIcon:hover + .tooltip-text {
	    display: block;
	}
	
	.txtHour {
		padding: 30px 10px 0 10px;
	}
	
	.openTime, .closeTime {
		width: 35%;
		height: 50px;
		border: 1px solid #b7b7b7;
		font-size: 17px;
		margin-top: 15px;
		padding: 8px 8px 8px 8px;
		resize: none;
	}
	
	.area, .floor {
		width: 90%;
		height: 50px;
		border: 1px solid #b7b7b7;
		font-size: 17px;
		margin-top: 15px;
		padding: 8px 8px 8px 8px;
		resize: none;
		text-align: right;
	}
	
	.sdName {
		width: 100%;
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
	
	input[type="checkbox"] {
		width: 20px;
		height: 20px;
		margin: 0 10px 5px 0;
	}
	
	.form-check-label {
		font-size: 18px;
		color: black;
	}
	
	.form-check.form-check-inline {
		margin: 0 10px 25px 0;
	}
	
	.criteria {
		font-weight: bold;
		font-size: 18px;
		color: black;
	}
	
	.lbPerson {
		margin: 0 50px 0 0;
	}
	
	.txtPerson {
		border: 1px solid #b7b7b7;
		height: 30px;
		text-align: right;
		padding-right: 10px;
	}
	
	.lbRefund {
		cursor: default;
		font-weight: 600;
		display: inline-block; 
		vertical-align: middle;
		font-size: 18px;
		width: 163px;
		padding-right: 16px; 
		color: rgb(17, 17, 17);
	}
	
	.opRefund {
		display: flex;
    	align-items: center;
		width: 50%;
		margin-left: 22px;
	}
	
	.spRefund {
		display: flex;
    	align-items: center;
    	margin-bottom: 25px; 
	}
	
	.opRefund span {
		font-size: 18px;
		color: #656565;
	}
	
	.form-select {
		font-size: 18px;
		width: 135px;
		margin: 0 10px 0 10px;
	}
	
</style>

<script type="text/javascript" src="<c:url value='/js/space.js'/>"></script>
<script type="text/javascript">
	$(function() {
		// 체크박스 상태가 변경될 때 처리
        $('#flexCheckChecked').change(function () {
            if ($(this).is(':checked')) {
                // 체크박스가 체크되면 openTime과 closeTime을 설정
                $('.openTime').val('00');
                $('.closeTime').val('24');
            } else {
                // 체크박스가 체크 해제되면 select 엘리먼트를 초기화
                $('.openTime').val('00');
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
      	
      	
        $(".area").on("input", function() {
            var isValid = validate_number($(".area").val());

            if (!isValid) {
                alert('숫자만 입력 가능합니다.');
                $(this).val('');
            }
        });
        
      	//공간 층수 정규화
        $(".floor").on("input", function() {
            var isValid = validate_number($(".floor").val());

            if (!isValid) {
                alert('숫자만 입력 가능합니다.');
                $(this).val('');
            }
        });
        
      	//인원 정규화
        $(".txtPerson").on("input", function() {
            var isValid = validate_number($(".txtPerson").val());

            if (!isValid) {
                alert('숫자만 입력 가능합니다.');
                $(this).val('');
            }
        });
        
      	//하단 버튼
		$('#back').click(function() {
			history.back();
		});
        
      	$('#next').click(function() {
    		//공간 면적
    		if ($('#sdArea').val().length < 1) {
    			alert('공간 면적를 입력하세요.');
    			$('#sdArea').focus();
    			
    			scrollMove($('.area'));
    			
    			return false;
    		}

    		//공간 층수
    		if ($('.floor').val().toString().length < 1) {
    			alert('공간 층수를 입력하세요.');
    			$('.floor').focus();
    			
    			scrollMove($('.floor'));
    			
    			return false;
    		}

    		//세부 공간명
    		if ($('.sdName').val().toString().length < 1) {
    			alert('공간 층수를 입력하세요.');
    			$('.sdName').focus();
    			
    			scrollMove($('.sdName'));
    			
    			return false;
    		}
    		
		
		});
      	
	});
	
	//스크롤이동
	function scrollMove(val) {
		var offset = $(val).offset();	//해당 위치 반환
		$("html, body").animate({scrollTop: offset.top - 150}, 200);	//선택한 위치로 이동. 두번째 인자는 시간 0.2초
	}

</script>

<article>
	<div class="main">
		<form name="frmRegi3" method="post" action="<c:url value='/host/registration/registration4' />">
			<div class="heading">
				<span class="hd1">세부 공간 정보를 입력해주세요.</span>
				<span class="hd2">* 필수입력</span>
			</div>
			<!-- 세부 공간명 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>세부 공간명 <span style="color: red;">*</span></span>
				</div>
				<div class="boxContents">
					<div class="spaceDetailName">
						<input type="text" class="sdName" name="sdType" value="" required >
					</div>
				</div>
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
						<select class="form-select openTime" name="sdOpenTime"
							aria-label="Default select example" style="float: left; font-size: 17px;">
						  	<option selected value="00">00시</option>
						  	<option value="01">01시</option>
						  	<option value="02">02시</option>
						  	<option value="03">03시</option>
						  	<option value="04">04시</option>
						  	<option value="05">05시</option>
						  	<option value="06">06시</option>
						  	<option value="07">07시</option>
						  	<option value="08">08시</option>
						  	<option value="09">09시</option>
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
						<select class="form-select closeTime" name="sdCloseTime"
							aria-label="Default select example" style="float: left; font-size: 17px;">
						  	<option value="00">00시</option>
						  	<option value="01">01시</option>
						  	<option value="02">02시</option>
						  	<option value="03">03시</option>
						  	<option value="04">04시</option>
						  	<option value="05">05시</option>
						  	<option value="06">06시</option>
						  	<option value="07">07시</option>
						  	<option value="08">08시</option>
						  	<option value="09">09시</option>
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
						  	<option selected value="24">24시</option>
						</select>
						<span class="txtHour"  style="float: left;">까지</span>
					</div>
					<div class="boxnoti"  style="float: inherit;">
						<img src="<c:url value='/images/pngwing.com.png' />" >
						<p>실제 공간 예약이 가능한 시간을 입력해주세요.</p>
					</div>
				</div>
			</div>
			<div class="heading" style="margin-top: 100px;">
				<span class="hd1">공간 정보를 입력해주세요.</span>
			</div>
			<!-- 공간 면적 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>공간 면적 <span style="color: red;">*</span></span>
				</div>
				<div class="boxContents">
					<div class="spaceArea">
						<input type="text" class="area" maxlength="3" value="" name="sdArea" id="sdArea" >
						<span style="font-size: 20px; color: black; margin-left: 15px; font-weight: bold;">평</span>
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
						<input type="text" class="floor" value="" style="font-size: 18px;" name="spaceLocation"
							placeholder="층수 여부를 입력하세요. ex. 지상 1층, 지하 2층">
					</div>
				</div>
			</div>
			<!-- 편의시설 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>편의시설</span>
					<br><hr>
				</div><br>
				<div class="boxContents">
					<div class="facility">
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facWifi" id="inlineCheckbox1" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox1">와이파이</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facPrinter" id="inlineCheckbox2" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox2">복사/인쇄기</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facChairTable" id="inlineCheckbox3" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox3">의자/테이블</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facSmoke" id="inlineCheckbox4" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox4">흡연가능여부</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facRestRoom" id="inlineCheckbox5" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox5">내부화장실</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facPC" id="inlineCheckbox6" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox6">PC/노트북</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facTV" id="inlineCheckbox7" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox7">TV/프로젝터</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facWhiteBoard" id="inlineCheckbox8" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox8">화이트보드</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facElevator" id="inlineCheckbox9" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox9">엘레베이터</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facParking" id="inlineCheckbox9" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox9">주차가능</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facFood" id="inlineCheckbox10" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox9">음식물섭취가능여부</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facDrink" id="inlineCheckbox11" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox10">주류반입가능여부</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facCook" id="inlineCheckbox12" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox11">취사가능여부</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facPet" id="inlineCheckbox13" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox12">애완동물동반가능여부</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facAudio" id="inlineCheckbox14" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox13">음향장비</label>
						</div>
					</div>
				</div>
			</div>
			<!-- 예약 기준 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>예약 기준 <span style="color: red;">*</span></span>
					<img class="boxIcon" src="https://partner.spacecloud.kr/static/media/info-circle-solid.d9a24d05.svg">
					<div class="tooltip-text">• 최소 수용인원 : 설정한 최소 수용인원 정보를 게스트가 확인할 수 있습니다.<br>
						• 최대 수용인원 : 설정한 최대 수용인원까지 공간 예약을 받을 수 있습니다.
					</div><br><hr>
				</div><br>
				<div class="boxContents">
					<div class="criteria">
						<div class="minPerson" style="float: left; margin-right: 8%;">
							<label class="lbPerson">최소 수용인원</label>
							<input type="text" class="txtPerson" name="sdMinPeople" > 명
						</div>
						<div class="maxPerson" style="float: left;">
							<label class="lbPerson">최대 수용인원</label>
							<input type="text" class="txtPerson" name="sdMaxPeople" > 명
						</div>
					</div>
				</div>
			</div>
			<div class="heading" style="margin-top: 120px;">
				<span class="hd1">환불 기준를 입력해주세요.</span>
			</div>
			<!-- 예약 기준 -->
			<div class="boxForm" style="margin-top: 60px;">
				<div class="boxContents">
					<div class="refund">
						<div class="spRefund">
							<label class="lbRefund">이용 7일전</label>
							<div class="opRefund">
								<span>총 금액의</span>
								<div>
									<select class="form-select" name="refund7Day"
										aria-label="Default select example">
										<option selected value="100%">100%</option>
									</select>
								</div>
								<span>환불</span>
							</div>
						</div>
						<div class="spRefund">
							<label class="lbRefund">이용 6일전</label>
							<div class="opRefund">
								<span>총 금액의</span>
								<select class="form-select" name="refund6Day"
									aria-label="Default select example">
									<option value="100%">100%</option>
									<option value="90%">90%</option>
									<option value="80%">80%</option>
									<option value="70%">70%</option>
									<option value="60%">60%</option>
									<option value="50%">50%</option>
									<option value="40%">40%</option>
									<option value="30%">30%</option>
									<option value="20%">20%</option>
									<option value="10%">10%</option>
									<option selected value="0%">0%</option>
								</select>
								<span>환불</span>
							</div>
						</div>
						<div class="spRefund">
							<label class="lbRefund">이용 5일전</label>
							<div class="opRefund">
								<span>총 금액의</span> 
								<select class="form-select" name="refund5Day"
									aria-label="Default select example">
									<option value="100%">100%</option>
									<option value="90%">90%</option>
									<option value="80%">80%</option>
									<option value="70%">70%</option>
									<option value="60%">60%</option>
									<option value="50%">50%</option>
									<option value="40%">40%</option>
									<option value="30%">30%</option>
									<option value="20%">20%</option>
									<option value="10%">10%</option>
									<option selected value="0%">0%</option>
								</select>
								<span>환불</span>
							</div>
						</div>
						<div class="spRefund">
							<label class="lbRefund">이용 4일전</label>
							<div class="opRefund">
								<span>총 금액의</span> 
								<select class="form-select" name="refund4Day"
									aria-label="Default select example">
									<option value="100%">100%</option>
									<option value="90%">90%</option>
									<option value="80%">80%</option>
									<option value="70%">70%</option>
									<option value="60%">60%</option>
									<option value="50%">50%</option>
									<option value="40%">40%</option>
									<option value="30%">30%</option>
									<option value="20%">20%</option>
									<option value="10%">10%</option>
									<option selected value="0%">0%</option>
								</select>
								<span>환불</span>
							</div>
						</div>
						<div class="spRefund">
							<label class="lbRefund">이용 3일전</label>
							<div class="opRefund">
								<span>총 금액의</span> 
								<select class="form-select" name="refund3Day"
									aria-label="Default select example">
									<option value="100%">100%</option>
									<option value="90%">90%</option>
									<option value="80%">80%</option>
									<option value="70%">70%</option>
									<option value="60%">60%</option>
									<option value="50%">50%</option>
									<option value="40%">40%</option>
									<option value="30%">30%</option>
									<option value="20%">20%</option>
									<option value="10%">10%</option>
									<option selected value="0%">0%</option>
								</select>
								<span>환불</span>
							</div>
						</div>
						<div class="spRefund">
							<label class="lbRefund">이용 2일전</label>
							<div class="opRefund">
								<span>총 금액의</span> 
								<select class="form-select" name="refund2Day"
									aria-label="Default select example">
									<option value="100%">100%</option>
									<option value="90%">90%</option>
									<option value="80%">80%</option>
									<option value="70%">70%</option>
									<option value="60%">60%</option>
									<option value="50%">50%</option>
									<option value="40%">40%</option>
									<option value="30%">30%</option>
									<option value="20%">20%</option>
									<option value="10%">10%</option>
									<option selected value="0%">0%</option>
								</select>
								<span>환불</span>
							</div>
						</div>
						<div class="spRefund">
							<label class="lbRefund">이용 전날</label>
							<div class="opRefund">
								<span>총 금액의</span> 
								<select class="form-select" name="refund1Day"
									aria-label="Default select example">
									<option value="100%">100%</option>
									<option value="90%">90%</option>
									<option value="80%">80%</option>
									<option value="70%">70%</option>
									<option value="60%">60%</option>
									<option value="50%">50%</option>
									<option value="40%">40%</option>
									<option value="30%">30%</option>
									<option value="20%">20%</option>
									<option value="10%">10%</option>
									<option selected value="0%">0%</option>
								</select>
								<span>환불</span>
							</div>
						</div>
						<div class="spRefund">
							<label class="lbRefund">이용 당일</label>
							<div class="opRefund">
								<span>총 금액의</span> 
								<select class="form-select" name="refundDay"
									aria-label="Default select example">
									<option selected value="0%">0%</option>
								</select>
								<span>환불</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="heading" style="margin-top: 80px;">
				<span class="hd1">세부 공간의 예약단위를 입력해주세요.</span>
				<span class="hd2">* 필수선택</span>
				<div class="boxnoti">
					<img src="<c:url value='/images/pngwing.com.png' />" >
					<p>시간단위, 패키지단위 중 최소 1개 예약단위 체크박스를 설정해주세요.</p>
				</div>
			</div>
			<!-- 세부 공간명 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>세부 공간명 <span style="color: red;">*</span></span>
				</div>
				<div class="boxContents">
					<div class="spaceDetailName">
						<input type="text" class="sdName" name="sdType" value="" required >
					</div>
				</div>
			</div>

			<div class="btBar">
				<button type="button" class="btn btn-secondary" id="back" >이전</button>
				<button type="submit" class="btn btn-warning" id="next" >다음</button>
			</div>
			
			<input type="text" name="spaceName" value="${spaceVo.spaceName }">
			<input type="text" name="spaceTypeName" value="${spaceTypeVO.spaceTypeName } }">
			<input type="text" name="spaceIntro" value="${spaceVo.spaceIntro } }">
			<input type="text" name="spaceInfo" value="${spaceVo.spaceInfo } }">
			<input type="text" name="spaceTag" value="${spaceVo.spaceTag } }">
			<input type="text" name="spaceFacility" value="${spaceVo.spaceFacility } }">
			<input type="text" name="spaceWarn" value="${spaceVo.spaceWarn } }">
		</form>
	</div>
</article>


</body>
</html>