<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<%--  <%@ include file="/WEB-INF/views/form/userTop.jsp" %>  --%>
<html>
<head>
<meta charset="UTF-8">
<title>시즌 이벤트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<style>
	
	section{
 		display: flex;
        flex-wrap: wrap;
        gap: 20px;
        justify-content: center;
        max-width: 1200px;
        margin: 0 auto; 
	}
	
</style>
<script>

</script>
<section class="section1">
		<div class="eventCard"  var="map" >
			<c:if test="${empty map }">  
	  			<td colspan="5" class="align_center">글이 존재하지 않습니다.</td>
		  	</c:if>
		  	<c:if test="${!empty map }">	
					<div class="col align-center">
						 ${map.BOARD_CONTENT } 
					</div>
			</c:if>
		</div>
</section>
	<!-- 댓글쓰기란 -->
				
	<!--댓글 목록-->
		<!-- <div class="eventText" id="eventText">
			<div class="registering_comment"  style="position: absolute;">
			<input type="text" name="comments" placeholder="로그인 후 글을 작성하실 수 있습니다." style="width: 800px;">
			<button type="button" class="btn btn-primary btn-lg" id="sendBt" style="scale: 0.8;">등록</button>
			</div>  -->
		
		
<%--  <%@ include file="/WEB-INF/views/form/userBottom.jsp" %>  --%>