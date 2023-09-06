<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<style type="text/css">
	
	
	i.bi.bi-exclamation-circle {
 		color: #ffd600;
   		font-size: 40px;
   		display: block;
   		margin-block: -13px;
	}
	
	.m-left{
		margin-left: 12px;
	}
	
	#btDiv{
		margin-top: 10px;
		float: right;
	}
	
	#btDiv>button{
		width: 100px;
	}
	
	.active{
		color: green;
		font-weight: bold;
	}
	
	.deActive{
		color: red;
		font-weight: bold;
	}
	
	p{
		width: 100%;
	}
	
	.tag{
	}
	
	.fr{
		text-align: right;
		width: 160px;
		float: left;
	}
	
	.back{
		text-align: left;
		ma
	}
	.back>span{
		margin: 10px 0 0 20px;
	}
	
	.fr, .back{
		margin-bottom: 5px;
	}
	
	#carouselExampleIndicators{
		width: 600px;
		height: 350px;
	}
	
	#carouselExampleIndicators img{
		width: 100%;
	}
	
	.confirm{
		color: rgb(13,110,253);
		font-weight: bold;
	}
	.denine{
		color: red;
		font-weight: bold;
	}
	.request{
		color: rgb(255,214,1);
		font-weight: bold;
	}
	
	td, th{
		text-align: center;
		width: 100px;
	}
