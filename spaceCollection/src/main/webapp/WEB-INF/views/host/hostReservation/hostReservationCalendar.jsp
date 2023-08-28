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
	.calendarHeader{
		margin-top:75px;
	}
	.calendar-wrapper{
		width:80%;
		margin: 5% 0% 0% 15%;
	}
	.fc-event, .fc-event-dot {
		cursor: pointer;
	}
	.event-popup{
		height: 100px;
		background: red;
		z-index:1000;
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