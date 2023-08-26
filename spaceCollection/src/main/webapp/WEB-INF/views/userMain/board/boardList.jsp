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
		
		$('#boardTypeName').change(function() {
			location.href = "/spaceCollection/admin/board/boardList?boardTypeName="+$('#boardTypeName>option:selected').val();
		});
		
		$('tbody tr').hover(function() {
			$(this).find('td').css("background-color", "#d1cece");
		}, function() {
			$(this).find('td').css("background-color", "white");
		});
		
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
	 
	 .col.align-center {
	    margin: 45px;
	 }
	 
	 
</style>
<body>
<form name="frmSearch" method="post" action="<c:url value='userMain/boardList'/>"> <!-- boardDetail -->
	  
<div id="main">
<section class="wrapper style1">
	<div class="inner">
		<header class="align-center">
			<h2>진행 중인 이벤트</h2>
			<p>지금 진행 중인 이벤트를 만나보세요!</p>
		</header>
		
		<div class="">  
			<c:if test="${empty list }">  
		  		<tr><td colspan="5" class="align_center">글이 존재하지 않습니다.</td></tr>
		  	</c:if>
		  	<c:if test="${!empty list }">	
			<c:forEach var="vo" items="${list}"> 
					<div class="col align-center">
						<div class="">
							<img src="..." alt="" />
							<a href="#" class="titleButton"
							 onclick="location.href='<c:url value='/userMain/board/boardDetail?boardNum=${vo.boardNum }'/>';"
							 style="cursor:pointer;">${vo.boardNum }</a><br><br>
						</div>
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