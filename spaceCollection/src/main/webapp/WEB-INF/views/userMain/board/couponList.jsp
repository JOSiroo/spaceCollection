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
    width: 85%;
    border-radius: 50%;
    margin: 5%;
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
    float: right;
    margin-right: 4%;
    font-weight: bold;
}
.CouponList {
    display: flex;
    justify-content: flex-start;
    height: 95vh;
    max-width: 100%;
    max-height: 90%;
    align-items: flex-start;
    margin: 0px;
    margin-top: 5%;
}
button#mypage {
    color: #999;
    background-color: white;
    border: 1px solid #a1a1a1;
    font-weight: bold;
}
table {
    caption-side: bottom;
    border-collapse: collapse;
    width: 100%;
}
tr#oneBox {
    border-bottom: 1px solid #999;
}
td{
     border-bottom: 0.1px solid lightgray;
}
td {
    height: 40px;
}
th#tdR {
    border-right: 1px solid white;
}
th{
    font-weight: bold;
    background-color: #193D76;
    color: white;
}
form#couponListForm {
    width: 100%;
}
</style>

<section>
<article class="profile">
		<input type="hidden" name="snsCode" value="${guestVo.userSnsCode }">
		<input type="hidden" name=userNum value="${guestVo.userNum }">
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
				
				<form name="couponCount" var="count" items="${count }" action="#">
				<br><o>총 ${count }장</o>
				</form>
			
			<div class="CouponList">
			
				<form id="couponListForm" name="selectUserCoupon" var="list" items="${list }" action="#">
					<c:if test="${empty list}">
						<img alt="" src="<c:url value='/images/couponSubmit.png'/>">
					</c:if>
					<c:if test="${!empty list}">
					    <table align = "center">
						    <tr id="oneBox" >
						        <th id="tdR">쿠폰 번호</th>
						        <th id="tdR">할인률</th>
						        <th colspan = "2" >쿠폰 사용 기간</th>
						    </tr>
						    <tr>
						       <c:forEach var="list" items="${list}">
					                <tr>
					                    <td id="tdR">${list.couponName}</td>
					                    <td id="tdR">${list.couponType} %</td>
					                    <td>${list.couponStartDay} ~ ${list.couponFinishDay}</td>
					                </tr>
					            </c:forEach>
						    </tr>
						</table>
					</c:if>
				</form>
				
			</div>
		</div>
	
	
</section>

