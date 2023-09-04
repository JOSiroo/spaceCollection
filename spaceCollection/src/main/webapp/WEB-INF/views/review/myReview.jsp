<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../form/userTop.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	$(function(){
		
		if($("input[name=page]").val()<1){
			$("input[name=page]").val(1);
		}
		
		$("#moreReview").click(function(){
			var plus=$("input[name=page]").val();
			plus++;
			$("input[name=page]").val(plus);
			$("form[name=frmPage]").submit();
		});
	});
</script>
<style type="text/css">
	.wrap {
		min-height: 100vh;
		background: -webkit-gradient(linear, left bottom, right top, from(#F6F6F6),
			to(#F6F6F6));
		background: -webkit-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
		background: -moz-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
		background: -o-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
		background: linear-gradient(to top right, #F6F6F6 0%, #F6F6F6 100%);
		width: 100%;
		margin-top: 140px;
		margin-right: 50px;
		padding-bottom: 100px;
	}
	
	.align_center {
		width: 1500px;
		margin: 0 auto;
	}
	
	#menubar {
		margin: 0 auto;
		text-align: center;
	}
	
	#review {
		padding: 15px 250px 15px 250px;
		background: #2d5aa0;
		border-top: 1px solid #2d5aa0;
		font-size: 17px;
		color: white;
	}
	
	#QnA {
		padding: 15px 250px 15px 250px;
		background: #ebebeb;
		border-top: 1px solid #2d5aa0;
		font-size: 17px;
	}
	
	#searchbar {
		margin: 70px 0px 25px 197px;
		border: 4px solid #2d5aa0;
		width: 1107px;
		padding: 20px 30px 20px 30px;
		color: black;
		font-size: 15px;
		background: white;
	}
	
	input[name=keyword] {
		height: 52px;
		width: 730px;
		border-radius: 0px;
		border: 1px solid #e0e0e0;
		padding-left: 15px;
		margin-left: 30px;
		margin-right: 25px;
		outline: none;
	}
	
	#search {
		background-color: #2d5aa0;
		border: none;
		padding: 13px 50px 13px 50px;
		color: white;
		font-weight: bold;
		font-size: 17px;
	}
	
	#userImage {
		width: 150px;
		height: 150px;
		border-radius: 70%;
		border: 0.5px solid gray;
		margin: 30px 0px -19px 50px;
	}
	
	h1 {
		font-weight: bold;
		font-size: 40px;
		padding: 50px;
		text-align: center;
		margin-bottom: 100px;
	}
	
	.reViewInfo {
		width: 1120px;
		background: #eee;
		padding-left: 10px;
		padding-right: 10px;
		margin: 0 auto;
		border: 2px solid #2d5aa0;
	}
	
	.tbReview {
		border-radius: 0 0 20px 0;
	}
	
	.spaceInfo {
		font-size: 12px;
		font-style: normal;
		font-weight: normal;
	}
	
	#star {
		width: 20px;
		height: 20px;
	}
	
	#content {
		color: #484848;
		font-weight: normal;
		margin: 5px;
		margin-left: 0;
	}
	
	.review_content {
		border: 1px solid #484848;
		border-radius: 0 0 3rem 0;
		padding: 5px;
	}
	
	select[name=condition] {
		width: 130px;
		height: 43px;
		border-radius: 0px;
		border: 1px solid #e0e0e0;
		padding: 5px;
		outline: none;
		margin-left: 1170px;
		margin-bottom: 30px;
	}
	
	#moreReview{
		background-color: #e5e5e5;
		border: 2px solid #2d5aa0;
		color: black;
		font-weight: bold;
		font-size: 17px;
		width: 100%;
		
	}
	.emptyLine{
		height: 3px; 
		background: #2d5aa0;
		margin-top: 10px;
	}
</style>

<form action="<c:url value='/myReview'/>" name="frmPage" method="post">
	<input type="text" name="page" value="${param.page }">
	<input type="text" name="searchCondition" value="">
	<input type="text" name="searchKeyword" value="">
</form>
<div class="wrap">
	<div class="align_center">
	<h1>이용 후기 관리</h1>
	<div id="menubar">
		<a href="<c:url value='/myReview'/>" id="review">
			이용후기
		</a>
		<a href="<c:url value='/myQnA'/>" id="QnA">
			Q&A
		</a>
	</div>
	<div id=searchbar>
		<label >예약 정보 검색</label>
		<input type="text" name="keyword" placeholder="공간명">
		<button type="button" id="search">검색</button>
	</div>
	<select name="condition">
		<option selected="selected" value="">전체</option>
		<option value="Y"
			<c:if test="${param.searchCondition=='Y' }">
			selected="selected"
			</c:if>
		>답변 있음</option>
		<option value="N"
			<c:if test="${param.searchCondition=='N' }">
			selected="selected"
			</c:if>
		>답변 없음
		</option>
	</select>
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
					<label>태그</label>&nbsp;
					<span class="spaceInfo"># ${reviewMap['SPACE_TAG'] }</span>
				</div>
				<div class="review_content">
					<div>
						<c:set var="count" value="0"/>
						<c:forEach var="i" begin="1" end="${reviewMap['REVIEW_RATE'] /2 }">
							<img alt="별.png" src="<c:url value='/images/fullStar.png'/>" id="star">
							<c:set var="count" value="${count+1 }" />
						</c:forEach>
						<c:if test="${reviewMap['REVIEW_RATE']%2 != 0 }">
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
				<br>
				<div style="margin-left: 75%;">
					<span>등록일 : ${reviewMap['REVIEW_REG_DATE']}</span> | 
					<a href="<c:url value='/deleteReview?reviewNum=${reviewMap["REVIEW_NUM"] }&spaceNum=${reviewMap["SAPCE_NUM"]}  '/>">삭제</a>
					<!-- <a href="#">수정</a> -->
				</div>
				<div class="emptyLine">&nbsp;</div>
			</c:forEach>
		</c:if>
			<div class="pagingDiv">
				<button type="button" id="moreReview">더보기</button>
			</div> 
		</div>
	</div>
	</div>
</div>
<%@include file="../form/userBottom.jsp" %>
