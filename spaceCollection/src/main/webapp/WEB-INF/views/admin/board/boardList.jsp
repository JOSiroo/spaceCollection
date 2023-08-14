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
	
	form[name=boardTypeNameFrm] {
  	  clear: both;	
	}
	
	form[name=boardTypeNameFrm]>div {
 	   width: 500px;
 	   float: left;
	}
	
	form[name=boardTypeNameFrm]>div>label {
 	   width: 140px;
	}

	div#boardTypeselectDiv {
    	width: 200px;
    	margin-left: -38px;
	}
	
</style>
<script type="text/javascript">
	$(function() {
		$('tbody tr').hover(function() {
			$(this).find('td').css("background-color", "#d1cece");
		}, function() {
			$(this).find('td').css("background-color", "white");
		});
		
		$('#boardTypeName').change(function() {
			location.href = "/spaceCollection/admin/board/boardList?boardTypeName="+$('#boardTypeName>option:selected').val();
		});
		
		$('#searchBt').click(function() {
			alert($('#boardFrm>input#boardTypeName').val());
		});
	});
	
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmPage"]').submit();
	}
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>게시물 관리</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">게시물 관리</li>
				<li class="breadcrumb-item active">
					<c:if test="${empty param.boardTypeName }">
						전체보기
					</c:if> 
					<c:if test="${!empty param.boardTypeName }">
						${param.boardTypeName }
					</c:if> 
				</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6" style="width: 100%">

				<div class="card" id="pageDiv" >
					<div class="card-body">
 						<h5 class="card-title" style="font-weight: bold;">
 							<c:if test="${!empty param.boardTypeName }">
 								${param.boardTypeName }
 							</c:if> 
 							<c:if test="${empty param.boardTypeName }">
 								전체조회
 							</c:if> 
 						</h5>
 						<form name="frmPage" method="post" action="<c:url value='/admin/board/boardList'/>">
 							<input type="hidden" name="currentPage">
 							<input type="hidden" name="boardTypeName" value="${param.boardTypeName}">
							<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
							<input type="hidden" name="searchCondition" value="${param.searchCondition}">
 						</form>
 						<form name="boardTypeNameFrm" method="post" action="<c:url value='/admin/board/boardWrite'/>">
 							<div class="row mb-3">
                  				<label for="boardTypeName" class="col-sm-2 col-form-label">게시판 분류</label>
                  				<div id="boardTypeselectDiv" class="col-sm-10">
                    				<select class="form-select" name="boardTypeName" id="boardTypeName">
                    					<option value="">전체조회</option>
                    					<c:forEach var="boardTypeList" items="${boardTypeList }">
                    						<option value="${boardTypeList.boardTypeName }" 
                    						<c:if test="${boardTypeList.boardTypeName==param.boardTypeName}">
						            		selected="selected"</c:if>
						            		<c:if test="${boardTypeList.boardTypeName==searchVo.boardTypeName}">selected="selected"</c:if> >
						            	 ${boardTypeList.boardTypeName }</option>
                    					</c:forEach>
									</select>
                  				</div>
                			</div>
	 						<button type="submit" class="btn btn-primary rounded-pill" id="boardWriteBt">게시물 작성</button>
 						</form>
						<table class="table">
							<thead>
								<tr>
									<th scope="col"><input type="checkbox" name="chkAll"></th>
									<th scope="col">게시물 번호</th>
									<th scope="col">게시판 분류</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list }">
									<tr>
										<td colspan="6" style="text-align: center;">작성된 게시물이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty list }">
									<c:forEach var="map" items="${list }">
										<fmt:parseDate value="${map.BOARD_REG_DATE }" var="boardRegDate" pattern="yyyy-MM-dd"/>
										<tr onclick="location.href='<c:url value='/admin/board/boardDetail?boardNum=${map.BOARD_NUM }&boardTypeName=${map.BOARD_TYPE_NAME}'/>';" style="cursor:pointer;">
											<td><input type="checkbox" name="chk"></td>
											<td>${map.BOARD_NUM }</td>
											<td>${map.BOARD_TYPE_NAME }</td>
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
											<a class="page-link" href="#" aria-label="Previous" onclick="pageFunc(${pagingInfo.firstPage-1})">Previous</a>
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
									<button type="submit" id="searchBt" class="btn btn-primary">검색</button>
								</div>
								<div class="col-sm-3" id="keyword">
									<label class="visually-hidden" for="searchKeyword">searchCondition</label>
									<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" value="${searchVo.searchKeyword }">
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
								<input type="hidden" name="boardTypeName" value="${param.boardTypeName }">
							</div>
						</form>				
					</div>
				</div>
			</div> 
		</div>
		
	</section>
	
</main>
<!-- End #main -->
<%@ include file="../../form/adminBottom.jsp"%>

