<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	<link rel="stylesheet" href="css/tiny-slider.css">
	<link rel="stylesheet" href="css/aos.css">
	<link rel="stylesheet" href="css/style.css">

	<title>스페이스 클라우드</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$('.nav-item').click(function(){
			$(this).css('background', 'yellow');
			$('.nav-item').not($(this)).css('background', 'white');
		})
	})
		
	
	
	</script>
	</head>
<style type="text/css">
	.custom-nav{
    padding-top: 0 !important;
    padding-bottom: 0 !important;
}
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
<!-- 
	<nav class="site-nav">
		<div class="container">
			<div class="menu-bg-wrap">
				<div class="site-navigation">
					<a href="index.html" class="logo m-0 float-start">Property</a>

					<ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
						<li><a href="index.html">Home</a></li>
						<li class="has-children">
							<a href="properties.html">Properties</a>
							<ul class="dropdown">
								<li><a href="#">Buy Property</a></li>
								<li><a href="#">Sell Property</a></li>
								<li class="has-children">
									<a href="#">Dropdown</a>
									<ul class="dropdown">
										<li><a href="#">Sub Menu One</a></li>
										<li><a href="#">Sub Menu Two</a></li>
										<li><a href="#">Sub Menu Three</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li><a href="services.html">Services</a></li>
						<li><a href="about.html">About</a></li>
						<li class="active"><a href="contact.html">Contact Us</a></li>
					</ul>

					<a href="#" class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
						<span></span>
					</a>

				</div>
			</div>
		</div>
	</nav>
 
 네비게이션탭 없애기 위한 주석
 -->

	<div class="hero page-inner overlay" style="background-image: url('images/hero_bg_3.jpg');">

		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
				<!-- 공간명이 들어갈 자리 -->
					<h1 class="heading" data-aos="fade-up">공간명이 들어갈 자리 입니다</h1>
					<h2 class="heading" data-aos="fade-up">공간에 대한 한줄 설명이 들어갈 자리입니다</h2>
					<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
						<ol class="breadcrumb text-center justify-content-center">
							<li class="breadcrumb-item active text-white" aria-current="page">#태그1</li>
							<li class="breadcrumb-item active text-white" aria-current="page">#태그2</li>
							<li class="breadcrumb-item active text-white" aria-current="page">#태그3</li>
							<li class="breadcrumb-item active text-white" aria-current="page">#태그4</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
