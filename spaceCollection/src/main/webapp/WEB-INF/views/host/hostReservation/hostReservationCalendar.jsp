<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/hostTop.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.8/index.global.min.js"></script>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.0/main.css' rel='stylesheet' />
    <script>
  //#,### 포멧 적용시키는 정규식 함수
	 function addComma(value){
		    value = value+"";
	        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        return value; 
	    }
   	
    document.addEventListener('DOMContentLoaded', function() {
    	  var calendarEl = document.getElementById('calendar');
    	  var popup = null; // 팝업 요소
    	  var savedInfo = null; // 클릭한 이벤트 정보

    	  var calendar = new FullCalendar.Calendar(calendarEl, {
    	    timeZone: 'local',
    	    initialView: 'dayGridMonth',
    	    locale: 'ko',
    	    aspectRatio: 1.35,
    	    height: 800,
    	    dayMaxEventRows: true,
    	    views: {
    	      timeGrid: {
    	        dayMaxEventRows: 4 
    	      }
    	    },
    	    headerToolbar: {
    	        center: 'addEventButton'
    	      },
    	      customButtons: {
    	          addEventButton: {
    	            text: '일정 추가',
    	            click: function() {
    	              var startStr = prompt('날짜를 입력하세요');
    	              var start = new Date(startStr + 'T00:00:00'); // will be in local time
    	              var endStr = prompt('날짜를 입력하세요');
    	              var end = new Date(endStr + 'T00:00:00'); // will be in local time
    	              
    	              var title = prompt('일정 이름을 입력하세요');
    	              var contentStr = prompt('일정 내용을 입력하세요');
    	              
    	              
    	              if (!isNaN(start.valueOf()) && !isNaN(end.valueOf())) { // valid?
    	            		$.ajax({
    	            			url:"<c:url value='/insertMemo'/>",
							    data:{
							    	title:title,
									content:contentStr,
									start:startStr+"",
									end:endStr+""
							    },
							    success:function(response){
							    	console.log(response);
							    },
							    error:function(error, xhr, status){
							    	console.log(error);
							    	console.log(xhr);
							    	console.log(status);
							    }
    	            		});
    	                alert('asdsad');
    	              } else {
    	                alert('Invalid date.');
    	              }
    	            }
    	          }
    	        },
    	    events: [
    	    	<c:forEach var ="i" items="${list}">
		    	      {
		    	        title: '${i.SPACE_NAME }',
		    	        start: '${i.RESERVE_START_DAY}',
		    	        extendedProps: {
		    	            content: '${i.SD_TYPE} / ${i.RESERVE_START_HOUR}시 ~ ${i.RESERVE_FINISH_HOUR}시 ${i.RESERVE_PEOPLE}명',
		    	            reservationNum: '${i.RESERVATION_NUM}'
		    	        }
		    	      },
    	      	</c:forEach>
				<c:forEach var ="i" items="${calList}">
				{
	    	        title: '${i.memoTitle}',
	    	        start: '${i.memoStartDay}',
	    	        end: '${i.memoEndDay}',
	    	        extendedProps: {
	    	            content: '${i.memoContent}'
	    	        },
	    	        color:'purple'
	    	      },
				</c:forEach>
	    	    ],
	    	    eventDidMount: function (info) {
	                $(info.el).popover({
	                    title: info.event.title,
	                    placement: 'top',
	                    trigger: 'hover',
	                    content: info.event.extendedProps.content,
	                    container: 'body'
	                });
	            },
	            dateClick: function(info) {
	            	console.log(info);
	            	$('.fc-day').attr('style','none');
	                info.dayEl.style.backgroundColor = '#ffd014';
	                var date = info.dateStr;
	                $.ajax({
	                	url:"<c:url value='/host/calendarDate?date="+date+"'/>",
	                	type:"get",
	                	success:function(data){
	                		console.log(data);
	                		var totalPrice = 0;
	                		data.forEach(function(item){
	                			totalPrice += item;
	                		});
	                		
	                		$('#sumPrice').css('padding-top', '1%');
							$('#sumPrice').html(date+ "<br> 매출액 : " + addComma(totalPrice)+"원");         		
	                		
	                	},
	                	error:function(xhr, status, error){
	                		alert("error : ", error);
	                		alert("others = " + xhr, status, error);
	                	}
	                });
              	},
	            eventClick: function(data){
	            	const event = data.jsEvent.srcElement;
	            	var reservationNum = data.event.extendedProps.reservationNum;
					console.log(reservationNum);
	            	$.ajax({
	            		url:"<c:url value='/host/calendarDetail?reservationNum="+reservationNum+"'/>",
	            		type:'get',
	            		success:function(response){
	            			console.log(response)
	            			
						var htmlStr =   '<div class="contentWrapper">' +
										'<div class="contetnHead">'+
										'<div class="row">'+
										'<div class="col-9">'+
										'	예약내용'+
										'</div>'+
										'<div class="col-2 reservationNum">'+
										'예약번호 &nbsp;:&nbsp;&nbsp;&nbsp; '+response.RESERVATION_NUM+''+ 					 	
										'</div>'+
										'</div>'+
										'</div>'+
										'<div class="contentBox">'+
										'<div class="row">'+
										'	<div class="col-4">신청일</div>'+
										'<div class="col-8">'+response.RESERVER_PAY_DAY+'</div>'+
										'</div>'+
										'<hr>'+
										'<div class="row">'+
										'	<div class="col-4">예약공간</div>'+
										'	<div class="col-8">'+response.SPACE_NAME + response.SD_TYPE+'</div>'+
										'</div>'+
										'<hr>'+
										'<div class="row">'+
										'		<div class="col-4">예약내용</div>'+
										'			<div class="col-8"> '+ response.RESERVE_START_DAY + '('+response.RESERVE_START_HOUR +'시'+ ~ response.RESERVE_FINISH_HOUR시+')</div>'+
										'		</div>'+
										'		<hr>'+
										'		<div class="row">'+
										'			<div class="col-4">예약인원</div>'+
										'			<div class="col-8">'+response.RESERVE_PEOPLE +'명</div>'+
										'		</div>'+
										'		<hr>'+
										'		<div class="row">'+
										'			<div class="col-4">결제정보</div>'+
										'			<div class="col-8">카카오페이('+response.RESERVE_PRICE+'원)</div>'+
										'		</div>'+
										'	</div>'+
										'</div>';
		            			
	            			$('#modalBody').html(htmlStr);
	            			$('#exampleModalLabel').text(data.event.title);
	    	            	event.setAttribute('data-bs-target', '#modal');
	    	            	event.setAttribute('data-bs-toggle', 'modal');
	    	            	$("#modal").modal("show");
	            		},
	            		error:function(xhr, status, error){
	            			$('.modal-title').text(data.event.title);
	            			$('.modal-body').text(data.event.extendedProps.content);
	            			$("#exampleModal").modal("show");
	            		}
	            	});//ajax
	            	
	            }//eventClick
	            
    	    });
    	  calendar.render();
    	});
    </script>
    <script type="text/javascript">
    </script>
