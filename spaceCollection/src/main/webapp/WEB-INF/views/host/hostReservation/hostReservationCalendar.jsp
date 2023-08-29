<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/hostTop.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.8/index.global.min.js"></script>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.0/main.css' rel='stylesheet' />
    <script>
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
    	    events: [
    	    	<c:forEach var ="i" items="${list}">
		    	      {
		    	        title: '${i.SPACE_NAME }',
		    	        start: '${i.RESERVE_START_DAY}',
		    	        extendedProps: {
		    	            content: '${i.SD_TYPE} / ${i.RESERVE_START_HOUR}시 ~ ${i.RESERVE_FINISH_HOUR}시 ${i.RESERVE_PEOPLE}명'
		    	          }
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
	            }
    	    });
    	  calendar.render();
    	});
    </script>
    <script type="text/javascript">
    </script>
<style type="text/css">
	body{
		background: rgba(128, 157, 255, 0.1);
	}
	#calendar{
		border : #193D76 solid 4px;
	}
	.calendarHeader{
		margin-top:75px;
	}
	.calendar-wrapper{
		width:70%;
		margin: 5% 0% 2% 29%;
		background: white;
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
	.fc-toolbar-chunk{
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
		background-color:rgba(255, 173, 20, 0.5) !important;
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
</style>
	<div class="calendarHeader">
 	</div>
 		<div class = "calendar-wrapper">
 			<div id='calendar'></div>
 		</div>
<%@ include file="/WEB-INF/views/form/hostBottom.jsp" %>