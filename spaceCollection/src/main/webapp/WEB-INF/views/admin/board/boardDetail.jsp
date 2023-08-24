<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<style type="text/css">
	label{
		font-weight: bold;
	}
	
	form{
		width: 100%;
	}
	
	#commentsContent{
		height: 100px;
	}
	
	div#commentDiv {
    	margin: 0 auto;
    	width: 100%;
	}
	
	#submitBt, #editBt, #listBt{
		margin-top: 10px;
	}
	
	hr{
		color: gray;
	}
	
	#files{
		float: right;
		
	
	#fileSpan{
		float: right;
		cursor: pointer;
	}
	}
	
	li>a{
		color: #555555;
		float: left;
		margin-right: 30px;
		margin-top: 7px;
	}
	li {
		list-style: none;
	}
	
	i.bi.bi-exclamation-circle{
 		color: #ffd600;
   		font-size: 40px;
   		display: block;
   		margin-block: -13px;
	}
	
	a~p{
		margin-top: 10px;
	}
	
	#commentsDel, #commentsEdit{
		color: #555555;
		float: right;
		margin-left: 10px;
		cursor: pointer;
	}
	
	#cmmentsMoreDiv{
		text-align: center;
	}
	
	#cmmentsMoreDiv>a{
		color: #555555;
	}
	
	
	
	
</style>
<script type="text/javascript">
	$(function() {
		$('#okBt').hide();
		$('#fileList').hide();
		
		$('#fileSpan').click(function() {
			$('#fileList').toggle();
		});
		
		$('#listBt').click(function() {
			location.href="<c:url value='/admin/board/boardList'/>";
		});
		
		$('form[name=commentsFrm]').submit(function() {
			if($('textarea').val().trim()==''){
				$('#cancelBt').html("확인");
				$('.modal-body').html("댓글을 입력해주세요.");
		        $('#confirm1').modal('show');
				
				event.preventDefault();
			}
		});
		
		$('#editBt').click(function() {
			location.href="/spaceCollection/admin/board/boardEdit?boardNum="+$('input[name=boardNum]').val();
		});
		
		$('#commentsDel').click(function() {
			$('#okBt').show();
			$('#cancelBt').html("취소");
			$('#okBt').html("삭제");
			$('.modal-body').html("댓글을 삭제하시겠습니까?");
			
			$('#confirm1').modal('show');
		});
		
	});
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
 						<span>${map.BOARD_TYPE_NAME }</span>
						<h4>${map.BOARD_TITLE }</h4>
						<p><a href="#"><i class="bi bi-person-fill"></i>${map.USER_ID }</a><br>
							<fmt:parseDate var="regdate" value="${map.BOARD_REG_DATE }" pattern="yyyy-MM-dd HH:mm"/>
							<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd HH:mm"/> 조회 0
						</p>
						
						<hr>
						<c:if test="${!empty spaceFileList }">
							<div id="files">
								<span id="fileSpan"><i class="bi bi-folder"></i> 첨부파일 : ${fn:length(spaceFileList) }</span>
								<br>
								<div id="fileList" class="card">
									<ul>
										<c:forEach var="spaceFileVo" items="${spaceFileList }">
											<li>
												<a href="<c:url value='/admin/board/download?boardNum=${spaceFileVo.imgForeignKey }&fileName=${spaceFileVo.imgTempName }'/>">
													<i class="bi bi-files"></i> ${spaceFileVo.imgOriginalName }
												</a>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</c:if>
						<div>
							<!-- 내용 -->
							<div>
								${map.BOARD_CONTENT }
							</div>
						</div>
						<hr>
						<!-- 좋아요 댓글수 -->
						<!-- 댓글쓰기란 -->
						<c:if test="${map.BOARD_TYPE_COMMENT_OK=='Y' }">
							<form name="commentsFrm" method="post" action="<c:url value='/admin/board/boardDetail/commentsWrite'/>">
								<label for="commentsContent">댓글</label>
								<div class="col-sm-10" id="commentDiv">
				                	<textarea class="form-control" style="height: 100px" name="commentContent"></textarea>
				                </div>
				                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                  					<button type="submit" class="btn btn-primary right" id="submitBt">댓글 등록</button>
                  					<button type="button" class="btn btn-secondary right" id="editBt">수정</button>
                  					<button type="button" class="btn btn-secondary right" id="listBt">목록</button>
								</div>
								<input type="hidden" name="boardNum" value="${map.BOARD_NUM }">							
								<input type="hidden" name="userNum" value="9999999">							
							</form>
							
							<hr>
							<div>
								<c:if test="${empty list }">
									<span>등록된 댓글이 없습니다.</span>
								</c:if>
								<c:if test="${!empty list }">
									<c:forEach var="comments" items="${list }">
										<div>
											<a href="#"><i class="bi bi-person-fill"></i><span>${comments.USER_ID }</span></a>
											<span id="commentsDel">삭제</span><span id="commentsEdit">수정</span>
											<p style="white-space: pre;"><c:out value="${comments.COMMENT_CONTENT }"/></p>
											<fmt:parseDate var="commentRegdate" value="${comments.COMMENT_REG_DATE }" pattern="yyyy-MM-dd HH:mm"/>
											<span><fmt:formatDate value="${commentRegdate }" pattern="yyyy-MM-dd HH:mm"/></span>
											<hr>
										</div>
									</c:forEach>
									<div id="cmmentsMoreDiv">
										<a href="#">댓글 더 보기</a>
									</div>
								</c:if>
							</div>
						</c:if>
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
