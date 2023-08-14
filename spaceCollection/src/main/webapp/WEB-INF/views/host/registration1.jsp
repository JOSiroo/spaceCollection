<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/hostTop2.jsp"%>

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
	
	.accordion-header p {
		padding: 15px 0 0 20px;
		font-weight: bold;
		font-size: 17px;
	}
	
	.accordion-body p {
		padding-top: 20px;
		color: #333;
		font-stretch: normal;
    	font-style: normal;
    	font-size: 16px;
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
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
						aria-expanded="false" aria-controls="flush-collapseOne">
							<a> 
								<img class="icon" src="<c:url value='/img/icons/kitchen.svg' />">
							</a>
							<p>공유 주방</p>
					</button>
				</h2>
				<div id="flush-collapseOne" class="accordion-collapse collapse"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<p>
							여럿이 요리가 가능한 주방 시설과 용품 구비되어 있고, 공유주방으로 독립적 대관이 특화된 공간
						</p>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
						aria-expanded="false" aria-controls="flush-collapseTwo">
							<a> 
								<img class="icon" src="<c:url value='/img/icons/vocal_studio.svg' />">
							</a>
							<p>보컬 연습실</p>
						</button>
				</h2>
				<div id="flush-collapseTwo" class="accordion-collapse collapse"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<p>
							보컬, 발성, 스피치 등 육성을 기반으로 연습에 필요한 시설이 제공되는 독립 공간
						</p>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
						aria-expanded="false" aria-controls="flush-collapseThree">
							<a> 
								<img class="icon" src="<c:url value='/img/icons/rentalstudio.svg' />">
							</a>
							<p>렌탈 스튜디오</p>
						</button>
				</h2>
				<div id="flush-collapseThree" class="accordion-collapse collapse"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<p>
							디자인과 컨셉이 있는, 쇼핑몰⋅화보⋅뮤직비디오⋅프로필⋅방송 등의 촬영이 가능한 실내 렌탈스튜디오 공간
						</p>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
						aria-expanded="false" aria-controls="flush-collapseThree">
							<a> 
								<img class="icon" src="<c:url value='/img/icons/rentalstudio.svg' />">
							</a>
							<p>렌탈 스튜디오</p>
						</button>
				</h2>
				<div id="flush-collapseThree" class="accordion-collapse collapse"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<p>
							디자인과 컨셉이 있는, 쇼핑몰⋅화보⋅뮤직비디오⋅프로필⋅방송 등의 촬영이 가능한 실내 렌탈스튜디오 공간
						</p>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
						aria-expanded="false" aria-controls="flush-collapseThree">
							<a> 
								<img class="icon" src="<c:url value='/img/icons/rentalstudio.svg' />">
							</a>
							<p>렌탈 스튜디오</p>
						</button>
				</h2>
				<div id="flush-collapseThree" class="accordion-collapse collapse"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<p>
							디자인과 컨셉이 있는, 쇼핑몰⋅화보⋅뮤직비디오⋅프로필⋅방송 등의 촬영이 가능한 실내 렌탈스튜디오 공간
						</p>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
						aria-expanded="false" aria-controls="flush-collapseThree">
							<a> 
								<img class="icon" src="<c:url value='/img/icons/rentalstudio.svg' />">
							</a>
							<p>렌탈 스튜디오</p>
						</button>
				</h2>
				<div id="flush-collapseThree" class="accordion-collapse collapse"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<p>
							디자인과 컨셉이 있는, 쇼핑몰⋅화보⋅뮤직비디오⋅프로필⋅방송 등의 촬영이 가능한 실내 렌탈스튜디오 공간
						</p>
					</div>
				</div>
			</div>
		</div>

	</article>




	<%-- <article>
		<div class="boxForm">
			<div class="boxWrapper">
				<div class="boxInner">
					<input type="checkbox"> <label class="meeting"> <a>
							<span class="icon"> <img alt="모임공간"
								src="<c:url value='/img/icons/gathering.svg' />">
						</span> 모임 공간
					</a> <img alt="아래화살표" src="<c:url value='/img/icons/pngegg.png' />"
						width="25px;" height="20px;">
					</label>
				</div>
				<div class="blind"></div>

			</div>
		</div>
	</article> --%>
</section>

<%@ include file="/WEB-INF/views/form/hostBottom.jsp" %>
