<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/userTop.jsp" %>
<style type="text/css">
	.reservation-header{
		margin-top :120px;
		padding:5% 16% 5% 16%;
	}
	.search-box{
		border : 5px solid #193D76;
		border-radius : 1rem;
		padding: 4% 4% 4% 4%;
		color: transparent;
 		text-shadow: 0 0 0 black;
		
	}
	input[name=reservationInfo]{
		font-size:25px;
		width: 65%;
		height: 60px;
		margin-left: 3%;
		padding-left:1%;
		border : 3px solid lightgrey;
		border-radius: 0.5rem;
	
		
	}
	input[name=reservationInfo]::placeholder{
		color:lightgrey;
		font-weight: bold;
		font-size: 18px;
		
	}
	.searchBt{
		border: none;
		width: 10%;
		padding: 1.3% 0% 1% 0%;
		margin-bottom:1%;
		margin-left:4%;
		color: white;
		font-weight: bold;
		background: #ffd014;
		font-size: 20px;
		caret-color:none;
		color: transparent;
 		text-shadow: 0 0 0 black;
		border-radius: 1rem;
	}
	.orderSelector{
		width: 100%;
	}
	.statusSelector{
		width: 100%;
	}
	.calendarBtn{
		width: 80%;
		padding:4% 0% 4% 0%;
		border:none;
		background: #ffd014;
		color: black;
		font-size:18px;
		font-weight: bold;
		border-radius: 1rem;
	}
	.row{
		margin-top:2%;
		color: transparent;
 		text-shadow: 0 0 0 black;
	}
	select{
		height: 45px;
		border: lightgrey solid 2px;
		padding:0% 0% 0% 4%;
		border-radius: 1rem;
	}
	.reservationData{
		border: 3px solid lightgrey;
	}
	.row.dataTitle{
		/*border: 2px solid lightgrey;*/
		padding:1% 0% 1% 0%;
		margin-bottom:2%;
		font-size:16px;
		font-weight: bold;
	}
	.row.data{
		border: 2px solid lightgrey;
		padding:0% 2% 0% 2%;
		margin-top:0;
		height: 70px;
		font-size:16px;
		font-weight: bold;
	}
	.row.data .col-1{
		padding:1.8% 0% 0% 0%;
	}
	.row.data .col-2{
		padding:1.8% 0% 0% 0%;
	}
	.row.data .col-4{
		padding:1.8% 0% 0% 0%;
	}
	
	
	.checkReservation{
		border : none;
		border-radius: 0.5rem;
		background : #ffd014;
		width:100%;
		padding: 0% 0% 0% 0%;
		height: 30px;
		
	}
	.pageBox{
		width:20%;
		padding: 3% 47% 0% 47%;	
	}
	/* h2.accordion-header {
	    border-top: 0.5px solid #193D76;
	} */
	div#accordionFlushExample {
    margin-top: 50px;
	}
</style>

<section>
	<div class="reservation-header">
		<div class="search-box">
			<label style="font-size: 18px; font-weight: bold"> 공지 사항 검색</label>
			<!-- https://www.spacecloud.kr/board/notice?page=1&q=tlwms -->
			<input type="text" id = "searchKeyword" name = "reservationInfo" placeholder="검색어를 입력하세요."
				<c:if test="${!empty param.keyword}"> value="${param.keyword}"</c:if>>  
			<button class="searchBt" onclick="search()">검색</button>
		</div>
		<jsp:useBean id="now" class="java.util.Date"/>
		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />
		<c:if test="${!empty list}">
			<c:forEach var="reservation" items="${list}">
			<fmt:parseDate value="${reservation.RESERVE_START_DAY}" var="parsedDate" pattern="yyyy-MM-dd" />
			<c:set var="status" value="default" />
				<div class="row data">
					<div class = "col-1">${reservation.RESERVATION_NUM }</div>
					<div class = "col-2" style="padding:1.8% 0% 0% 0% !important;">${reservation.USER_ID }</div>
					<div class = "col-4">${reservation.SPACE_NAME }</div>
					<div class = "col-2">${reservation.RESERVE_START_DAY}</div>
					<c:if test="${reservation.RESERVATION_DEL_FLAG == 'Y'}">
						<div class = "col-2">환불완료</div>
						<c:set var="status" value="환불됨" />
					</c:if>
					<c:if test="${reservation.RESERVATION_DEL_FLAG == 'N'}">
						<c:if test="${now.before(parsedDate)}">
							<div class = "col-2">이용전</div>
							<c:set var="status" value="이용전" />
						</c:if>
						<c:if test="${now.after(parsedDate)}">
							<div class = "col-2">이용완료</div>
							<c:set var="status" value="이용완료" />
						</c:if>
					</c:if>
					<div class = "col-1" style="padding-top:1.4% !important;">
						<button class = "checkReservation" onclick="goReservation('${reservation.RESERVATION_NUM}')">
							정보
						</button>
					</div>
				</div>
			</c:forEach>
		</c:if>
		
		
