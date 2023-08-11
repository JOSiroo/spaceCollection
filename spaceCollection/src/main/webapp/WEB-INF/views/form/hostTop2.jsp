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

<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>




<style type="text/css">
	* {margin: 0; padding: 0;}
	
	.headerMain {
		background: #193D76;
		width: 100%;
		height: 65px;
		position: fixed;
	}
	
	.headerMain nav {
		font-weight: bold;
		padding: 15px 15px 15px 15px;
	}

	.logo1 {
		color: white;
		text-decoration: none;
		font-size: 21px;
	}

	.logo2 {
		color: #ffd014;
		font-size: 17px;
	}
	
	.btLogout {
		border: 0.5px solid white;
		color: white;
		background: #193D76;
		padding: 6px 6px 6px 6px;
		font-size: 14px;
		float: right;
	}
	
	.menu{
		float: right;
		margin-left: 20px;
	}
	
	#header { 
		width: 100%; 
		height: 52px; 
		background: #447e65; 
		position: relative; 
		overflow: hidden; 
	}
	
	#mask { 
		width: 100%; 
		height: 100%; 
		position: fixed; 
		top: 0; left: 0; 
		background: #000; 
		-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)"; 
		filter: alpha(opacity=50); 
		zoom: 1; 
		opacity: 0.5; 
		z-index: 9998; 
		display: none; 
	}
	
	.logo { 
		font-size: 25px; 
		color: #fff; 
		position: absolute; 
		top: 5px; 
		left: 15px; 
	}
	
	.btn_menu_open { 
		background: none; 
		border: 0; 
		font-size: 15px; 
		color: #fff; 
		position: absolute; 
		top: 15px; 
		right: 15px; 
		cursor: pointer; 
	}
	
	.slide_menu { 
		width: 80%; 
		height: 100%; 
		max-width: 360px; 
		background: #fff; 
		position: fixed; 
		top: 0; right: 0; 
		overflow-y: scroll; 
		z-index: 9999; 
		display: none; 
	}
	
	.slide_menu .menu_close { 
		width: 100%; 
		height: 52px; 
		background: #447e65; 
		position: relative; 
	}
	
	.slide_menu .btn_menu_close { 
		background: none; 
		border: 0; 
		font-size: 15px; 
		color: #fff; 
		position: absolute; 
		top: 15px; 
		right: 15px; 
		cursor: pointer; 
	}
	
	.slide_menu .menu_list li { 
		padding: 15px; 
		border-bottom:1px solid #ccc; 
		list-style: none; 
	}
	
	.slide_menu .menu_list li a { font-size: 15px; color: #333; }
	
</style>

</head>
<body>
	<header class="headerMain">
		<nav>
			<a class="logo1" href="<c:url value='/host/index' />"></a>
			<span class="logo2">호스트 센터</span>
			
			<button class="btLogout">호스트 로그아웃</button>
			<div id="header">
				<div id="mask"></div>
				<h1><a href="<c:url value='/host/index' />" class="logo">SpaceCollection</a></h1>
				<button type="button" class="btn_menu_open">
					<img class="menu" alt="menu" src="<c:url value='/img/icons/menu.svg' />">
				</button>
				<div class="slide_menu">
					<div class="menu_close"><button type="button" class="btn_menu_close">메뉴 닫기</button></div>
					<ul class="menu_list">
						<li><a href="#">메뉴 1</a></li>
						<li><a href="#">메뉴 2</a></li>
						<li><a href="#">메뉴 3</a></li>
						<li><a href="#">메뉴 4</a></li>
						<li><a href="#">메뉴 5</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
