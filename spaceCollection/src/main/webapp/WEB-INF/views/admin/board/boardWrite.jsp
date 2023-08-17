<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<style type="text/css">
	div#searchDiv>div {
 	   width: 100%;
	}
	
	.labelNext{
		width: 70%;
		float: left;
	}
	
	div#searchDiv>div label {
    	float: left;
    	width: 86px;
    	margin-bottom: 14px;
		text-align: right;
		margin-right: 10px
	}
	
	#keyword{
		clear: both;
	}
	
	.titleLimit{
		display: block;
		padding-top: 6px;
		font-size: 15px;
		color: gray;
	}
	
	#strCount{
		float: left;
	}
</style>
<script type="text/javascript" src="<c:url value='/resource/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace('contents', {
			uploadUrl : '<c:url value='/admin/board/boardWrite'/>',
			filebrowserUploadUrl : '<c:url value='/admin/board/boardWrite'/>',
			width : '100%'
			
		});
		
		$('form').submit(function() {
			$('#boardTypeName').val($('option:selected').html());
		});
		
		$('#boardTitle').keyup(function() {
			var strLength = $(this).val().length;
			$('#strCount').html('&nbsp;&nbsp(' + strLength);
			var sliceStr = $(this).val().slice(0, 45);
			
			if(strLength>45){
				$('#boardTitle').val(sliceStr);
				$('#confirm1').modal('show');
				$('#confirm1').on('hidden.bs.modal', function (e) {
					$('#boardTitle').focus();
				});
			}
		});
			
		$('#boardTitle').change(function() {
			var strLength = $(this).val().length;
			$('#strCount').html('&nbsp;&nbsp(' + strLength);
		});
		
		
		$('input[type=submit]').click(function() {
			$('#boardFrm').submit();
		});
	});
		
	document.myForm.addEventListener("keydown", evt => {
	    if ((evt.keyCode || evt.which) === 13) {
	        evt.preventDefault();
	    }
	});
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
 						<form class="row gx-3 gy-2 align-items-center" name="boardFrm" id="boardFrm" method="post" action="<c:url value='/admin/board/boardWriteSub'/>"
 							onkeydown="return event.key != 'Enter';">
							<div id="searchDiv">
								<div class="col-sm-3" id="select">
									<label class="col-sm-2 col-form-label" for="boardTypeName">게시판 분류</label>
									<select class="form-select labelNext " name="boardTypeId" id="boardTypeId">
										<c:forEach var="boardTypeVo" items="${list }">
											<option value="${boardTypeVo.boardTypeId }" <c:if test="${boardTypeName == boardTypeVo.boardTypeName}">
							            		selected="selected"
							            	</c:if> >${boardTypeVo.boardTypeName }</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-3" id="keyword">
									<label class="col-sm-2 col-form-label" for="boardTitle">제목</label>
									<input type="text" class="form-control labelNext" id="boardTitle" name="boardTitle">
									<span class="titleLimit" id="strCount">&nbsp;&nbsp;(0</span>
									<span class="titleLimit" id="titleLimit">&nbsp;/45자 이내)</span>
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
	<!-- Modal1 -->
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
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal" id="confirm">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModal1 -->

</main>

<%@ include file="../../form/adminBottom.jsp"%>    