<!--  여기까지 이미지 포함 상단 부분  -->

	<div class="section">
		<div class="container">
			<div class="row justify-content-between">
			<!-- 섹션의 이미지 슬라이드 부분 -->
				<div class="col-lg-7">
					<div class="img-property-slide-wrap">
						<div class="img-property-slide">
							<img src="images/img_1.jpg" alt="Image" class="img-fluid">
							<img src="images/img_2.jpg" alt="Image" class="img-fluid">
							<img src="images/img_3.jpg" alt="Image" class="img-fluid">
						</div>
					</div>
				<h1>공간명이 들어갈 자리 입니다</h1>
				<br><br><br>
				<nav class="navbar navbar-expand-lg bg-light bd-highlight custom-nav" style="justify-content:center !important;">
				  <div>
				    <div id="navbarNav">
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
				
				<h5 class = "detail-navTab">공간 소개</h5>
				<p>
					인천 예술회관역 도보 10분<br>
					카페거리&먹자골목 내 위치<br>
					
					ㅁ 브라이덜 샤워 무료셋팅<br>
					ㅁ 고급 드레스 17벌 무료 대여<br>
					ㅁ 대형 프로젝트 빔(OTT이용가능)<br>
					ㅁ 음식 및 주류 섭취 가능<br>
					*테이블 + 드레스 + OTT이용은 리뷰 이벤트 참여시 셋팅<br>
				</p>
				<p>
				[평일]<br>				
				-데이 (월-금) 12~17(5H) : 60,000원<br>
				-나잇 (월-목) 18~23(5H) : 80,000원<br>
				-올나잇 (월-금) 24~10(10H) : 100,000원<br>
				-나잇 + 올나잇 (월-목) 18~110(15H) : 150,000원<br>
				</p>
				
				<h5 class = "detail-navTab">시설 안내</h5>
				<p>
				[평일]<br>				
				-데이 (월-금) 12~17(5H) : 60,000원<br>
				-나잇 (월-목) 18~23(5H) : 80,000원<br>
				-올나잇 (월-금) 24~10(10H) : 100,000원<br>
				-나잇 + 올나잇 (월-목) 18~110(15H) : 150,000원<br>
					인천 예술회관역 도보 10분<br>
					카페거리&먹자골목 내 위치<br>
					
					ㅁ 브라이덜 샤워 무료셋팅<br>
					ㅁ 고급 드레스 17벌 무료 대여<br>
					ㅁ 대형 프로젝트 빔(OTT이용가능)<br>
					ㅁ 음식 및 주류 섭취 가능<br>
					*테이블 + 드레스 + OTT이용은 리뷰 이벤트 참여시 셋팅<br>
						인천 예술회관역 도보 10분<br>
					카페거리&먹자골목 내 위치<br>
					
					ㅁ 브라이덜 샤워 무료셋팅<br>
					ㅁ 고급 드레스 17벌 무료 대여<br>
					ㅁ 대형 프로젝트 빔(OTT이용가능)<br>
					ㅁ 음식 및 주류 섭취 가능<br>
					*테이블 + 드레스 + OTT이용은 리뷰 이벤트 참여시 셋팅<br>
						인천 예술회관역 도보 10분<br>
					카페거리&먹자골목 내 위치<br>
					
					ㅁ 브라이덜 샤워 무료셋팅<br>
					ㅁ 고급 드레스 17벌 무료 대여<br>
					ㅁ 대형 프로젝트 빔(OTT이용가능)<br>
					ㅁ 음식 및 주류 섭취 가능<br>
					*테이블 + 드레스 + OTT이용은 리뷰 이벤트 참여시 셋팅<br>
				</p>
				
				<h5 class = "detail-navTab">유의사항</h5>
				<p>
					인천 예술회관역 도보 10분<br>
					카페거리&먹자골목 내 위치<br>
					
					ㅁ 브라이덜 샤워 무료셋팅<br>
					ㅁ 고급 드레스 17벌 무료 대여<br>
					ㅁ 대형 프로젝트 빔(OTT이용가능)<br>
					ㅁ 음식 및 주류 섭취 가능<br>
					*테이블 + 드레스 + OTT이용은 리뷰 이벤트 참여시 셋팅<br>
						인천 예술회관역 도보 10분<br>
					카페거리&먹자골목 내 위치<br>
					
					ㅁ 브라이덜 샤워 무료셋팅<br>
					ㅁ 고급 드레스 17벌 무료 대여<br>
					ㅁ 대형 프로젝트 빔(OTT이용가능)<br>
					ㅁ 음식 및 주류 섭취 가능<br>
					*테이블 + 드레스 + OTT이용은 리뷰 이벤트 참여시 셋팅<br>
					
				</p>

				<h5 class = "detail-navTab">환불정책</h5>
				<p>
				
				</p>
				
				<div id="map"style="height:500px;"></div>
				
				
				
				<h5 class = "detail-navTab">Q&A</h5>
				<p>
				
				</p>
				
				<h5 class = "detail-navTab">이용 후기</h5>
				<p>
				
				</p>
				
				
				
			</div>
			<!-- 여기까지 이미지 슬라이드 -->	
			
			
						
				<div class="col-lg-4">
				<!-- 여기부터 이미지 오른쪽 설명 블럭 -->				
					<div class="d-block agent-box p-3" style="border-top: 5px purple solid  text-align: left;">
					<h3 class="h5 text-primary" style="margin:4% 1% 5% 1%">공간명 : 스페이스</h3>
						<div style="margin-top: 5px">	
							<img src="images/img_1.jpg" alt="Image" class="img-fluid">
						</div>
						
						<div class="property-item">
								<a href="property-single.html" class="img">
									<img src="images/img_2.jpg" alt="Image" class="img-fluid">
								</a>
								<!-- 여기까지 오른쪽 박스 사진 -->
								<div class="property-content">
									<span class="price mb-2">₩10,000</span><span>/(시간단위)</span>
									<!-- 요금 -->
									<hr>
									<div>
										<span class="d-block mb-2 text-black-50">5232 California Fake, Ave. 21BC</span>
									<!-- 주소 -->
									<hr>
										<span class="city d-block mb-3">California, USA</span>
									<!-- 지역 -->
									<hr>
										<div class="specs d-flex mb-4 ">
											<span class="d-block d-flex align-items-center me-3">
												<span class="icon-bed me-2"></span>
												<span class="caption">2 beds</span>
											</span>
											<span class="d-block d-flex align-items-center">
												<span class="icon-bath me-2"></span>
												<span class="caption">2 baths</span>
											</span>
										</div>
										<div class="specs d-flex mb-4 " style="border-bottom:purple solid 2px;"></div>
									<!-- 옵션 -->

										<span class="city d-block">예약선택</span>
										<hr>
											<a href="property-single.html" class="btn btn-primary py-2 px-3">전화</a>
											<a href="property-single.html" class="btn btn-primary py-2 px-3">바로 예약하기</a>
									</div>
								</div>
							</div> 
							
					</div>
				</div>
			<!-- 여기까지 오른쪽 부분-->				
			</div>
		</div>
	</div>
	<!-- 여기까지 섹션-->				


    <!-- Preloader -->
    <div id="overlayer"></div>
    <div class="loader">
    	<div class="spinner-border" role="status">
    		<span class="visually-hidden">Loading...</span>
    	</div>
    </div>


    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/tiny-slider.js"></script>
    <script src="js/aos.js"></script>
    <script src="js/navbar.js"></script>
    <script src="js/counter.js"></script>
    <script src="js/custom.js"></script>
    <script src="js/spaceDetail.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=daa469d4ff476714bf26432374f5ebff"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	</script>
  </body>
  </html>
