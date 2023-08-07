<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="Untree.co">
	<link rel="shortcut icon" href="favicon.png">

	<meta name="description" content="" />
	<meta name="keywords" content="bootstrap, bootstrap5" />
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">


	<link rel="stylesheet" href="fonts/icomoon/style.css">
	<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

	<link rel="stylesheet" href="<c:url value = '/css/tiny-slider.css'/>">
	<link rel="stylesheet" href="<c:url value = '/css/aos.css'/>">
	<link rel="stylesheet" href="<c:url value = '/css/style.css'/>">
	
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
	<!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	    <script>
        var IMP = window.IMP; 
        IMP.init("imp04807210"); 
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;

        
        var paymentType = "";
        function setPaymentType(type){
        	paymentType = type;
        	if(paymentType === 'kakaopay'){
        		document.getElementById('kakaopay').style.border = '#193D76 5px solid';	
        		document.getElementById('kakaopay').style.borderRadius  = '1rem';	
        		document.getElementById('kcp').style.border = 'none';	
        	}else if(paymentType === 'kcp'){
        		document.getElementById('kcp').style.border = '#193D76 5px solid';	
        		document.getElementById('kcp').style.borderRadius  = '1rem';	
        		document.getElementById('kakaopay').style.border = 'none';	
        	}
        }
        
        
        function requestPay() {
            IMP.request_pay({
                pg : paymentType,
                pay_method : 'card',
                merchant_uid: "order_no_0006", 
                name : '당근 10kg',
                amount : 1000000,
                //buyer_email : 'Iamport@chai.finance',
                buyer_name : '아임포트 기술지원팀',
                buyer_tel : '010-1234-5678',
                buyer_addr : '서울특별시 강남구 삼성동',
                //buyer_postcode : '123-456'
            }, function (rsp) { // callback
                if (rsp.success) {
                    console.log(rsp);
                } else {
                	alert('이미 완료된 결제건 입니다');
                }
            });
        }
       
    </script>
	<title>스페이스 클라우드</title>
	

	</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.nav-item').click(function(){
		$(this).css('background', '#ffd014');
		$('.nav-item').not($(this)).css('background', 'white');
	})
	
	$('.swiper-inBox').click(function(){
	    var result = 0;
	    $('.swiper-inBox.on').each(function(){
	        result += parseInt($(this).find('input[type=hidden]').val());
	    });
	    
	    var formattedTotalPrice = addComma(result);
	    $('#totalPrice').text("₩" + formattedTotalPrice+ "원");
	});
})
 function addComma(value){
	    value = value+"";
        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        return value; 
    }
