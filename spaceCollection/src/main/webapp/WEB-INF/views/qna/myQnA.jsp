<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../form/userTop.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		background: #ebebeb;
		border-top: 1px solid #2d5aa0;
		font-size: 17px;
	}
	#QnA {
		padding: 15px 250px 15px 250px;
		background: #2d5aa0;
		border-top: 1px solid #2d5aa0;
		font-size: 17px;
		color: white;
	}
	
	h1 {
		font-weight: bold;
		font-size: 40px;
		padding: 50px;
		text-align: center;
		margin-bottom: 100px;
	}
	
	.qnaList{
		background: #eeeeee;
		width: 1110px;
		margin: 0 auto;
		padding:12px;
		border: 2px solid #2d5aa0;
	}
	
	.answer{
		color: #2d5aa0;
		font-weight: bold;
		text-align: left;
	}
	
	.fontBold{
		font-weight: bold;
		color: black;
	}
	
	.qnaDetail{
		background: white;
		padding: 5px;
		border: 2px solid #e1e1e1;
	}
	.count{
		text-align: left;
		margin-left:210px;
		color: black;
		font-size: 20px;
		font-weight: bold;
		margin-top: 30px;
	}
	.editMenu{
		padding-left:0px;
	}
	select[name=searchCondition] {
		width: 130px;
		height: 43px;
		border-radius: 0px;
		border: 1px solid #e0e0e0;
		padding: 5px;
		outline: none;
		margin-left: 1170px;
		margin-top: 50px;
	}
	
	.chkBox{
		float: right;
		padding: 3px;
	}
	.deleteQna{
		border: 1px solid #5a6ff2;
		background: #6e81e5;
		color: white;
		font-size: 17px;
		padding: 15px 35px 15px 35px;
		margin-left: 1200px;
	}
</style>


<div class="wrap">
	<div class="align_center">
		<h1>나의 Q&A 관리</h1>
		<div id="menubar">
			<a href="<c:url value='/myReview'/>" id="review">
				이용후기
			</a>
			<a href="<c:url value='/myQnA'/>" id="QnA">
				Q&A
			</a>
		</div>
		<form name="frmQna" action="<c:url value='/myQnA'/>" method="post">
		<select name="searchCondition">
			<option selected="selected" value="">전체</option>
			<option value="Y">답변 있음</option>
			<option value="N">답변 없음</option>
		</select>
		<div class="count">
			Q&A<span style="color: #2d5aa0;">${pagingInfo.totalRecord }개</span>
		</div>
		<c:if test="${empty qnaList }">
				<h1>등록된 QnA가 없습니다.</h1>
		</c:if>
		<c:if test="${!empty qnaList }">
		<!-- 반복시작 -->
		<c:set var="idx" value="0"/>
			<c:forEach var="map" items="${qnaList }">
				<div class="qnaList">
					<div class="qnaDetail">
						<label class="fontBold">${map['USER_ID'] }</label>
						<input type="checkbox" class="chkBox" value="">
						<br>
						<span>${map['QNA_CONTENT'] }</span>
						<div class="editMenu">
							<a class="answer">${map['SPACE_NAME'] }</a>
							${map['QNA_REG_DATE'] }
							| <a href="#">수정</a>
						</div>
						<hr>
						<c:if test="${!empty map['QNA_ANSWER'] }">
							<label class="fontBold">호스트님의 답글</label><br>
							<p>${map['QNA_ANSWER'] }</p>
						</c:if>
						<c:if test="${empty map['QNA_ANSWER'] }">
							<div>호스트님의 답변을 기다리는 중 입니다.</div>
						</c:if>
					</div>
				</div>
				<br>
				<c:set var="idx" value="${idx+1 }"/>
			</c:forEach>
			<!-- 반복끝 -->
		</c:if>
		<button type="button" class="deleteQna">삭제</button>
		</form>
	</div>
	<div class="divPage">
		<!-- 페이지 번호 추가 -->		
		<c:if test="${pagingInfo.firstPage>1 }">
			<a href="#" onclick="boardList(${pagingInfo.firstPage-1})">			
			    <img src='<c:url value="/images/first.JPG" />'  border="0">	</a>
		</c:if>
						
		<!-- [1][2][3][4][5][6][7][8][9][10] -->
		<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
			<c:if test="${i==pagingInfo.currentPage }">
				<span style="color:blue;font-weight:bold">${i }</span>
			</c:if>
			<c:if test="${i!=pagingInfo.currentPage }">						
				<a href="#" onclick="boardList(${i})">
					[${i }]
				</a>
			</c:if>		
		</c:forEach>
		
		<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
			<a href="#" onclick="boardList(${pagingInfo.lastPage+1})">			
				<img src="<c:url value="/images/last.JPG" />" border="0">
			</a>
		</c:if>
		<!--  페이지 번호 끝 -->
	</div>
</div>

<%@include file="../form/userBottom.jsp" %>