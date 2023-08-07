<!-- /*
* Template Name: Property
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>

<style type="text/css">
  a{
	  text-decoration: none; /* 밑줄 없애기 */
	  color: inherit; 
	}
	
	.navbar-toggler {
	  color: #white  !important;
	}
	
	.navbar {
	    width: 100%;
	    height: 80px; /* 헤더의 높이에 맞추기 */
	  }
	  
	.service_menu {
    padding: 18px 0 20px;
    text-align: center;
    color: #949494;
    background: #f6f6f6;
    height: 200px;
    
	}

	.bi{
	color:white; 
	font-size: 40px;
	 width: 50px;
	  height: 30px;
	
	}

	  form.d-flex.justify-content-center {
	    width: 600px;
	    height: 100px;
	  }
  
  	p{
    margin-right: 120px;
	}
	
	i.bi.bi-info-circle {
    margin-right: 120px;
	}


	element.style {
    margin-right: 160px;
    margin-top: 70px;
	}
	
	button.navbar-toggler {
    margin-left: 1400px;
    margin-top: 120px;
    position: absolute;
    
	}

form.narrow-w.form-search.d-flex.align-items-stretch.mb-3.aos-init.aos-animate
	{
	margin-top: 10px;
}

.topSearch {
	width: 1000px;
	padding: 10px 50px 0px 300px;
	margin-left: 450px;
	scale: 0.8;
	position: absolute;
	border-radius: 10px;
}

input.form-control.px-4 {
	border-radius: 24px;
	border: 1px solid #f6f6f6;
	background-color: #d1d1d1;
	color: #333;
	box-shadow: 0 15px 30px -15px rgba(0, 0, 0, 0.1);
}

a.logo.float-start {
	font-size: 40px;
	font-weight: bolder;
	margin-left: 20px;
	margin-top: 13px;
}

</style>

<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="favicon.png">

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
	rel="stylesheet">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/fonts/icomoon/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/fonts/flaticon/font/flaticon.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/tiny-slider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/aos.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

<title>SpaceCollection.com</title>
</head>


<body>

	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<nav class="site-nav">
		<div class="container">
			<div class="menu-bg-wrap">
				<div class="site-navigation">

					<a href="http://localhost:9091/spaceCollection/"
						class="logo float-start">SpaceCollection</a>

					<div class="topbar">
						<ul
							class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
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
						<form action="#"
							class="narrow-w form-search d-flex align-items-stretch mb-3"
							data-aos="fade-up" data-aos-delay="200">
							<input type="text" class="form-control px-4"
								placeholder="지역, 공간유형, 공간명으로 찾아보세요">
							<button type="submit" class="btn btn-primary">Search</button>
						</form>
					</div>

					<!-- 사이드바 메뉴 -->
					<!-- 토글버튼  -->
					<button class="navbar-toggler" type="button"
						data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar"
						aria-controls="offcanvasDarkNavbar" style="margin-right: 150px;">
						<i class="bi bi-list"></i>
					</button>

					<!--토글버튼 클릭 시 나타나는 버튼  -->
					<div class="offcanvas offcanvas-end" tabindex="-1"
						id="offcanvasDarkNavbar"
						aria-labelledby="offcanvasDarkNavbarLabel">
						<div class="offcanvas-header" style="background-color: #f6f6f6; text-align: center;">
							<div>
								<a href="#">
									<h5>Space Collaction</h5>
								</a>
							</div>
							<div>
								<button type="button" class="btn-close text-dark"
									data-bs-dismiss="offcanvas" aria-label="Close"></button>
							</div>
						</div>


						<!-- 메뉴 바(내 정보) *넣어야함 -->


						<!-- 메뉴 바(관리) -->
						<div class="row" style="margin-top: 30px; margin-bottom: 40px">

							<div class="col-sm-6">
								<a href="${pageContext.request.contextPath }/member_mypage">
									<i class="bi bi-person-video"></i>
									<p>마이페이지</p>
								</a>
							</div>

							<div class="col-sm-6">
								<a href="${pageContext.request.contextPath }/member_reserve">
									<i class="bi bi-calendar-check"></i>
									<p>예약 리스트</p>
								</a>
							</div>

							<div class="col-sm-6">
								<a href="${pageContext.request.contextPath }/member_review">
									<i class="bi bi-person-hearts"></i>
									<p>이용 후기/Q&A</p>
								</a>
							</div>

							<div class="col-sm-6">
								<a href="${pageContext.request.contextPath }/member_heart">
									<i class="bi bi-house-heart"></i>
									<p>찜 리스트</p>
								</a>
							</div>

							<div class="col-sm-6 " style="text-align: center;">
								<a
									href="${pageContext.request.contextPath }/member_notice?nmstatus=1&nstatus=1">
									<i class="bi bi-info-circle"></i>
									<p>공지사항</p>
								</a>
							</div>

							<div class="col-sm-6">
								<a
									href="${pageContext.request.contextPath }/member_faq?fmstatus=1&fstatus=1">
									<i class="bi bi-question-diamond"></i>
									<p>FAQ</p>
								</a>
							</div>

							<div class="col-sm-6">
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

							<div class="col-sm-6 ">
								<a href="${pageContext.request.contextPath }"> 
								<i class="bi bi-houses"></i>
									<p>Home</p></a>
							</div>
						</div>
						
						<!--Host센터 이동 -->
						<div class="service_menu">
							<a href="${pageContext.request.contextPath }/host">Host센터로 이동하기</a>
							<p class="copyright">Powered by © itwill Corp.</p>
						</div>

					</div><!-- 토글버튼 종료 -->
					
				</div><!-- topbar -->
				
				</div>

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

			</div>
		</div>
		</div>
	</nav>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>