<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/hostTop.jsp"%>

<style type="text/css">
	body {background: #f6f6f6;}

	article {
		margin: 140px 0 150px 0; 
		font-size: 16px;
    	line-height: 20px;
		display: flex;
		justify-content: center;
	}

	.main {width: 1000px; display: inline-block;}
	
	.regi {
		text-align: center;
		width: 100%;
		border: 1px solid #704de4;
		background: #fff;
		height: 60px;
    	line-height: 60px;
    	border-radius: 0.5rem;
    	font-size: 18px;
    	font-weight: bold;
    	margin-bottom: 100px;
	}
	
	.regi a {color: #704de4;}
	
</style>

<article>
	<div class="main">
		<form name="frmRegi3" method="post" action="<c:url value='/host/registration/registration4' />">
		<div class="regi">
			<a href="<c:url value='/host/registration/registration1' />">새 공간 등록하기</a>
		</div>
		<div class="spaceList">
			
		</div>
		</form>
	</div>
</article>

<%@ include file="/WEB-INF/views/form/hostBottom.jsp" %>