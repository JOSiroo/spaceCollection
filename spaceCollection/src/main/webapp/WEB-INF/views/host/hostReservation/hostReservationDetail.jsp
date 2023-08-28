<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/hostTop.jsp" %>
<style type="text/css">
	.reservation-header{
		border : 5px solid #193D76;
		margin-top :75px;
		padding:5% 16% 5% 16%;
	}
	.contentWrapper{
		border: rgba(0, 0, 0, 0.1) solid 2px;
		border-radius: 1rem;
	}
	.contetnHead{
		background: rgba(0, 0, 0, 0.06);
		border-top-right-radius: 0.8rem; 
		border-top-left-radius: 0.8rem;
		
		padding: 0.5% 0% 0.5% 2%;
		
		font-weight: bold;
		font-size: 30px;
		
	}
	.contentBox{
		margin-top:1%;
		padding:1% 2% 2% 2%;
	}
	.col-4{
		font-weight: bolder;
		font-size: 26px;
		color: rgba(0, 0, 0, 0.3);	
	}
	
</style>
<section>
	<div class="reservation-header">
		<div class="contentWrapper">
			<div class="contetnHead">
						sadsadsadsadsad
			</div>
			<div class="contentBox">
				<div class="row">
					<div class="col-4">신청일</div>
					<div class="col-8">2017.06.05 (월)</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-4">예약공간</div>
					<div class="col-8">스페이스클라우드 작업실</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-4">예약내용</div>
					<div class="col-8">2017.06.22(목) 15시 ~ 19시</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-4">예약인원</div>
					<div class="col-8">1명</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-4">결제정보</div>
					<div class="col-8">카카오페이(56,000원)</div>
				</div>
			</div>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/views/form/hostBottom.jsp" %>