<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
  <style>
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
      max-width: 500px;

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
    
    .infoLink{
    	font-size: 9px;
    	color: #656565;
    	margin-left: 15px;
    	
    }
    
    #kakao-login-btn{
    	width: 200px;
    	margin: 0px auto;
    }
    
    .hr-sect {
        display: flex;
        flex-basis: 100%;
        align-items: center;
        color: rgba(0, 0, 0, 0.35);
        font-size: 12px;
        margin: 8px 0px;
      }
      .hr-sect::before,
      .hr-sect::after {
        content: "";
        flex-grow: 1;
        background: rgba(0, 0, 0, 0.35);
        height: 1px;
        font-size: 0px;
        line-height: 0px;
        margin: 0px 16px;
      }
      
      .register{
      	font-size: 15px;
      	color: #656565;
      	margin-left: 15px;
      }
      .register a{
      	color: black;
      	text-decoration: underline;
      	float: right;
      	margin-right: 15px;
      }
  </style>
</head>
<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-8 mx-auto">
        <h1 class="mb-3" align="center">게스트 로그인</h1>
        <form class="validation-form" novalidate>
        
        <div class="col-md-11 mb-3">
			<a id="kakao-login-btn"></a>
        </div>
        <div class="hr-sect">또는</div>
        
        <hr class="mb-4">
          <div class="row">
            <div class="col-md-11 mb-3" style="margin: 0px auto;">
              <input type="text" class="form-control" id="userid" placeholder="아이디" value="" required>
              <div class="invalid-feedback">
                아이디를 입력해주세요.
              </div>
            </div>
          </div>
           <div class="row">
            <div class="col-md-11 mb-3" style="margin: 0px auto;">
              <input type="password" class="form-control" id="nickname" placeholder="비밀번호" value="" required>
              <div class="invalid-feedback">
                비밀번호를 입력해주세요.
              </div>
            </div>
           </div>
           <div class="col-md-12 mb-3">
          	<input type="checkbox" name="chkSave" id="chkSave" style="bottom: 30px;">
          	<label for="chkSave" style="font-size: 12px; ">아이디 저장</label>
          	<a href="#" style="color: black; font-size: 12px; float: right;">비밀번호 찾기</a>
           </div>
          <div class="col-md-12 mb-3" style="margin: 0px auto;">
         	 <button class="btn btn-primary btn-lg btn-block" type="submit">로그인</button>
          </div>
          <div class="register">아직 스페이스컬렉션 회원이 아니신가요?
          	<a href="#" class="register">회원가입</a>
          </div>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2023 YD</p>
    </footer>
  </div>
  <script type="text/javascript">
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
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('0865f25b9e2e1e9ea1619b5c2d9d8fdf');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
        container: '#kakao-login-btn',
        success: function (authObj) {
            alert(JSON.stringify(authObj));
        },
        fail: function (err) {
            alert(JSON.stringify(err));
        }
    });
  //]]>
  </script>
</body>
</html>