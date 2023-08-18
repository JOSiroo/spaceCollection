<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@ include file="/WEB-INF/views/form/userTop.jsp" %> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	
	.registering_comment textarea{
		width:100%;
		border:1px solid #e0e0e0;
	} 
	
	 .registering_comment{
		display:flex;
		justify-content:space-between
	} 
	
  	 section {
    	padding: 0px 300px 200px;
	}

	img.img-fluid {
	    scale: 0.6;
	}
	
	article {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
    max-width: 1200px;
    margin: 0 auto;
    }
    
    .registering_comment {
    display: flex;
    margin-top: 850px;
	}
	
</style>
	<section class="contents member_wrap user_level_mo user_event_mo">
	<div class="profile_inner user_event_mo">
		<div class="profile_inner user_level_mo">
			<article>
				<div class="event_card">
				<img src="images/event.png" alt="Image" class="img-fluid">
				</div>
				<div class="registering_comment"  style="position: absolute;">
				<!-- <textarea placeholder="로그인 후 글을 작성하실 수 있습니다."></textarea>  -->
				<input type="text" placeholder="로그인 후 글을 작성하실 수 있습니다." style="width: 800px;">
				<button type="button" class="btn btn-primary btn-lg" style="scale: 0.8;">등록</button>
				</div> <!---->
				<div class="event_card_text">
				</div>
			</article>
		</div> 
	</div>
	</section>
		
		
<%@ include file="/WEB-INF/views/form/userBottom.jsp" %>