<style type="text/css">
@keyframes fadein {from {opacity: 0;}to {opacity: 1;}}

	.fc-license-message{z-index:-1 !important;}
	
	.fade-in{
		animation: fadein 2s;
	}

	body{
		background: lightgrey;
	}
	.row{
		margin-top: 6%;
   		margin-bottom: 3%;
	}
	.row.body{
		margin-top:1%;
		margin-bottom: 3%;
	}
	.col-3{
		margin: 0% 0% 0% 2.5%;
		padding:0% 0% 0% 0%;
		background: white;
		border-left : #193D76 solid 4px;
		border-top : #193D76 solid 4px;
		border-bottom : #193D76 solid 4px;
	}
	#calendar{
		border : #193D76 solid 4px;
	}
	.calendarHeader{
		margin-top:75px;
	}
	.calendar-wrapper{
		width:70%;
		background: white;
		padding:0;
	}
	.fc .fc-button{
		background: #193D76 !important;
		font-weight: bold;
	}
	.fc .fc-button:disabled{
		opacity:1 !important;
		background: #193D76 !important;
		color:grey;
	}
	.fc-icon .fc-icon-chevron-right{
		background: #193D76 !important;
	} 
	.fc-icon .fc-icon-chevron-left{
		background: #193D76 !important;
	} 
	.fc-header-toolbar.fc-toolbar {
		background: #ffd014;
		margin-bottom:0 !important;
		padding: 0.5% 2% 0.5% 2% !important;
	}
	.fc-event, .fc-event-dot {
		cursor: pointer;
	}
	.event-popup{
		height: 100px;
		background: red;
		z-index:1000;
	}
	.fc-col-header-cell{
		background: inherit !important;
	}

	.fc-day-sat.fc-day-other{
		background: inherit;
	}
	
	.fc-day-sun.fc-day-other{
		background: inherit;
	}
	.fc-col-header-cell.fc-day.fc-day-sun .fc-col-header-cell-cushion {
	  color: red;
	}
	.fc-col-header-cell.fc-day.fc-day-sat .fc-col-header-cell-cushion {
	  color: blue;
	}
	.fc-day-sat {
		background-color: rgba(25, 61, 118, 0.23); /* 토요일 배경색 */
	}
	.fc-day-sun {
		background-color: rgba(255, 208, 20, 0.23); /* 일요일 배경색 */
	}
	.fc-day-today{
		background-color:rgba(255, 173, 20, 0.5);
	}
	
	
	.fc-daygrid-day-number{
		font-size:16px;
		font-weight: bold;
	}
	.fc-toolbar-title{
		font-weight: bold;
	}
	.popover{
		z-index:100000 !important;
	}
	.col-8.sum{
		opacity: 1;
        transition: 0.3s;
	}
	
	#wonIcon{
	    background: rgba(255, 208, 20, 0.8);
	    display: inline-block;
	    font-weight: bold;
	    font-size: 26px;
	    border-radius: 2rem;
	    margin-left: 1%;
	    padding: 3% 2% 1% 2%;
	    width: 12%;
	    text-align: center;
	    color:white;
	    animation: fadein 0.7s;
	}
	#sumPrice{
		display:inline-block; 
		margin-left:4%; 
		font-weight: bold;
		padding-top: 5%;
		line-height: 1;
		margin-bottom:0;
		animation: fadein 2s;
	}
	.statisticHeader{
		width: 100%;
		padding:4% 0% 3% 4%;
		border: 1px solid #ffd014;	
		background:#193D76;
		
	}
	.statisticBody{
		padding:5% 4% 5% 4%;
	}
	.fc-theme-standard .fc-popover-header{
		background : #ffd014;
		color:black;
		font-weight: bold;
	}
	.fc-theme-standard .fc-popover{
		    border: 2px solid #193D76 !important;
	}

	.modal-fullscreen .modal-content {
	    height: 90%;
	    border: 0;
	    border-radius: 0;
	    width: 90%;
	    margin: 2% 0% 0% 5%;
	}	
	


	.modal-header{
		background:#ffd014;
	}
	.modal-footer{
		background: #193D76;
	}
	.modal-body{
		
		padding: 2% 8% 2% 8%;
		
		.contentWrapper{
			border: rgba(0, 0, 0, 0.1) solid 2px;
			border-radius: 1rem;
			margin-top:1%;
		}
		.contetnHead{
			background: rgba(0, 0, 0, 0.06);
			border-top-right-radius: 0.8rem; 
			border-top-left-radius: 0.8rem;
			
			padding: 1% 0% 1% 2%;
			
			font-weight: bold;
			font-size: 28px;
			
		}
		.contentBox{
			margin-top:1%;
			padding:1% 2% 2% 2%;
		}
		.row{
		    margin-top: 1%;
    		margin-bottom: 1%;
		}
		.col-9{
			color:rgba(0, 0, 0, 0.8);
		}
		.col-2.reservationNum{
			background: white;
			border : rgba(0, 0, 0, 0.3) 2px solid; 
			border-radius:1.5rem;
			
			font-size: 20px;
			font-weight: bold;
			color:rgba(0, 0, 0, 0.8);
			padding:0.7% 0% 0.5% 1%;
			
		}
		.col-4{
			font-weight: bolder;
			font-size: 26px;
			color: rgba(0, 0, 0, 0.33);	
		}
		.col-8{
			text-align: left;
			padding:0% 0% 0% 0%;
			
			color:black;	
			font-size: 20px;
			font-weight: bold;
		}
		.goback{
			padding-left:2%;
			padding-top:5%;
			font-size: 40px;
		}
	}
	.incomeBox{
		height: 65px;
		padding:0% 0% 0% 0%
	}
	
		
	
</style>
	<div class="calendarHeader">
 	</div>
 	<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-fullscreen">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel" style="font-weight: bold;">예약정보</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body" id = "modalBody">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	</div>
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel"  style="font-weight: bold;"></h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body" style="font-weight: bold; color:black; font-size:24px;padding:5% 5% 5% 5%;">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary">일정 삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
 	<div class="row">
 		<div class = "col-3">
 			<div class="statisticHeader">
 				<h4 style="color:white; font-weight: bold">${sessionScope.userId}님 환영합니다.</h4>
 			</div>
 			<div class="statisticBody">
				<div class="row body">
	 				<div class="col-2" id="wonIcon" style="display: inline-block;">
	 					<h4 style="color:white;font-weight: bold;font-size: 24px;">₩</h4>
	 				</div>
					<div class="col-8 sum" style="display: inline-block;">
						<h4 id="sumPrice">
							일별 매출액
						</h4>
					</div>
				</div>
 			</div>
 		</div>
 		<div class = "col-8 calendar-wrapper">
 			<div id='calendar'></div>
 		</div>
	</div>
	
