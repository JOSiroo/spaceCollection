<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<script type="text/javascript">
	$(function() {
		
		
	});
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>게시판 생성/관리</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item active">게시판 생성/관리</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6" style="width: 100%">

				<div class="card" id="pageDiv" >
					<div class="card-body">
 						<h5 class="card-title" style="font-weight: bold;">${param.boardTypeName }</h5>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">게시물 번호</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">작성일</th>
									<th scope="col">삭제여부</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list }">
									<tr>
										<td colspan="5" style="text-align: center;">작성된 게시물이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty list }">
									<c:forEach var="map" items="${list }">
									
											<tr onclick="location.href='<c:url value='/admin/board/boardList?boardTypeName=${vo.boardTypeName }'/>';" style="cursor:pointer;">
												<td>${map.boardTypeName }</td>
												<td>${vo.boardTitle }</td>
												<td>${vo.boardTypeCommentOk }</td>
												<td>${vo.boardTypeFileOk }</td>
												<td><fmt:formatDate value="${vo.boardTypeRegdate }" pattern="yyyy-MM-dd"/></td>
											</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>						
				 	</div>
				</div>

			</div> 
		</div>
		
	</section>
	<!-- Modal1 -->
	<div class="modal fade" id="confirm1" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">게시판 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">변경사항을 저장하시겠습니까??</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button class="btn btn-primary" id="editBt2">저장하기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModal -->
	<!-- Modal2 -->
	<div class="modal fade" id="confirm2" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">게시판 수정 중지</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">게시판 수정을 중단하시겠습니까? <br> 작성된 내용은 저장되지 않습니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button class="btn btn-primary" id="cancelBt2">중단하기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModa2 -->
</main>
<!-- End #main -->
<!-- End #main -->
<%@ include file="../../form/adminBottom.jsp"%>

