<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <script src="<c:url value='/userMain/board/couponscript.js'/>"></script> --%>
 <%@ include file="/WEB-INF/views/form/userTop.jsp" %> 
  
<style>
section{
	margin-bottom: 50px;
}
.rouletter {
  position: relative;
  width: 186px;
  height: 400px;
  margin-top: 200px;
}
.rouletter-bg {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 350px;
  height: 350px;
  border-radius: 350px;
  overflow: hidden;
}
.rouletter-wacu {
  width: 100%;
  height: 100%;
  background: #f5f5f2;
  background-size: 100%;
  transform-origin: center;
  transition-timing-function: ease-in-out;
  transition: 2s;
}
.rouletter-arrow {
  position: absolute;
  top: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 1px;
  height: 1px;
  border-right: 10px solid transparent;
  border-left: 10px solid transparent;
  border-top: 40px solid red;
  border-bottom: 0px solid transparent;
}
.rouletter-btn {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 80px;
  height: 80px;
  border-radius: 80px;
  background: #fff;
  border-image: linear-gradient(to right, #fbfcb9be, #ffcdf3aa, #65d3ffaa);
  border: 2px solid;
}

.hidden-input {
  display: none;
}
#generateButton,#roulette{
	 justify-content: center;
      max-width: 1200px;
      margin: 0 auto; 
      margin-left: 700px; 
      position: center;
	 width: 200px;
}
</style>
<section>
  <div id="roulette" class="roulette">
	    <div id="app">
	    
	    </div>
  </div>
  <div var="num" class="couponBox">
	   <button id="generateButton" onclick="generateCoupon()" >랜덤 쿠폰 발급</button>
	   <p id="couponDisplay" ></p>
		<!-- Button trigger modal -->
		<button id="generateButton" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
		  Launch demo modal
		</button>
  </div>
</section>
<!-- Modal 디자인 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
	       <div class="modal-body2">
			  <h2 class="fs-5">Popover in a modal</h2>
			  <p>This <button class="btn btn-secondary" data-bs-toggle="popover" title="Popover title" data-bs-content="Popover body content is set in this attribute.">button</button> triggers a popover on click.</p>
			  <hr>
			  <h2 class="fs-5">Tooltips in a modal</h2>
			  <p><a href="#" data-bs-toggle="tooltip" title="Tooltip">This link</a> and <a href="#" data-bs-toggle="tooltip" title="Tooltip">that link</a> have tooltips on hover.</p>
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>	
<!-- Modal 디자인 끝 -->

<script>

//모달
/* const myModal = document.getElementById('myModal')
const myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus()
}) */

//값 받아서 알림창으로 출력
function generateCoupon() {
 	// 오늘의 날짜를 YYYY-MM-DD 형식으로 얻음
    var today = new Date().toISOString().slice(0, 10);
    var lastClickDate = localStorage.getItem("lastClickDate");

    if (lastClickDate !== today) {
        // 오늘 클릭한 경우에만 쿠폰 발행
        var generatedCoupon = "${num}"; // 서버에서 전달된 num 값
        alert("발행된 쿠폰 번호 : \"" + generatedCoupon + "\"");
        // 오늘의 날짜를 로컬 스토리지에 저장
        localStorage.setItem("lastClickDate", today);
        // 클릭 이벤트 핸들러를 제거하여 버튼이 다시 클릭되지 않게 함
        document.getElementById("generateButton").removeEventListener("click", generateCoupon);
    } else {
        alert("쿠폰은 하루 한 번만 발급됩니다.");
    }
}

	// 페이지 로드 시에 실행되는 함수
window.onload = function() {
    // 오늘의 날짜와 로컬 스토리지에 저장된 날짜 비교
    var today = new Date().toISOString().slice(0, 10);
    var lastClickDate = localStorage.getItem("lastClickDate");
    if (lastClickDate !== today) {
        // 로컬 스토리지에 저장된 날짜가 오늘이 아니라면 클릭 이벤트 핸들러 추가
        document.getElementById("generateButton").addEventListener("click", generateCoupon);
    }
};


    var rolLength = 6; // 해당 룰렛 콘텐츠 갯수
    var setNum; // 랜덤숫자 담을 변수
    var hiddenInput = document.createElement("input");
    hiddenInput.className = "hidden-input";

    //랜덤숫자부여
    const rRandom = () => {
      var min = Math.ceil(0);
      var max = Math.floor(rolLength - 1);
      return Math.floor(Math.random() * (max - min)) + min;
    };

    const rRotate = () => {
      var panel = document.querySelector(".rouletter-wacu");
      var btn = document.querySelector(".rouletter-btn");
      var deg = [];
      // 룰렛 각도 설정(rolLength = 6)
      for (var i = 1, len = rolLength; i <= len; i++) {
        deg.push((360 / len) * i);
      }
      
      // 랜덤 생성된 숫자를 히든 인풋에 넣기
      var num = 0;
      document.body.append(hiddenInput);
      setNum = hiddenInput.value = rRandom();
    	
      // 애니설정
      var ani = setInterval(() => {
        num++;
        panel.style.transform = "rotate(" + 360 * num + "deg)";
        btn.disabled = true; //button,input
        btn.style.pointerEvents = "none"; //a 태그
        
        // 총 50에 다달했을때, 즉 마지막 바퀴를 돌고나서
        if (num === 50) {
          clearInterval(ani);
          panel.style.transform = `rotate(${deg[setNum]}deg)`;
        }
      }, 50);
    };

    // 정해진 alert띄우기, custom modal등
    const rLayerPopup = (num) => {
      switch (num) {
        case 1:
          alert("당첨!! 햄버거 세트 교환권");
          break;
      /*case 3:
          alert("당첨!! CU 3,000원 상품권"); 
          break;
        case 5:
          alert("당첨!! 스타벅스 아메리카노");
          break; */
        default:
          alert("꽝!다음번에 다시 도전하세요");
      }
    };

    // reset
    const rReset = (ele) => {
      setTimeout(() => {
        ele.disabled = false;
        ele.style.pointerEvents = "auto";
        rLayerPopup(setNum);
        hiddenInput.remove();
      }, 5500);
    };

    // 룰렛 이벤트 클릭 버튼
    document.addEventListener("click", function (e) {
      var target = e.target;
      if (target.tagName === "BUTTON") {
        rRotate();
        rReset(target);
      }
    });

    // roulette default
    document.getElementById("app").innerHTML = `
    <div class="rouletter">
        <div class="rouletter-bg">
            <div class="rouletter-wacu"></div>
        </div>
        <div class="rouletter-arrow"></div>
        <button class="rouletter-btn">start</button>
    </div>
    `;
    </script>
    
<%@ include file="/WEB-INF/views/form/userBottom.jsp" %>
 
