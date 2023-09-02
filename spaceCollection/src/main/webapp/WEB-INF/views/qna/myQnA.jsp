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
		margin-top: 100px;
	}
	.editMenu{
		padding-left:0px;
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
		<div class="count">
			Q&A<span style="color: #2d5aa0;">10개</span>
		</div>
		<div class="qnaList">
			<div class="qnaDetail">
				<label class="fontBold">spacecloud</label>
				<input type="checkbox" class="chkBox" value="">
				<br>
				<p>그린룸 사이즈가 정확히 몇인가요그린룸 사이즈가 정확히 몇인가요그린룸 사이즈가 정확히 몇인가요그린룸 사이즈가 정확히 몇인가요몇인가요그린룸 사이즈가 정확히 몇인가요몇인가요그린룸 사이즈가 정확히 몇인가요</p>
				<div class="editMenu">
					<a class="answer">스페이스클라우드 파티룸</a>
					2023.08.13 11:58:04
					| <a href="#">수정</a>
				</div>
				<hr>
				<label class="fontBold">호스트님의 답글</label><br>
				<p>대충 호스트님이 답장하는 내용대충 호스트님이 답장하는 내용대충 호스트님이 답장하는 내용대충 호스트님이 답장하는 내용</p>
			</div>
		</div>
		<button type="button" class="deleteQna">삭제</button>
	</div>
</div>






<%@include file="../form/userBottom.jsp" %>