<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스페이스컬렉션 호스트</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- 공간 상세페이지용 cdn -->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


<style type="text/css">
	* {margin: 0; padding: 0;}
	
	.headerMain {
		background: #3F64C7;
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
		background: #3F64C7;
		padding: 6px 6px 6px 6px;
		font-size: 14px;
		float: right;
	}
	
	.menu{
		float: right;
		margin-left: 20px;
	}
</style>

</head>
<body>
	<header class="headerMain">
		<nav>
			<a class="logo1" href="<c:url value='/host/index' />">SpaceCollection</a>
			<span class="logo2">호스트 센터</span>
			<img class="menu" alt="menu" src="<c:url value='/img/icons/menu.svg' />">
			<button class="btLogout">호스트 로그아웃</button>
		</nav>
	</header>
