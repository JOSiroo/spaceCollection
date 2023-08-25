<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../form/userTop.jsp" %>
<%-- <%@include file="myPageMenu.jsp" %> --%>

<style type="text/css">
	.wrapProfile{
	  min-height: 100vh;
	  
	  background: -webkit-gradient(linear, left bottom, right top, from(#F6F6F6), to(#F6F6F6));
      background: -webkit-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
      background: -moz-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
      background: -o-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
      background: linear-gradient(to top right, #F6F6F6 0%, #F6F6F6 100%);
      width:100%;
      margin-top: 135px;
	}
	
	.align_center{
		width: 1500px;
		margin: 0 auto;
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
	
	.review_content{
		border: 2px solid #484848;
		border-radius: 0 0 3rem 0;
	}
</style>

<div class="wrapProfile">
	<div class="align_center">
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
		<div class="tbReview">
		<c:if test="${empty reviewMap }">
			<hr>
			<div>
				<a href="#" style="font-size: 20px; color: #484848;">등록된 리뷰가 없습니다!</a>
			</div>
		</c:if>
		<c:if test="${!empty reviewMap }">
			<c:forEach var="reviewMap" items="${reviewMap }">
				<hr>
				<div>
					<a href="<c:url value='/detail?spaceNum=${reviewMap["SPACE_NUM"]}'/>" style="font-size: 20px; color: #484848;">
						${reviewMap['SPACE_NAME'] } 〉</a>
					<br>유형 : <span class="spaceInfo">${reviewMap['SD_TYPE'] }</span>
				</div>
				<div>
					<label>전화번호</label> <span class="spaceInfo">${reviewMap['SPACE_PHONE_NUM'] }</span>
				</div>
				<div>
					<label>위치</label> <span class="spaceInfo">${reviewMap['SPACE_ADDRESS'] } ${reviewMap['SPACE_ADDRESS_DETAIL'] }</span>
				</div>
				<div>
					<label>태그</label><br>
					<span class="spaceInfo"># ${reviewMap['SPACE_TAG'] }</span>
				</div>
				<div class="review_content">
					<div>
						<c:set var="count" value="0"/>
						<c:forEach var="i" begin="1" end="${reviewMap['REVIEW_RATE'] }">
							<img alt="별.png" src="<c:url value='/images/fullStar.png'/>" id="star">
							<c:set var="count" value="${count+1 }" />
						</c:forEach>
						<c:if test="${reviewMap['REVIEW_RATE']%1 >0 }">
							<img alt="별.png" src="<c:url value='/images/halfStar.png'/>" id="star">
							<c:set var="count" value="${count+1 }" />
						</c:if>
						<c:forEach var="j" begin="${count}" end="4">
							<img alt="별.png" src="<c:url value='/images/emptyStar.png'/>" id="star">
						</c:forEach>
					</div>
					<div>
						<label>${sessionScope.userId }</label> 
						<span class="spaceInfo"> | ${reviewMap['REVIEW_REG_DATE'] }</span>
					</div>
					<div>
						<div id="content">
							${reviewMap['REVIEW_CONTENT'] }
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
			<div class="footProfile">
				<hr>
				<a href="#" class="editInfo" style="margin-left: 210px;">1 2 3 4 5 6 7 8 9 10</a> 
			</div> 
		</div>
	</div>
	</div>
</div>
<%@include file="../form/userBottom.jsp" %>
