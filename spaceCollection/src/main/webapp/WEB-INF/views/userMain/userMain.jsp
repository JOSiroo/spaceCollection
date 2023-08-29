<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/JavaScript" src="<c:url value='/js/jquery-3.7.0.min.js'/>" ></script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
  
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
      
    .couponBanner {
    position: relative;
    margin-top: 100px;
    margin-bottom: 134px;
    width: 700px;
	}
      
      
      section.sectionIcon {
		    margin-top: 70px;
		}
		
    </style>
  
  	<section class="sectionIcon" >
  	<h1 >어떤 공간을 찾고 있나요?</h1>
    <div class="icon-container">
	  <c:forEach var="i" begin="5" end="16">
  		<div class="icon" id="iconimage${i}">
		    <a href="<c:url value='/search?spaceTypeNo=${i}' />">
		      <img src="<c:url value='/images/main_icon${i}.png' />">
		    </a>
		</div>
	 </c:forEach>

	</div>
	</section>
	
	<section class="sectionCoupon" >
	<div class="slider-1" style="scale:0.8;">
		<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-inner" >
	    <div class="carousel-item active" >
	    	<a href="<c:url value='/collection?scNum=1' />" >
	      	<img src="<c:url value='/images/couponView1.jpg' />" class="d-block w-100" alt="...">
	      	</a>
	    </div>
	    <div class="carousel-item">
	    	<a href="<c:url value='/collection?scNum=1' />" >
	      	<img src="<c:url value='/images/couponView2.jpg' />" class="d-block w-100" alt="...">
	      	</a>
	    </div>
	    <div class="carousel-item">
	    	<a href="<c:url value='/collection?scNum=1' />" >
	      	<img src="<c:url value='/images/couponView3.jpg' />" class="d-block w-100" alt="...">
	      	</a>
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	</div>
	
	
	</section>
	<%-- <%@ include file="../userMain/userMain2.jsp" %> --%>
	

