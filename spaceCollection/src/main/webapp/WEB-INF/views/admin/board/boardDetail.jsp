<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<script type="text/javascript" src="<c:url value='/resource/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace('contents', {
			uploadUrl : '<c:url value='/admin/board/boardDetail'/>',
			filebrowserUploadUrl : '<c:url value='/admin/board/boardDetail'/>',
			width : '100%'
			
		});
		
	})
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>게시물 상세보기</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">게시판 생성/관리</li>
				<li class="breadcrumb-item">게시물 관리</li>
				<li class="breadcrumb-item active">게시물 상세보기</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6" style="width: 100%">

				<div class="card" id="pageDiv" >
					<div class="card-body">
 						<h5 class="card-title" style="font-weight: bold;">게시물 상세보기</h5>
 						<form class="row gx-3 gy-2 align-items-center" id="boardFrm" method="post" action="<c:url value='/admin/board/boardWriteSub'/>">
							<div id="searchDiv">
								<div class="col-sm-3" id="select">
									<label class="col-sm-2 col-form-label" for="boardTypeName">게시판 분류</label>
									<select class="form-select" name="boardTypeId" id="boardTypeId">
										<c:forEach var="boardTypeVo" items="${list }">
											<option value="${boardTypeVo.boardTypeId }" <c:if test="${boardTypeName == boardTypeVo.boardTypeName}">
							            		selected="selected"
							            	</c:if> >${boardTypeVo.boardTypeName }</option>
										</c:forEach>
									</select>
								</div>
								
								<div class="col-sm-3" id="keyword">
									<label class="col-sm-2 col-form-label" for="boardTitle">제목</label>
									<input type="text" class="form-control" id="boardTitle" name="boardTitle">
									<input type="hidden" class="form-control" id="userid" name="userid" value="관리자">
								</div>
								
							</div>
							<textarea name="boardContent" id="contents"></textarea>
							<div class="col-auto">
								<button type="submit" class="btn btn-primary">등록</button>
							</div>
							<input type="hidden" name="boardTypeName" id="boardTypeName">
							<input type="hidden" name="userNum" value="9999999">
						</form>
				 	</div>
				</div>

			</div> 
		</div>
	</section>

</main>

<%@ include file="../../form/adminBottom.jsp"%>    
