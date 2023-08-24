<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mainstyle.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/font-awesome.min.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>" />
<title>Insert title here</title>
</head>
<script type="text/javascript">	

	$(function(){
	 });

</script>
<style type="text/css">
	*{
		font-family: "Malgun Gothic", sans-serif !important;
	 }	
	 
	 c {
	    font-weight: bold;
	    font-size: 20px;
	 }
	 
	/*  .col.align-center {
	    margin: 50px;
	 } */
	 
	.box_1 {
	    background-color: #e4edf7;
	}
		
	img {
	    margin: -8px;
	    scale: 0.8;
	}
	
	a.button {
	    margin-bottom: 20px;
	}
	
	.flex.flex-2 {
	    display: flex;
	    position: absolute;
	}
	
</style>
<body>
<form name="frmSearch" method="post" action="<c:url value='userMain/boardList'/>">
	  
<div id="main">
<section class="wrapper style1">
	<div class="inner">
		<header class="align-center">
			<h2>진행 중인 이벤트</h2>
			<p>지금 진행 중인 이벤트를 만나보세요!</p>
		</header>
		<div class="box_1">
			<c:if test="${empty mapList }">  
		  		<tr><td colspan="5" class="align_center">글이 존재하지 않습니다.</td></tr>
		  	</c:if>
		  	
 				<%-- 	<!-- 첫 이미지만 -->
					<a href="<c:url value='/user/boardDetail?num=${map.게시판번호}'/>">
						  <c:if test="${fn:length(vo.title)}">   
		                     ${fn:substring(vo.title,0,20)}...
		                  </c:if>
		                  <c:if test="${fn:length(vo.title)<=20}">   
		                     ${vo.title}
		                  </c:if>
					</a> --%>
		  	
		  	<c:if test="${!empty mapList }">	
			<c:forEach var="map" items="${mapList }"> 
					<div class="col align-center" style="background-color: light gray;">
						<div class="align-center" style="background: ${map.boardContent };">
							<img src="<c:url value='/images/푸바옷.png'/>">
						  <p>${map.boardContent } </p> 
						</div>
						<%-- <c>${map.BOARD_TITLE }</c><br><br> --%>
						<a href="#" class="button">${map.BOARD_TITLE }</a>
					</div>
			</c:forEach>
			</c:if>
		</div>
	</div>
</section>
</div>
					
</form>
</body>
</html>