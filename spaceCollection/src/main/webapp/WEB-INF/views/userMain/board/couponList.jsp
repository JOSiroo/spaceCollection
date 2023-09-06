<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/userTop.jsp" %> 
 
<style>
body {
    background-color: #f2f2f2;
}
section{
	display: flex;
	margin:10%;
}
.profile{
	background-color: white;
	width: 18%;
	height: 55%;
	text-align: -webkit-center;
	margin-left: 20%;
}
.profileImg {
	background-color: white;
    width: 70%;
    height: 70%;
    border-radius: 50%;
    margin: 10%;
}

.couponList {
    width: 40%;
    background-color: white;
    height: 55%;
    margin-left: 4%;
    text-align: center;
}

#userName{
	font-weight: bold;
	color: black;
}

#code{
    height: 44px;
    background-color: #fff;
    border: 1px solid #e0e0e0;
    border-radius: 6px;
    padding: 0 0 0 15px;
    cursor: text;
    display: inline-block;
    position: relative;
    width: 80%;
    margin:3%;
}
#addCoupon{
	border: 1px solid #fff;
	width: 50px;
	height: 43px;
	margin: 0px;
	background-color: #07426b;
	border-radius: 10px;
	font-weight: 3px;
	font-size: 15px;
	line-height: 16px;
	text-align: center;
	letter-spacing: 1px;
	color: #fff;
}
o{
    float: left;
    margin-left: 6%;
    font-weight: bold;
}
.CouponList {
    display: flex;
    justify-content: center; 
    height: 105vh;
    max-width: 75%; 
    max-height: 90%;
    align-items: center;
}
button#mypage {
    color: #999;
    background-color: white;
    border: 1px solid #a1a1a1;
    font-weight: bold;
}
</style>

<section>
<article class="profile">
		<input type="hidden" name="snsCode" value="${guestVo.userSnsCode }">
		<input type="text" name=userNum value="${guestVo.userNum }">
			<div class="profileImg">
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
				" id="userImage" alt="사용자 이미지" class="profileImg"><br><br><br>
				<strong style="color: black;" >
					<c:if test="${!empty guestVo.userName }">
						<div  id="userName">
						${guestVo.userName }
						</div>
					</c:if>
				</strong><br>
				<c:if test="${empty sessionScope.code}">
					<label for="file-input">
						<a href="<c:url value='/guest/myPage/myProfile'/>"><button id="mypage">마이페이지</button></a>
				    </label>
				    <input type="file" id="file-input" name="userProfileImage" value="1" style="display: none; 
				    		margin-bottom: 50px;" accept="image/gif,image.jpeg,image/png"/>
				</c:if>
			</div>
</article>
	
		<div class="couponList">
			<input id="code"  placeholder="쿠폰 코드를 입력하세요" type="text">
			<button id="addCoupon">등록</button>
			<br><o>총 0장</o>
			
			<div class="CouponList">
				<c:if test="${empty couponName}">
					<img alt="" src="<c:url value='/images/couponSubmit.png'/>">
				</c:if>
				<c:if test="${!empty couponName}">
				</c:if>
			</div>
		</div>
	
	
</section>

