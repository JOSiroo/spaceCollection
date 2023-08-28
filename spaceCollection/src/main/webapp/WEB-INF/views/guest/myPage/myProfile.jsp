<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../form/userTop.jsp" %>
<%-- <%@include file="myPageMenu.jsp" %> --%>
<script type="text/javascript">
	$(function(){
		
		 $(".hiddenText").hide(); // 처음에 숨기기

         $(".editInfo").click(function() {
        	 
        	 if($(this).text()==="변경하기"){
	             $(this).parent().find("span").hide();
	             $(this).parent().find(".hiddenText").show();
	             $(this).text("취소");
	             return false;
        	 }
        	 
        	 if($(this).text()==="취소"){
        		 $(this).parent().find("span").show();
        		 $(this).parent().find(".hiddenText").hide();
        		 $(this).text("변경하기");
        		 return false;
        	 }
         });
	});
</script>
<style type="text/css">
	.wrapProfile{
	  min-height: 100vh;
	  
	  background: -webkit-gradient(linear, left bottom, right top, from(#F6F6F6), to(#F6F6F6));
      background: -webkit-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
      background: -moz-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
      background: -o-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
      background: linear-gradient(to top right, #F6F6F6 0%, #F6F6F6 100%);
      margin-top: 135px;
      width:100%;
	}
	
	.myProfile{
		width: 250px;
		height: 280px;
		background: white;
		float: left;
		margin-left: 120px;
		border: 0.5px solid	#193d76;
	}
	
	.align_center{
		width: 1500px;
		margin: 0 auto;
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
	
	.profileInfo{
		width: 584px;
		height: 500px;
		margin-left: 30%;
	}
	
	.tbProfile{
		background: white;
		width: 584px;
		border: 0.5px solid	#193d76;
		border-bottom: none;
		border-radius: 20px 20px 0 0;
		padding-top: 30px;
	}
	
	.tbProfile tr:first-child{
		background: #193d76;
		color: #d1d8e4;
		padding: 17px;
		font-weight: bold;
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
		margin-top: 0px;
		margin-bottom: 5px;
		color: gray;
	}
	
	.footProfile{
		padding: 20px;
		background: white;
		border: 0.5px solid #193d76;
    	border-top: none;
	}
	
	.edit-textbox{
		display: inline-block;
		width: 250px;
		height: 35px;
		border: 1px solid gray;
		margin-right: -5px;
	}
	
	.edit-button{
		display: inline-block;
		border: 1px solid #5a6ff2;
		background: #6e81e5;
		color: white;
		font-size: 12px;
		padding: 9px 13px 7px 13px;
	}
</style>

<div class="wrapProfile">
	<div class="align_center">
		<h1>프로필 관리</h1>
		<div class="myProfile">
			<img src="
				<c:if test="${empty sessionScope.code}">
					<c:if test="${!empty guestVo.userProfileImage }">
						<c:url value='/user_images/${guestVo.userProfileImage }'/>
					</c:if>
					<c:if test="${empty guestVo.userProfileImage }">
						<c:url value='/user_images/default_profile.jpg'/>
					</c:if>
				</c:if>
				<c:if test="${!empty sessionScope.code}">
					${guestVo.userProfileImage }
				</c:if>	
			" id="userImage" alt="사용자 이미지"><br><br><br>
			<strong style="color: black; margin: 0px;">
				<c:if test="${!empty guestVo.userName }">
					<div style="text-align: center;">
					${guestVo.userName }</div>
				</c:if>
			</strong><br>
			<c:if test="${empty sessionScope.code}">
				<label for="file-input">
		        	<img alt="프로필 사진 변경.png" src="<c:url value='/images/editProfileImg.png'/>" style="width: 104.48px; height: 30.48px; margin-left: 72.76px;">
			    </label>
			    <input id="file-input" type="file" style="display: none;"/>
			</c:if>
		</div>
		<div class="profileInfo">
		<c:set var="emailOk" value="${guestVo.userMarketingEmailOk }"/>
		<c:set var="smsOk" value="${guestVo.userMarketingSmsOk }"/>
			<table class="tbProfile">
				<tr>
					<th colspan="2" style="color: white;">내 프로필</th>
				</tr>
				<tr>
					<th>
						<label>이름</label>
					</th>
					<td>
					<c:if test="${empty sessionScope.code }">
						<div class="userName">
							<span>${guestVo.userName }<br></span>
							<div class="hiddenText">
								<input type="text" class="edit-textbox" name="userName">
								<button class="edit-button">확인</button>
							</div>
							<a href="#" class="editInfo">변경하기</a>
						</div>
					</c:if>
					<c:if test="${!empty sessionScope.code }">
						${guestVo.userName }<br>
					</c:if>
					</td>
				</tr>
				<tr>
					<th>
						<label>이메일</label>
					</th>
					<td>
					<c:if test="${!empty guestVo.userEmail }">
						${guestVo.userEmail }
					</c:if>
					</td>
				</tr>
				<tr>
					<th>
						<label>연락처</label>
					</th>
					<td>
					<c:if test="${!empty guestVo.userHp }">
						<div class="userHp">
							<span>${guestVo.userHp }<br></span>
							<div class="hiddenText">
								<input type="text" class="edit-textbox" name="userHp">
								<button class="edit-button">확인</button>
							</div>
							<a href="#" class="editInfo">변경하기</a>
						</div>
					</c:if>
					<c:if test="${empty guestVo.userHp }">
						<a href="#" class="editInfo">등록하기</a>
					</c:if>
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
							<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" onclick="return false">
						</div>
					</td>
				</tr>
				<tr>
					<th>&nbsp;</th>
					<td>
						<div class="form-check form-switch" style="margin-left: -36px;">
							<img alt="카카오로고.png" src="<c:url value='/images/kakaoLogo.jpg'/>" class="SNSLogo">
							<label class="form-check-label">카카오 연동</label>
							<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" onclick="return false">
						</div>
						<a style="color: gray; font-size: 7px">한개의 SNS만 연동이 가능하며, 연동된 소셜계정은 해제가 불가합니다.</a>
					</td>
				</tr>
				<tr>
				<c:if test="${empty sessionScope.code }">
					<th><label>비밀번호</label></th>
					<td>
						<div class="userPwd">
							<div class="hiddenText">
								<input type="text" class="edit-textbox" name="userPwd" id="userPwd">
								<button class="edit-button">확인</button>
							</div>
							<a href="#" class="editInfo">변경하기</a>
						</div>
					</td>
				</c:if>
				<c:if test="${!empty sessionScope.code }">
					<th><label>비밀번호</label></th>
					<td>
						<span class="editInfo">SNS계정은 변경이 불가능합니다.</span>
					</td>
				</c:if>
				</tr>
				<tr>
					<th><label>마케팅 수신 동의</label></th>
					<td>
						<div class="form-check form-switch" style="margin-left: -38px;">
							<label class="form-check-label" for="flexSwitchCheckChecked">이메일</label>
							<input class="form-check-input" type="checkbox" name="userMarketingEmailOk" role="switch" id="flexSwitchCheckChecked" checked>
						</div>
					</td>
				</tr>
				<tr>
					<th>&nbsp;</th>
					<td>
						<div class="form-check form-switch" style="margin-left: -36px;">
							<label class="form-check-label" for="flexSwitchCheckChecked">SMS</label>
							<input class="form-check-input" type="checkbox" name="userMarketingSmsOk" role="switch" id="flexSwitchCheckChecked" checked>
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
</div>
<%@include file="../../form/userBottom.jsp" %>
