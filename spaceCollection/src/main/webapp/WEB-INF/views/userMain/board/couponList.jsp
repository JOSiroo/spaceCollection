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
	width: 25%;
    height: 60%;
	text-align: -webkit-center;
	margin-top: 5%;
	margin-left: 7%;
}
.profileImg {
	background-color: white;
    width: 70%;
    height: 70%;
    border-radius: 50%;
    margin: 10%;
}
o{
	font-weight: bold;
	color: black;
}
.couponList {
    margin-top: 5%;
    width: 60%;
    background-color: white;
    height: 700px;
    margin-left: 4%;
    text-align: center;
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
strong {
    float: left;
    margin-left: 6%;
}
.noneCoupon {
    display: flex;
    justify-content: center; 
    height: 105vh;
    max-width: 75%; 
    max-height: 90%;
    align-items: center;
}
</style>

<section>
	<article class="profile">
		<div class="profileImg">
		<img src="<c:url value='/images/맹구.png'/>" class="profileImg" alt="...">
		<br><o>훈이</o>
		</div>
	</article>
	
		<div class="couponList">
			<input id="code"  placeholder="쿠폰 코드를 입력하세요" type="text">
			<button id="addCoupon">등록</button>
			<br><strong>총 0장</strong>
			
			<div class="noneCoupon">
			<img alt="" src="<c:url value='/images/couponSubmit.png'/>">
			</div>
		</div>
	
	
</section>

