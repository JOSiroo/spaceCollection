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
	
	.sdList {
		margin-left: -13px;
		margin-right: -13px;
	}
	
	.boxManage {
		width: 33.3%;
		margin-bottom: 26px;
		display: block;
		float: left;
	}
	
	.inner {
		padding-bottom: 21px;
		padding: 22px 20px 21px;
    	min-height: 225px;
    	position: relative;
	    border: 1px solid #ebebeb;
	    background-color: #fff;
	}
	
	.titSpace {
		padding-bottom: 10px;
	    font-size: 20px;
	    line-height: 22px;
	    border-bottom: 0;
	    display: block;
	    font-weight: 700;
	    color: #000;
	    vertical-align: bottom;
	}
	
	.optionObj {
		padding-bottom: 37px;
    	border-bottom: 1px solid #704de4;
	}
	
	.price {
		font-size: 14px;
		float: left;
	    line-height: 28px;
	}
	
	.price Strong {
		color: #6d3bff;
    	font-weight: 700;
	}
	
	span {vertical-align: top;}
	
	.infoState {
		padding: 20px 0 0 244px;
    	min-height: 137px;
    	position: relative;
	}
	
	.imgBox {
		top: 20px;
	    width: 192px;
	    height: 108px;
	    overflow: hidden;
    	position: absolute;
    	left: 0;
    	background-size: 100%;
	}
	
	.bt {
		color: #000;
	    border: 1px solid #ccc;
	    background: #f6f6f6;
	    width: 100%;
    	height: 40px;
    	font-size: 14px;
    	display: table;
    	text-align: center;
	}
	
	.edit {border-bottom: none;}
	
	.btns {
		width: 56px;
	}
	
</style>

<script type="text/javascript">
	$(function() {
		$('.delete').click(function() {
			var cf = confirm('공간을 삭제하시겠습니까?');
			
			if (!cf) {
				alert('삭제가 취소되었습니다.');
				return false;
			}
		});
	});

</script>

<article>
	<div class="main">
		<div class="regi">
			<a href="<c:url value='/host/registration/spDetail' />">세부 공간 추가하기</a>
		</div>
		<div class="sdList">
			<c:forEach var="sd" items="${spaceDetailVo }">
				<div class="boxManage closed_product">
					<div class="inner closed_txt">
						<strong class="titSpace">${sd.sdType }</strong>
						<div class="optionObj">
							<span class="price"><strong>${sd.sdPrice }</strong>원~/시간</span>
						</div>
						<div class="infoState">
							<!-- <span class="imgBox" style="background-image: url();">
							</span> -->
							<div class="btns">
								<a class="bt edit" href="/space/54594/product/90975/basic_info/">수정</a>
								<a class="bt delete">삭제</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</article>

<%@ include file="/WEB-INF/views/form/hostBottom.jsp" %>