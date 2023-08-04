<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스페이스컬렉션 호스트</title>
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