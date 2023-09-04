<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<style type="text/css">
main>div>nav {
	float: left;
}

#spaceConfirmBt, #spaceDenineBt {
	float: right;
	margin-top: 16px;
	margin-right: 5px;
	width: 89px;
}

section {
	clear: both;
}

div.row {
	margin-top: 10px;
}

div.label {
	color: #677fa9;
	font-weight: bold;
}

#card {
	min-height: 420px;
}

th, td {
	text-align: center;
}

#searchDiv>div {
	float: right;
}

div#select {
	width: 150px;
}

#searchDiv>div {
	margin-left: 5px;
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

#confirm, #denine {
	margin-top: 50px;
}

#MChkDiv {
	margin-top: 5px;
	text-align: left;
}

#excelDownloadBt {
	--bs-btn-bg: #dadddf;
}

#excelModal>div>div>div>p {
	margin-bottom: 20px;
}

.marginTop {
	margin-top: 5px;
}

.marginTop>div {
	text-align: left;
}

#warning {
	color: red;
	text-align: left;
	margin-top: -15px;
}

.request {
	color: #34bb38;
}

.denine {
	color: red;
}

.confirm {
	color: #0d6efd;
}

#spaceConfirmHistoryList{
	clear: both;
}

th>i{
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#okBt').hide();
		$.spaceConfirmListSearch();
		
		
		//페이지 출력 관련 시작
		$('li button').click(function() {
			$('input[name=searchKeyword]').val('');
		});

		$('#spaceConfirmListSearchBt').click(function() {
			$.spaceConfirmListSend(1);
		});
		
		$('button[name=spaceConfirmTab]').click(function() {
			$.spaceConfirmListSearch();
			$.spaceConfirmListSend(1);
		});

		$('#spaceConfirmHistoryListSearchBt').click(function() {
			$.spaceConfirmHistoryListSend(1);
		});
		
		$('button[name=spaceConfirmHistoryListTab]').click(function() {
			/* $.spaceConfirmHistoryListSearch(); */
			$.spaceConfirmHistoryListSend(1);
		});
		//페이지 출력 관련 끝
		
		//체크박스 전체 체크 관련 시작
		$('input[name=chkAll]').click(function() {
			var checkState = $(this).is(':checked')
			$('td>input[type=checkbox]').prop('checked', checkState);
		});
		
		$('li.nav-item>button').click(function() {
			$('input[name=chkAll]').prop('checked', false);
		});
		//체크박스 전체 체크 관련 끝
		
		
		//엑셀 다운 관련 시작
		$('#warning').hide();
		
		$('#excelDownloadBt').click(function() {
			$('#excelModal').modal('show');
		});
		
		$('#columnChkAll').click(function() {
			var checkState = $(this).is(":checked");
			$('.modal-body input[type=checkbox]').prop('checked', checkState);
		});
		
		$('#downloadBt').click(function() {
			if($('.modal-body input[type=checkbox]:checked').length<1){
				event.preventDefault();
				$('#warning').show();
			}else{
				$('#excelModal').modal('hide');
				$('form[name=excelFrm]').submit();
			}
		});
		
		$('.modal button').click(function() {
			$('.modal-body input[type=checkbox]').prop('checked', false);
		});
		
		$('.modal-body input[type=checkbox]').click(function name() {
			$('#warning').hide();
		});
		
		$('#excelModal button[name=cancelBt]').click(function() {
			$('#warning').hide();
		});
		//엑셀 다운 관련 끝
		
		$('#spaceNumTh').click(function() {
			$('input[name=order]').val('space_name desc');
			$.spaceConfirmHistoryListSearch();
		});
	});
	
	function mouseIn(evt) {
		$(evt).find('td').css("background-color", "#d1cece");
	}
	function mouseOut(evt) {
		$(evt).find('td').css("background-color", "white");
	}
	
	function transForm() {
		$('#downloadBt').click(function() {
			if($('.modal-body input[type=checkbox]:checked').length<1){
				event.preventDefault();
				$('#warning').show();
			}else{
				$('#excelModal').modal('hide');
				$('form[name=excelFrm]').submit();
				$('form[name=trFrm]').attr("action", "/spaceCollection/admin/space/spaceConfirm/denine");
				$('form[name=trFrm]').submit();
			}
		});
	}
	
	$.spaceConfirmListSearch = function() {
		$.ajax({
			url : "<c:url value='/admin/space/spaceConfirmList/ajax_spaceConfirmList'/>",
			type: 'post',
			data: $('form[name=spaceConfirmListSearchFrm]').serializeArray(),
			dataType: 'json',
			success:function(res){
				$('#blockSize').val(res.pagingInfo.blockSize);
				$('input[name=currentPage]').val(res.searchVo.currentPage);
				$('input[name=userId]').val(res.searchVo.userId);
				$('input[name=searchKeyword]').val(res.searchVo.searchKeyword);
				$('input[name=searchCondition]').val(res.searchVo.searchCondition);
				var i = 0;
				var str = "";
				var str2 = "";
				if(res.ajaxList!=null && res.ajaxList.length>0){
					
					$('#spaceConfirmListTbody').html("");
					str2 += "<button type='submit' class='btn btn-outline-primary' id='spaceConfirmBt' onClick='$.spaceConfirm()'>승인</button>";
					str2 += "<button type='button' class='btn btn-outline-danger' id='spaceDenineBt' onClick='$.spaceDenine()'>거절</button>";
					
					$('#buttonDiv').html(str2);
					
					str += "<form name='trFrm' method='post' action=''>";
						$.each(res.ajaxList, function() {
								str += "<tr onmouseenter='mouseIn(this)' onmouseout='mouseOut(this)'>"
								str += "<td>"
								str += "<input type='checkbox' name='spaceItemList["+i+"].spaceNum' value='"+this.SPACE_NUM+"'>";
								str += "</td>";
								str += "<td class='red' onclick='location.href=';' style='cursor: pointer;''>" + this.SPACE_NUM;
								str += "</td>";
								str += "<td onclick='location.href=';' style='cursor: pointer;''>" + this.SPACE_TYPE_NAME;
								str += "</td>";
								str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.SPACE_NAME;
								str += "</td>";
								str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.USER_ID;
								str += "</td>";
								str += "<td onclick='location.href=';' style='cursor: pointer;color: rgb(255,214,1)'>승인 요청";
								str += "</td>";
								str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.SPACE_REQUEST_DATE;
								str += "</td>";
								str += "</tr>";
								
								i++;
						});
						str += "</form>";
						i++;
						$('#spaceConfirmListTbody').html(str);
						pageMake(res.pagingInfo);
				}else{
					str = "<tr>"
						+ "<td colspan='7' style='text-align: center;''>승인 요청이 없습니다.</td>"
						+ "</tr>"
					$('#spaceConfirmListTbody').html(str);
				}
				
			},
			
			error:function(xhr, status, error){
				alert(status + " : " + error);
			}
		});
	}
	
	$.spaceConfirmHistoryListSearch = function() {
		$.ajax({
			url : "<c:url value='/admin/space/spaceConfirmList/ajax_spaceConfirmHistoryList'/>",
			type: 'post',
			data: $('form[name=spaceConfirmHistoryListSearchFrm]').serializeArray(),
			dataType: 'json',
			success:function(res){
				$('#blockSize').val(res.pagingInfo.blockSize);
				$('input[name=currentPage]').val(res.searchVo.currentPage);
				$('input[name=userId]').val(res.searchVo.userId);
				$('input[name=searchKeyword]').val(res.searchVo.searchKeyword);
				$('input[name=searchCondition]').val(res.searchVo.searchCondition);
				var str = "";
				if(res.ajaxList!=null && res.ajaxList.length>0){
					
					$('#spaceConfirmHistoryListTbody>form').html("");
					
						$.each(res.ajaxList, function() {
							str += "<tr onmouseenter='mouseIn(this)' onmouseout='mouseOut(this)'>"
							str += "<td onclick='location.href=';' style='cursor: pointer;''>" + this.SPACE_NUM;
							str += "</td>";
							str += "<td onclick='location.href=';' style='cursor: pointer;''>" + this.SPACE_TYPE_NAME;
							str += "</td>";
							str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.SPACE_NAME;
							str += "</td>";
							str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.USER_ID;
							str += "</td>";
							str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.SPACE_REQUEST_DATE;
							str += "</td>";
							str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.SPACE_REG_DATE;
							str += "</td>";
							if(this.SPACE_REQUEST_STATUS=="Y"){
								str += "<td onclick='location.href=';' style='cursor: pointer;color: rgb(13,110,253)'>승인";
							}else if(this.SPACE_REQUEST_STATUS=="R"){
								str += "<td onclick='location.href=';' style='cursor: pointer;color: rgb(255,214,1)'>승인 요청";
							}else if(this.SPACE_REQUEST_STATUS=="N"){
								str += "<td onclick='location.href=';' style='cursor: pointer;color: red'>거절";
							}
							str += "</td>";
							str += "</tr>";
							
						});
						$('#spaceConfirmHistoryListTbody').html(str);
						pageMake(res.pagingInfo);
				}else{
					str = "<tr>"
						+ "<td colspan='6' style='text-align: center;''>승인 내역이 없습니다.</td>"
						+ "</tr>"
					$('#spaceConfirmHistoryListTbody').html(str);
				}
				
			},
			
			error:function(xhr, status, error){
				alert(status + " : " + error);
			}
		});
	}
	
	
	function pageMake(pagingInfo) {
		//페이징 처리
		//게시물 구분
		var kindFlag = pagingInfo.kindFlag;
		var blockSize = pagingInfo.blockSize;
		var countPerPage = pagingInfo.countPerPage;
		
		
		var str = "";
		str += "<nav aria-label='...'>";
		str	+= "<ul class='pagination justify-content-center'>";
		
		//이전 블럭으로	
		if(pagingInfo.firstPage>1){
			str += "<li class='page-item"
			if(pagingInfo.firstPage <= 1){
				str += " disabled";
			}
			str += ">";
			str += "<a class='page-link' href='#' aria-label='Previous' onclick='pageFunc("+pagingInfo.firstPage-1+")'>이전</a>";
			str += "</li>";
		}
		//페이지 번호 출력
		for(var i=pagingInfo.firstPage; i<=pagingInfo.lastPage; i++){
			if(i==pagingInfo.currentPage){
				str += "<li class='page-item active' aria-current='page'>";
				str += "<a class='page-link' href='#'>" + i + "</a></li>";
			}else{
				if(kindFlag =='spaceConfirmList'){
					str += "<li class='page-item'><a class='page-link' aria-label='Previous' href='#' onclick='$.spaceConfirmListSend("+ i +")'>"+i+"</a>";
				}else if(kindFlag == 'spaceConfirmHistoryList'){
					str += "<li class='page-item'><a class='page-link' aria-label='Previous' href='#' onclick='$.spaceConfirmHistoryListSend("+ i +")'>"+i+"</a>";
				}
				
				str += "</li>";
			}
		}
		//다음 블럭으로
		if(pagingInfo.lastPage < pagingInfo.totalPage){
			str += "<li class='page-item";
			if(pagingInfo.lastPage >= pagingInfo.totalPage){
				str += " disabled";
			}
			str += ">";
			str += "<a class='page-link' href='#' onclick='pageFunc("+pagingInfo.lastPage+1 + ">다음</a>";
			str += "</li>";
			str += "</ul>";
			str += "</nav>";
		}
		if(kindFlag == 'spaceConfirmList'){
			$('.spaceConfirmListDivPage').html(str);	
		}else if(kindFlag == 'spaceConfirmHistoryList'){
			$('.spaceConfirmHistoryListDivPage').html(str);
		}
	}
	
	$.spaceConfirmListSend = function(curPage) {
		$('input[name=currentPage]').val(curPage);
		
		$.ajax({
			url:"<c:url value='/admin/space/spaceConfirmList/ajax_spaceConfirmList'/>",
			type:"post",
			data:$('form[name=spaceConfirmListSearchFrm]').serializeArray(),
			dataType:"json",
			success:function(res){
				totalCount = res.pagingInfo.totalRecord;
				
				if(res!=null){
					$.spaceConfirmListSearch(res);
					pageMake(res.pagingInfo);
				}
				
			},
			error:function(xhr, status, error){
				alert("에러 발생: " + error);
			}
		});
	}
		
	$.spaceConfirmHistoryListSend = function(curPage) {
		$('input[name=currentPage]').val(curPage);
		
		$.ajax({
			url:"<c:url value='/admin/space/spaceConfirmList/ajax_spaceConfirmHistoryList'/>",
			type:"post",
			data:$('form[name=spaceConfirmHistoryListSearchFrm]').serializeArray(),
			dataType:"json",
			success:function(res){
				totalCount = res.pagingInfo.totalRecord;
				
				if(res!=null){
					$.spaceConfirmHistoryListSearch(res);
					pageMake(res.pagingInfo);
				}
				
			},
			error:function(xhr, status, error){
				alert("에러 발생: " + error);
			}
		});
	}
	
	//승인 또는 거절할 체크박스 유효성 검사 시작
	$.spaceConfirm = function () {
		if($('td>input[type=checkbox]:checked').length<1){
			$('#confirm1 .modal-body').html("최소 하나 이상의 요청을 선택하세요.");
			$('#cancelBt').html("확인");
			$('#confirm1').modal("show");
		}else{
			$('#confirm1 .modal-body').html("선택된 요청을 승인 처리하시겠습니까?");
			$('#okBt').show();
			$('#okBt').addClass("btn-primary");
			$('#cancelBt').html("취소");
			$('#okBt').html("승인");
			$('#confirm1').modal("show");
			$('#okBt').click(function() {
				$('#confirm1').modal("hide");
				$(this).removeClass("btn-primary");
				$('#okBt').hide();
				$('form[name=trFrm]').attr("action", "/spaceCollection/admin/space/spaceConfirmList/confirm");
				$('form[name=trFrm]').submit();
			});
		}
	}
	
	$.spaceDenine = function() {
		if($('td>input[type=checkbox]:checked').length<1){
			$('#confirm1 .modal-body').html("최소 하나 이상의 요청을 선택하세요.");
			$('#cancelBt').html("확인");
			$('#confirm1').modal("show");
		}else{
			$('#confirm1 .modal-body').html("선택된 요청을 거절 처리하시겠습니까?");
			$('#okBt').show();
			$('#okBt').addClass("btn-danger");
			$('#cancelBt').html("취소");
			$('#okBt').html("거절");
			$('#confirm1').modal("show");
			$('#okBt').click(function() {
				$('#confirm1').modal("hide");
				$(this).removeClass("btn-danger");
				$('#okBt').hide();
				$('form[name=trFrm]').attr("action", "/spaceCollection/admin/space/spaceConfirmList/denine");
				$('form[name=trFrm]').submit();				
			});
		}	
	}
	//승인 또는 거절할 체크박스 유효성 검사 끝
