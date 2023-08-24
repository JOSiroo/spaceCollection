<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/hostTop.jsp"%>

<style type="text/css">
	.contents {
		padding-top: 100px;
		position: relative;
		width: 800px;
		margin-left: auto;
		margin-right: auto;
	}
	
	.guide {
		color: #656565;
	}
	
	.noti {
		text-align: -webkit-center;
		width: 857px;
		background: #80808014;
		display: inline-block;
		padding: 15px 0 15px 0;
	}
	
	.notiBox {
		text-align: center;
		display: inline-block;
	}
	
	ul {
		text-align: left;
	}

	.icon {
		width: 90px;
		height: 90px;
	}
	
	.main {
		width: 855px;
		margin-top: 50px;
	}
	
	.accordion-header span {
		padding: 15px 0 0 20px;
		font-weight: bold;
		font-size: 17px;
	}
	
	.accordion-body span {
		padding-top: 20px;
		color: #333;
		font-stretch: normal;
    	font-style: normal;
    	font-size: 16px;
	}

	#flush-collapseOne {
		width: 200px;
		float: left;
	}
	
	.btn {
		background: white;
		border: 1px solid #704de4 !important;
		color: #704de4;
	}
	
	
</style>

<section class="contents">
	<article class="noti">
		<div class="notiBox">
			<ul class="guide">
				<li>6개의 공간 용도(모임, 연습, 촬영, 행사, 캠핑, 오피스) 중 1개의 용도 안에서만 유형을 선택할 수
					있습니다.</li>
				<li>선택한 공간 용도 안에서, 등록한 공간에 적합한 유형은 모두 선택이 가능합니다.</li>
				<li>검수 단계에서 검수 기준에 적합하지 않은 유형은 제외될 수 있습니다.</li>
				<li>검수 신청 후, 공간 유형 변경은 고객센터를 통해서만 가능하오니, 신중히 선택해주세요!</li>
			</ul>
		</div>
	</article>

	<article class="main">
		<div class="accordion accordion-flush" id="accordionFlushExample">
			<c:forEach var="AllVo" items="${type }">
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
							aria-expanded="false" aria-controls="flush-collapseOne">
							<span>${AllVo.spaceCategoryVo.categoryName }</span>
						</button>
					</h2>
					<c:forEach var="list" items="${AllVo.spaceTypeList}">
						<div id="flush-collapseOne" class="accordion-collapse collapse"
							data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
								<div class="dropdown">
									<button class="btn btn-secondary dropdown-toggle" type="button"
										data-bs-toggle="dropdown" aria-expanded="false">
										${list.spaceTypeName }</button>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="#">${list.explanation }</a></li>
									</ul>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
	</article>

</section>

<%@ include file="/WEB-INF/views/form/hostBottom.jsp" %>
