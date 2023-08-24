<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/hostTop.jsp"%>

<style type="text/css">
	.divMain {
		display: flex;
		justify-content: center;
	}

	.contents {
		padding-top: 120px;
		width: 1000px;
	}
	
	.guide {
		color: #656565;
	}
	
	.noti {
		text-align: -webkit-center;
		width: 1000px;
		background: #80808014;
		display: inline-block;
		padding: 17px 5px 15px 0;
		font-size: 17px;
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
		width: 1000px;
		margin-top: 50px;
	}
	
	.accordion-header span {
		padding: 15px 0 0 20px;
		font-weight: bold;
		font-size: 23px;
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
	
	.dropdown .btn {
		background: white;
		border: 1px solid #704de4 !important;
		color: #704de4;
	}
	
	.dropdown-menu {
		background: white;
		border: 1px solid #704de4 !important;
		color: #704de4;
	}
	
	.accordion {
		margin-bottom: 60px;
	}
	
	.btBar {
		display: flex;
		justify-content: center;
	}
	
	.btBar button {
		border-radius: 0.5rem;
		width: 100%;
		height: 80px;
		margin: 0 10px 60px 10px;
		color: white;
		font-size: 23px;
		font-weight: bold;
	}
	
	
	
</style>

<script type="text/javascript">
	$(function() {
		$('#back').click(function() {
			history.back();
		});

		$('#next').click(function() {
			location.href="<c:url value='/host/registration/registration2' />";
		});
	});
</script>

<div class="divMain">
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
		<form name="frmRegi1" method="post" action="<c:url value='/host/registration/registration2' />" >
		
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
			</div>	<!-- 아코디언 -->
			
			<div class="btBar">
				<button type="button" class="btn btn-secondary" id="back" >이전</button>
				<button type="button" class="btn btn-warning" id="next" >다음</button>
			</div>
		
		</form>
	</article>

</section>
</div>

<%@ include file="/WEB-INF/views/form/hostBottom.jsp" %>
