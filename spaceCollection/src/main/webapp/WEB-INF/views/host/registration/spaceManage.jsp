<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/hostTop.jsp"%>

<style type="text/css">
	body {background: #f6f6f6;}

	article {
		margin: 140px 0 150px 0; 
    	line-height: 20px;
		display: flex;
		justify-content: center;
	}

	.main {width: 1000px; display: inline-block;}
	
	.regi {
		text-align: center;
		width: 100%;
		border: 1px solid #704de4;
		background: #fff;
		height: 60px;
    	line-height: 60px;
    	border-radius: 0.5rem;
    	font-size: 18px;
    	font-weight: bold;
    	margin-bottom: 100px;
	}
	
	.regi a {color: #704de4;}
	
	.spaceList {
		margin-left: -13px;
		margin-right: -13px;
	}
	
	.ListBox {
		width: 33.3%;
		padding: 0 13px;
		margin: 0 0 50px 0;
		float: left;
	}
	
	.inner, .imgBox {
		-webkit-box-sizing: border-box;
	}
	
	.img {
		background-size: cover;
	    position: absolute;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	}
	
	.closed {font-size: 17px;}
	
	.closed em {
		display: table-cell;
    	vertical-align: middle;
	}
	
	.lbWriting {
	    width: 75px;
	    height: 26px;
	    padding: 5px 11px 5px 12px;
	    font-size: 12px;
	    position: absolute;
	    top: 0;
	    right: 0;
	    background-color: #704de4;
	}
	
	.infoArea {
		padding: 18px 20px 35px;
		background: #fff;
	}
	
	.spName {
		font-size: 18px;
	    line-height: 22px;
	    padding-bottom: 12px;
	    border-bottom: 1px solid #ebebeb;
	    font-weight: 700;
	}
	
	.stateList {
		position: relative;
		padding: 10px 0 0 0;
	}
	
	ul {list-style: none;}

	.stateList li {
		position: relative;
	    padding-top: 6px;
	    font-size: 14px;
	    display: inline-block;
	}
	
	.stateList .date {
		color: #949494;
	}
	
	li.btn {
		top: 11px;
		position: absolute;
	    right: 0;
	    padding-top: 0;
	}
	
	.btnArea {
		padding-right: 71px;
    	font-size: 14px;
    	position: relative;
	}
	
	.btnArea a {
		height: 50px;
    	padding: 16px 0 15px;
    	display: block;
	    float: left;
	    background-color: #704de4;
	    text-align: center;
	    color: #fff;
	}
	
	a {text-decoration: none;}
	
	.spaceModify {
		width: 42%;
		border-right: 2px solid #473094;
		padding: 5px 0 5px 0;
	}
	
	.productModify {
		width: 58%;
		padding: 0 5px 0 5px;
	}
	
	.delete {
		width: 22.5%;
		position: absolute;
	    top: 0;
	    right: 0;
	    background-color: #4d4d4d !important;
	}
	
	
</style>

<article>
	<div class="main">
		<div class="regi">
			<a href="<c:url value='/host/registration/registration1' />">새 공간 등록하기</a>
		</div>
		<div class="regi">
			<a href="<c:url value='/host/registration/spDetail' />">상혁님 이게 세부공간 등록</a>
		</div>
		<c:forEach var="spaceVo" items="${spaceVo }">
			<div class="spaceList">
				<div class="ListBox">
					<div class="inner">
						<div class="imgBox">
							<!-- <span class="img" style="background-image: url();"></span> -->
							<span class="lbWriting">작성중 입니다.</span>
						</div> <!-- imgBox -->
						<div class="infoArea">
							<p class="spName">${spaceVo.spaceName }</p>
							<ul class="stateList">
								<li class="date">공간번호 ${spaceVo.spaceNum }</li>
								<br>
								<li class="date">등록일 
									${spaceVo.spaceRegDate }
								</li>
							</ul>
						</div>	<!-- infoArea -->
						<div class="btnArea">
							<a class="spaceModify" href="<c:url value='/host/registration/' />">공간정보 수정</a>
							<a class="productModify" href="#">세부 공간 추가/수정</a>
							<a class="delete" href="#">삭제</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</article>

<%@ include file="/WEB-INF/views/form/hostBottom.jsp" %>