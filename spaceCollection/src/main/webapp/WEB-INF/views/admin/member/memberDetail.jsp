<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<style type="text/css">
	div.row{
		margin-top: 10px;
	}
	
	div.label{
		color: #677fa9;
		font-weight: bold;
	}
	
	#card {
    	min-height: 420px;
	}
</style>
<script type="text/javascript">
	$(function() {
		$('#okBt').hide();
	});
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>회원 상세보기</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">회원 관리</li>
				<li class="breadcrumb-item">회원 관리</li>
				<li class="breadcrumb-item active">회원 상세보기</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section profile">
		<div class="row">
			<div class="col-xl-4">
				<div class="card">
					<div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
						<img src="<c:url value='/user_images/test1.jpg'/>" alt="Profile" class="rounded-circle">
						<h2>${memberMap.USER_NAME }</h2>
						<h3>${memberMap.USER_ID }</h3>
					</div>
				</div>
			</div>

			<div class="col-xl-8">
				<div class="card" id="card">
					<div class="card-body pt-3">
						<ul class="nav nav-tabs nav-tabs-bordered">
							<li class="nav-item">
								<button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profileOverview">회원 정보</button>
							</li>
							<li class="nav-item">
								<button class="nav-link" data-bs-toggle="tab" data-bs-target="#reservationList">예약 내역</button>
							</li>
							<li class="nav-item">
								<button class="nav-link" data-bs-toggle="tab" data-bs-target="#reviewList">리뷰 내역</button>
							</li>
							<li class="nav-item">
								<button class="nav-link" data-bs-toggle="tab" data-bs-target="#commentList">댓글 내역</button>
							</li>

						</ul>
						<div class="tab-content pt-2">
							<!-- 회원정보 시작 -->
							<div class="tab-pane fade show active" id="profileOverview">
								<h5 class="card-title" style="font-weight: bold;">회원 상세정보</h5>

								<div class="row">
									<div class="col-lg-3 col-md-4 label ">이름</div>
									<div class="col-lg-9 col-md-8">${memberMap.USER_NAME }</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">연락처</div>
									<div class="col-lg-9 col-md-8">${memberMap.USER_HP }</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">주소</div>
									<div class="col-lg-9 col-md-8">${memberMap.ZIPCODE }<br> 
									${memberMap.ADDRESS } ${memberMap.ADDRESS_DETAIL }</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">이메일</div>
									<div class="col-lg-9 col-md-8">${memberMap.USER_EMAIL }</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">마케팅 수신 동의</div>
									<div class="col-lg-9 col-md-8">
										이메일 ${memberMap.USER_MARKETING_EMAIL_OK }<br>
										SMS ${memberMap.USER_MARKETING_SMS_OK }
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">가입일자</div>
									<div class="col-lg-9 col-md-8">
										<fmt:formatDate value="${memberMap.USER_REG_DATE }" pattern="yyyy-MM-dd"/>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">탈퇴여부</div>
									<div class="col-lg-9 col-md-8">
										<c:if test="${memberMap.USER_OUT_TYPE == 'Y' }">
											탈퇴(탈퇴일 : <fmt:formatDate value="${memberMap.USER_OUT_DATE }" pattern="yyyy-MM-dd"/> )
										</c:if>
										<c:if test="${empty memberMap.USER_OUT_TYPE }">
											가입
										</c:if>
									</div>
								</div>
							</div>
							<!-- 회원정보 끝 -->
							<!-- 예약 내역 시작 -->
							<div class="tab-pane fade pt-3" id="reservationList">
								<div class="row mb-3">
									예약 내역 갈길 곳
								</div>
								
							</div>
							<!-- 예약 내역 끝 -->
							<!-- 후기 내역 시작 -->
							<div class="tab-pane fade pt-3" id="reviewList">
								<div class="row mb-3">
									후기 갈길 곳
								</div>
							</div>
							<!-- 후기 내역 끝 -->
							<!-- 댓글 내역 시작 -->
							<div class="tab-pane fade pt-3" id="commentList">
								<div class="row mb-3">
									댓글 갈길 곳
								</div>
							</div>
							<!-- 댓글 내역 끝 -->
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
					<button type="button" class="btn btn-danger" id="okBt"></button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModal -->
</main>

<%@ include file="../../form/adminBottom.jsp"%>    
