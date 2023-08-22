<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../form/userTop.jsp" %>
<%@include file="myPageMenu.jsp" %>

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
		margin-left: 200px;
		text-align: center;
	}
	
	.profileInfo{
		width: 584px;
		height: 900px;
		margin-left: 30%;
	}
	
	#profileTitle{
		background: #193d76;
		color: #d1d8e4;
		padding: 17px;
		border-radius: 10px 10px 0 0;
		font-weight: bold;
		
	}
	.tbProfile{
		background: white;
		width: 584px;
		border: 0.5px solid	#193d76;
		border-bottom: none;
		padding-top: 30px;
	}
	
	.tbProfile th{
		color: #656565;
		width: 150px;
		padding-left: 17px;
		padding-top: 5px;
		
	}
	
	.tbProfile td{
		color: black;
		font-size: 15px;
		padding-top: 5px;
		
	}
	
	.tbProfile th,
	.tbProfile td {
	  padding: 8px;
	  text-align: left;
	}
	
	
	
	.SNSLogo{
		width: 20px;
		height: 20px;
	}
	
	#flexSwitchCheckChecked{
		float: right;
		margin-right: 20px;
	}
	
	.editInfo{
		margin-bottom: 5px;
		color: gray;
	}
	
	.footProfile{
		padding: 20px;
		background: white;
		border: 0.5px solid #193d76;
    	border-top: none;
	}
	
</style>

<div class="wrapProfile">
	<h1>프로필 관리</h1>
	<div class="myProfile">
		<img src="<c:url value='/user_images/test1.jpg'/>" id="userImage"><br><br>
		<strong style="color: black; margin: 101px;">박희수</strong><br>
		<label for="file-input">
        <img alt="프로필 사진 변경.png" src="<c:url value='/images/editProfileImg.png'/>" style="width: 104.48px; height: 30.48px; margin-left: 72.76px;">
	    </label>
	    <input id="file-input" type="file" style="display: none;"/>
	</div>
	<div class="profileInfo">
		<div>
			<div id="profileTitle">내 프로필</div>
		</div>
		<table class="tbProfile">
			<tr>
				<th>
					<label>이름</label>
				</th>
				<td>
					박희수
				</td>
			</tr>
			<tr>
				<th>
					<label>이메일</label>
				</th>
				<td>
					pcdno3@naver.com
				</td>
			</tr>
			<tr>
				<th>
					<label>연락처</label>
				</th>
				<td>
					01029221300<br>
					<a href="#" class="editInfo">변경하기</a>
				</td>
			</tr>
			<tr>
				<th>
					<label>SNS연동</label>
				</th>
				<td>
					<div class="form-check form-switch" style="margin-left: -36px;">
						<img alt="네이버로고.png" src="<c:url value='/images/naverLogo.png'/>" class="SNSLogo">
						<label class="form-check-label">네이버 연동</label>
						<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked">
					</div>
				</td>
			</tr>
			<tr>
				<th>&nbsp;</th>
				<td>
					<div class="form-check form-switch" style="margin-left: -36px;">
						<img alt="카카오로고.png" src="<c:url value='/images/kakaoLogo.jpg'/>" class="SNSLogo">
						<label class="form-check-label">카카오 연동</label>
						<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked">
					</div>
					<a style="color: gray; font-size: 7px">한개의 SNS만 연동이 가능하며, 연동된 소셜계정은 해제가 불가합니다.</a>
				</td>
			</tr>
			<tr>
				<th><label>비밀번호</label></th>
				<td>
					<a href="#" class="editInfo	">변경하기</a>
				</td>
			</tr>
			<tr>
				<th><label>마케팅 수신 동의</label></th>
				<td>
					<div class="form-check form-switch" style="margin-left: -38px;">
						<label class="form-check-label" for="flexSwitchCheckChecked">이메일</label>
						<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
					</div>
				</td>
			</tr>
			<tr>
				<th>&nbsp;</th>
				<td>
					<div class="form-check form-switch" style="margin-left: -36px;">
						<label class="form-check-label" for="flexSwitchCheckChecked">SMS</label>
						<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
					</div>
				</td>
			</tr>
		</table>
		<div class="footProfile">
			<hr>
			<a href="#" class="editInfo" style="margin-left: 210px;">서비스 탈퇴하기</a>
		</div>
	</div>
</div>
<%@include file="../../form/userBottom.jsp" %>
