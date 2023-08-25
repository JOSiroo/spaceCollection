<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<style type="text/css">
	div.row{
		margin-top: 10px;
	}
	
	div.label{
		color: #677fa9;
		font-weight: bold;
	}
	
	#card {
    	min-height: 420px;
	}
	
	th{
		text-align: center;
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
		$('#okBt').hide();
	});
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>회원 상세보기</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">회원 관리</li>
				<li class="breadcrumb-item">회원 관리</li>
				<li class="breadcrumb-item active">회원 상세보기</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section profile">
		<div class="row">
			<div class="col-xl-4">
				<div class="card">
					<div
						class="card-body profile-card pt-4 d-flex flex-column align-items-center">
						<img src="<c:url value='/user_images/test1.jpg'/>" alt="Profile"
							class="rounded-circle">
						<h2>${memberMap.USER_NAME }</h2>
						<h3>${memberMap.USER_ID }</h3>
					</div>
				</div>
			</div>

			<div class="col-xl-8">
				<div class="card" id="card">
					<div class="card-body pt-3">
						<ul class="nav nav-tabs nav-tabs-bordered">
							<li class="nav-item">
								<button class="nav-link active" data-bs-toggle="tab"
									data-bs-target="#profileOverview">회원 정보</button>
							</li>
							<li class="nav-item">
								<button class="nav-link" data-bs-toggle="tab"
									data-bs-target="#reservationList">예약 내역</button>
							</li>
							<li class="nav-item">
								<button class="nav-link" data-bs-toggle="tab"
									data-bs-target="#reviewList">리뷰 내역</button>
							</li>
							<li class="nav-item">
								<button class="nav-link" data-bs-toggle="tab"
									data-bs-target="#commentList">댓글 내역</button>
							</li>

						</ul>
						<div class="tab-content pt-2">
							<!-- 회원정보 시작 -->
							<div class="tab-pane fade show active" id="profileOverview">
								<h5 class="card-title" style="font-weight: bold;">회원 상세정보</h5>

								<div class="row">
									<div class="col-lg-3 col-md-4 label ">이름</div>
									<div class="col-lg-9 col-md-8">${memberMap.USER_NAME }</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">연락처</div>
									<div class="col-lg-9 col-md-8">${memberMap.USER_HP }</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">주소</div>
									<div class="col-lg-9 col-md-8">${memberMap.ZIPCODE }<br>
										${memberMap.ADDRESS } ${memberMap.ADDRESS_DETAIL }
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">이메일</div>
									<div class="col-lg-9 col-md-8">${memberMap.USER_EMAIL }</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">마케팅 수신 동의</div>
									<div class="col-lg-9 col-md-8">
										이메일 ${memberMap.USER_MARKETING_EMAIL_OK }<br> 
										SMS ${memberMap.USER_MARKETING_SMS_OK }
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">가입일자</div>
									<div class="col-lg-9 col-md-8">
										<fmt:formatDate value="${memberMap.USER_REG_DATE }" pattern="yyyy-MM-dd" />
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">탈퇴여부</div>
									<div class="col-lg-9 col-md-8">
										<c:if test="${memberMap.USER_OUT_TYPE == 'Y' }">
											탈퇴(탈퇴일 : <fmt:formatDate value="${memberMap.USER_OUT_DATE }" pattern="yyyy-MM-dd" /> )
										</c:if>
										<c:if test="${empty memberMap.USER_OUT_TYPE }">
											가입
										</c:if>
									</div>
								</div>
							</div>
							<!-- 회원정보 끝 -->
							<!-- 예약 내역 시작 -->
							<div class="tab-pane fade pt-3" id="reservationList">
								<div class="row mb-3">
									<table class="table">
										<colgroup>
											<col style="width: 5%"; />
											<col style="width: 12%"; />
											<col style="width: 12%;" />
											<col style="width: 26%;" />
											<col style="width: 15%;" />
											<col style="width: 15%;" />
											<col style="width: 15%;" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col"><input type="checkbox" name="chkAll"></th>
												<th scope="col">예약 번호</th>
												<th scope="col">장소 구분</th>
												<th scope="col">예약 장소</th>
												<th scope="col">예약 인원</th>
												<th scope="col">예약일</th>
												<th scope="col">결제일</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty list }">
												<tr>
													<td colspan="7" style="text-align: center;">예약 내역이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty list }">
												<form name="trFrm" method="post" action="<c:url value='/admin/board/boardDelete'/>">
													<c:set var="i" value="0" />
													<c:forEach var="map" items="${list }">
														<fmt:parseDate value="${map.BOARD_REG_DATE }" var="boardRegDate" pattern="yyyy-MM-dd" />
														<tr>
															<td>
																<input type="checkbox" name="boardItemList[${i }].boardNum" value="${map.BOARD_NUM }"></td>
															<td onclick="location.href='<c:url value='/admin/board/boardDetail?boardNum=${map.BOARD_NUM }&boardTypeName=${map.BOARD_TYPE_NAME}'/>';"
																style="cursor: pointer;">
																${map.BOARD_NUM }
															</td>
															<td onclick="location.href='<c:url value='/admin/board/boardDetail?boardNum=${map.BOARD_NUM }&boardTypeName=${map.BOARD_TYPE_NAME}'/>';"
																style="cursor: pointer;">
																${map.BOARD_TYPE_NAME }
															</td>
															<td onclick="location.href='<c:url value='/admin/board/boardDetail?boardNum=${map.BOARD_NUM }&boardTypeName=${map.BOARD_TYPE_NAME}'/>';"
																style="cursor: pointer;">
																<c:if test="${fn:length(map.BOARD_TITLE)>23 }">
																	${fn:substring(map.BOARD_TITLE, 0, 23) } ...
																</c:if> 
																<c:if test="${fn:length(map.BOARD_TITLE)<=23 }">
																	${map.BOARD_TITLE }
																</c:if> 
																<c:if test="${map.FILECOUNT>0 }">
																	<i class="bi bi-link-45deg"></i>
																</c:if> 
																<c:if test="${map.BOARD_TYPE_COMMENT_OK == 'Y' }">
																	<span>(${map.COMMENTCOUNT })</span>
																</c:if>
															</td>
															<td onclick="location.href='<c:url value='/admin/board/boardDetail?boardNum=${map.BOARD_NUM }&boardTypeName=${map.BOARD_TYPE_NAME}'/>';"
																style="cursor: pointer;">
																${map.USER_ID }
															</td>
															<td onclick="location.href='<c:url value='/admin/board/boardDetail?boardNum=${map.BOARD_NUM }&boardTypeName=${map.BOARD_TYPE_NAME}'/>';"
																style="cursor: pointer;">
																<fmt:formatDate value="${boardRegDate }" pattern="yyyy-MM-dd" />
															</td>
															<td onclick="location.href='<c:url value='/admin/board/boardDetail?boardNum=${map.BOARD_NUM }&boardTypeName=${map.BOARD_TYPE_NAME}'/>';"
																style="cursor: pointer;">
																<fmt:formatDate value="${boardRegDate }" pattern="yyyy-MM-dd" />
															</td>
														</tr>
														<c:set var="i" value="${i+1 }" />
													</c:forEach>
												</form>
											</c:if>
										</tbody>
									</table>
									<div class="divPage">

										<nav aria-label="...">
											<ul class="pagination justify-content-center">
												<c:if test="${pagingInfo.firstPage>1 }">
													<li
														class="page-item <c:if test='${pagingInfo.firstPage <=1 }'>disabled</c:if>">
														<a class="page-link" href="#" aria-label="Previous"
														onclick="pageFunc(${pagingInfo.firstPage-1})">이전</a>
													</li>
												</c:if>
												<c:forEach var="i" begin="${pagingInfo.firstPage }"
													end="${pagingInfo.lastPage }">
													<c:if test="${i == pagingInfo.currentPage }">
														<li class="page-item active" aria-current="page"><a
															class="page-link" href="#">${i}</a></li>
													</c:if>
													<c:if test="${i != pagingInfo.currentPage }">
														<li class="page-item"><a class="page-link"
															aria-label="Previous" href="#" onclick="pageFunc(${i})">${i }</a>
														</li>
													</c:if>
												</c:forEach>
												<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
													<li
														class="page-item <c:if test='${pagingInfo.lastPage >= pagingInfo.totalPage }'>disabled</c:if>">
														<a class="page-link" href="#"
														onclick="pageFunc(${pagingInfo.lastPage+1})">다음</a>
													</li>
												</c:if>
											</ul>
										</nav>

									</div>
									<form class="row gx-3 gy-2 align-items-center" id="boardFrm"
										method="post" action="<c:url value='/admin/board/boardList'/>">
										<div id="searchDiv">
											<div class="col-auto">
												<button type="submit" id="searchBt" class="btn btn-primary">검색</button>
											</div>
											<div class="col-sm-3" id="keyword">
												<label class="visually-hidden" for="searchKeyword">searchCondition</label>
												<input type="text" class="form-control" id="searchKeyword"
													name="searchKeyword" value="${searchVo.searchKeyword }">
											</div>
											<div class="col-sm-3" id="select">
												<select class="form-select" name="searchCondition"
													id="searchCondition">
													<option value="reservation_num"
														<c:if test="${param.searchCondition=='reservation_num'}">
						            						selected="selected"
						            					</c:if>>예약번호</option>
													<option value="space_name"
														<c:if test="${param.searchCondition=='space_name'}">
						            						selected="selected"
						            					</c:if>>장소명</option>
												</select>
											</div>
										</div>
									</form>
								</div>

							</div>
							<!-- 예약 내역 끝 -->
							<!-- 후기 내역 시작 -->
							<div class="tab-pane fade pt-3" id="reviewList">
								<div class="row mb-3">후기 갈길 곳</div>
							</div>
							<!-- 후기 내역 끝 -->
							<!-- 댓글 내역 시작 -->
							<div class="tab-pane fade pt-3" id="commentList">
								<div class="row mb-3">댓글 갈길 곳</div>
							</div>
							<!-- 댓글 내역 끝 -->
						</div>
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