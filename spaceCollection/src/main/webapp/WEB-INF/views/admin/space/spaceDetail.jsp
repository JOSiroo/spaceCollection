<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<style type="text/css">
	main>div>nav{
		float: left;
	}
	
	section{
		clear: both;
	}
	
	div.row{
		margin-top: 10px;
	}
	
	
	#card {
    	min-height: 420px;
	}
	
	th, td{
		text-align: center;
		width: 100px;
	}
	
	img{
		width: auto;
		height: auto;
		object-fit: contain;
	}
	
	#carouselExampleIndicators{
		width: 100%;
		aspect-ratio: 2.1;
	}
	
	i.bi.bi-exclamation-circle {
 		color: #ffd600;
   		font-size: 40px;
   		display: block;
   		margin-block: -13px;
	}
	
	
	.goList{
		margin-top: -10px;
	}
	
	.fr{
		text-align: right;
		float: left;
	}
	
	.back{
		text-align: left;
		
	}
	.back>span{
		margin: 10px 0 0 20px;
	}
	
	.fr, .back{
		margin-bottom: 5px;
	}
	
	.col-3{
		font-weight: bold;
	}
	
	
</style>
<script type="text/javascript">
	$(function() {
		$('#okBt').hide();
		
		
		$('#withdrawal').click(function() {
			$('#okBt').addClass('withdrawal');
			$('.bi-exclamation-circle').css('color', 'red');
			$('.modal-body').html('해당 회원을 탈퇴시키겠습니까?<br>해당 회원이 작성한 모든 자료가 삭제됩니다.');
			$("#okBt").addClass('btn-danger');
			$('#okBt').html('탈퇴');
			$('#cancelBt').html('취소');
			$('#okBt').show();
			$('#confirm1').modal('show');
			$('.withdrawal').click(function() {
				$(this).removeClass('withdrawal')
				$("#okBt").removeClass('btn-danger');
				location.href="/spaceCollection/admin/member/memberWithdrawal?userId=" + $('main>input[name=userId]').val();
			});
		});
		
		$('#return').click(function() {
			$('#okBt').addClass('return');
			$('.bi-exclamation-circle').css('color', '#ffd600');
			$('.modal-body').html('해당 회원을 복구시키겠습니까?');
			$('#okBt').addClass('btn-success');
			$('#okBt').html('복구');
			$('#cancelBt').html('취소');
			$('#okBt').show();
			$('#confirm1').modal('show');
			$('.return').click(function() {
				$(this).removeClass('return');
				$("#okBt").removeClass('btn-success');
				location.href="/spaceCollection/admin/member/memberReturn?userId=" + $('main>input[name=userId]').val();
			});
		});
		
		$('#goMList').click(function() {
			location.href="<c:url value = '/admin/space/spaceList'/>";
		});
		
	});
	
	function mouseIn(evt) {
		$(evt).find('td').css("background-color", "#d1cece");
	}
	function mouseOut(evt) {
		$(evt).find('td').css("background-color", "white");
	}
	
	
				
