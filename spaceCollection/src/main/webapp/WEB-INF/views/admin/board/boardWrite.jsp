<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<script type="text/javascript" src="<c:url value='/resource/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace('contents', {
			uploadUrl : '<c:url value='/admin/board/boardWrite'/>',
			filebrowserUploadUrl : '<c:url value='/admin/board/boardWrite'/>'
		});
	})
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>게시판 생성/관리</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">게시판 생성/관리</li>
				<li class="breadcrumb-item">게시물 관리</li>
				<li class="breadcrumb-item active">게시물 작성</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6" style="width: 100%">

				<div class="card" id="pageDiv" >
					<div class="card-body">
 						<h5 class="card-title" style="font-weight: bold;">게시물 작성</h5>
 						<form class="row gx-3 gy-2 align-items-center" id="boardFrm" method="post" action="<c:url value='/admin/board/boardList'/>">
							<div id="searchDiv">
								<div class="col-auto">
									<button type="submit" class="btn btn-primary">검색</button>
								</div>
								<div class="col-sm-3" id="keyword">
									<label class="visually-hidden" for="searchCondition">searchCondition</label>
									<input type="text" class="form-control" id="searchCondition" name="searchCondition">
								</div>
								<div class="col-sm-3" id="select">
									<select class="form-select" name="searchCondition" id="searchCondition">
										<option value="board_title" <c:if test="${param.searchCondition=='board_title'}">
						            		selected="selected"
						            	</c:if> >제목</option>
										<option value="user_id" <c:if test="${param.searchCondition=='user_id'}">
						            		selected="selected"
						            	</c:if> >작성자</option>
									</select>
								</div>
							</div>
							<textarea id="contents"></textarea>
						</form>
				 	</div>
				</div>

			</div> 
		</div>
	</section>

</main>

<%@ include file="../../form/adminBottom.jsp"%>    
