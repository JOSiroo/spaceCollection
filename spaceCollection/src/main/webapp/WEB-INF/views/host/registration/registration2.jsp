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
	
	.spText, .spBusiness, .spTel, .floor {
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
	
	.typeSub.checked {
		background: #ffd014;
	}
	
	.subTitle {
		float: right;
		font-size: 14px;
		color: #767676;
	}
	
	.subTitleTag {
		float: right;
		font-size: 14px;
		color: #767676;
	}
	
	.btAdd {
		float: right;
		margin-top: 15px;
		width: 130px;
		height: 50px;
		background: #704de4 !important;
		color: white;
		border: 0;
		font-weight: bold;
		border-radius: 0;
	}
	
	.spTag {
		width: 100%;
		border: 1px solid #b7b7b7;
		font-size: 16px;
		margin-top: 15px;
		padding: 13px 8px 8px 8px;
		resize: none;
		background: white;
		color: black;
		font-weight: bold;
		display: inline-block;
		min-height: 50px;
	}
	
	.spaceImg {
		display: flex;
	}
	
	.spImg {
		width: 850px;
		min-height: 50px;
		border: 1px solid #b7b7b7;
		font-size: 15px;
		margin-top: 15px;
		padding: 8px 8px 8px 8px;
		resize: none;
		display: inline-block;
		background: white;
	}
	
	.inner {
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
	
	.imgClose {
		width: 25px;
		height: 25px;
	}
	
	.tagRe {
		display: inline-block;
		margin-left: 8px;
	}
	
	.file {
		margin-left: 20px;
		text-align: center;
		padding-top: 16px;
	}
	
	.btBox {
		width: 130px;
		height: 50px;
	}
	
	.imgBox {
		width: 122px;
		height: 122px;
		margin-right: 8px;
	}
	
	.imgBox img {
		width: 122px;
		height: 122px;
	}
	
	.modal-content {
		width: 850px;
		min-height: 500px;
		
	}
	
	.modal-header {
		background: #704de4;
		font-weight: bold;
	}
	
	.spRefund {
		display: flex;
    	align-items: center;
    	margin-bottom: 25px; 
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
	
	.opRefund span {
		font-size: 18px;
		color: #656565;
	}
	
</style>

<script type="text/javascript" src="<c:url value='/js/space.js'/>"></script>
<script type="text/javascript">
	$(function() {
		//공간 이름 정규화
        $(".spText.name").on("input", function() {
            var isValid = validate_spaceName($(".spText.name").val());

            if (!isValid) {
                alert('사용 가능한 특수문자는 ( ), [ ], -, .(마침표), ,(쉼표) 입니다.');
            }
        });
		
      	//사업자 등록번호 정규화
        $(".spBusiness").on("input", function() {
            var isValid = validate_business($(".spBusiness").val());

            if (!isValid) {
                alert('숫자와 -만 입력 가능합니다.');
                $(this).val('');
            }
        });
      	
      	//대표 전화번호 정규화
        $(".spTel").on("input", function() {
            var isValid = validate_number($(this).val());

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

		    // 모든 버튼에서 클래스 제거
		    spaceType.find('.typeSub').removeClass('checked');

		    // 클릭한 버튼에 클래스 추가
		    $(this).addClass('checked');

		    // 모든 typeTitle 버튼을 초기화
		    spaceType.find('.typeTitle').css('background', '#656565');
		    
		    // 클릭한 버튼의 상위에 있는 typeTitle의 배경색 변경
		    $(this).prevAll('.typeTitle').first().css('background', '#704de4');
		    
		});
		
		//태그 확인 숨기기
		$('.spTag').hide();
		
		// 사용자가 입력한 값을 저장할 배열
        var tag = [];
		
        // 버튼을 클릭할 때 이벤트 핸들러를 등록합니다.
        $('.btAdd.tag').click(function() {
        	var inputValue = $(this).siblings('.spText').val();
		    var tagContainer = $(this).siblings('.spTag');
			
		    if (inputValue.length < 1) {
		    	alert('내용을 입력해주세요.');
		    } else {
		    	// 입력값이 비어 있지 않고, 최대 5개까지만 저장하도록 합니다.
	            if (inputValue && tag.length < 5) {
	                tagContainer.show();
	                
	                // 입력값을 배열에 저장
	                tag.push(inputValue);
	                
	             	// 화면에 입력값을 표시할 부분을 업데이트합니다.
	        	    tagContainer.append('<span class="tagRe"> # ' + inputValue + ' <span class="tagClose"> <img class="imgClose" src="<c:url value='/images/btClose.png' />"/></span></span>');
	             	
	        		// 입력값을 String으로 변환합니다.
	        	    var inputValueString = tag.join('/');

	        		// hidden input에 값을 설정합니다.
	        	    $('#spaceTag').val(inputValueString);

	        		// 입력 필드 초기화
	                $(this).siblings('.spText').val('');
	                
	            } else {
	                alert('태그는 최대 5개까지 입력할 수 있습니다.');
	            }
		    }
		    
        });
	     
		// 사용자가 입력한 값을 저장할 배열
        var facility = [];

        // 버튼을 클릭할 때 이벤트 핸들러를 등록합니다.
        $('.btAdd.fa').click(function() {
        	var inputValue = $(this).siblings('.spText').val();
		    var tagContainer = $(this).siblings('.spTag');
		    var currentTagCount = tagContainer.find('.tagRe').length;

		    if (inputValue.length < 1) {
		    	alert('내용을 입력해주세요.');
		    } else {
		    	// 입력값이 비어 있지 않고, 최대 5개까지만 저장하도록 합니다.
	            if (inputValue && facility.length < 10) {
	                tagContainer.show();
	                
	                // 입력값을 배열에 저장
	                facility.push(inputValue);
	                
	             	// 화면에 입력값을 표시할 부분을 업데이트합니다.
	        	    tagContainer.append('<span class="tagRe"> ' + (currentTagCount + 1) + '. '  + inputValue 
	        	    		+ ' <span class="tagClose"> <img class="imgClose" src="<c:url value='/images/btClose.png' />"/></span></span>');
	             	
	        		// 입력값을 String으로 변환합니다.
	        	    var inputValueString = facility.join('||');

	        		// hidden input에 값을 설정합니다.
	        	    $('#spaceFacility').val(inputValueString);

	        		// 입력 필드 초기화
	                $(this).siblings('.spText').val('');
	                
	            } else {
	                alert('태그는 최대 10개까지 입력할 수 있습니다.');
	            }
			}
		    
        });
	     
		// 사용자가 입력한 값을 저장할 배열
        var warn = [];

        // 버튼을 클릭할 때 이벤트 핸들러를 등록합니다.
        $('.btAdd.pre').click(function() {
        	var inputValue = $(this).siblings('.spText').val();
		    var tagContainer = $(this).siblings('.spTag');
		    var currentTagCount = tagContainer.find('.tagRe').length;

		    if (inputValue.length < 1) {
		    	alert('내용을 입력해주세요.');
		    } else {
		    	// 입력값이 비어 있지 않고, 최대 5개까지만 저장하도록 합니다.
	            if (inputValue && warn.length < 10) {
	                tagContainer.show();
	                
	                // 입력값을 배열에 저장
	                warn.push(inputValue);
	                
	             	// 화면에 입력값을 표시할 부분을 업데이트합니다.
	        	    tagContainer.append('<span class="tagRe"> ' + (currentTagCount + 1) + '. ' + inputValue 
	        	    		+ ' <span class="tagClose"> <img class="imgClose" src="<c:url value='/images/btClose.png' />"/></span></span>');
	             	
	        		// 입력값을 String으로 변환합니다.
	        	    var inputValueString = warn.join('||');

	        		// hidden input에 값을 설정합니다.
	        	    $('#spaceWarn').val(inputValueString);

	        		// 입력 필드 초기화
	                $(this).siblings('.spText').val('');
	                
	            } else {
	                alert('태그는 최대 10개까지 입력할 수 있습니다.');
	            }
		    }
            
        });
		
		/* $('.btAdd.fa, .btAdd.pre').click(function() {
			var inputValue = $(this).siblings('.spText').val();
		    var tagContainer = $(this).siblings('.spTag');
		    
		    var currentTagCount = tagContainer.find('.tagRe').length;
		    
		    if (inputValue && currentTagCount < 10) {
		    	tagContainer.show();
		    	         
		    	var tagHTML = '<span class="tagRe"> ' + (currentTagCount + 1) + '. ' + inputValue + 
		    		' <span class="tagClose"> <img class="imgClose" src="<c:url value='/images/btClose.png' />"/></span></span>';
		    	tagContainer.append(tagHTML);
		    	$(this).siblings('.spText').val('');
		 	} else {
		    	alert('태그는 최대 10개까지 입력할 수 있습니다.');
		    }
		 }); */
		
		// 이미지를 누르면 해당 태그 제거
		$('.spTag').on('click', '.tagClose', function() {
			$(this).closest('.tagRe').remove();
		});
		
		//메인 이미지 첨부
		$('.btAdd.file.main').click(function() {
		    //기존에 있던 이미지 지우기
		    $('.spImg.main').empty().append('<span class="inner">이미지 파일을 추가해 주세요.</span>');
		    $('input[type="file"]').val('');
		});

		$('#mainImage').change(function() {
		  	var file = this.files[0];
			if (file) {
		      	var reader = new FileReader();
		      	reader.onload = function(e) {
		        	$('.spImg.main').empty().append('<div class="imgBox"><img src="' + e.target.result + '"></div>');
		      	};
		      	reader.readAsDataURL(file);
		    } else {
		        // 파일 선택이 취소되거나 없을 경우 기본 이미지 또는 안내 메시지를 보여줄 수 있음
		        $('.spImg.main').empty().append('<span class="inner">이미지 파일을 추가해 주세요.</span>');
		    }
		});
		
	    
	    //하단 버튼
		$('#back').click(function() {
			history.back();
		});
		
		$('#next').click(function() {
			//필수 입력
			//공간명
			if ($('.spaceName').find($('.spText')).val() < 1) {
				alert('공간명을 입력하세요.');
				$('.spaceName').find($('.spText')).focus();
				
				scrollMove('.spaceName');
				
				return false;
			}
			
			//공간 타입
            if ($('.typeSub.checked').length === 0) {
                alert("적어도 하나 이상의 유형을 선택해주세요.");
                
                scrollMove('.spaceType');
                
                return false;
            }
			
          	//공간 유형 hidden에 넣기
			var type = $('.typeSub.checked').val();
			
			// hidden input에 값을 설정합니다.
		    $('#spaceTypeName').val(type);
			
		  	//사업자 등록번호
    		if ($('.spBusiness').val().length < 1) {
    			alert('사업자 등록번호를 입력하세요.');
    			$('.spBusiness').focus();
    			
    			scrollMove($('.spBusiness'));
    			
    			return false;
    		}
		  	
    		//공간 대표번호
    		if ($('.spTel').val().length < 1) {
    			alert('대표전화를 입력하세요.');
    			$('.spTel').focus();
    			
    			scrollMove($('.spTel'));
    			
    			return false;
    		}
			
			//공간 한 줄 소개
			if ($('.spaceIntro').find($('.spText')).val() < 1) {
				alert('한 줄 소개를 입력하세요.');
				$('.spaceIntro').find($('.spText')).focus();
				
				scrollMove('.spaceIntro');
				
				return false;
			}
			
			//공간 소개
			if ($('.spaceInfo').find($('.spText')).val() < 1) {
				alert('공간 소개를 입력하세요.');
				$('.spaceInfo').find($('.spText')).focus();
				
				scrollMove('.spaceInfo');
				
				return false;
			}
			
			//공간 소개
			if ($('.spaceInfo').find($('.spText')).val().length > 1
					&& $('.spaceInfo').find($('.spText')).val().length < 21) {
				alert('공간 소개는 20자 이상 입력하셔야 합니다.');
				$('.spaceInfo').find($('.spText')).focus();
				
				scrollMove('.spaceInfo');
				
				return false;
			}

    		//공간 층수
    		if ($('.floor').val().toString().length < 1) {
    			alert('공간 층수를 입력하세요.');
    			$('.floor').focus();
    			
    			scrollMove($('.floor'));
    			
    			return false;
    		}

			//공간 태그
			if ($('.spaceTag.tag').find('.tagRe').length < 1) {
				alert('공간 태그를 하나라도 입력하세요.');
				$('.spaceTag.tag').find($('.spText')).focus();
				
				scrollMove('.spaceTag.tag');
				
				return false;
			}

			//시설 안내
			if ($('.spaceTag.fa').find($('.tagRe')).length < 1) {
				alert('시설 안내를 하나라도 입력하세요.');
				$('.spaceTag.fa').find($('.spText')).focus();
				
				scrollMove('.spaceTag.fa');
				
				return false;
			}

			//예약 시 주의사항
			if ($('.spaceTag.pre').find($('.tagRe')).length < 1) {
				alert('예약 시 주의사항을 하나라도 입력하세요.');
				$('.spaceTag.pre').find($('.spText')).focus();
				
				scrollMove('.spaceTag.pre');
				
				return false;
			}
			
			//대표 이미지
			if ($('.spImg.main .imgBox').length === 0) {
		        event.preventDefault(); // 폼 제출 막기
		        alert('대표 이미지를 첨부해 주세요.');
		        
		        scrollMove('.spaceImg.main');
		        
		        return false;
		    }
			
			$('form[name=frmRegi2]').submit();
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
						<input type="text" class="spText name" value="" name="spaceName"
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
						<input type="hidden" name="spaceTypeName" id="spaceTypeName">
					</div>
				</div>
			</div>
			<!-- 사업자 등록번호 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>사업자 등록번호 <span style="color: red;">*</span></span>
				</div>
				<div class="boxContents">
					<div class="spacepBusiness">
						<input type="text" class="spBusiness" name="spaceBusinessNum" value="" required >
					</div>
					<div class="boxnoti">
						<img src="<c:url value='/images/pngwing.com.png' />" >
						<p>-를 포함해서 입력해주세요. ex) 111-11-11111</p>
					</div>
				</div>
			</div>
			<!-- 공간 대표전화 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>대표전화 <span style="color: red;">*</span></span>
				</div>
				<div class="boxContents">
					<div class="spacepTel">
						<input type="text" class="spTel" name="spacePhoneNum" value="" required >
					</div>
					<div class="boxnoti">
						<img src="<c:url value='/images/pngwing.com.png' />" >
						<p>숫자만 입력해주세요.</p>
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
						<input type="text" class="spText" value="" name="spaceIntro"
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
						<textarea class="spText" name="spaceInfo"
							placeholder=" 게스트들에게 필요한 공간 정보를 상세하게 소개해주세요. 툴팁을 클릭해 작성 가이드를 확인할 수 있습니다." 
							maxlength="500" rows="6" ></textarea>
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
						<input type="text" class="spText floor" value=""
							name="spaceLocation" placeholder="층수 여부를 입력하세요. ex. 지상 1층, 지하 2층">
					</div>
				</div>
			</div>
			<!-- 공간 태그 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>공간 태그 <span style="color: red;">*</span></span>
					<span class="subTitleTag">최대 5개</span>
				</div>
				<div class="boxContents">
					<div class="spaceTag tag">
						<input type="text" class="spText" style="width: 850px;"
							placeholder=" 게스트들이 선호할만한 주요 특징들을 키워드로 입력해주세요. (최대 5개)" maxlength="27">
						<input type="button" class="btAdd tag" value="추가 ▽">
						<div class="spTag tag" id="tag"></div>
						<input type="hidden" name="spaceTag" id="spaceTag">
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
					<div class="spaceTag fa">
						<input type="text" class="spText" style="width: 850px;"
							placeholder=" 이용 가능한 시설에 대해 최대한 상세하게 입력해주세요. (최대 10개)" maxlength="100">
						<input type="button" class="btAdd fa" value="추가 ▽">
						<div class="spTag fa"></div>
						<input type="hidden" name="spaceFacility" id="spaceFacility">
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
					<div class="spaceTag pre">
						<input type="text" class="spText" style="width: 850px;"
							placeholder=" 게스트들이 예약 시 확인해야 하는 주의사항을 상세하게 입력해주세요. (최대 10개)" maxlength="100">
						<input type="button" class="btAdd pre" value="추가 ▽">
						<div class="spTag pre"></div>
						<input type="hidden" name="spaceWarn" id="spaceWarn">
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
					<div class="spaceImg main">
						<div class="spImg main" style="min-height: 150px;">
							<span class="inner">이미지 파일을 추가해 주세요.</span>
						</div>
						<div class="btBox">
							<label>
								<div class="btAdd file main" >파일첨부</div>
								<input type="file" id="mainImage" name="imgOriginalName" 
									accept="image/jpg, image/png, image/jpeg" style="display: none;">
							</label>
						</div>
					</div>
				</div>
			</div>
			<!-- 이미지 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>이미지 <span style="color: red;">*</span></span>
					<span class="subTitle">한 장당 최대 3MB<span style="color: #704de4;">(최대 10장)</span></span>
				</div>
				<div class="boxContents">
					<div class="spaceImg sub">
						<div class="spImg sub" style="height: 50px; padding-top: 15px;">
							<span class="inner">이미지 파일을 추가해 주세요.</span>
						</div>
						<div class="btBox">
							<label>
								<div class="btAdd file sub" >파일첨부</div>
								<input type="file" id="subImage" accept="image/jpg, image/png, image/jpeg" 
									style="display: none;">
							</label>
						</div>
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
						<!-- Button trigger modal -->
						<button type="button" class="btAdd btn btn-primary " data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="margin: 0;">
						  주소등록
						</button>
						
						<!-- Modal -->
						<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h1 class="modal-title fs-5" id="staticBackdropLabel" style="color: white; font-weight: bold;">주소 등록</h1>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        ...
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						        <button type="button" class="btn btn-primary">Understood</button>
						      </div>
						    </div>
						  </div>
						</div>
						<!-- <input type="button" class="btAdd" value="주소등록" style="margin: 0 0 10px 20px;"> -->
						<div class="spZip1" style="height: 50px; padding-top: 15px;">
							<span class="inner">실제 서비스되는 공간의 주소를 입력해주세요.</span>
						</div>
						<div class="spZip2" style="height: 50px; padding-top: 15px; width: 100%;">
							<span class="inner">상세 주소</span>
						</div>
					</div>
				</div>
			</div>
			<!-- 환불 기준 -->
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
			<div class="btBar">
				<button type="button" class="btn btn-secondary" id="back" >이전</button>
				<button type="button" class="btn btn-warning" id="next" >다음</button>
			</div>
			
		</form>
	</div>
</article>



</body>
</html>