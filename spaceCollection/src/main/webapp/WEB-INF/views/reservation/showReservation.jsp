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
.text-center{
	margin-bottom:4%;
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
	width: 6%;
	height:55px;
	border:none;
	font-size: 20px;
	font-weight: bold;
	
}
#reservationList{
	background : #ffd014;
}
#reservationList:hover{
	background : white;
	border:#ffd014 4px solid;
}

#home{
	background :#193D76;
	color:white;
}
#home:hover{
	background : white;
	border:#193D76 4px solid;
	color:black;
}

</style>
<section>
	<div class="asd"></div>
	<div class="receiption">
		<h1 style = "margin-bottom:2%; font-weight: 800">예약 완료!</h1>
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
			<div class="row row-cols-auto">
				<div class="col-2">연락처</div>
				<div class="col-6">
					<c:if test='${fn:length(map.SPACE_PHONE_NUM) > 9}'>
						${fn:substring(map.SPACE_PHONE_NUM, 0, 3)} -
						${fn:substring(map.SPACE_PHONE_NUM, 3, 7)} -
						${fn:substring(map.SPACE_PHONE_NUM, 7, 11)}  						
					</c:if>
					<c:if test='${fn:length(map.SPACE_PHONE_NUM) eq 9}'>
						${fn:substring(map.SPACE_PHONE_NUM, 0, 2)} -
						${fn:substring(map.SPACE_PHONE_NUM, 2, 4)} -
						${fn:substring(map.SPACE_PHONE_NUM, 4, 9)}  						
					</c:if>
				</div>
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
		<button class = 'reserveBt' id = "reservationList" onclick="reservationList()">예약 내역</button>
		<button class = 'reserveBt' id = "home" onclick="home()">홈</button>
	</div>
</section>
<script type="text/javascript">
	function reservationList(){
		location.href = "<c:url value = '/reservation/reservationList'/>";
	}
	function home(){
		location.href = "<c:url value = '/'/>";
	}
</script>
<%@ include file="../form/userBottom.jsp"%>