</style>
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#okBt').hide();
		
		$('#listBt').click(function() {
			location.href = "<c:url value='/admin/space/spaceConfirmList'/>";
		});
		
		$('#confirmBt').click(function() {
			$('#confirm1 .modal-body').html("승인 처리하시겠습니까?");
			$('#okBt').show();
			$('#okBt').addClass("btn-primary");
			$('#cancelBt').html("취소");
			$('#okBt').html("승인");
			$('#confirm1').modal("show");
			$('#okBt').click(function() {
				$('#confirm1').modal("hide");
				$(this).removeClass("btn-primary");
				$('#okBt').hide();
				location.href="/spaceCollection/admin/space/spaceConfirmList/confirmOne?spaceNum="+$('input[name=spaceNum]').val();
			});
		});
		
		$('#denineBt').click(function() {
			
		});
	});
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>공간 관리</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">공간 관리</li>
				<li class="breadcrumb-item">공간 승인 관리</li>
				<li class="breadcrumb-item active">공간 승인 상세보기</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6" style="width: 100%">

				<div class="card" id="pageDiv">
					<div class="card-body">
						<input type="hidden" name="spaceNum" value="${map.SPACE_NUM }">
						<h5 class="card-title" style="font-weight: bold;">공간 승인 상세보기</h5>
						<div class="row-sm-3">
							<h5 class="card-title">신청자 정보</h5>
							<div>
								<div class="col fr">
									<span class="tag">이름 :</span>
								</div>
								<div class="col back">
									<span>${map.USER_NAME }</span>
								</div>
							</div>
							<div>
								<div class="col fr">
									<span class="tag">아이디 :</span>
								</div>
								<div class="col back">
									<span>${map.USER_ID }</span>
								</div>
							</div>
							<div>
								<div class="col fr">
									<span class="tag">이메일 :</span>
								</div>
								<div class="col back">
									<span>${map.USER_EMAIL }</span>
								</div>
							</div>
							<div>
								<div class="col fr">
									<span class="tag">연락처 :</span>
								</div>
								<div class="col back">
									<span>${map.USER_HP }</span>
								</div>
							</div>
						</div>
						<hr>
						<div class="row-sm-3">
							<h5 class="card-title">공간 정보</h5>

							<div>
								<div class="col fr">
									<span class="tag">카테고리 :</span>
								</div>
								<div class="col back">
									<span>${map.CATEGORY_NAME }</span>
								</div>
							</div>

							<div>
								<div class="col fr">
									<span class="tag">공간 타입명 :</span>
								</div>
								<div class="col back">
									<span>${map.SPACE_TYPE_NAME }</span>
								</div>
							</div>
							<div>
								<div class="col fr">
									<span class="tag">공간 번호 :</span>
								</div>
								<div class="col back">
									<span>${map.SPACE_NUM }</span>
								</div>
							</div>
							<div>
								<div class="col fr">
									<span class="tag">공간명 :</span>
								</div>
								<div class="col back">
									<span>${map.SPACE_NAME }</span>
								</div>
							</div>
							<div>
								<div class="col fr">
									<span class="tag">공간 주소 :</span>
								</div>
								<div class="col back">
									<span>${map.SPACE_ADDRESS }</span>
								</div>
							</div>
							<div>
								<div class="col fr">
									<span class="tag">제공 면적 :</span>
								</div>
								<div class="col back">
									<span>${map.SD_AREA } m<sup>2</sup></span>
								</div>
							</div>
							<div>
								<div class="col fr">
									<span class="tag">연락처 :</span>
								</div>
								<div class="col back">
									<span>${map.SPACE_PHONE_NUM }</span>
								</div>
							</div>
							<div>
								<div class="col fr">
									<span class="tag">사업자 번호 :</span>
								</div>
								<div class="col back">
									<span>${map.SPACE_BUSINESS_NUM }</span>
								</div>
							</div>
							<div>
								<div class="col fr">
									<span class="tag">사업자 등록증 파일 :</span>
								</div>
								<div class="col back">
									<span><a href="#">사업자 등록증 파일이름.pdf</a></span>
								</div>
							</div>
							<div>
								<div class="col fr">
									<span class="tag">승인 요청일 :</span>
								</div>
								<div class="col back">
									<span>${map.SPACE_REQUEST_DATE }</span>
								</div>
							</div>
							<div>
								<div class="col fr">
									<span class="tag">결정일 :</span>
								</div>
								<div class="col back">
									<span>${map.SPACE_REG_DATE }</span>
								</div>
							</div>
							<div>
								<div class="col fr">
									<span class="tag">상태 :</span>
								</div>
								<div class="col back">
									<c:if test="${map.SPACE_REQUEST_STATUS=='승인' }">
										<span class="confirm">${map.SPACE_REQUEST_STATUS }</span>
									</c:if>
									<c:if test="${map.SPACE_REQUEST_STATUS=='거절' }">
										<span class="denine">${map.SPACE_REQUEST_STATUS }</span>
									</c:if>
									<c:if test="${map.SPACE_REQUEST_STATUS=='요청중' }">
										<span class="request">${map.SPACE_REQUEST_STATUS }</span>
									</c:if>
								</div>
							</div>
						</div>
						<br>
						<hr>
						<div class="row-sm-3">
							<h5 class="card-title">공간 설명</h5>
							<div>
								<div class="col fr">
									<span class="tag">공간 태그 :</span>
								</div>
								<div class="col back">
									<span>${map.SPACE_TAG }</span>
								</div>
							</div>

							<div>
								<div class="col fr">
									<span class="tag">상세타입 :</span>
								</div>
								<div class="col back">
									<span>${map.SD_TYPE }</span>
								</div>
							</div>
							<div>
								<div class="col fr">
									<span class="tag">인트로 :</span>
								</div>
								<div class="col back">
									<span>${map.SPACE_INTRO }</span>
								</div>
							</div>
							<div>
								<div class="col fr">
									<span class="tag">설명 :</span>
								</div>
								<div class="col back">
									<span>${map.SPACE_INFO }</span>
								</div>
							</div>
							<div>
								<div class="col fr">
									<span class="tag">주의사항 :</span>
								</div>
								<div class="col back">
									<span>${map.SPACE_WARN }</span>
								</div>
							</div>
						</div>

						<hr>
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
								<thead>
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
								<thead>
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
								<thead>
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
										<td>${map.REFUND_7_DAY }</td>
										<td>${map.REFUND_6_DAY }</td>
										<td>${map.REFUND_5_DAY }</td>
										<td>${map.REFUND_4_DAY }</td>
										<td>${map.REFUND_3_DAY }</td>
										<td>${map.REFUND_2_DAY }</td>
										<td>${map.REFUND_1_DAY }</td>
										<td>${map.REFUND_DAY }</td>
									</tr>
								</tbody>
							</table>
						</div>
						<hr>
						<div class="col-auto" id="btDiv">
							<%-- <c:if test="${map.SPACE_REQUEST_STATUS == 'R' }"> --%>
							<button type="button" class="btn btn-outline-danger"
								id="denineBt">거절</button>
							<button type="button" class="btn btn-outline-success"
								id="confirmBt">승인</button>
							<%-- </c:if> --%>
							<button type="button" class="btn btn-secondary" id="listBt">목록</button>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- Moda1 -->
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
					<button type="button" class="btn btn-secondary" id="cancelBt"
						data-bs-dismiss="modal"></button>
					<button type="button" class="btn" id="okBt"></button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModal1 -->

</main>

<%@ include file="../../form/adminBottom.jsp"%>    