<div class="accordion accordion-flush" id="accordionFlushExample">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        <span>[복구 완료] </span><p>&nbsp  스페이스클라우드 접속 장애에 대해 안내드립니다.
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
      </td></tr> <tr class="tr_view"><td colspan="2"><div class="view_box"><!----> <div class="p_answer"><p>안녕하세요, 스페이스클라우드 팀 입니다.</p><p>2023년 8월 21일 오후 7시 22분부터 8시 30분까지 약 1시간 가량 <b>네이버클라우드발 접속 장애</b>가 발생하였습니다.</p><p>서비스 이용에 불편을 드려 송구합니다. 현재는 복구 완료되어 정상적으로 서비스를 이용하실 수 있습니다.</p><p><strong><br></strong></p><p>&lt; 상세 내용 &gt;</p><p>■ 장애 내용 :&nbsp;스페이스클라우드(호스트센터 포함) 장애로 접속 불가</p><p>■ 장애 일시 :&nbsp;2023년 8월 21일 오후 7시 22분부터 8시 30분까지(약 1시간)</p><p>■ 장애 원인 :&nbsp;네이버클라우드 서비스 서버 장애</p><p>■ 조치 :&nbsp;서버 정상화 및 장애 복구 조치를 완료하였습니다.</p><p><br></p><p>서비스 이용에 불편을 드린 점에 대해 다시 한번 송구하다는 말씀드립니다.</p><p>향후 추가적인 장애가 발생하지 않도록 서버 안정화에 심혈을 기울이겠습니다.</p><p>관련해서 문의사항은 1:1 고객센터로 문의 바랍니다.</p><p>더 나은 서비스를 제공하기 위해 최선을 다하겠습니다. 감사합니다.</p><p><br></p><p>
      </div></div></td></tr></div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
       <span>[취소]</span><p>&nbsp 천재지변/감염병으로 인한 예약취소는 어떻게 하나요?
      </button>
    </h2>
    <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
       <ul>
       <li>천재지변(기상악화), 법정 감염병 등 불가항력적인 사유로 제휴점 이용이 불가할 경우 고객행복센터로 예약내역 및 증빙서류(결항확인서, e-티켓, 진단확인서 등)를 보내주시면 확인 후 예약취소 가능 여부를 확인해 드립니다.</li>
        <br><li>다만, 당사는 판매 중개 플랫폼의 입장으로 제휴점에 대하여 취소/환불을 강제할 수 없어 각 제휴점의 규정에 근거하여 상황에 따라 수수료가 발생하거나 취소가 어려울 수 있는 점 양해 부탁드립니다.</li>
        </ul>
       </div>
    </div>
  </div>
 </div>
</div>


		<div class="pageBox">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			    <li class="page-item">
			      <a class="page-link" id="previous" href="<c:url value='/host/reservation?page=${param.page-1}'/>" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <li class="page-item">
			      <a class="page-link" id="next" href="<c:url value='/host/reservation?page=${param.page+1}'/>" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		</div>
	</div>
</section>





<script type="text/javascript">
	$(function(){
		$('input[name=reservationInfo]').focus();
		
		$('#previous').click(function(){
			var page = ${param.page};
			if(page == 1){
				alert('첫 페이지 입니다');
				event.preventDefault();
			}
		});
		$('#next').click(function(){
			if(${empty list}){
				alert('더이상 기록이 없습니다');
				event.preventDefault();
			}
		});
		
		$('.calendarBtn').click(function(){
			location.href="<c:url value='/host/reservationCalendar'/>";
		});
	});
	
	
	const queryString = window.location.search;
	const params = new URLSearchParams(queryString);
	var currentTotalUrl = window.location.href;
	var currentUrl = currentTotalUrl.split("?");
	
	function goReservation(reservationNum){
		location.href="<c:url value='/host/reservationDetail?reservationNum="+reservationNum+"'/>";
	}
	
	function search(){
		var searchKeyword = document.getElementById('searchKeyword');
		if(searchKeyword.value.length == 0){
			alert('검색어를 입력하세요');
			searchKeyword.focus();
		}else{
			params.set("keyword",searchKeyword.value);
			location.href = currentUrl[0]+"?"+params;
		}
	}
	
	var orderSelector = document.getElementsByClassName('orderSelector');
	orderSelector[0].addEventListener('change',function(){
		if(this.value !== 'default'){
			params.set("order",this.value);
			location.href = currentUrl[0]+"?"+params;
		}else{
			params.delete("order");
			location.href = currentUrl[0]+"?"+params;
		}
	});
	
	var statusSelector = document.getElementsByClassName('statusSelector');
	statusSelector[0].addEventListener('change',function(){
		if(this.value !== 'default'){
			params.set("status",this.value);
			location.href = currentUrl[0]+"?"+params;
		}else{
			params.delete("status");
			location.href = currentUrl[0]+"?"+params;
		}
	});
	
</script>
<%@ include file="/WEB-INF/views/form/userBottom.jsp" %>