</script>
<style type="text/css">
	.custom-nav{
    padding-top: 0 !important;
    padding-bottom: 0 !important;
}
	body{
	overflow: visible;
	}
	.ol-list{
		font-weight: bold;
	}
	.ol-span{
		font-weight: normal;
	}
	
	.detail-navTab h5:after{
    position: absolute;
    bottom: 0;
    left: 0;
    content: "";
    height: 4px;
    width: 20px;
    background-color: #ffd014;
	}
	.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 14px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    
    
    .question-box{
    	text-align: center;
    	padding : 3% 3% 3% 3%;   
    }
    
    .review-box{
    	text-align: center;
    	padding : 3% 3% 3% 3%;   	
    }
    
    .detail-navTab{
		margin-top : 15px;
		 
    }
    .nav-bar{
    	width: 20px; height: 3px; background: #ffd014;
    	margin-bottom : 10px;
    }
    .btn.btn-primary {
    background: #193D76;
    color: #fff;
 	}   
    .nav-link {
    display: block;
    padding: 0.5rem 1rem;
    color: black;
    text-decoration: none;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out;
	}
	.payment_type{
		display: inline-block;
	}
	
	
	.accordionUl {
	  display: flex;
	  flex-direction: column;
	  gap: 16px;
	  margin: 0;
	  padding: 0;
	  max-width: 500px;
	  width: 100%;
	  list-style: none;
	}
	
	.accordionLi {
	  .button {
	    display: block;
	    padding: 20px;
	    width: 100%;
	    color: #000;
	    text-align: left;
	    font-size : 18px;
	    font-weight : bold;
	    background-color: white;
	    border: 4px #193D76 solid;
	    border: 0;
	    cursor: pointer;
	  }
	  .content {
	    display: none;
	    margin: 0;
	    background-color: #fff;
	    border-top: 1px solid #ddd;
	  }
	  
	  &.on {
	    .button {
			background-color: rgba(255, 208, 20, 0.9);
			opacity : 0.8;
		    border: 4px #193D76 solid;
			border-radius : 1rem;
			font-size : 18px;
			font-weight : bold;	
	    }
	    .content {
	      display: block;
	    }
	  }
	}
	
	
	.inAccordionUl {
	  display: flex;
	  flex-direction: column;
	  gap: 16px;
	  margin: 0;
	  padding: 0;
	  max-width: 500px;
	  width: 100%;
	  list-style: none;
	}
	
	.inAccordionLi {
	  .inButton {
	    display: block;
	    padding: 20px;
	    width: 100%;
	    color: #000;
	    text-align: left;
	    font-size : 16px;
	    font-weight : bold;
	    background-color: white;
	    border: 4px #193D76 solid;
	    border-radius : 1rem;
	    cursor: pointer;
	  }
	  .inContent {
	    display: none;
	    margin: 0;
	    padding: 20px;
	    background-color: #fff;
	    border-top: 1px solid #ddd;
	  }
	  
	  &.on {
	    .inButton {
	      background-color: rgba(255, 208, 20, 0.9);
	      opacity : 0.8;
	      border: 4px #193D76 solid;
	      border-radius : 1rem;
	      font-size : 16px;
    		font-weight : bold;
	    }
	    .inContent {
	      display: block;
	    }
	  }
	}
	<!-- 스와이프 시작 -->
	.swiper {
      width: 100%;
      height: 100%;
    }

    .swiper-slide {
		text-align: center;
		font-size: 18px;
		/*display: flex;*/
		justify-content: center;
		align-items: center;
		
		.swiper-p{
			margin-bottom : 0.3rem;
			text-align: left;
		}
		.swiper-inBox{
	    	text-align: center;
			font-size: 80%;
			display: flex;
			justify-content: center;
			align-items: center;
			border : grey 1px solid;
			color: #cc8c28;
			border: 2px solid #ffc000;
			background-color: #ffd014;
			padding: 17% 3% 19% 3%;
			width: 100%;
		}
   		.on{
			color: white;
			font-size: 80%;
			border: 2px solid navy;
			background-color: #193D76;
		}
    }
    
    .swiper-slide img {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
	<!-- 스와이프 끝 -->
	
	.facility-box{
		padding : 0% 0% 6% 11%;
	}
	.facility-icon{
		display: inline-block; 
		margin: 2% 2% 2% 2%;
	}
	.p-3{
		border-radius: 0.75rem;
	}
	
	
</style>
<body>

	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>


	<div class="hero page-inner overlay" style="background-image: url('images/hero_bg_3.jpg');">

		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
				<!-- 공간명이 들어갈 자리 -->
					<h1 class="heading" data-aos="fade-up">${vo.spaceName }</h1>
					<h2 class="heading" data-aos="fade-up">${vo.spaceIntro }</h2>
					<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
						<ol class="breadcrumb text-center justify-content-center">
						<c:if test="${!empty vo.spaceTag}">
						    <c:forEach items="${fn:split(vo.spaceTag, '/')}" var="tags">
						        <li class="breadcrumb-item active text-white" aria-current="page">#${tags}</li>
						    </c:forEach>
						</c:if>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
<!--  여기까지 이미지 포함 상단 부분  -->

	<div class="section">
		<div class="container">
			<div class="row justify-content-between" >
			<!-- 섹션의 이미지 슬라이드 부분 -->
				<div class="col-lg-7">
				<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
				  <div class="carousel-indicators">
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				  </div>
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="images/img_2.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="images/img_1.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="images/img_3.jpg" class="d-block w-100" alt="...">
				    </div>
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div>
					
				<br>
				<h1>${vo.spaceName }</h1>
				<br>
				<div class="sticky-top">
					<nav class="navbar navbar-expand-lg bg-light bd-highlight sticky-top custom-nav" style="justify-content:center !important; border-bottom : 1px #6d3bff solid;">
					  <div>
					    <div  id="navbarNav">
					      <ul class="nav nav-pills flex-column flex-sm-row bg-light" style="width: 100%">
					        <li class="nav-item p-2 flex-fill bd-highlight">
					          <a class="nav-link" href="javascript:void(0)">공간소개</a>
					        </li>
					        <li class="nav-item p-2 flex-fill bd-highlight">
					          <a class="nav-link" href="javascript:void(0)">시설안내</a>
					        </li>
					        <li class="nav-item p-2 flex-fill bd-highlight">
					          <a class="nav-link" href="javascript:void(0)">유의사항</a>
					        </li>
					        <li class="nav-item p-2 flex-fill bd-highlight">
					          <a class="nav-link" href="javascript:void(0)">환불정책</a>
					        </li>
					        <li class="nav-item p-2 flex-fill bd-highlight">
					          <a class="nav-link" href="javascript:void(0)">Q&A</a>
					        </li>
					        <li class="nav-item p-2 flex-fill bd-highlight">
					          <a class="nav-link" href="javascript:void(0)">이용후기</a>
					        </li>
					      </ul>
					    </div>
					  </div>
					</nav>
				</div>
				<br><br>
				<div class="detail-content">
					<div class = "detail-navTab">
						<h5 >공간 소개</h5>
						<div class = "nav-bar"></div>
						<p>
							${vo.spaceInfo }
						</p>
					</div>
					
					<div  class = "detail-navTab">
						<h5>시설 안내</h5>
						<div class = "nav-bar"></div>
						<ol>
							<c:if test="${!empty vo.spaceFacility }">
								<c:forEach var="facilities" items="${fn:split(vo.spaceFacility, '||')}">
									<li class = "ol-list"> ${facilities}</li>
									<br>
								</c:forEach>
							</c:if>
						</ol>
						
					</div>
					
					<div  class = "detail-navTab">
						<h5>유의사항</h5>
						<div class = "nav-bar"></div>
						<c:if test="${!empty vo.spaceFacility }">
							<ol>
								<c:forEach var="warns" items="${fn:split(vo.spaceWarn, '||')}">
									<li class = "ol-list"> ${warns}</li>
									<br>
								</c:forEach>
							</ol>
						</c:if>
					</div>
					
					<div class = "detail-navTab">
						<h5>환불정책</h5>
						<div class = "nav-bar"></div>
						<c:if test="${!empty refundVo }">
						<c:set var="refund" value="${refundVo}" />
							<ol>
								<li class = "ol-list">7일전 ${refund.refund7Day}</li>
								<br>
								<li class = "ol-list">6일전 ${refund.refund6Day}</li>
								<br>
								<li class = "ol-list">5일전 ${refund.refund5Day}</li>
								<br>
								<li class = "ol-list">4일전 ${refund.refund4Day}</li>
								<br>
								<li class = "ol-list">3일전 ${refund.refund3Day}</li>
								<br>
								<li class = "ol-list">2일전 ${refund.refund2Day}</li>
								<br>
								<li class = "ol-list">1일전 ${refund.refund1Day}</li>
								<br>
								<li class = "ol-list">당일 ${refund.refundDay}</li>
								<br>
							</ol>
						</c:if>
					</div>
					
					
					<div id="map"style="height:500px; border: 1px solid black"></div>
					<!-- 지도 -->
					
					<div class = "detail-navTab">
						<h5>Q&A</h5>
						<div class = "nav-bar"></div>
						<div class = "question-box">
							<h4>등록된 질문이 없습니다.</h1>
						</div>
					</div>
					
					<div class = "detail-navTab">
						<h5>이용 후기</h5>
						<div class = "nav-bar"></div>
						<div class = "review-box">
							<h4>등록된 후기가 없습니다</h1>								
						</div>
					</div>
				</div>
			</div>
			<!-- 여기까지 이미지 슬라이드 -->	
			
			
						
				<div class="col-lg-4">
				<!-- 여기부터 이미지 오른쪽 설명 블럭 -->				
					<div class="d-block agent-box p-3" style="border: 4px #193D76 solid;  text-align: left;">
					<h3 class="h5 text" style="margin:4% 1% 5% 1%; text-align: center;">공간 예약 정보</h3>
						<ul class = "accordionUl">
						<c:if test="${!empty map }">
							<c:forEach var="detail" items="${map }">
							  <li class = "accordionLi">
							    <button class="button">
							    	${detail.SD_TYPE} 
							    	<div style="float: right;">
								    	<span class="price mb-2" style= "color:#193D76;">
											<fmt:formatNumber value="${detail.SD_PRICE}" pattern="₩#,###"/>
										</span>
										<span style= "color:grey; font-weight: 400">/(시간단위)</span>
									</div>
							    </button>
							    <div id="menu2" class="content">
							    <div style="margin-top: 5px">	
									<img src="images/img_1.jpg" alt="Image" class="img-fluid">
								</div>
								<div class="property-item">
								  <div class="property-content">
									<span class="price mb-2" style= "color:#193D76">
										<fmt:formatNumber value="${detail.SD_PRICE}" pattern="₩#,###"/>
									</span>
									<span>/(시간단위)</span>
									<hr>
									<div>
										<span class="d-block mb-1 text-black" style="font-weight: bold; font-size: 15px">${vo.spaceZipcode } ${vo.spaceAddress } ${vo.spaceAddressDetail }</span>
									<hr>
										<span class="city d-block mb-3">${vo.spaceAddress }, 대한민국</span>
									<hr>
									<span class="d-block mb-1 text-black">
									${vo.spaceInfo }
									</span>
									<hr>
									<span class="tit">공간유형</span>
									<span class="city text-black">${detail.SD_TYPE}</span>
									<hr>
									<span class="tit">공간면적</span>
									<span class="city text-black">${detail.SD_AREA }㎡</span>
									<hr>
									<span class="tit">수용인원</span>
									<span class="city text-black">최소 ${detail.SD_MIN_PEOPLE }명 ~ 최대${detail.SD_MAX_PEOPLE }명</span>
									<hr>
								    <div class = "facility-box" style = "display: inline-block;">
										<c:forEach var="key" items="${detail.keySet()}">
										    <c:if test="${fn:contains(key, 'FAC_')}" >
												<img class = "facility-icon"src="<c:url value='/img/icons/facilityIcons/${key }.png'/>" width="70" height="70" >
										    </c:if>
										</c:forEach>
									</div>
									<div class="specs d-flex mb-4 " style="border-bottom:#6d3bff solid 2px; margin-top:5px"></div>
									</div>
										<span class="city d-block">예약선택</span>
									<hr>
									<ul class = "inAccordionUl">
									 <li class = "inAccordionLi">
									    <button class="inButton">시간 단위 예약하기(최소 ${detail.SD_MIN_TIME}부터)</button>
									    <div class = "inContent" style="width: 100%">
									    <hr>
									    
										 <div class="swiper mySwiper">
										    <div class="swiper-wrapper">
											    <fmt:parseNumber var="openTime" integerOnly="true" type="number" value="${detail.SD_OPEN_TIME}" />
											    <fmt:parseNumber var="closeTime" integerOnly="true" type="number" value="${detail.SD_CLOSE_TIME}" />
											    <c:forEach begin="${openTime }" end="${closeTime }" var="i">
										    			<div class="swiper-slide">
										    				<p class = "swiper-p">${i}</p>
										    				<button class = "swiper-inBox">
										    					<input type="hidden" value="${detail.SD_PRICE }"/> 
										    					<fmt:formatNumber value="${detail.SD_PRICE}" pattern="#,###"/>
										    				</button>
										    			</div>
										     	</c:forEach>
												</span>
										    </div>
										  </div>
										  <br>
									     	<span class="price mb-2" style= "color:#193D76" id = "totalPrice"></span>
										  <br><br>
										  <button class="btn btn-primary py-2 px-3" onclick="timeTableReset()">초기화</button>
										  <br><br>
									    <hr>
										    <div style = "padding:1% 3% 1% 3%; text-align: center;">
												<a href = "javascript:void(0);"><div class = "payment_type" id = "kakaopay" value="kakaopay" onclick="setPaymentType('kakaopay')">
													<img alt="" src="<c:url value='/img/paymentIcons/kakaoPay.png'/>"width="75"/>
												</div></a>
												<a href = "javascript:void(0);"  style = "margin-left:20%;"><div class = "payment_type" id = "kcp" value = "kcp" onclick="setPaymentType('kcp')">
													<img alt="" src="<c:url value='/img/paymentIcons/card.png'/>" width="75" style="border-radius: 1rem"/>
												</div></a>
											</div>
											<hr>
											<div style="text-align: center;">
												<a href="property-single.html" class="btn btn-primary py-2 px-3" style="width: 45%">전화</a>
												<div class="modal-dialog modal-dialog-centered">
													
												</div>
												<a onclick="requestPay()"  class="btn btn-primary py-2 px-7" style="width: 45%">결제하기</a>
											</div>
										</div>
							  		</li>
							  		</ul>
								  </li>
								  </c:forEach>
							  </c:if>
							</ul>
						</div> 
					</div>
				</div>
			<!-- 여기까지 오른쪽 부분-->				
			</div>
		</div>
	<!-- 여기까지 섹션-->				


    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/tiny-slider.js"></script>
    <script src="js/aos.js"></script>
    <script src="js/navbar.js"></script>
    <script src="js/counter.js"></script>
    <script src="js/custom.js"></script>
    <script src="js/spaceDetail.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=daa469d4ff476714bf26432374f5ebff"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도의 중심좌표
	    mapOption = { 
	        center: new kakao.maps.LatLng(${vo.latitude}, ${vo.longitude}), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    }; 
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 지도에 마커를 표시합니다 
		var marker = new kakao.maps.Marker({
		    map: map, 
		    position: new kakao.maps.LatLng(${vo.latitude}, ${vo.longitude})
		});
		
		// 커스텀 오버레이에 표시할 컨텐츠 입니다
		// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
		// 별도의 이벤트 메소드를 제공하지 않습니다 
		var content = '<div class="wrap">' + 
		            '    <div class="info">' + 
		            '        <div class="title">' + 
		            '            ${vo.spaceName}' + 
		            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
		            '        </div>' + 
		            '        <div class="body">' + 
		            '            <div class="img">' +
		            '                <img src="images/img_1.jpg" width="73" height="70">' +
		            '           </div>' + 
		            '            <div class="desc">' + 
		            '                <div class="ellipsis">${vo.spaceAddress} ${vo.spaceAddressDetail}</div>' + 
		            '                <div class="jibun ellipsis">(우) ${vo.spaceZipcode} </div>' + 
		            '                <div><a href="http://localhost:9091/spaceCollection/" target="_blank" class="link">홈페이지</a></div>' + 
		            '            </div>' + 
		            '        </div>' + 
		            '    </div>' +    
		            '</div>';
		
		// 마커 위에 커스텀오버레이를 표시합니다
		// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		var overlay = new kakao.maps.CustomOverlay({
		    content: content,
		    map: map,
		    position: marker.getPosition()       
		});
		
		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		kakao.maps.event.addListener(marker, 'click', function() {
		    overlay.setMap(map);
		});
		
		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay() {
		    overlay.setMap(null);     
		}
	</script>
	
	
	<script>
	//스와이프 스크립트
    var swiper = new Swiper(".mySwiper", {
      slidesPerView: 6,
      spaceBetween: 0,
      freeMode: true,
      on: {
          transitionEnd: function () {
              // 활성 슬라이드의 인덱스를 가져옵니다.
              const activeSlideIndex = this.activeIndex;

              // 활성 슬라이드에 있는 'on' 클래스를 유지합니다.
              const activeSlideSlots = document.querySelectorAll('.swiper-slide-active .swiper-inBox.on');
              activeSlideSlots.forEach(function (slot) {
                  slot.classList.add('on');
              });
          }
      }
  });

  	</script>
		
<%@ include file="../form/bottom.jsp" %>