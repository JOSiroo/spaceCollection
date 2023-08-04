<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
  
    <title>아이콘 목록</title>
    <style>
      .icon-container {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        justify-content: center;
        max-width: 1200px;
        margin: 0 auto; /* 수평 가운데 정렬 */
      }

      .icon {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 180px; 
        height: 180px;

        cursor: pointer;
      }

   
      
      h1{
       text-align: center;
       margin-bottom: 50px;
      }
      
    </style>
  
  	<h1>Please select a space.</h1>
    <div class="icon-container" >
      <!-- 아이콘을 출력. -->
      <div class="icon" id="iconimag"><img src="${pageContext.request.contextPath}/images/main_icon1.png"></a></div>
      <div class="icon" id="iconimag"><img src="${pageContext.request.contextPath}/images/main_icon2.png"></a></div>
      <div class="icon" id="iconimag"><img src="${pageContext.request.contextPath}/images/main_icon3.png"></a></div>
      <div class="icon" id="iconimag"><img src="${pageContext.request.contextPath}/images/main_icon4.png"></a></div>
      <div class="icon" id="iconimag"><img src="${pageContext.request.contextPath}/images/main_icon5.png"></a></div>
      <div class="icon" id="iconimag"><img src="${pageContext.request.contextPath}/images/main_icon6.png"></a></div>
      <div class="icon" id="iconimag"><img src="${pageContext.request.contextPath}/images/main_icon7.png"></a></div>
      <div class="icon" id="iconimag"><img src="${pageContext.request.contextPath}/images/main_icon8.png"></a></div>
      <div class="icon" id="iconimag"><img src="${pageContext.request.contextPath}/images/main_icon9.png"></a></div>
      <div class="icon" id="iconimag"><img src="${pageContext.request.contextPath}/images/main_icon10.png"></a></div>
     </div>

