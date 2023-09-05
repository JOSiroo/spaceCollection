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
		width: 100px;
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

				<div class="card" id="pageDiv" >
					<div class="card-body">
					<input type="hidden" name="spaceNum" value="${map.SPACE_NUM }">
 						<h5 class="card-title" style="font-weight: bold;">공간 승인 상세보기</h5>
							<div class="row-sm-3">
								<h5 class="card-title">공간 정보</h5>
								<div>
									<div class="col fr">
										<span class="tag">카테고리명 :</span>
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
										<input type="hidden" name="spaceTypeName" id="spaceTypeName" value="${map.SPACE_TYPE_NAME }">
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
												<img src="<c:url value='/board_images/1.jpg'/>" class="d-block w-100">
											</div>
											<div class="carousel-item">
												<img src="<c:url value='/board_images/2.jpg'/>" class="d-block w-100">
											</div>
											<div class="carousel-item">
												<img src="<c:url value='/board_images/3.jpg'/>" class="d-block w-100">
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
							</div>
							<hr>
							<div class="row-sm-3">
								<h5 class="card-title">운영 정보</h5>
								<div>
									<div class="col fr">
										<span class="tag">카테고리명 :</span>
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
										<input type="hidden" name="spaceTypeName" id="spaceTypeName" value="${map.SPACE_TYPE_NAME }">
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
										<span>${map.SPACE_TYPE_NO }</span>
									</div>
								</div>
								<div>
									<div class="col fr">
										<span class="tag">공간명 :</span>
									</div>
									<div class="col back">
										<span>${map.SPACE_TYPE_NO }</span>
									</div>
								</div>
								
								<hr>
							<div class="row-sm-3">
								<h5 class="card-title">시설 정보</h5>
								<div>
									<div class="col fr">
										<span class="tag">카테고리명 :</span>
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
										<input type="hidden" name="spaceTypeName" id="spaceTypeName" value="${map.SPACE_TYPE_NAME }">
									</div>
								</div>
								<div>
									<div class="col fr">
										<span class="tag">공간 번호 :</span>
									</div>
									<div class="col back">
										<span>${map.SPACE_TYPE_NO }</span>
									</div>
								</div>
								<div>
									<div class="col fr">
										<span class="tag">공간명 :</span>
									</div>
									<div class="col back">
										<span>${map.SPACE_TYPE_NO }</span>
									</div>
								</div>
								<div>
									<div class="col fr">
										<span class="tag">공간명 :</span>
									</div>
									<div class="col back">
										<span>${map.SPACE_TYPE_NO }</span>
									</div>
								</div>
								
								<hr>
							<div class="row-sm-3">
								<h5 class="card-title">환불 정보</h5>
								<div>
									<div class="col fr">
										<span class="tag">카테고리명 :</span>
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
										<input type="hidden" name="spaceTypeName" id="spaceTypeName" value="${map.SPACE_TYPE_NAME }">
									</div>
								</div>
								<div>
									<div class="col fr">
										<span class="tag">공간 번호 :</span>
									</div>
									<div class="col back">
										<span>${map.SPACE_TYPE_NO }</span>
									</div>
								</div>
								<div>
									<div class="col fr">
										<span class="tag">공간명 :</span>
									</div>
									<div class="col back">
										<span>${map.SPACE_TYPE_NO }</span>
									</div>
								</div>
								<div>
									<div class="col fr">
										<span class="tag">공간명 :</span>
									</div>
									<div class="col back">
										<span>${map.SPACE_TYPE_NO }</span>
									</div>
								</div>
								
								<hr>
						<div class="col-auto" id="btDiv">
							<%-- <c:if test="${map.SPACE_REQUEST_STATUS == 'R' }"> --%>
								<button type="button" class="btn btn-outline-danger" id="denineBt">거절</button>
								<button type="button" class="btn btn-outline-success" id="confirmBt">승인</button>
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
