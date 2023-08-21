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
.text-center{
	border-top:2px solid lightgrey;
	border-left:2px solid lightgrey;
	border-right:2px solid lightgrey;
}
.list-Wrapper {
	padding: 4% 27% 4% 27%;
	text-align: center;
}
.row.wrapper{
	border-bottom: 2px solid lightgrey;
	margin-bottom : 30px;
}
.col-4.wrapper{
	font-size: 24px;
	font-weight: bold;
	padding-top: 6%;
	border-right : 2px solid lightgrey;
}
.col-1{
	font-size: 24px;
	font-weight: bold;
	border-right : 2px solid lightgrey;
	padding-top: 4%;
}
.col-5{
	border-right : 2px solid lightgrey;
	padding : 2% 0% 1% 2%;
}
.innerLeft {
	padding-top: 0 !important;
	font-size: 18px;
}

.innerRight {
	font-size: 20px;
	font-weight: bold;
}

.innerRow {
	margin-bottom: 10px;
}
.reserveBtn{
	padding-top: 6%;
	
}
.goReservation{
	border-radius: 1rem;
	width : 69%;
	height: 46px;
	font-size:16px;
	font-weight:700;
	border: none;
	background : #ffd014;
}
.goReservation:hover{
	background : white;
	border:#ffd014 4px solid;
}
.canceled:hover{
	border:black 4px solid;
	background-color: white !important;
}
</style>
<section>
	<div class="asd"></div>
	<h1 style = "text-align: center; margin-top : 1%; font-weight: 700;"> 예약 내역 </h1>
	<br>
	<hr>
	<div class="list-Wrapper">
		<c:forEach var="map" items="${list}">
			<div class="container text-center">
				<div class="row wrapper">
					<div class = "col-1">${map.RNUM }</div>
					<div class="col-4 wrapper">${map.SPACE_NAME}</div>
					<div class="col-5">
						<div class="row innerRow">
							<div class="col-4 innerLeft">공간 세부 :</div><div class="col-8 innerRight">${map.SD_TYPE}</div>
						</div>
						<div class="row innerRow">
							<div class="col-4 innerLeft">예약일 :</div><div class="col-8 innerRight">${map.RESERVE_START_DAY }</div>
						</div>
						<div class="row innerRow">
							<div class="col-4 innerLeft">예약 시간 :</div><div class="col-8 innerRight">${map.RESERVE_START_HOUR }시~ ${map.RESERVE_FINISH_HOUR}시<br></div>
						</div>
						<div class="row innerRow">
							<div class="col-4 innerLeft">결제 금액 :</div>
							<div class="col-8 innerRight"><fmt:formatNumber value="${map.RESERVE_PRICE}" pattern="#,###" />원</div>
						</div>
					</div>
					<div class = "col-2 reserveBtn">
					<c:if test="${map.RESERVATION_DEL_FLAG != 'Y'}">
						<button class = "goReservation" onclick = "goReservation(${map.RESERVATION_NUM})">예약 보러가기</button>
					</c:if>
					<c:if test="${map.RESERVATION_DEL_FLAG == 'Y' }">
						<button class = "goReservation canceled" onclick = "goReservation(${map.RESERVATION_NUM})" style = "background: lightgrey;">환불됨</button>
					</c:if>
					</div>
				</div>
				<div></div>
			</div>
		</c:forEach>
	</div>
</section>
<script type="text/javascript">
	function goReservation(reservationNum){
		location.href = "<c:url value = '/reservation/showReservation?reservationNum="+reservationNum+"'/>";		
	}
</script>
<%@ include file="/WEB-INF/views/form/userBottom.jsp"%>