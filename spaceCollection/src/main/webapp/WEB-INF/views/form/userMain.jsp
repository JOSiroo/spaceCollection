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
       margin-top: 40px;
	   font-size: 30px;
	   font-weight: bold;
      }
      
    </style>
  
  	<h1 >어떤 공간을 찾고 있나요?</h1>
    <div class="icon-container">
	  <% for (int i = 1; i <= 12; i++) { %>
	    <div class="icon" id="iconimag">
	      <a href="">
	        <img src="${pageContext.request.contextPath}/images/main_icon<%= i %>.png">
	      </a>
	    </div>
	  <% } %>
	</div>

