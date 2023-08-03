<!-- /*
* Template Name: Property
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<style>
	form.narrow-w.form-search.d-flex.align-items-stretch.mb-3.aos-init.aos-animate {
	    margin-top: 10px;
   		 
	}

	.topSearch {
	    width: 100%;
        padding: 10px 0px 10px 150px;
        position: relative;
            
	}
	
	input.form-control.px-4 {
	    border-radius: 24px;
	    border: 1px solid #f6f6f6;
	    background-color: #d1d1d1;
	    color: #333;
	    box-shadow: 0 15px 30px -15px rgba(0, 0, 0, 0.1);
	}
	
</style>

<html lang="ko">
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


	<link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/icomoon/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/flaticon/font/flaticon.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tiny-slider.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/aos.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

	<title>SpaceCollection.com</title>
</head>


<body>

	<div class="topSearch">
	<form action="#" class="narrow-w form-search d-flex align-items-stretch mb-3" data-aos="fade-up" data-aos-delay="200">
		<input type="text" class="form-control px-4" 
		placeholder="지역, 공간유형, 공간명으로 찾아보세요">
		<button type="submit" class="btn btn-primary">Search</button>
	</form>
	</div>
	

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

					<a href="index.html" class="logo m-0 float-start">SpaceCollection</a>

					<ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
						<li class="active"><a href="index.html">Home</a></li>
						<li class="has-children">
							<a href="SpaceCollection.html">SpaceCollection</a>
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
						<li><a href="contact.html">Contact Us</a></li>
					</ul>

					<a href="#" class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
						<span></span>
					</a>

				</div>
			</div>
		</div>
	</nav>
