<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/hostTop.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
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
    	    height: 1000,
    	    weekends: true, 
    	    events: [
    	      {
    	        title: '이벤트 1',
    	        start: '2023-08-01',
    	        end: '2023-08-02'
    	      },
    	      // 다른 이벤트...
    	    ],
    	    eventClick: function(info) {
    	      if (!popup) { // 팝업이 없을 때만 생성
    	        popup = document.createElement('div');
    	        popup.className = 'event-popup';
    	        popup.innerHTML = info.event.title;

    	        savedInfo = info; // 클릭한 이벤트 정보 저장

    	        // 팝업을 바디에 추가합니다
    	        document.body.appendChild(popup);

    	        updatePopupPosition(); // 팝업 위치 업데이트

    	        // 팝업 외부를 클릭하면 팝업을 제거합니다
    	        document.addEventListener('click', clickOutside);

    	        // 클릭 이벤트 중지 (전파 방지)
    	        info.jsEvent.stopPropagation();
    	      }
    	    }
    	  });

    	  // 팝업 외부를 클릭했을 때 팝업을 제거하는 함수
    	  function clickOutside(event) {
    	    var clickedElement = event.target;

    	    if (!popup.contains(clickedElement)) {
    	      closePopup();
    	    }
    	  }

    	  // 팝업을 닫는 함수
    	  function closePopup() {
    	    if (popup) {
    	      popup.remove();
    	      popup = null;
    	      document.removeEventListener('click', clickOutside);
    	    }
    	  }

    	  // 창 크기가 조정될 때 팝업 위치 업데이트
    	  window.addEventListener('resize', updatePopupPosition);

    	  function updatePopupPosition() {
    	    if (popup && savedInfo) {
    	      var eventElement = savedInfo.el;
    	      var eventPosition = eventElement.getBoundingClientRect();

    	      popup.style.position = 'absolute';
    	      popup.style.left = eventPosition.left +2+ 'px';
    	      popup.style.top = eventPosition.top +20+ 'px';
    	      popup.style.width = eventPosition.width + 'px';
    	    }
    	  }

    	  calendar.render();
    	});
    document.addEventListener('click', function(event) {
    	  var clickedElement = event.target;

    	  // 클릭한 요소가 팝업 레이아웃이 아닐 경우 모든 팝업 제거
    	  if (!clickedElement.classList.contains('event-popup')) {
    	    var popups = document.querySelectorAll('.event-popup');
    	    popups.forEach(function(popup) {
    	      popup.remove();
    	    });
    	  }
    	});
    </script>
    <script type="text/javascript">
    </script>
<style type="text/css">
	body{
		background: #efefef;
	}
	#calendar{
		border : #193D76 solid 4px;
	}
	.calendarHeader{
		margin-top:75px;
	}
	.calendar-wrapper{
		width:80%;
		margin: 5% 0% 0% 15%;
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
		background-color: rgb(135, 206, 250,0.3); /* 토요일 배경색 */
	}
	
	.fc-day-sun {
		background-color: rgb(255, 182, 193, 0.3); /* 일요일 배경색 */
	}
	.fc-daygrid-day-number{
		font-size:16px;
		font-weight: bold;
	}
	.fc-toolbar-title{
		font-weight: bold;
	}
</style>
<body>
	<div class="calendarHeader">
 	</div>
 		<div class = "calendar-wrapper">
 			<div id='calendar'></div>
 		</div>
</body>
</html>