</script>
<main id="main" class="main">
	<section class="section profile">
		<div class="row">
			<div class="col-lg-6" style="width: 100%">
				<div class="card" id="card">
					<div class="card-body pt-3">
						<ul class="nav nav-tabs nav-tabs-bordered">
							<li class="nav-item">
								<button class="nav-link active" data-bs-toggle="tab"
									data-bs-target="#spaceConfirmList" name="spaceConfirmListTab">
									승인 요청</button>
							</li>
							<li class="nav-item">
								<button class="nav-link" data-bs-toggle="tab"
									data-bs-target="#spaceConfirmHistoryList"
									name="spaceConfirmHistoryListTab">승인 내역</button>
							</li>
						</ul>

						<!-- 장소 승인 요청 내역 시작 -->
						<div class="tab-pane fade show active" id="spaceConfirmList">
							<div class="row">
								<div class="col-12" id="buttonDiv"></div>
							</div>
							<div class="row mb-3">
								<table class="table">
									<colgroup>
										<col style="width: 5%;" />
										<col style="width: 7%;" />
										<col style="width: 12%;" />
										<col style="width: 33%;" />
										<col style="width: 15%;" />
										<col style="width: 13%;" />
										<col style="width: 15%;" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col"><input type="checkbox" name="chkAll"></th>
											<th scope="col">번호</th>
											<th scope="col">공간 타입</th>
											<th scope="col">공간명</th>
											<th scope="col">신청인</th>
											<th scope="col">상태</th>
											<th scope="col">신청일</th>
										</tr>
									</thead>

									<tbody id="spaceConfirmListTbody">
										<!-- ajax로 승인 요청 내역 출력 -->
									</tbody>
								</table>
								<div class="spaceConfirmListDivPage">
									<!-- ajax로 페이징 -->
								</div>
								<form class="col align-items-center"
									name="spaceConfirmListSearchFrm" onsubmit="return false">
									<input type="hidden" name="currentPage" value="1">
									<input type="hidden" name="order">
									<div id="searchDiv">
										<div style="float: left;">
											<button class="btn btn-light" type="button"
												id="excelDownloadBt">
												<i class="bi bi-filetype-xlsx"></i> 엑셀 다운로드
											</button>
										</div>
										<div class="col-auto">
											<button type="button" id="spaceConfirmListSearchBt"
												class="btn btn-primary">검색</button>
										</div>

										<div class="col-sm-3" id="keyword">
											<label class="visually-hidden" for="searchKeyword">searchCondition</label>
											<input type="text" class="form-control" id="searchKeyword"
												name="searchKeyword" value="${searchVo.searchKeyword }">
										</div>
										<div class="col-sm-3" id="select">
											<select class="form-select" name="searchCondition"
												id="searchCondition">
												<option value="space_num"
													<c:if test="${param.searchCondition=='space_num'}">
								            		selected="selected"
								            	</c:if>>공간
													번호</option>
												<option value="space_type_name"
													<c:if test="${param.searchCondition=='space_type_name'}">
								            		selected="selected"
								            	</c:if>>공간
													타입명</option>
												<option value="space_name"
													<c:if test="${param.searchCondition=='space_name'}">
								            		selected="selected"
								            	</c:if>>공간명</option>
												<option value="user_id"
													<c:if test="${param.searchCondition=='user_id'}">
								            		selected="selected"
								            	</c:if>>신청인</option>
											</select>
										</div>

									</div>
								</form>
							</div>

						</div>
						<!-- 장소 승인 요청 내역 끝 -->


						<!-- 장소 승인 내역 시작 -->
						<div class="tab-pane fade pt-3" id="spaceConfirmHistoryList">

							<div class="row mb-3">
								<table class="table">
									<colgroup>
										<col style="width: 6%;" />
										<col style="width: 12%;" />
										<col style="width: 31%;" />
										<col style="width: 15%;" />
										<col style="width: 14%;" />
										<col style="width: 14%;" />
										<col style="width: 8%;" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col">
												<i class="bi bi-chevron-bar-expand" id="spaceNumTh"> </i>번호
											</th>
											<th scope="col">
												<i class="bi bi-chevron-bar-expand" id="spaceNameTh"> </i>공간 타입
											</th>
											<th scope="col">
												<i class="bi bi-chevron-bar-expand" id="spaceNameTh"> </i>공간명
											</th>
											<th scope="col">
												<i class="bi bi-chevron-bar-expand" id="userIdTh"> </i>신청인
											</th>
											<th scope="col">
												<i class="bi bi-chevron-bar-expand" id="spaceRequestDateTh"> </i>요청일
											</th>
											<th scope="col">
												<i class="bi bi-chevron-bar-expand" id="spaceRegDateTh"> </i>결정일
											</th>
											<th scope="col">
												<i class="bi bi-chevron-bar-expand" id="spaceRequestStatusTh"> </i>상태
											</th>
										</tr>
									</thead>
									<tbody id="spaceConfirmHistoryListTbody">
										<!-- ajax로 승인 내역 출력 -->
									</tbody>
								</table>
								<div class="spaceConfirmHistoryListDivPage">
									<!-- ajax로 페이징 -->
								</div>
								<form class="col align-items-center"
									name="spaceConfirmHistoryListSearchFrm" onsubmit="return false">
									<input type="hidden" name="currentPage" value="1">
									<input type="hidden" name="order" value="${param.order }">
									<input type="hidden" name="status" value="Y">
									<div id="searchDiv">
										<div style="float: left;">
											<button class="btn btn-light" type="button"
												id="excelDownloadBt">
												<i class="bi bi-filetype-xlsx"></i> 엑셀 다운로드
											</button>
										</div>
										<div class="col-auto">
											<button type="button" id="spaceConfirmHistoryListSearchBt"
												class="btn btn-primary">검색</button>
										</div>

										<div class="col-sm-3" id="keyword">
											<label class="visually-hidden" for="searchKeyword">searchCondition</label>
											<input type="text" class="form-control" id="searchKeyword"
												name="searchKeyword" value="${searchVo.searchKeyword }">
										</div>
										<div class="col-sm-3" id="select">
											<select class="form-select" name="searchCondition"
												id="searchCondition">
												<option value="space_num"
													<c:if test="${param.searchCondition=='space_num'}">
								            		selected="selected"
								            	</c:if>>공간
													번호</option>
												<option value="space_type_name"
													<c:if test="${param.searchCondition=='space_type_name'}">
								            		selected="selected"
								            	</c:if>>공간
													타입명</option>
												<option value="space_name"
													<c:if test="${param.searchCondition=='space_name'}">
								            		selected="selected"
								            	</c:if>>공간명</option>
												<option value="user_id"
													<c:if test="${param.searchCondition=='user_id'}">
								            		selected="selected"
								            	</c:if>>신청인</option>
											</select>
										</div>

									</div>
								</form>
							</div>

						</div>
						<!-- 승인 내역 끝 -->
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
					<h5 class="modal-title">
						<i class="bi bi-exclamation-circle"></i>
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="cancelBt"></button>
					<button type="button" class="btn" id="okBt"></button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModal -->
	<!-- Moda3 -->
	<div class="modal fade" id="excelModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">엑셀 다운로드 항목 선택</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>
						엑셀에 포함시킬 데이터를 선택하세요.&nbsp;&nbsp; <input class="form-check-input"
							type="checkbox" value="" id="columnChkAll" name="columnChkAll">
						<label class="form-check-label" for="columnChkAll">전체 선택</label>
					</p>
					<div class="container text-center " id="MChkDiv">
						<p id="warning">※ 최소 하나 이상의 컬럼을 선택하세요.</p>
						<c:set var="columnListEng1"
							value="${fn:split('userNum,userHp,userId,userRegDate,zipcode,addressDetail,userMarketingSmsOk', ',') }" />
						<c:set var="columnListKor1"
							value="${fn:split('회원번호,아이디,이메일,가입일,우편번호,상세주소,마케팅 동의(SMS)', ',') }" />
						<c:set var="columnListEng2"
							value="${fn:split('userName,userEmail,userOutType,userOutDate,address,userMarketingEmailOk', ',') }" />
						<c:set var="columnListKor2"
							value="${fn:split('이름,연락처,가입상태,탈퇴일,주소,마케팅 동의(이메일)', ',') }" />
						<form name="excelFrm"
							action="<c:url value='/admin/member/memberExcelDownload'/>"
							method="post">
							<div class="row align-items-start">
								<div class="col marginTop">
									<c:forEach var="i" begin="0"
										end="${fn:length(columnListEng1)-1 }">
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												value="${2*i }" id="${columnListEng1[i] }"
												name="headerListIndex[${2*i }]"> <label
												class="form-check-label" for="${columnListEng1[i] }">${columnListKor1[i] }</label>
										</div>
									</c:forEach>
								</div>

								<div class="col marginTop">
									<c:forEach var="i" begin="0"
										end="${fn:length(columnListEng2)-1 }">
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												value="${2*i+1 }" id="${columnListEng2[i] }"
												name="headerListIndex[${2*i+1 }]"> <label
												class="form-check-label" for="${columnListEng2[i] }">${columnListKor2[i] }</label>
										</div>
									</c:forEach>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" name="cancelBt">취소</button>
					<button type="button" class="btn btn-success" id="downloadBt">다운로드</button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModal3 -->
</main>

<%@ include file="../../form/adminBottom.jsp"%>
