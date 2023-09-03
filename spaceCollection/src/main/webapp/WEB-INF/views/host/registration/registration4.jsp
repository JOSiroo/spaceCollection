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
	
	.area, .spTel, .floor {
		width: 90%;
		height: 50px;
		border: 1px solid #b7b7b7;
		font-size: 20px;
		margin-top: 15px;
		padding: 8px 8px 8px 8px;
		resize: none;
		text-align: right;
		font-weight: bold;
	}
	
	
	
</style>

<script type="text/javascript" src="<c:url value='/js/space.js'/>"></script>
<script type="text/javascript">
	$(function() {
		
        
      	//하단 버튼
		$('#back').click(function() {
			history.back();
		});
        
      	$('#next').click(function() {
      		
    		
		
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
		<form name="frmRegi4" method="post" action="<c:url value='/host/registration/registration5' />">
			<div class="heading">
				<span class="hd1">공간의 정보를 입력해주세요.</span>
				<span class="hd2">* 필수입력</span>
			</div>
			<!-- 공간 대표전화 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>대표전화 <span style="color: red;">*</span></span>
				</div>
				<div class="boxContents">
					<div class="spacepTel">
						<input type="text" class="spTel" value="" required >
					</div>
					<div class="boxnoti">
						<img src="<c:url value='/images/pngwing.com.png' />" >
						<p>숫자만 입력해주세요.</p>
					</div>
				</div>
			</div>
			<!-- 공간 면적 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>공간 면적 <span style="color: red;">*</span></span>
				</div>
				<div class="boxContents">
					<div class="spaceArea">
						<input type="number" class="area" maxlength="3" value="" >
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
						<input type="text" class="floor" value="" style="font-size: 18px;"
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
							<input type="number" class="txtPerson" > 명
						</div>
						<div class="maxPerson" style="float: left;">
							<label class="lbPerson">최대 수용인원</label>
							<input type="number" class="txtPerson" > 명
						</div>
					</div>
				</div>
			</div>
			
			<div class="btBar">
				<button type="button" class="btn btn-secondary" id="back" >이전</button>
				<button type="submit" class="btn btn-warning" id="next" >다음</button>
			</div>
			
		</form>
	</div>
</article>

</body>
</html>