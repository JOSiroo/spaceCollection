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

	.main {width: 1000px;}
	
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
		font-size: 17px;
		font-weight: bold;
		color: black;
		margin-bottom: 15px;
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
	
	.spText {
		width: 100%;
		height: 50px;
		border: 1px solid #b7b7b7;
		font-size: 15px;
		margin-top: 15px;
		padding: 8px 8px 8px 8px;
		resize: none;
	}
	
	.spText::placeholder {
		color: #b7b7b7;
		font-weight: bold;
	}
	
	.boxnoti {
		margin: 20px 0 0 0;
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
	
	.typeTip {margin-top: 15px;}
	
	.typeTip img {
		width: 15px;
		height: 15px;
		float: left;
		margin-top: 2px;
	}
	
	.typeTip p {
		margin: 0 0 0 25px;
		font-size: 14px;
		color: #7b7b7b;
	}
	
	.typeTitle {
		width: 100px;
		height: 40px;
		background: #656565;
		color: white;
		border-radius: 1rem;
		font-size: 12px;
		border: 0;
		margin: 10px 20px 10px 0;
	}
	
	.typeSub {
		width: 100px;
		height: 40px;
		border-radius: 1rem;
		font-size: 12px;
		border: 0;
		background: white;
		color: #656565;
		box-shadow: 2px 2px 8px;
		margin-left: 10px;
	}
	
	.subTitle {
		float: right;
		font-size: 14px;
		color: #767676;
	}
	
	.btAdd {
		float: right;
		margin-top: 15px;
		width: 130px;
		height: 50px;
		background: #704de4;
		color: white;
		border: 0;
		font-weight: bold;
	}
	
	.spTag {
		width: 100%;
		height: 50px;
		border: 1px solid #b7b7b7;
		font-size: 15px;
		margin-top: 15px;
		padding: 8px 8px 8px 8px;
		resize: none;
		background: white;
	}
	
	.spaceFacility {
		display: flex;
	}
	
	.spFacility {
		width: 850px;
		height: 150px;
		border: 1px solid #b7b7b7;
		font-size: 15px;
		margin-top: 15px;
		padding: 8px 8px 8px 8px;
		resize: none;
		background: white;
	}
	
	.spFa {
		color: #b7b7b7;
		font-weight: bold;
	}
	
	.spZip1 {
		width: 850px;
		height: 150px;
		border: 1px solid #b7b7b7;
		font-size: 15px;
		margin-top: 15px;
		padding: 8px 8px 8px 8px;
		resize: none;
		background: white;
	}
	
	.spZip2 {
		width: 850px;
		height: 150px;
		border: 1px solid #b7b7b7;
		font-size: 15px;
		margin-top: 15px;
		padding: 8px 8px 8px 8px;
		resize: none;
		background: white;
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
</style>


<article>
	<div class="main">
		<form name="frmRegi2" method="post" action="<c:url value='/host/registration/registration2' />">
			<div class="heading">
				<span class="hd1">공간 정보를 입력해주세요.</span>
				<span class="hd2">* 필수입력</span>
			</div>
			<!-- 공간명 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>공간명 <span style="color: red;">*</span></span>
					<span class="subTitle">0자/18자</span>
					<img class="boxIcon" src="https://partner.spacecloud.kr/static/media/info-circle-solid.d9a24d05.svg">
					<div class="tooltip-text">
						• 다른 공간과 구별될 수 있는 공간의 고유 업체명(브랜드명)을 입력해주세요! <br>
						※ 검수 반려 사유 : 업체명이 확인 되지 않는 공간명 <br><br>
						(예시) 인디워커스 하이브(o), 홍대 뷰가 예쁜 파티룸(x), 강남 회의실(x)
					</div>
				</div>
				<div class="boxContents">
					<div class="spaceName">
						<input type="text" class="spText" value=""
							placeholder=" 고유 업체명을 입력해주세요. (예시) 인디워커스 하이브 회의실" maxlength="18">
					</div>
					<div class="boxnoti">
						<img src="<c:url value='/images/pngwing.com.png' />" >
						<p>사용 가능한 특수문자 : ( ), [ ], -, .(마침표), ,(쉼표)</p>
					</div>
				</div>
			</div>
			<!-- 공간 유형 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>공간 유형 <span style="color: red;">*</span></span>
					<span class="subTitle" style="color: red;">필수선택</span>
					<img class="boxIcon" src="https://partner.spacecloud.kr/static/media/info-circle-solid.d9a24d05.svg">
					<div class="tooltip-text">
						• 모임/연습/촬영/행사/캠핑으로 구분된 용도 중 1개의 용도 안에서만 유형을 선택할 수 있어요! <br>
						• 1개의 용도 안에서 등록하는 공간에 적절한 유형을 모두 선택해주세요. <br>
						• 검수 신청 후, 유형변경은 고객센터를 통해서만 가능합니다. <br>
						※ 검수 반려 사유 : 공간 상세 소개/이미지에서 선택한 유형에 대한 사용성이 충분히 확인되지 않는 경우
					</div>
					<div class="typeTip">
						<img src="https://partner.spacecloud.kr/static/media/exclamation_mark-gray.7fb4cd60.svg">
						<div class="typeTip2">
							<p>빠른 검수 통과를 위해 반드시 공간에 적합한 유형을 선택해주세요!<br>
								부적합한 유형 선택시 검수 반려 사유가 됩니다.</p>
						</div>
					</div>
				</div>
				<div class="boxContents">
					<div class="spaceType">
						<c:forEach var="allVo" items="${type }">
							<input type="button" class="typeTitle" value="${allVo.spaceCategoryVo.categoryName }">
							<c:forEach var="list" items="${allVo.spaceTypeList }" >
								<input type="button" class="typeSub" value="${list.spaceTypeName }" >
							</c:forEach><br>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- 공간 한 줄 소개 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>공간 한 줄 소개 <span style="color: red;">*</span></span>
					<span class="subTitle">0자/27자</span>
					<img class="boxIcon" src="https://partner.spacecloud.kr/static/media/info-circle-solid.d9a24d05.svg">
					<div class="tooltip-text">
						아래 항목중에 해당 사항이 있는 내용으로 한 줄 소개를 매력적으로 작성해보세요!<br>
						• 유니크한 인테리어 컨셉<br>• 이용가능한 특별 장비<br>• 합리적인 이용 단가 등<br><br>
						(예시)<br>층고 4.5m 살수차 진입 가능 대형 촬영스튜디오<br>
					</div>
				</div>
				<div class="boxContents">
					<div class="spaceIntro">
						<input type="text" class="spText" value=""
							placeholder=" 공간의 특장점을 한 문장으로 작성해주세요." maxlength="27">
					</div>
				</div>
			</div>
			<!-- 공간 소개 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>공간 소개 <span style="color: red;">*</span></span>
					<span class="subTitle">0자/500자<span style="color: #704de4;">(최소 20자)</span></span>
					<img class="boxIcon" src="https://partner.spacecloud.kr/static/media/info-circle-solid.d9a24d05.svg">
					<div class="tooltip-text">
						온라인 예약을 선호하는 게스트들은 공간에 대한 정보와 이미지만으로 예약 여부를 결정합니다.<br>
						아래 항목을 참고해 게스트들에게 공간의 매력과 이용 방식을 자세히 소개해보세요!<br><br>
						• 공간에 대한 콘셉/브랜딩 스토리<br>• 공간 이용 정보<br>
						 - 공간 이용 가능 인원, 진행 가능한 행사 및 규모, 이용 가능한 시설 및 이용방식, 공간 이용 시간 등<br>
						• 장비나 시설 이용에 대한 추가 비용 정보<br> - 공간 세부 상품 옵션 설정에서 해당 금액을 청구할 수 있어요!<br>
						• 공간의 차별점 (해당 사항만)<br> - 지리적 장점, 이용 가능한 서비스, 특별한 콘텐츠 등<br>
						• 현재 진행중인 이벤트 내용 등<br><br>※ 검수 반려 사유<br>
						• 직거래 유도, 타 예약 서비스에 대한 안내, 개인 정보가 표기된 경우<br>
						• 공간 이용 외 다른 재화/서비스 필수 구매인 경우<br>
					</div>
				</div>
				<div class="boxContents">
					<div class="spaceInfo">
						<textarea class="spText" name=""
							placeholder=" 게스트들에게 필요한 공간 정보를 상세하게 소개해주세요. 툴팁을 클릭해 작성 가이드를 확인할 수 있습니다." 
							maxlength="500" rows="6" ></textarea>
					</div>
				</div>
			</div>
			<!-- 공간 태그 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>공간 태그 <span style="color: red;">*</span></span>
					<span class="subTitle">최대 5개</span>
				</div>
				<div class="boxContents">
					<div class="spaceTag">
						<input type="text" class="spText" value="" style="width: 850px;"
							placeholder=" 게스트들이 선호할만한 주요 특징들을 키워드로 입력해주세요. (최대 5개)" maxlength="27">
						<input type="button" class="btAdd" value="추가 ▽">
						<div class="spTag">
							<span>#기억<span>✕</span></span>
						</div>
					</div>
				</div>
			</div>
			<!-- 시설 안내 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>시설 안내 <span style="color: red;">*</span></span>
					<span class="subTitle">0자/100자</span>
				</div>
				<div class="boxContents">
					<div class="spaceTag">
						<input type="text" class="spText" value="" style="width: 850px;"
							placeholder=" 이용 가능한 시설에 대해 최대한 상세하게 입력해주세요. (최대 10개)" maxlength="27">
						<input type="button" class="btAdd" value="추가 ▽">
						<div class="spTag"></div>
					</div>
				</div>
			</div>
			<!-- 예약 시 주의사항 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>예약 시 주의사항 <span style="color: red;">*</span></span>
					<span class="subTitle">0자/100자</span>
				</div>
				<div class="boxContents">
					<div class="spaceTag">
						<input type="text" class="spText" value="" style="width: 850px;"
							placeholder=" 이용 가능한 시설에 대해 최대한 상세하게 입력해주세요. (최대 10개)" maxlength="27">
						<input type="button" class="btAdd" value="추가 ▽">
						<div class="spTag"></div>
					</div>
				</div>
			</div>
			<!-- 대표 이미지 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>대표 이미지 <span style="color: red;">*</span></span>
					<span class="subTitle">최대 3MB</span>
					<img class="boxIcon" src="https://partner.spacecloud.kr/static/media/info-circle-solid.d9a24d05.svg">
					<div class="tooltip-text">
						대표 이미지는 예약/이용이 가능한 공간의 전체 이미지가 잘 보이는 사진으로 등록해주세요!<br><br>
						※ 검수 반려 이미지<br>• 인물, 텍스트가 포함된 이미지<br>• 노출 등으로 제 3자에게 수치심을 주는 이미지<br>
						• 지도, 평면도, 약도 등의 이미지<br>• 홍보물/포스터, 이미지/도형 등이 합성된 편집 이미지<br>
						• 내용이 식별되지 않는 이미지<br>
					</div>
				</div>
				<div class="boxContents">
					<div class="spaceFacility">
						<div class="spFacility">
							<span class="spFa">이미지 파일을 추가해 주세요.</span>
						</div>
						<input type="button" class="btAdd" value="파일첨부" style="margin-left: 20px;">
					</div>
				</div>
			</div>
			<!-- 이미지 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>이미지 <span style="color: red;">*</span></span>
					<span class="subTitle">한 장당 최대 3MB<span style="color: #704de4;">(최대 10장)</span></span>
					<img class="boxIcon" src="https://partner.spacecloud.kr/static/media/info-circle-solid.d9a24d05.svg">
					<div class="tooltip-text">
						대표 이미지는 예약/이용이 가능한 공간의 전체 이미지가 잘 보이는 사진으로 등록해주세요!<br><br>
						※ 검수 반려 이미지<br>• 인물, 텍스트가 포함된 이미지<br>• 노출 등으로 제 3자에게 수치심을 주는 이미지<br>
						• 지도, 평면도, 약도 등의 이미지<br>• 홍보물/포스터, 이미지/도형 등이 합성된 편집 이미지<br>
						• 내용이 식별되지 않는 이미지<br>
					</div>
				</div>
				<div class="boxContents">
					<div class="spaceFacility">
						<div class="spFacility" style="height: 50px; padding-top: 15px;">
							<span class="spFa">이미지 파일을 추가해 주세요.</span>
						</div>
						<input type="button" class="btAdd" value="파일첨부" style="margin-left: 20px;">
					</div>
				</div>
			</div>
			<!-- 주소(위치) -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>주소(위치) <span style="color: red;">*</span></span>
					<div class="boxnoti">
						<img src="<c:url value='/images/pngwing.com.png' />" >
						<p>공간 주소는 최초 등록 이후 직접 변경할 수 없습니다. 고객센터를 통해 주소 변경을 요청해주세요.</p>
					</div>
				</div>
				<div class="boxContents">
					<div class="spaceZip">
						<input type="button" class="btAdd" value="주소등록" style="margin: 0 0 10px 20px;">
						<div class="spZip1" style="height: 50px; padding-top: 15px;">
							<span class="spFa">실제 서비스되는 공간의 주소를 입력해주세요.</span>
						</div>
						<div class="spZip2" style="height: 50px; padding-top: 15px; width: 100%;">
							<span class="spFa">상세 주소</span>
						</div>
					</div>
				</div>
			</div>
			<!-- 위치정보 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>위치정보 <span style="color: red;">*</span></span>
					<span class="subTitle">0자/20자</span>
					<img class="boxIcon" src="https://partner.spacecloud.kr/static/media/info-circle-solid.d9a24d05.svg">
					<div class="tooltip-text">
						• 공간을 찾아오기 쉽도록 랜드마크, 역 등에서<br>
						얼마나 걸리는 지를 안내해 주세요.<br><br>(예시) 홍대입구역/OO마트/OO학교 도보 1분거리
					</div>
				</div>
				<div class="boxContents">
					<div class="spaceInfo">
						<input type="text" class="spText" value=""
							placeholder=" ex. 동대문역사공원역 도본 1분 거리" maxlength="27">
					</div>
					<div class="boxnoti">
						<img src="<c:url value='/images/pngwing.com.png' />" >
						<p>작성하신 위치정보는 검색에 영향을 미치지 않습니다.</p>
					</div>
					<div class="boxnoti">
						<img src="<c:url value='/images/pngwing.com.png' />" >
						<p>공간 주소를 입력하시면 반려 처리됩니다. (ex. 강남구 대치동, 삼성로 141 등)</p>
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

<script type="text/javascript" src="<c:url value='/js/space.js'/>"></script>
<script type="text/javascript">
	$(function() {
		//사용자가 입력한 글자수 표시
		$('.spText').on('input', function() {
			var txtLen = $(this).val().length;
			var maxLen = parseInt($(this).attr('maxlength'));
			var subTxt = $(this).closest('.boxForm').find('.subTitle');
			
			subTxt.text(txtLen + '자/' + maxLen + '자');
		});
		
		$('.typeTitle').prop('disabled', true); // 공간타입 타이틀버튼 비활성화
		
		//버튼 누르면 색 변환
		$('.typeSub').click(function() {
			var spaceType = $(this).closest('.spaceType');
		    
		    // 모든 typeSub 버튼을 초기화
		    spaceType.find('.typeSub').css('background', 'white');
		    
		    // 모든 typeTitle 버튼을 초기화
		    spaceType.find('.typeTitle').css('background', '#656565');
		    
		    // 클릭한 버튼의 배경색 변경
		    $(this).css('background', '#ffd014');
		    
		    // 클릭한 버튼의 상위에 있는 typeTitle의 배경색 변경
		    $(this).prevAll('.typeTitle').first().css('background', '#704de4');
		});
		
		$('.btAdd').click(function() {
	        var inputValue = $('.spText').val(); // 입력한 값을 가져옵니다
	        
	        if (inputValue.trim() !== '') { // 값이 공백이 아닌 경우에만 추가
	            if ($('.spTag').children().length < 5) { // 최대 5개까지 추가
	                var newTag = $('<span class="tag">' + inputValue + '<span class="tagClose">✕</span></span>');
	                $('.spTag').append(newTag);
	                $('.spText').val(''); // 입력 필드 초기화
	            } else {
	                alert('최대 5개까지만 입력 가능합니다.');
	            }
	        }
	    });

	    // 태그 삭제
	    $('.spTag').on('click', '.tagClose', function() {
	        $(this).parent().remove();
	    });
		
		
		//태그 확인 숨기기
		$('.spTag').hide();
		
		$('.btAdd').click(function() {
	    	var tagVal = $(this).prev().val();
	    	
	    	if (tagVal.trim() !== '') {
	    		$('.spTag').show();
	    		var tagAdd = $('<span class="tag">' + inputValue + '<span class="tagClose">✕</span></span>');
	    		$('.spTag').append(newTag);
                $('.spText').val(''); // 입력 필드 초기화
	    	} else {
	    		alert('태그를 입력해주세요.');
	    	}
	    });

	    // 태그 삭제
	    $('.spTag').on('click', '.tagClose', function() {
	        $(this).parent().remove();
	    });
		
		$('#back').click(function() {
			history.back();
		});
		
		$('#next').click(function() {
			
			//필수 입력
			//공간명
			if ($('.spaceName').find($('.spText')).val() < 1) {
				alert('공간명을 입력하세요.');
				$('.spaceName').find($('.spText')).focus();
				
				var offset = $('.spaceName').offset();	//해당 위치 반환
				$("html, body").animate({scrollTop: offset.top},400); // 선택한 위치로 이동. 두번째 인자는 0.4초를 의미한다.
				
				return false;
			}
			
			//공간 타입
			if ($('.typeTip').find($('.spText')).val() < 1) {
				alert('공간명을 입력하세요.');
				$('.spaceName').find($('.spText')).focus();
				
				var offset = $('.spaceName').offset();
				$("html, body").animate({scrollTop: offset.top},400);
				
				return false;
			}
			
			//공간명 정규화
			if (!validate_spaceName($('.spText').val())) {
				alert('사용 가능한 특수문자는 ( ), [ ], -, .(마침표), ,(쉼표) 입니다.');
				$('.spText').focus();
				
				var offset = $('.spaceName').offset();
				$("html, body").animate({scrollTop: offset.top},400); 
				
				return false;
			}
			
			$('form[name=frmRegi2]').prop('action', "<c:url value='/host/registration/registration3' />");
			$('form[name=frmRegi2]').submit();
		});
	});
	
	
</script>

</body>
</html>