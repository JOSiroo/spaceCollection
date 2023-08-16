<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- 리셋 css -->
  <link rel="stylesheet" href="./common/minireset.min.css">
  <!-- favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico">
  <!-- og -->
  <!-- index css -->
  <link rel="stylesheet" href="./css/about.css">
  <!-- index js -->
  <script defer src="./js/about.js"></script>

</head>
  <title>회사소개</title>
  <link rel="stylesheet" href="CSS/style.css">
</head>
<style type="text/css">
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

li{
  list-style-type: none;
}

/* 보여줄 구간의 높이와 넓이 설정 */
#slideShow{
  width: 700px;
  height: 500px;
  position: relative;
  margin: 50px auto;
  overflow: hidden;   
  /*리스트 형식으로 이미지를 일렬로 
  정렬할 것이기 때문에, 500px 밖으로 튀어 나간 이미지들은
  hidden으로 숨겨줘야됨*/
}

img {
    width: 500px;
}

.slides{
  position: absolute;
  left: 0;
  top: 0;
  width: 2500px; /* 슬라이드할 사진과 마진 총 넓이 */
  transition: left 0.5s ease-out; 
  /*ease-out: 처음에는 느렸다가 점점 빨라짐*/
}

/* 첫 번째 슬라이드 가운데에 정렬하기위해
첫번째 슬라이드만 margin-left조정 */
.slides li:first-child{
  margin-left: 100px;
}

/* 슬라이드들 옆으로 정렬 */
.slides li:not(:last-child){
  float: left;
  margin-right: 100px;
}

.slides li{
  float: left;
}

.controller span{
  position:absolute;
  background-color: transparent;
  color: black;
  text-align: center;
  border-radius: 50%;
  padding: 10px 20px;
  top: 50%;
  font-size: 1.3em;
  cursor: pointer;
}

/* 이전, 다음 화살표에 마우스 커서가 올라가 있을때 */
.controller span:hover{
  background-color: rgba(128, 128, 128, 0.11);
}

.prev{
  left: 10px;
}

/* 이전 화살표에 마우스 커서가 올라가 있을때 
이전 화살표가 살짝 왼쪽으로 이동하는 효과*/
.prev:hover{
  transform: translateX(-10px);
}

.next{
  right: 10px;
}

/* 다음 화살표에 마우스 커서가 올라가 있을때 
이전 화살표가 살짝 오른쪽으로 이동하는 효과*/
.next:hover{
  transform: translateX(10px);
}
</style>

<body>

<!-- 로고 -->
  <div class="introLogo">
    <p></p>
  </div>

  <!--  <div class="topBtn">   -->
  
  <div class="topBtn">
    <span>
      <img src="./img/ind_arrow-down.svg" alt="아래 화살표" id="downArrow">
      <a href="#" id="upArrow">
        <img src="./img/index_arrow-up.svg" alt="위 화살표">
      </a>
    </span>
  </div>
<section class="sec1">
      <div class="container">
        <div class="sec1Txt txtBox">
          <em>Space Collection</em>
          <h1 class="title">
            <p><span class="del">세상의</span></p>
            <p><span class="del1">모든 공간</span></p>
          </h1>
          <div class="sTxtWrapper">
            <p class="sTxt">
              새로운 도시혁신 서비스로 머물기 좋은 도시를 만드는 소셜벤처</em>
            </p>
          </div>
          <div class="hovBox">
            <span>
              <img src="./images/q.png" alt="물음표">
            </span>
            <a href="./whatWeDo.html">what we do</a>
            <img src="./images/q.png" alt="물음표" class="gone">
          </div>
        </div>
        </div>
        </section>


  <div id="slideShow">
    <ul class="slides">
    	<div>
      <li><img src="images/about1.png" alt=""></li>
      </div>
    </ul>  
    <ul class="slides">
     <li><img src="images/about2.png" alt=""></li>
      </ul>
    <ul class="slides">
      <li><img src="images/about3.pngg" alt=""></li>
      </ul>
    <p class="controller">
      <!-- &lang: 왼쪽 방향 화살표
      &rang: 오른쪽 방향 화살표 -->
      <span class="prev">&lang;</span>  
      <span class="next">&rang;</span>
    </p>
  </div>
  <script src="js/slideShow.js"></script>
</body>
</html>