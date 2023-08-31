<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../form/userTop.jsp" %>
<%-- <%@include file="myPageMenu.jsp" %> --%>
<script type="text/javascript" src="<c:url value='/js/guest.js'/>"></script>
<script type="text/javascript">
	$(function(){
		
		 $(".hiddenText").hide(); // 처음에 숨기기
		 
		 if($("input[name=userMarketingSmsOk]").val() =='Y'){
			 $("input[name=userMarketingSmsOk]").prop("checked",true);
		 }else{
			 $("input[name=userMarketingSmsOk]").prop("checked",false);
		 }
		 
		 if($("input[name=userMarketingEmailOk]").val() == 'Y'){
			 $("input[name=userMarketingEmailOk]").prop("checked",true);
		 }else{
			 $("input[name=userMarketingEmailOk]").prop("checked",false);
		 }
/* 		 
		 $("input[name=userMarketingSmsOk]").change(function(){
			 
			 $.ajax({
					url:"<c:url value='/guest/agreementSms' />",
					type:'post',
					data:{
						userMarketingSmsOk : $(this).val(),
					},
					success:function(res){
						
						if(res){
							$(this).prev().text("동의").css("color","gray");
						}else{
							$(this).prev().text("비동의").css("color","#ea5454");
						}
						
					},
					error:function(xhr, status, error){
						alert(status+" : " + error);
					}
				}); 
		 };
		 
		 $("input[name=userMarketingEmailOk]").change(function(){
			 
			 $.ajax({
					url:"<c:url value='/guest/agreementEmail' />",
					type:'post',
					data:{
						userMarketingSmsOk : $(this).val(),
					},
					success:function(res){
						
						if(res){
							$(this).prev().text("동의").css("color","gray");
						}else{
							$(this).prev().text("비동의").css("color","#ea5454");
						}
						
					},
					error:function(xhr, status, error){
						alert(status+" : " + error);
					}
				}); 
		 }; */
		 
         $(".editInfo").click(function() {
        	 
        	 if($(this).text()==="변경하기"){
	             $(this).parent().find("p").hide();
	             $(this).parent().find(".hiddenText").show();
	             $(this).text("취소");
	             return false;
        	 }
        	 
        	 if($(this).text()==="취소"){
        		 $(this).parent().find("p").show();
        		 $(this).parent().find(".hiddenText").hide();
        		 $(this).parent().find(".hiddenText").find("input[type=text]").val("");
        		 $(this).text("변경하기");
        		 return false;
        	 }
         });
		 
		 $("#edit-name").click(function(){
			 var newName=$("#edit-name").prev().val();
			 if(newName.length>2){
				 $.ajax({ 
					 url:"<c:url value='/guest/editName'/>",
					 type:'post',
					 data:{
						userName : $("input[name=userName]").val(),
					 },
					 success:function(res){
						 
					 	alert("정보수정이 완료되었습니다.");
					 	$("#dbUserName").html(newName);
					 	$(".userName").find("p").html(newName);
						$(".userName").find("p").show();
			        	$(".userName").find(".hiddenText").hide();
			        	$(".userName").find(".editInfo").text("변경하기"); 
					 },
					 error:function(xhr,status,error){
						 alert(error+"정보 수정의 실패했습니다.");
					 }
				 });//ajax
			 }else{
				 
			 }
			 
		 });
		 
		 $("#edit-hp").click(function(){
			 var newHp = $("#edit-hp").prev().val();
			 
			 if(validate_hp(newHp) && newHp.length>10){
				 $.ajax({ 
					 url:"<c:url value='/guest/editHp'/>",
					 type:'post',
					 data:{
						userHp : $("input[name=userHp]").val(),
					 },
					 success:function(res){
						 if(res){
							 alert("정보수정이 완료되었습니다.");
							 $("#dbUserHp").html(newHp);
			        		 $("#dbUserHp").next().hide();
							 $("#dbUserHp").show();
			        		 $("#dbUserHp").next().next().text("변경하기");
						 }
						 
					 },
					 error:function(xhr,status,error){
						 alert(error+"정보 수정의 실패했습니다.");
					 }
				 });//ajax
			 }else{
				 $('.error').text('\n전화번호 규칙에 맞지 않습니다.').css("color","#ea5454");
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
		font-size: 12px;
		font-weight: bold;
	}
	
	.edit-button{
		display: inline-block;
		border: 1px solid #5a6ff2;
		background: #6e81e5;
		color: white;
		font-size: 12px;
		padding: 9px 13px 7px 13px;
	}
	
	.userInfo{
		margin-bottom: 0px;
	}
	.error{
		font-size: 11px;
	}
</style>

<div class="wrapProfile">
	<form name="editProfile" method="post" enctype="multipart/form-data"
		action="<c:url value='/guest/myPage/editProfile'/>">
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
						<div style="text-align: center;" id="dbUserName">
						${guestVo.userName }
						</div>
					</c:if>
				</strong><br>
				<c:if test="${empty sessionScope.code}">
					<label for="file-input">
			        	<img alt="프로필 사진 변경.png" src="<c:url value='/images/editProfileImg.png'/>" style="width: 104.48px; height: 30.48px; margin-left: 72.76px;">
				    </label>
				    <input type="file" id="file-input" name="userProfileImage" value="1" style="display: none;"/>
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
								<p id="dbUserName" class="userInfo">${guestVo.userName }</p>
								<div class="hiddenText" >
									<input type="text" class="edit-textbox" name="userName">
									<button type="button" class="edit-button" id="edit-name">확인</button>
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
						 		<p class="userInfo" id="dbUserHp">${guestVo.userHp }</p>
								<div class="hiddenText">
									<input type="text" class="edit-textbox" name="userHp" placeholder=" -를 제외한 번호">
									<button type="button" class="edit-button" id="edit-hp">확인</button>
									<br><span class="error"></span>
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
							<a style="color: gray; font-size: 7px">소셜계정만 연동이 가능하며, 연동된 소셜계정은 해제가 불가합니다.</a>
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
								<span class="msg"></span>
								<input class="form-check-input" type="checkbox" name="userMarketingEmailOk" role="switch"
								 id="flexSwitchCheckChecked" value="${guestVo.userMarketingEmailOk}" checked>
							</div>
						</td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>
							<div class="form-check form-switch" style="margin-left: -36px;">
								<label class="form-check-label" for="flexSwitchCheckChecked">SMS</label>
								<span class="msg"></span>
								<input class="form-check-input" type="checkbox" name="userMarketingSmsOk" role="switch"
								 id="flexSwitchCheckChecked" value="${guestVo.userMarketingSmsOk}" checked>
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
	</form>
</div>
<%@include file="../../form/userBottom.jsp" %>
