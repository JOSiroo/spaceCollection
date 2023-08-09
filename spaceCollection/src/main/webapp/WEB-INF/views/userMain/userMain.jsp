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
      
      
    /* 쿠폰뷰 슬라이드 */
    a {
    color:inherit;
    text-decoration:none;
	}
	
	/* 커스텀 */
	
	/* 슬라이더 1 시작 */
	.slider-1 {
	    height:200px;
	    position:relative;
	}
	
	/* 슬라이더 1 - 페이지 버튼 */
	.slider-1 > .page-btns {
	    text-align:center;
	    position:absolute;
	    bottom:20px;
	    left:0;
	    width:100%;
	}
	
	.slider-1 > .page-btns > div {
	    width:20px;
	    height:20px;
	    background-color:rgba(255,255,255,.5);
	    border-radius:4px;
	    display:inline-block;
	    cursor:pointer;
	}
	
	.slider-1 > .page-btns > div.active {
	    background-color:rgba(255,255,255,1);
	}
	
	/* 슬라이더 1 - 슬라이드 */
	
	.slider-1 > .slides > div {
	    position:absolute;
	    top:0;
	    left:0;
	    right:0;
	    bottom:0;
	    opacity:0;
	    transition: opacity 0.3s;
	    background-position:center;
	    background-size:cover;
	    background-repeat:no-repeat;
	}
	
	.slider-1 > .slides > div.active {
	    opacity:1;
	}
	
	/* 슬라이더 좌우 버튼 */
	.slider-1 > .side-btns > div {
	    position:absolute;
	    top:0;
	    left:0;
	    width:25%;
	    height:100%;
	    cursor:pointer;
	}
	.slider-1 > .side-btns > div:last-child {
	    left:auto;
	    right:0;
	}
	.slider-1 >.side-btns > div > span {
	    position:absolute;
	    top:50%;
	    left:20px;
	    transform:translatey(-50%);
	    background-color:white;
	    opacity:0.5;
	    padding:1px 13px;
	    border-radius:50px;
	    font-size:25px;
	}
	
	.slider-1 {
	        display: flex;
	        flex-wrap: wrap;
	        gap: 20px;
	        justify-content: center;
	        max-width: 1500px;
	        margin: 0 auto; /* 수평 가운데 정렬 */
      }
      
    </style>
    
	<script type="text/javascript">
	console.clear();
	
	// 기존 버튼형 슬라이더
	$('.slider-1 > .page-btns > div').click(function(){
	    var $this = $(this);
	    var index = $this.index();
	    
	    $this.addClass('active');
	    $this.siblings('.active').removeClass('active');
	    
	    var $slider = $this.parent().parent();
	    
	    var $current = $slider.find(' > .slides > div.active');
	    
	    var $post = $slider.find(' > .slides > div').eq(index);
	    
	    $current.removeClass('active');
	    $post.addClass('active');
	});
	
	// 좌/우 버튼 추가 슬라이더
	$('.slider-1 > .side-btns > div').click(function(){
	    var $this = $(this);
	    var $slider = $this.closest('.slider-1');
	    
	    var index = $this.index();
	    var isLeft = index == 0;
	    
	    var $current = $slider.find(' > .page-btns > div.active');
	    var $post;
	    
	    if ( isLeft ){
	        $post = $current.prev();
	    }
	    else {
	        $post = $current.next();
	    };
	    
	    if ( $post.length == 0 ){
	        if ( isLeft ){
	            $post = $slider.find(' > .page-btns > div:last-child');
	        }
	        else {
	            $post = $slider.find(' > .page-btns > div:first-child');
	        }
	    };
	    
	    $post.click();
	});
	
	setInterval(function(){
	    $('.slider-1 > .side-btns > div').eq(1).click();
	}, 3000);
	</script>
    
  
  	<h1 >어떤 공간을 찾고 있나요?</h1>
  	<section class="sectionIcon" >
    <div class="icon-container">
	  <% for (int i = 1; i <= 12; i++) { %>
	    <div class="icon" id="iconimag">
	      <a href="">
	        <img src="${pageContext.request.contextPath}/images/main_icon<%= i %>.png">
	      </a>
	    </div>
	  <% } %>
	</div>
	</section>
	
	<section class="sectionCoupon" >
	<div class="slider-1" style="scale:0.8;">
    <div class="slides">
        <div class="active" style=" background-image:url(https://kr.object.ncloudstorage.com/scloud-service/service/168653026_ca5303bc12a915374368a241118a3ff3.jpg);"></div>
        <div style=" background-image:url(url(https://kr.object.ncloudstorage.com/scloud-service/service/168663921_ce694db6127c2bed0c3b37c7003089ec.jpg);"></div>
        <div style=" background-image:url(https://kr.object.ncloudstorage.com/scloud-service/service/168895894_1e396191825059b063ac8327635e5df3.jpg);"></div>
    </div>
    <div class="page-btns">
        <div class="active"></div>
        <div></div>
        <div></div>
        <div></div>
    </div>
	</div>
	</section>
	
	<%-- <%@ include file="../userMain/userMain2.jsp" %> --%>
	

