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
	
	.area {
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
	
	input[type="checkbox"] {
		width: 20px;
		height: 20px;
		margin: 0 10px 5px 0;
	}
	
	.form-check-label {
		font-size: 20px;
		color: black;
	}
	
	.form-check.form-check-inline {
		margin: 0 10px 25px 0;
	}
	
	.criteria {
		font-weight: bold;
		font-size: 20px;
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
	
</style>

<article>
	<div class="main">
		<form name="frmRegi3" method="post" action="<c:url value='/host/registration/registration4' />">
			<div class="heading">
				<span class="hd1">공간의 정보를 입력해주세요.</span>
				<span class="hd2">* 필수입력</span>
			</div>
			<!-- 공간 층수 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>공간 면적 <span style="color: red;">*</span></span>
				</div>
				<div class="boxContents">
					<div class="spaceArea">
						<input type="text" class="area" maxlength="3" value="" >
						<span style="font-size: 20px; color: black; margin-left: 15px; font-weight: bold;">평</span>
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
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
						  	<label class="form-check-label" for="inlineCheckbox1">와이파이</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
						  	<label class="form-check-label" for="inlineCheckbox2">복사/인쇄기</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
						  	<label class="form-check-label" for="inlineCheckbox3">의자/테이블</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox4" value="option4">
						  	<label class="form-check-label" for="inlineCheckbox4">흡연가능여부</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox5" value="option5">
						  	<label class="form-check-label" for="inlineCheckbox5">내부화장실</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox6" value="option6">
						  	<label class="form-check-label" for="inlineCheckbox6">PC/노트북</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox7" value="option7">
						  	<label class="form-check-label" for="inlineCheckbox7">TV/프로젝터</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox8" value="option8">
						  	<label class="form-check-label" for="inlineCheckbox8">화이트보드</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox9" value="option9">
						  	<label class="form-check-label" for="inlineCheckbox9">음식물섭취가능여부</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox10" value="option10">
						  	<label class="form-check-label" for="inlineCheckbox10">주유반입가능여부</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox11" value="option11">
						  	<label class="form-check-label" for="inlineCheckbox11">취사가능여부</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox12" value="option12">
						  	<label class="form-check-label" for="inlineCheckbox12">애완동물동반가능여부</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox13" value="option13">
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
							<input type="text" class="txtPerson" > 명
						</div>
						<div class="maxPerson" style="float: left;">
							<label class="lbPerson">최대 수용인원</label>
							<input type="text" class="txtPerson" > 명
						</div>
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
		//공간 면적 정규화
		if (!validate_sdArea($('.area').val())) {
			$('.area').focus();
			
			scrollMove('.area');
			
			return false;
		}
        
      	//하단 버튼
		$('#back').click(function() {
			history.back();
		});
        
      	$('#next').click(function() {
      		
			
			
			$('form[name=frmRegi2]').prop('action', "<c:url value='/host/registration/registration5' />");
			$('form[name=frmRegi2]').submit();
		
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