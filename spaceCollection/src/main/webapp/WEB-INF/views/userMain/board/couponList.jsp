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

<script>
/* var str="<tr>"
 +"<td id='tdR'>"+this.couponName+"</td>"
 +"<td id='tdR'>"+this.couponType+" %</td>"
 +"<td>"+this.couponStartDay+" ~ "+this.couponFinishDay+"</td>"
 +"</tr>";
 */
	var userNum = ${guestVo.userNum }; 
	function makeList(data) {
		 console.log("로딩 시작");
			$.each(data, function() {  
			var str="<li class='list-group-item d-flex justify-content-between align-items-start'>"
				   +"<div class='ms-2 me-auto'>"
			  	   +"<div class='fw-bold'>"+this.couponName+"</div>"
			       +""+this.couponStartDay+" ~ "+this.couponFinishDay+""
			       +"</div>"
			       +"<span class='badge bg-primary rounded-pill'>"+this.couponType+" %</span>"
			       +"</li>";
			    $('#selectCoupon').append(str);
			}); //each
	 }//makeList
	
	 loadCoupon(userNum);
	function loadCoupon(userNum){
	 console.log("로딩성공귣귣!!!!!!!!이제디자인");
		$.ajax({
			url : '<c:url value="/user/couponList/couponLoad?userNum='+userNum+'"/>',
			type: 'get',
			success:function(data){
				if(data!=null && data.length>0){
					makeList(data);
				}else{  
					str = "<img alt='쿠폰없음' src='<c:url value="/images/couponSubmit.png"/>'>";
					console.log("없음 확인");
					$('#selectCoupon').html(str);
					return;
				}
			},
			error:function(xhr, status, error){
				alert(status + " : " + error);
			}
		});//ajax
	 }
	
$(function() {	
	$('#addCoupon').click(function() {
		event.preventDefault();
		var sendDate = $('form[name=couponNum]').serialize(); //입력 양식 내용 쿼리 문자열로 만듬
	    $.ajax({
	        url: "<c:url value='/user/couponList/commentsWrite' />",
	        method: 'post',
	        data: sendDate,
	        success: function(data) {
                 // data를 사용하여 필요한 작업 수행
                 // 가져온 data를 이용하여 댓글 목록을 다시 구성
						if(data!=null){
     						alert("쿠폰을 등록했습니다.");
							$('#addCoupon').html("");
     						console.log("쿠폰 추가 성공");
						   location.reload();  						
						}else if(data==null){
							alert("쿠폰 일련 번호를 입력해주세요.");
						}//if
	        },//success
	    	error:function(xhr, status, error){
				alert(status + " : " + error);
			}
	    });//ajax
	});//#sendBt
});	
</script>

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
			<form name="couponNum" method="post" action="<c:url value='/user/couponList/commentsWrite'/>">
				<input id="addCode" placeholder="쿠폰 일련번호를 입력하세요" type="text">
				<button id="addCoupon" onclick="couponAdd()">등록</button>
			</form>	
				<br><o>총 ${count }장</o>
		<div class="CouponList">
			<ol class="list-group list-group-numbered" >
				  <li class="list-group-item d-flex justify-content-between align-items-start" id="addCoupon">
				  </li>
				  <li class="list-group-item d-flex justify-content-between align-items-start" id="selectCoupon">
				     <!--<div class="ms-2 me-auto">
					      <div class="fw-bold">Subheading</div>
					      Content for list item
					    </div>
					    <span class="badge bg-primary rounded-pill">10 %</span>-->
				  </li>
				  <!--<li class="list-group-item d-flex justify-content-between align-items-start">
					    <div class="ms-2 me-auto">
					      <div class="fw-bold">Subheading</div>
					      Content for list item
					    </div>
					    <span class="badge bg-primary rounded-pill">14</span>
					  </li>
					  <li class="list-group-item d-flex justify-content-between align-items-start">
					    <div class="ms-2 me-auto">
					      <div class="fw-bold">Subheading</div>
					      Content for list item
					    </div>
					    <span class="badge bg-primary rounded-pill">14</span>
					  </li> -->
			</ol>	
					<%-- <c:if test="${empty list}">
						<img alt="" src="<c:url value='/images/couponSubmit.png'/>">
					</c:if>
					<c:if test="${!empty list}">
					    <table align = "center">
						    <tr id="oneBox" >
						        <th id="tdR">쿠폰 번호</th>
						        <th id="tdR">할인률</th>
						        <th colspan = "2" >쿠폰 사용 기간</th>
						    </tr>
						    <tr id="selectCoupon">
					               <tr>
					                    <td id="tdR">${list.couponName}</td>
					                    <td id="tdR">${list.couponType} %</td>
					                    <td>${list.couponStartDay} ~ ${list.couponFinishDay}</td> 
					                </tr>
						    </tr>
						</table>
					</c:if> --%>
			</div>
		</div>
</section>

