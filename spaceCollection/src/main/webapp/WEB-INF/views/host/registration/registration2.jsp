<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/hostTop.jsp"%>

<style type="text/css">
	article {
		margin-top: 140px; 
		font-size: 16px;
    	line-height: 20px;
		display: flex;
		justify-content: center;
	}

	.main {width: 1000px;}
	
	.heading {
		border-bottom: 4px solid #704de4;
		padding-bottom: 24px;
	}
	
	.hd1 {
		font-size: 26px;
		color: black;
	}
	
	.hd2 {
		float: right;
		color: red;
	}
	
	.boxForm {
		margin-top: 50px;
	}
	
	.boxTitle {
		font-size: 17px;
		font-weight: bold;
		color: black;
		margin-bottom: 15px;
	}
	
	
	
</style>

<script type="text/javascript">

</script>

<article>
	<div class="main">
		<form name="frmRegi2" method="post" action="<c:url value='/host/registration/registration2' />">
			<div class="heading">
				<span class="hd1">공간 정보를 입력해주세요.</span>
				<span class="hd2">* 필수입력</span>
			</div>
			<div class="boxForm">
				<div class="boxTitle">
					<span>공간명<span style="color: red;">*</span></span>
					<img alt="" src="">
				</div>
			</div>
		</form>
	</div>
</article>


<%@ include file="/WEB-INF/views/form/hostBottom.jsp" %>