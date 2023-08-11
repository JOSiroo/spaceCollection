<!-- /*
* Template Name: Property
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>

<html lang="ko">
<head>
<title>SpaceCollection.com</title>

<meta charset="utf-8">

<!-- 사이드메뉴 -->
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 사이드메뉴 -->

<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="title_icon.jpg">
<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/icomoon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tiny-slider.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

<!-- 공간 상세페이지용 cdn -->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/datepickerCss/datepicker.css">
<style type="text/css">

/* form.narrow-w.form-search.d-flex.align-items-stretch.mb-3.aos-init.aos-animate
	{
	margin-top: 10px;
} */

.topSearch {
	width: 1000px;
    padding: 20px 40px 50px 260px;
	margin-left: 450px;
	scale: 0.8;
	position: absolute;
	border-radius: 10px;
}

#inputSearch {
	width: 400px;
	border-radius: 24px;
	border: 1px solid #f6f6f6;
	background-color: #d1d1d1;
	color: #333;
	box-shadow: 0 15px 30px -15px rgba(0, 0, 0, 0.1);
}

#topLogo {
	font-size: 40px;
	font-weight: bolder;
	margin-left: 20px;
	margin-top: 13px;
}

/* side */
	a{
	  text-decoration: none; 
	  color: inherit;
	}
  
	.sidemenubt {
  	color: white !important;
	}
	
	.service_menu {
    padding: 18px 0 20px;
    text-align: center;
    color: #949494;
    background: #f6f6f6;
    height: 200px;
    
	}

	.bi{
	color:#193D76; 
	font-size: 40px;
	width: 50px;
	height: 30px;
	}
	
	#sidemenubtcl{
	color:white;
	}
	
	.sidemenust {
    position: absolute;
    float: right;
    margin-left: 1170px;
    margin-top: 25px;
    width: 100px;
	}

	#searchBt{
    width: 100px;
    margin-left: 10px;
	}
	#offcanvasDarkNavbar{
	z-index:1051;
	}
</style>
</head>

<body>
	<!-- 스크롤 -->
	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>
	<!-- 스크롤끝-->

<!-- 상단메뉴 -->
<nav class="site-nav">
		<div class="container">
			<div class="menu-bg-wrap">
				<div class="site-navigation">

					<a href="http://localhost:9091/spaceCollection/"
						class="logo float-start" id="topLogo">SpaceCollection</a>

					<div class="topbar">
						<ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
							<li class="active"><a href="index.html">Home</a></li>
							<li class="has-children"><a href="SpaceCollection.html">SpaceCollection</a>
								<ul class="dropdown">
									<li><a href="#">Buy Property</a></li>
									<li><a href="#">Sell Property</a></li>
									<li class="has-children"><a href="#">Dropdown</a>
										<ul class="dropdown">
											<li><a href="#">Sub Menu One</a></li>
											<li><a href="#">Sub Menu Two</a></li>
											<li><a href="#">Sub Menu Three</a></li>
										</ul></li>
								</ul></li>
							<li><a href="services.html">Services</a></li>
							<li><a href="about.html">About</a></li>
							<li><a href="contact.html">Contact Us</a></li>
						</ul>
						<br>
					
					<div class="topSearch">
						<form class="narrow-w form-search d-flex align-items-stretch mb-3" method="get" action="${pageContext.request.contextPath }/search">
							<input type="text" class="form-control px-4"
								placeholder="지역, 공간유형, 공간명으로 찾아보세요" id="inputSearch">
							<button type="submit" class="btn btn-primary" id="searchBt">Search</button>
						</form>
					</div>
					
					
