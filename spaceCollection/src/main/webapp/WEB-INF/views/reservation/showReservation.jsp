<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/form/userTop.jsp"%>
<style type="text/css">
.asd {
	padding: 3% 0% 3% 0%;
}

.receiption {
	padding-top: 3%;
	width: 100%;
	height: 70%;
	text-align: center;
	margin-bottom:5%;
}

.row-cols-auto {
	font-weight: 600;
	font-size: 21px;
	margin-bottom:12px;
}
h4{
color:#193D76;
font-weight : bold;
}
.yellowBar {
	width: 20px;
    height: 3px;
    background: #ffd014;
    margin-bottom: 10px;
    margin-left : 3.5%;
    padding-left: 8%;	
}
.reserveBt{
	width: 5%;
	height: 40px;
}
</style>
<section>
	<div class="asd"></div>
	<div class="receiption">
		<h1 style = "margin-bottom:3%;">예약 완료!</h1>
		<div class="container text-center">
			<div class="row row-cols-auto">
				<div class="col-2"><h4>공간 정보</h4></div>
			</div>
			<div class = "yellowBar"></div>
			<hr>
			<br>
			<div class="row row-cols-auto">
				<div class="col-2">공간명</div>
				<div class="col-6">${map.SPACE_NAME }</div>
			</div>
			<div class="row row-cols-auto">
				<div class="col-2">타입</div>
				<div class="col-6">${map.SD_TYPE}</div>
			</div>
			<div class="row row-cols-auto">
				<div class="col-2">주소</div>
				<div class="col-6">(우)${map.SPACE_ZIPCODE} ${map.SPACE_ADDRESS}
					${map.SPACE_ADDRESS_DETAIL} ${map.SPACE_LOCATION}</div>
			</div>
			<br>
			<div class="row row-cols-auto">
				<div class="col-2"><h4>상세 내용</h4></div>
			</div>
			<div class = "yellowBar"></div>
			<hr>
			<br>
			<div class="row row-cols-auto">
				<div class="col-2">예약 인원</div>
				<div class="col-6">${map.RESERVE_PEOPLE}명</div>
			</div>
			<div class="row row-cols-auto">
				<div class="col-2">날짜</div>
				<div class="col-6">${map.RESERVE_START_DAY}/
					${map.RESERVE_START_HOUR}시 ~ ${map.RESERVE_FINISH_HOUR}시</div>
			</div>
			<div class="row row-cols-auto">
				<div class="col-2">금액</div>
				<div class="col-6">
					<fmt:formatNumber value="${map.RESERVE_PRICE}" pattern="#,###"/> 원
				</div>
			</div>
			<div class="row row-cols-auto">
				<div class="col-2">결제 수단</div>
				<div class="col-6">
					${map.PAYMENT_INFO }
				</div>
			</div>
			<div class="row row-cols-auto">
				<div class="col-2">결제일</div>
				<div class="col-6">${map.RESERVER_PAY_DAY}</div>
			</div>
			<div class="row row-cols-auto">
			<div class="col-2">예약번호</div>
			<div class="col-6">${map.RESERVATION_NUM}</div>
		</div>
		</div><!-- 아래는 컨테이너 밖에있는거임 -->
		<button class = 'reserveBt'>예약 내역</button>
		<button class = 'reserveBt'>홈</button>
	</div>
</section>
<%@ include file="../form/userBottom.jsp"%>