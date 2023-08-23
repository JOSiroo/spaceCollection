<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../form/userTop.jsp" %>
<%-- <%@include file="myPageMenu.jsp" %> --%>

<style type="text/css">
	.wrapProfile{
	  min-height: 100vh;
	  
	  background: -webkit-gradient(linear, left bottom, right top, from(#F6F6F6), to(#F6F6F6));
      background: -webkit-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
      background: -moz-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
      background: -o-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
      background: linear-gradient(to top right, #F6F6F6 0%, #F6F6F6 100%);
      
      margin-top: 10%;
	}
	
	.myProfile{
		width: 250px;
		height: 280px;
		background: white;
		float: left;
		margin-left: 120px;
	}
	
	
	#userImage{
		width: 150px;
		height: 150px;
		border-radius: 70%;
		border: 0.5px solid gray;
		margin: 30px 0px -19px 50px;
	}
	
	h1{
		padding:50px;
		text-align: center;
	}
	
	.reViewInfo{
		width: 800px;
		margin-left: 30%;
		background: #f4f2ea;
		padding-left: 10px;
		padding-right: 10px;
	}
	
	.tbReview{
		border-radius: 0 0 20px 0;
	}
	
	.tbReview td{
		text-align: left;
	}
	
	.spaceInfo{
		font-size: 12px;
		font-style: normal;
		font-weight: normal;
	}
	
	#star{
		width: 20px;
		height: 20px;
	}
	
	#content{
		color: #484848;
		font-weight: normal;
		margin: 5px;
		margin-left: 0;
	}
	
	.tbReview tr:nth-last-child(3){
		border: 2px solid #484848;;
		border-bottom: none;
	}
	.tbReview tr:nth-last-child(2){
		border-left: 2px solid #484848;;
		border-right: 2px solid #484848;;
	}
	.tbReview tr:last-child{
		border: 2px solid #484848;
		border-top: none;
	}
</style>

<div class="wrapProfile">
	<h1>리뷰 관리</h1>
	<div class="myProfile">
		<img src="<c:url value='/user_images/test1.jpg'/>" id="userImage"><br><br>
		<strong style="color: black; margin: 101px;">박희수</strong><br>
		<label for="file-input">
        <img alt="프로필 사진 변경.png" src="<c:url value='/images/editProfileImg.png'/>" style="width: 104.48px; height: 30.48px; margin-left: 72.76px;">
	    </label>
	    <input id="file-input" type="file" style="display: none;"/>
	</div>
	<div class="reViewInfo">
		<table class="tbReview">
			<tr>
			<hr>
				<th>
					<a href="#" style="font-size: 20px; color: #484848;">푸토어 프로덕션 케이스 〉</a>
				</th>
				<td></td>
			</tr>
			<tr>
				<th>
					<label>전화번호</label> <span class="spaceInfo">02-798-7155</span>
				</th>
			</tr>
			<tr>
				<th>
					<label>위치</label> <span class="spaceInfo">서울특별시 서초구 동산로 19길</span>
				</th>
			</tr>
			<tr>
				<th>
					<label>태그</label><br>
					<span class="spaceInfo">#보컬연습실 #레슨실대여 #악기연습실 #강남연습실 #셀프녹음실</span>
				</th>
			</tr>
			<tr>
				<th>
					<img alt="별.png" src="<c:url value='/images/fullStar.png'/>" id="star">
					<img alt="별.png" src="<c:url value='/images/fullStar.png'/>" id="star">
					<img alt="별.png" src="<c:url value='/images/fullStar.png'/>" id="star">
					<img alt="별.png" src="<c:url value='/images/fullStar.png'/>" id="star">
					<img alt="별.png" src="<c:url value='/images/halfStar.png'/>" id="star">
				</th>
			</tr>
			<tr>
				<th>
					<label>이름</label> 
					<span class="spaceInfo"> | 2021.09.07</span>
				</th>
			</tr>
			<tr>
				<th>
					<div id="content">
						아 여기 대충 이런이런 곳이였고 좋았다는 내용아 ;빨리해결해주셈짜증남 현기증나요
						아 여기 대충 이런이런 곳이였고 좋았다는 내용
						아 여기 대충 이런이런 곳이였고 좋았다는 내용
						아 여기 대충 이런이런 곳이였고 좋았다는 내용
						아 여기 대충 이런이런 곳이였고 좋았다는 내용
					</div>
				</th>
			</tr>
		</table>
		<div class="footProfile">
			<hr>
			<a href="#" class="editInfo" style="margin-left: 210px;">1 2 3 4 5 6 7 8 9 10</a> 
		</div> 
	</div>
</div>
<%@include file="../../form/userBottom.jsp" %>
