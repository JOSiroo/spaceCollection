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
		width: 65px;
		height: 65px;
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

	<article>
		<div class="accordion accordion-flush" id="accordionFlushExample">
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
						aria-expanded="false" aria-controls="flush-collapseOne">
						<label class="meeting"> 
							<a> 
								<img class="icon" src="<c:url value='https://kr.object.ncloudstorage.com/scloud-service/service/161647850_c9f8fff99aa0999813fb91775e74f348.png' />">
								모임 공간
							</a>
						</label>
					</button>
				</h2>
				<div id="flush-collapseOne" class="accordion-collapse collapse"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
					
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
						aria-expanded="false" aria-controls="flush-collapseTwo">
						<label class="meeting"> 
							<a> 
								<img class="icon" src="<c:url value='https://kr.object.ncloudstorage.com/scloud-service/service/161647851_15f1409aa52ae420c93d442eb4cfec53.png' />">
								연습 공간
							</a>
						</label>
						</button>
				</h2>
				<div id="flush-collapseTwo" class="accordion-collapse collapse"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
					
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
						aria-expanded="false" aria-controls="flush-collapseThree">
						Accordion Item #3</button>
				</h2>
				<div id="flush-collapseThree" class="accordion-collapse collapse"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						Placeholder content for this accordion, which is intended to
						demonstrate the
						<code>.accordion-flush</code>
						class. This is the third item's accordion body. Nothing more
						exciting happening here in terms of content, but just filling up
						the space to make it look, at least at first glance, a bit more
						representative of how this would look in a real-world application.
					</div>
				</div>
			</div>
		</div>

	</article>




	<article>
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
	</article>
</section>

</body>
</html>