<!-- 사이드시작  -->      
<div class="sidemenust">
    <button class="sidemenubt" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar">
      <i class="bi bi-list" id="sidemenubtcl"></i>
    </button>
    
    <!--사이드메뉴 시작-->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel" >
    <div class="offcanvas-header" style="background-color: #f6f6f6; text-align: center;">     	 		
		<div><a href="#"><h5> Space Collection</h5></a></div>	
		<div><button type="button" class="btn-close text-dark" data-bs-dismiss="offcanvas" aria-label="Close"></button></div>
  	</div>
      
      
      <!-- 메뉴 바(내 정보) 추가하기!!!!!!!!!!!!!!!!!!!!! -->
		
		
			<!-- 사이드메뉴 -->
			<div class="sideform" style="margin-top: 30px; margin-bottom: 40px;">
			 	<div class="col-sm-6 " style="text-align: center;">
				<a href="<c:url value='/member_mypage' />">
		  		<i class="bi bi-person-video" ></i>
		 	    <p>마이페이지</p></a>
		 	</div>
				
		  	<div class="col-sm-6 " style="text-align: center;">
			  <a href="<c:url value='/member_reserve' />">  
			        <i class="bi bi-calendar-check" ></i>
		 		  <p>예약 리스트</p></a> 
		 	</div>
		 
		   <div class="col-sm-6 " style="text-align: center;">
			       <a href="<c:url value='/member_review' />">  
					<i class="bi bi-person-hearts" ></i>
		 	 	  <p>이용 후기</p></a>
		 	</div>
	
		    <div class="col-sm-6 " style="text-align: center;">
			  <a href="<c:url value='/member_heart' />"> 
		   		 <i class="bi bi-house-heart" ></i>
		 	 	  <p>찜 리스트</p></a>
			</div>
	
		  <div class="col-sm-6 " style="text-align: center;">
		    <a href="https://www.spacecloud.kr/board/notice" >   
		     <i class="bi bi-info-circle" ></i>
		   	<p>공지사항</p></a> 
		  </div>
		  
		  <div class="col-sm-6 " style="text-align: center;">
		    <a href="https://www.goodchoice.kr/more/faq" >
		     <i class="bi bi-question-diamond" ></i>
		 	   <p>FAQ</p></a>
		  </div>
				  
		  <div class="col-sm-6"  style="text-align: center;">
			  <c:choose>
			    <c:when test="${not empty loginMember}">
			      <!-- 로그인한 경우 -->
			      <a href="${pageContext.request.contextPath}/logout/member">
			        <i class="bi bi-box-arrow-right"></i>
			        <p>로그아웃</p>
			      </a>
			    </c:when>
			    <c:otherwise>
			      <!-- 로그인하지 않은 경우 -->
			      <a href="${pageContext.request.contextPath}/login/member">
			        <i class="bi bi-person-check"></i>
			        <p>로그인</p>
			      </a>
			    </c:otherwise>
			  </c:choose>
		 </div>
				  
		  <div class="col-sm-6 "  style="text-align: center;">
		    <a href="https://www.spacecloud.kr/introduction">
		    <i class="bi bi-houses" ></i>
		 	   <p>회사소개</p></a>
		  </div>
				
	</div><!-- sideform -->	      
      
	      <!--Host이동 --> 
	      <div class="service_menu">
	      <a href="${pageContext.request.contextPath }/host">Host센터로 이동하기</a>
	      <p class="copyright">Powered by © nada Crew.</p>
	      </div>
       
    </div><!--사이드메뉴끝-->
<!-- 사이드종료 -->
					
					
					
</div></div></div></div></div>



	
<!-- 상단메뉴 끝 -->	</nav>	
		
	<!-- 채팅api -->				
	<script type="text/javascript">
		var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
		(function() {
			var s1 = document.createElement("script"), s0 = document
					.getElementsByTagName("script")[0];
			s1.async = true;
			s1.src = 'https://embed.tawk.to/64cc763c94cf5d49dc6853f9/1h6varo07';
			s1.charset = 'UTF-8';
			s1.setAttribute('crossorigin', '*');
			s0.parentNode.insertBefore(s1, s0);
		})();
	</script>

	<a href="#"
		class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none"
		data-toggle="collapse" data-target="#main-navbar"> <span></span>
	</a>
	<!-- 채팅api 끝 -->	