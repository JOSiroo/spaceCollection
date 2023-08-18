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
	
	#submitBt{
		margin-top: 10px;
	}
	
	hr{
		color: gray;
	}
</style>
<script type="text/javascript">
	$(function() {
		
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
 						<!-- 게시판 종류 -->
 						<span>${map.BOARD_TYPE_NAME }</span>
						<!-- 제목 -->
						<h4>${map.BOARD_TITLE }</h4>
						<!-- 아이디 -->
						<!-- 게시시간 -->
						<p><i class="bi bi-person-fill"></i>${map.USER_ID }<br>
						<fmt:parseDate var="regdate" value="${map.BOARD_REG_DATE }" pattern="yyyy-MM-dd HH:mm"/>
						<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd HH:mm"/> 조회 0
						</p>
						
						<hr>
						<div>
							<!-- 내용 -->
							<div>
								${map.BOARD_CONTENT }
							</div>
							<!-- 첨부파일 -->
							<div>
							<c:if test="${map.BOARD_TYPE_FILE_OK=='Y' }">
								<c:if test="">
								
								</c:if>
								<c:if test="">
								
								</c:if>
							</c:if>
							</div>
						</div>
						<hr>
						<!-- 사용자명 검색 -->
						<a href="#"><i class="bi bi-person-fill"></i><span>${map.USER_ID }</span>님의 게시글 더보기></a>
						<!-- 좋아요 댓글수 -->
						<!-- 댓글쓰기란 -->
						<c:if test="${map.BOARD_TYPE_COMMENT_OK=='Y' }">
							<form name="commentsFrm" method="post" action="<c:url value='/admin/board/boardDetail/commentsWrite'/>">
								<label for="commentsContent">댓글</label>
								<div class="col-sm-10" id="commentDiv">
				                	<textarea class="form-control" style="height: 100px" name="commentContent" id=""></textarea>
				                </div>
				                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                  					<button type="submit" class="btn btn-primary right" id="submitBt">댓글 등록</button>
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
											<p style="white-space: pre;"><c:out value="${comments.COMMENT_CONTENT }"/></p>
											<fmt:parseDate var="commentRegdate" value="${comments.COMMENT_REG_DATE }" pattern="yyyy-MM-dd HH:mm"/>
											<span><fmt:formatDate value="${commentRegdate }" pattern="yyyy-MM-dd HH:mm"/></span>
											<hr>
										</div>
									</c:forEach>
									<div>
										<a href="#">댓글 더 보기</a>
									</div>
								</c:if>
							</div>
						</c:if>
						<!-- 댓글 목록 -->
				 	</div>
				</div>

			</div> 
		</div>
	</section>

</main>

<%@ include file="../../form/adminBottom.jsp"%>    
