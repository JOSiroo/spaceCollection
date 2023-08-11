<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<style type="text/css">
	#boardWriteBt{
		float: right;
		margin-top: 16px;
		margin-right: 5px;
	}	

	h5{
		float: left;
	}
	
	#searchDiv>div {
    	float: right;
	}
	
	div#select {
    	width: 114px;
	}
	
	#searchDiv>div{
		margin-left: 5px;
	}
	
</style>
<script type="text/javascript">
	$(function() {
		$('tbody tr').hover(function() {
			$(this).find('td').css("background-color", "#d1cece");
		}, function() {
			$(this).find('td').css("background-color", "white");
		});
	});
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>게시물 관리</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">게시판 생성/관리</li>
				<li class="breadcrumb-item active">${param.boardTypeName }</li>
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
 						<form method="post" action="<c:url value='/admin/board/boardWrite'/>">
 							<input type="hidden" value="${param.boardTypeName }" name="boardTypeName">
	 						<button type="submit" class="btn btn-primary rounded-pill" id="boardWriteBt">게시물 작성</button>
 						</form>
						<table class="table">
							<thead>
								<tr>
									<th scope="col"><input type="checkbox" name="chkAll"></th>
									<th scope="col">게시물 번호</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">작성일</th>
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
										<fmt:parseDate value="${map.BOARD_REG_DATE }" var="boardRegDate" pattern="yyyy-MM-dd"/>
										<tr onclick="location.href='<c:url value='/admin/board/boardDetail?boardNum=${map.BOARD_NUM }'/>';" style="cursor:pointer;">
											<td><input type="checkbox" name="chk"></td>
											<td>${map.BOARD_NUM }</td>
											<td>${map.BOARD_TITLE }</td>
											<td>${map.USER_ID }</td>
											<td><fmt:formatDate value="${boardRegDate }" pattern="yyyy-MM-dd"/></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						<div class="divPage">
						
							<nav aria-label="...">
								<ul class="pagination">
									<c:if test="${pagingInfo.firstPage>1 }">
										<li class="page-item <c:if test='${pagingInfo.firstPage <=1 }'>disabled</c:if>">
											<a class="page-link" aria-label="Previous" onclick="pageFunc(${pagingInfo.firstPage-1})">Previous</a>
							    		</li>
									</c:if>	
							    	<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">		
										<c:if test="${i == pagingInfo.currentPage }">
											<li class="page-item active" aria-current="page">
									      		<a class="page-link" href="#">${i}</a>
									    	</li>		
								        </c:if>
										<c:if test="${i != pagingInfo.currentPage }">		
									         <li class="page-item">
									         	<a class="page-link" aria-label="Previous" href="#" onclick="pageFunc(${i})">${i }</a>
									         </li>
									    </c:if>   		
									</c:forEach>
							      	<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
							      		<li class="page-item <c:if test='${pagingInfo.lastPage >= pagingInfo.totalPage }'>disabled</c:if>">
								      		<a class="page-link" href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">Next</a>
								    	</li>
									</c:if>
							  	</ul>
							</nav>
						
						</div>	
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
</main>
<!-- End #main -->
<!-- End #main -->
<%@ include file="../../form/adminBottom.jsp"%>

