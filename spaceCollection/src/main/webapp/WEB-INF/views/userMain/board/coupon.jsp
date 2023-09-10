<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/form/userTop.jsp" %> 
 
<style>
section {
	width:100%;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    max-width: 1200px;
    margin: 0 auto;
    margin-top: 300px;
    margin-bottom: 200px;
}
.couponBox {
    text-align: center;
}
</style>

<script>
    
 	 //모달
    const myModal = document.getElementById('myModal')
    const myInput = document.getElementById('myInput')

    myModal.addEventListener('shown.bs.modal', () => {
      myInput.focus()
    })
    
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
    
</script>
<section>
 <div var="num" class="couponBox">
 
	   <button id="generateButton" class="btn btn-primary"  id="display" onclick="generateCoupon()" >랜덤 쿠폰 발급</button>
	   <p id="couponDisplay" ></p>
		버튼을 클릭하여 쿠폰 일련번호를 받으세요 <br>
		저장된 쿠폰은 쿠폰함에서 확인 하실 수 있습니다.<br>
		* 쿠폰은 1일 1회까지만 지급됩니다. *
		
  </div> 
</section>

<%@ include file="/WEB-INF/views/form/userBottom.jsp" %>

