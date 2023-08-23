<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
	header{
		padding-top:20px;
		height: 60px;
		margin: 0% 0% 0% 0%;
		background: #193D76;
		text-align: center;
		color: white;
		font-size:27px;
		font-weight: bold;
	}
	body{
		margin:0% 0% 0% 0%;
	}
	.spaceName{
		padding:2% 2% 3% 3%;
	}
</style>
<header>
	<span class="headerSpan">리뷰작성</span>
</header>
<body>
<div class="spaceName">
	<h3>공간명 : ${reservMap.SPACE_NAME} / ${reservMap.SD_TYPE}</h3>
</div>
</body>
</html>