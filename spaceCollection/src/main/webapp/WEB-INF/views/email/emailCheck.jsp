<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증</title>
  <!-- Bootstrap CSS -->
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    #mailCheckBody { 
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#F6F6F6), to(#F6F6F6));
      background: -webkit-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
      background: -moz-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
      background: -o-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
      background: linear-gradient(to top right, #F6F6F6 0%, #F6F6F6 100%);
      width: 500px;
      margin: 0 auto;
      
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    
    #timer{
    	color: #e4271a;
    }
  </style>
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		
		$("#checkEmail").click(function(){
			if($("#userEmail").val().length<1){
				alert("이메일을 입력해주세요!");
				return false;
			}
			
			$("form[name=frmEmail]").submit();
		});	
		
 		$("#checkCode").click(function(){
			
			if($("#acNumber").val().length<1){
				alert("인증번호 6자리를 입력해주세요.");
				return false;
			}
			
			if($("#acNumber").val()===$("#authCode").val()){
				userEmail= $("#acEmail").val();
				var type="${param.type}";
				var link="";
				if(type==="findId"){
					link = "<c:url value='/guest/completeFindId?userEmail=${acEamil }'/>";
				}else if(type==="findPwd"){
					
				}else if(type==="register"){
					alert("이메일 인증이 완료되었습니다!");
					opener.$("#userEmail").val(userEmail);
					opener.$("#userEmail").attr('readonly',true);
					opener.$("#chkEmail").val("Y");
					self.close();
				}
				
				location.href = link;
			}else{
				alert("인증번호가 일치하지 않습니다.");
				return false;
			}
			
		});
 		
 		// 시작 시간 설정 (5분)
        var startTime = 5 * 60;

        // 타이머 업데이트 함수
        function updateTimer() {
            var minutes = Math.floor(startTime / 60);
            var seconds = startTime % 60;

            // 앞에 0을 추가하여 두 자리 숫자로 표시
            var formattedTime = (minutes < 10 ? '0' : '') + minutes + ':' + (seconds < 10 ? '0' : '') + seconds;

            $('#timer').text(formattedTime);

            // 1초씩 감소
            startTime--;

            // 타이머 종료
            if (startTime < 0) {
                clearInterval(timerInterval);
                $('#authCode').val(""); //인증코드 소멸
                alert("인증 기간이 만료되었습니다.");
            }
        }

        // 1초마다 타이머 업데이트
        var timerInterval = setInterval(updateTimer, 1000);
	});
		
</script>
</head>
<body id="mailCheckBody">
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">이메일 인증</h4>
        <form name="frmEmail" class="validation-form" method="post" action="<c:url value='/email/sendEmail'/>" novalidate>
        <input type="hidden" name="type" value="${param.type }">
        <div class="row">
	            <div class="col-md-8 mb-3">
	            	<label for="checkEmail">이메일</label>
	            	<input type="email" class="form-control" name="userEmail" id="userEmail" value="${param.userEmail }" placeholder="이메일" required>
		            <div class="invalid-feedback">
		            	이메일을 입력해주세요.
		            </div>
	            </div>
	          	<div class="col-md-3 mb-3">
					<label>&nbsp;</label>
					  <input type="button" class="btn btn-secondary" id="checkEmail" value="이메일 인증"
					  	style="width: 125px;text-align: center;">
	            </div>
		    </div>	
        <div class="row">
	            <div class="col-md-8 mb-3">
	            	<label for="acNumber">인증번호</label>
	            	<input type="text" class="form-control" name="acNumber" id="acNumber" placeholder="인증번호 6자리를 입력해주세요" required>
	            	<input type="hidden" id="authCode" value="${authCode }">
	            	<c:if test="${!empty authCode }">
	            		<label>인증 만료 : </label><span id="timer">05:00</span>
	            	</c:if>
	            	<input type="hidden" id="acEmail" value="${acEamil }"> 
		            <div class="invalid-feedback">
		            	인증번호를 입력해주세요.
		            </div>
	            </div>
	          	<div class="col-md-3 mb-3">
					<label>&nbsp;</label>
					  <input type="button" class="btn btn-secondary" id="checkCode" value="확인"
					  	style="width: 125px;text-align: center;">
	            </div>
		    </div>	
        </form>
      </div>
    </div>
  </div>
  <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
</body>
</html>