<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>SpaceCollection - 공간에 사람을 더하다.</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript"
	src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
	
	<!-- Favicons -->
<link href="<c:url value='/NiceAdmin-pro/assets/img/favicon.png'/>"
	rel="icon">
<link
	href="<c:url value='/NiceAdmin-pro/assets/img/apple-touch-icon.png'/>"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/bootstrap-icons/bootstrap-icons.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/boxicons/css/boxicons.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/quill/quill.snow.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/quill/quill.bubble.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/remixicon/remixicon.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/simple-datatables/style.css'/>"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="<c:url value='/NiceAdmin-pro/assets/css/style.css'/>"
	rel="stylesheet">
</head>
<style type="text/css">
	#boardWriteBt, #boardDeleteBt{
		float: right;
		margin-top: 16px;
		margin-right: 5px;
		margin-bottom: 20px;
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
	
	i.bi.bi-exclamation-circle {
 		color: #ffd600;
   		font-size: 40px;
   		display: block;
   		margin-block: -13px;
	}
	
	td>span {
		color: red;
	}
	
	
</style>
<script type="text/javascript">
	$(function() {
		$('tbody tr').hover(function() {
			$(this).find('td').css("background-color", "#d1cece");
		}, function() {
			$(this).find('td').css("background-color", "white");
		});
		
		$('#boardNum').change(function() {
			location.href = "/spaceCollection/userMain/board/boardDetail?boardNum="
					+$('#boardTypeName>option:selected').val();
		});
		
		$('#searchBt').click(function() {
			if($('#searchKeyword').val().length<1){
				event.preventDefault();
				$('#confirm1 .modal-body').html("검색어를 입력해주세요.");
				$('#confirm1').modal("show");
			}
		});
		
		$('input[name=chkAll]').click(function() {
			var checkState = $(this).is(':checked')
			$('td>input[type=checkbox]').prop('checked', checkState);
		});
		
	});
	
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmPage"]').submit();
	}
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>진행 중인 이벤트</h1>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6" style="width: 100%">

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
									<form name="trFrm" method="post" action="<c:url value='/admin/board/boardDelete'/>">
										<c:set var="i" value="0"/>
										<c:forEach var="map" items="${list }">
											<fmt:parseDate value="${map.BOARD_REG_DATE }" var="boardRegDate" pattern="yyyy-MM-dd"/>
											<tr>
												<td>
													<input type="checkbox" name="boardItemList[${i }].boardNum" value="${map.BOARD_NUM }">
												</td>
												<td onclick="location.href='<c:url value='/admin/board/boardDetail?boardNum=${map.BOARD_NUM }&boardNum=${map.BOARD_NUM}'/>';" style="cursor:pointer;">
													${map.BOARD_NUM }
												</td>
												<td onclick="location.href='<c:url value='/admin/board/boardDetail?boardNum=${map.BOARD_NUM }&boardNum=${map.BOARD_TYPE_NAME}'/>';" style="cursor:pointer;">
													${map.BOARD_TYPE_NAME }
												</td>
												<td onclick="location.href='<c:url value='/admin/board/boardDetail?boardNum=${map.BOARD_NUM }&boardTypeName=${map.BOARD_TYPE_NAME}'/>';" style="cursor:pointer;">
													${map.BOARD_TITLE }
													<c:if test="${map.BOARD_TYPE_COMMENT_OK == 'Y' }">
														<span>(${map.COMMENTCOUNT })</span>
													</c:if> 
												</td>
												<td onclick="location.href='<c:url value='/admin/board/boardDetail?boardNum=${map.BOARD_NUM }&boardTypeName=${map.BOARD_TYPE_NAME}'/>';" style="cursor:pointer;">
													${map.USER_ID }
												</td>
												<td onclick="location.href='<c:url value='/admin/board/boardDetail?boardNum=${map.BOARD_NUM }&boardTypeName=${map.BOARD_TYPE_NAME}'/>';" style="cursor:pointer;">
													<fmt:formatDate value="${boardRegDate }" pattern="yyyy-MM-dd"/>
												</td>
											</tr>
											<c:set var="i" value="${i+1 }"/>
										</c:forEach>
									</form>
								</c:if>
							</tbody>
						</table>
						<div class="divPage">
						
							<nav aria-label="...">
								<ul class="pagination justify-content-center">
									<c:if test="${pagingInfo.firstPage>1 }">
										<li class="page-item <c:if test='${pagingInfo.firstPage <=1 }'>disabled</c:if>">
											<a class="page-link" href="#" aria-label="Previous" onclick="pageFunc(${pagingInfo.firstPage-1})">이전</a>
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
								      		<a class="page-link" href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">다음</a>
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
	<!-- Moda2 -->
	<div class="modal fade" id="confirm2" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"><i class="bi bi-exclamation-circle" style="color: red;"></i></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-danger" id="okBt">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModal2 -->
	
</main>
<!-- End #main -->

