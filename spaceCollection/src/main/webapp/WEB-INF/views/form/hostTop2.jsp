<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스페이스컬렉션 호스트</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<!--  -->
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="title_icon.jpg">
<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/fonts/icomoon/style.css' />">
<link rel="stylesheet" href="<c:url value='/fonts/flaticon/font/flaticon.css' />">
<link rel="stylesheet" href="<c:url value='/css/tiny-slider.css' />">
<link rel="stylesheet" href="<c:url value='/css/aos.css' />">
<link rel="stylesheet" href="<c:url value='/css/style.css' />">


<style type="text/css">
	* {margin: 0; padding: 0;}
	
	.navbar {
		background: #193D76 !important;
		width: 100%;
		height: 65px !important;
	}
	
	.headerMain nav {
		font-weight: bold;
		padding: 15px 15px 15px 15px;
	}

	.navbar-brand {
		color: white;
		text-decoration: none;
		font-size: 25px;
		float: left;
		font-weight: bold;
	}

	.logo2 {
		color: #ffd014;
		font-size: 18px;
	}
	
	.navbar-toggler {
		color: #ffd014 !important;
	}
	
	.offcanvas-header {
		height: 150px;
		background: #ffd014;
		padding-right: 20px;
	}
	
	.offcanvas-title {
		width: 250px;  
		color: white;
		font-weight: bold;
		font-size: 25px;
	}
	
	.nav-item {
		height: 60px;
		padding: 21px 25px 20px;
		border-bottom: 1px solid gray;
	}
	
	.frofile {font-size: 16px; color: white; text-decoration: underline;}
	
	.offcanvas-body {
		font-size: 19px; 
		
		
	}
	
</style>

<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">

</script>

</head>
<body>
	<nav class="navbar bg-body-tertiary fixed-top">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="<c:url value='/host/index' />">SpaceCollection <span class="logo2">호스트센터</span></a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
	      <div class="offcanvas-header">
	        <span class="offcanvas-title" id="offcanvasNavbarLabel">호스트(사용자 이름)</span>
	        <a class="frofile" href="#">프로필 관리</a>
	        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	      </div>
	      <div class="offcanvas-body">
	      	<div class="">
	      	
	      	</div>
	        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
	          <li class="nav-item" style="border-top: 1px solid gray;">
	            <a class="nav-link active" aria-current="page" href="<c:url value='/host/index' />">호스트센터 홈</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link" href="#">Link</a>
	          </li>
	          <li class="nav-item dropdown">
	            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	              Dropdown
	            </a>
	            <ul class="dropdown-menu">
	              <li><a class="dropdown-item" href="#">Action</a></li>
	              <li><a class="dropdown-item" href="#">Another action</a></li>
	              <li>
	                <hr class="dropdown-divider">
	              </li>
	              <li><a class="dropdown-item" href="#">Something else here</a></li>
	            </ul>
	          </li>
	        </ul>
	      </div>
	    </div>
	  </div>
	</nav>
