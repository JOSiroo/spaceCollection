<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <script src="<c:url value='/userMain/board/couponscript.js'/>"></script> --%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  </head>
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
  <body>
    <div var="num">
    <button id="generateButton" onclick="generateCoupon()" >랜덤 쿠폰 발급</button>
    <p id="couponDisplay" ></p>
	</div>
	
	
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch demo modal
</button>

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
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  </body>
</html>

	