</script>
<main id="main" class="main">
	<input type="hidden" name="userId" value="${memberMap.USER_ID }">
	<div class="pagetitle">
		<h1>공간 상세보기</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">공간 관리</li>
				<li class="breadcrumb-item">공간 관리</li>
				<li class="breadcrumb-item active">공간 상세보기</li>
			</ol>
		</nav>
		<div style="float: right;">
				<button class="btn btn-primary goList" id="goMList">공간 목록</button>
		</div>
	</div>
	<!-- End Page Title -->

	<section class="section profile">
		<div class="row">
			<div class="col-xl-4">
				<div class="card">
					<div class="card-body pt-4">
						<div class="row-sm-3">
							<div class="row-sm-3">
								<h5 class="card-title">공간 이미지</h5>
								<div id="carouselExampleIndicators" class="carousel slide">
									<div class="carousel-indicators">
										<button type="button"
											data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="0" class="active" aria-current="true"
											aria-label="Slide 1"></button>
										<button type="button"
											data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="1" aria-label="Slide 2"></button>
										<button type="button"
											data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="2" aria-label="Slide 3"></button>
									</div>
									<div class="carousel-inner">
										<div class="carousel-item active">
											<img src="<c:url value='/board_images/1.jpg'/>"
												class="d-block w-100">
										</div>
										<div class="carousel-item">
											<img src="<c:url value='/board_images/2.jpg'/>"
												class="d-block w-100">
										</div>
										<div class="carousel-item">
											<img src="<c:url value='/board_images/3.jpg'/>"
												class="d-block w-100">
										</div>
									</div>
									<button class="carousel-control-prev" type="button"
										data-bs-target="#carouselExampleIndicators"
										data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</button>
									<button class="carousel-control-next" type="button"
										data-bs-target="#carouselExampleIndicators"
										data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Next</span>
									</button>
								</div>
							</div>
							<hr>
							<h5 class="card-title">신청자 정보</h5>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">이름 :</span>
								</div>
								<div class="col-9 back">
									<span>${spaceTotalInfo.spaceDetail.USER_NAME }</span>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">아이디 :</span>
								</div>
								<div class="col-9 back">
									<span>${spaceTotalInfo.spaceDetail.USER_ID }</span>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">이메일 :</span>
								</div>
								<div class="col-9 back">
									<span>${spaceTotalInfo.spaceDetail.USER_EMAIL }</span>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">연락처 :</span>
								</div>
								<div class="col-9 back">
									<span>${spaceTotalInfo.spaceDetail.USER_HP }</span>
								</div>
							</div>
						</div>
						<hr>
						<div class="row-sm-3">
							<h5 class="card-title">공간 정보</h5>

							<div class="row">
								<div class="col-3 fr">
									<span class="tag">카테고리 :</span>
								</div>
								<div class="col-9 back">
									<span>${spaceTotalInfo.spaceDetail.CATEGORY_NAME }</span>
								</div>
							</div>

							<div class="row">
								<div class="col-3 fr">
									<span class="tag">공간 타입명 :</span>
								</div>
								<div class="col-9 back">
									<span>${spaceTotalInfo.spaceDetail.SPACE_TYPE_NAME }</span>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">공간 번호 :</span>
								</div>
								<div class="col-9 back">
									<span>${spaceTotalInfo.spaceDetail.SPACE_NUM }</span>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">공간명 :</span>
								</div>
								<div class="col-9 back">
									<span>${spaceTotalInfo.spaceDetail.SPACE_NAME }</span>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">공간 주소 :</span>
								</div>
								<div class="col-9 back">
									<p>${spaceTotalInfo.spaceDetail.SPACE_ADDRESS }</p>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">간략 설명 :</span>
								</div>
								<div class="col-9 back">
									<p>${spaceTotalInfo.spaceDetail.SPACE_INTRO }</p>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">상세 설명 :</span>
								</div>
								<div class="col-9 back">
									<p>${spaceTotalInfo.spaceDetail.SPACE_INFO }</p>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">주의사항 :</span>
								</div>
								<div class="col-9 back">
									<p>${spaceTotalInfo.spaceDetail.SPACE_WARN }</p>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

			<div class="col-xl-8">
				<div class="card" id="card">
					<div class="card-body pt-3">
						<c:if test="${fn:length(spaceTotalInfo.spaceDetailList)>0 }">
							<ul class="nav nav-tabs nav-tabs-bordered">
								<c:set var="i" value="0"/>
								<c:forEach var="map" items="${spaceTotalInfo.spaceDetailList }">
									<li class="nav-item">
										<c:if test="${i != '0'}">
											<button class="nav-link" data-bs-toggle="tab"
												data-bs-target="#${fn:replace(map.SD_TYPE, ' ', '') }">${map.SD_TYPE }</button>
										</c:if>
										<c:if test="${i == '0'}">
											<button class="nav-link active" data-bs-toggle="tab"
												data-bs-target="#${fn:replace(map.SD_TYPE, ' ', '') }">${map.SD_TYPE }</button>
											<c:set var="i" value="${i+1}" />
										</c:if>
									</li>
								</c:forEach>
							</ul>
						</c:if>
						<c:if test="${fn:length (spaceTotalInfo.spaceDetailList)<1}">
							아직 등록된 세부 공간이 없습니다.
						</c:if>
						<div class="tab-content pt-2 infoDiv">
							<c:if test="${spaceTotalInfo.spaceDetailList != null }">
								<c:set var="i" value="0"/>
								<c:forEach var="map" items="${spaceTotalInfo.spaceDetailList }">
									<c:if test="${i != '0'}">
										<div class="tab-pane" id="${fn:replace(map.SD_TYPE, ' ', '') }">
									</c:if>
									<c:if test="${i == '0'}">
										<div class="tab-pane active show" id="${fn:replace(map.SD_TYPE, ' ', '') }">
										<c:set var="i" value="1"/>
									</c:if>
										<div class="row-sm-3">
											<h5 class="card-title">운영 정보</h5>
											<div>
												<div class="col fr">
													<span class="tag">최소 예약 시간 :</span>
												</div>
												<div class="col back">
													<span>${map.SD_MIN_TIME }</span>
												</div>
											</div>
											<div>
												<div class="col fr">
													<span class="tag">시간당 금액 :</span>
												</div>
												<div class="col back">
													<span>${map.SD_PRICE }</span>
												</div>
											</div>
											<div>
												<div class="col fr">
													<span class="tag">사용 인원 :</span>
												</div>
												<div class="col back">
													<span>${map.SD_PEOPLE }</span>
												</div>
											</div>
											<div>
												<div class="col fr">
													<span class="tag">운영시간 :</span>
												</div>
												<div class="col back">
													<span>${map.SD_TIME }</span>
												</div>
											</div>
										</div>
										<hr>
										<div class="row-sm-3">
											<h5 class="card-title">시설 정보</h5>
											<table class="table">
												<thead class="table-light">
													<tr>
														<th scope="col">WIFI</th>
														<th scope="col">프린터</th>
														<th scope="col">의자/테이블</th>
														<th scope="col">흡연</th>
														<th scope="col">화장실</th>
														<th scope="col">PC</th>
														<th scope="col">TV</th>
														<th scope="col">화이트보드</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>${map.FAC_WIFI }</td>
														<td>${map.FAC_PRINTER }</td>
														<td>${map.FAC_CHAIR_TABLE }</td>
														<td>${map.FAC_SMOKE }</td>
														<td>${map.FAC_REST_ROOM }</td>
														<td>${map.FAC_PC }</td>
														<td>${map.FAC_TV }</td>
														<td>${map.FAC_WHITE_BOARD }</td>
													</tr>
												</tbody>
											</table>
											<table class="table">
												<thead class="table-light">
													<tr>
														<th scope="col">엘리베이터</th>
														<th scope="col">주차</th>
														<th scope="col">취식</th>
														<th scope="col">주류반입</th>
														<th scope="col">취사</th>
														<th scope="col">반려동물반입</th>
														<th scope="col">오디오시설</th>
														<th scope="col"></th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>${map.FAC_ELEVATOR }</td>
														<td>${map.FAC_PARKING }</td>
														<td>${map.FAC_FOOD }</td>
														<td>${map.FAC_DRINK }</td>
														<td>${map.FAC_COOK }</td>
														<td>${map.FAC_PET }</td>
														<td>${map.FAC_AUDIO }</td>
														<td></td>
													</tr>
												</tbody>
											</table>
										</div>
										<hr>
										<div class="row-sm-3">
											<h5 class="card-title">환불 정보</h5>
											<table class="table">
												<thead class="table-light">
													<tr>
														<th scope="col">7일 전</th>
														<th scope="col">6일 전</th>
														<th scope="col">5일 전</th>
														<th scope="col">4일 전</th>
														<th scope="col">3일 전</th>
														<th scope="col">2일 전</th>
														<th scope="col">1일 전</th>
														<th scope="col">당일</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>${spaceTotalInfo.spaceDetail.REFUND_7_DAY }</td>
														<td>${spaceTotalInfo.spaceDetail.REFUND_6_DAY }</td>
														<td>${spaceTotalInfo.spaceDetail.REFUND_5_DAY }</td>
														<td>${spaceTotalInfo.spaceDetail.REFUND_4_DAY }</td>
														<td>${spaceTotalInfo.spaceDetail.REFUND_3_DAY }</td>
														<td>${spaceTotalInfo.spaceDetail.REFUND_2_DAY }</td>
														<td>${spaceTotalInfo.spaceDetail.REFUND_1_DAY }</td>
														<td>${spaceTotalInfo.spaceDetail.REFUND_DAY }</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</c:forEach>
							</c:if>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Modal -->
	<div class="modal fade" id="confirm1" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"><i class="bi bi-exclamation-circle"></i></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="cancelBt"></button>
					<button type="button" class="btn" id="okBt"></button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModal -->
</main>

<%@ include file="../../form/adminBottom.jsp"%>    