<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/userTop.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
	
    .section1{
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
    max-width: 1200px;
    margin: 0 auto; 
	} 
	.section2{
	display: flex;
	flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
    max-width: 1200px;
    margin: 0 auto;  
	}
	#commentsMoreDiv{
	cursor: pointer;
	margin:40px;
	text-align: center;
	}
	.comment-name {
    margin-left: 30px;
	}
	input#replyContents {
    height: 35px;
    width: 460px;
	}
	.alleventBox {
    margin-top: 15%;
    margin-bottom: 8%;
	}
	div#commentDiv {
    width: 1000px;
    margin-top: 20px;
    margin-left: 3px;
	}
	div#CommentsBox {
    margin-top: 40px;
	}
	#sendBt{
    scale: 0.7;
	}   
	button.commentsDel{
	border-radius: 10px;
    background-color: white;
    float: right;
    border: 0.1px white;
    font-weight: bold;
    font-size: 90%;
    color: #193D76;
	}
	button.commentsEdit{
	border-radius: 10px;
    background-color: white;
    float: right;
    border: 0.1px white;
    font-weight: bold;
    font-size: 90%;
    color: #193D76;
	}
	img.userIcon {
    width: 5.5%;
	}
	
</style>

<script>
	var page = 1;
	var boardNum = ${param.boardNum}; 
	
	 function makeList(data) {
		 console.log("로딩 메서드 시작");
			 $.each(data, function() {  
			var str = "<div class='CommentsBox' id='"+this.commentNum+"'  style='border-top: 0.1px solid #ccc; width: 600px; '>"
					+ "<form action='/user/board/boardDetail/commentsLoad' method='GET'>"
					+ "<input type='text' name='userNum' id='userNum' value='"+this.userId+"' style='float: right; visibility: hidden;'/>"
			        + "<input type='text' name='commentNum' id='commentNum' value='"+this.commentNum+"'style='float: right; visibility: hidden;' />"
			        + "</form>"
			        + "<form name='CommentsBox' method='post' action='#' var='list1' items='" + this.list1 + "' >"
			        + "<div class='anonym' style='margin: 10px;'><img class='userIcon' src='<c:url value='/images/userIcon.png'/>'>"
			        + "<input type='text'  id='com_writer' placeholder='id' value='" + this.userNum + "' readonly style='width: 80px; border:none; font-weight: bold; '>"
			        + "<input type='text' value='" + (this.commentRegDate).substring(0,10) + " " + (this.commentRegDate).substring(11,19)  + "' style='border: none; color: #999;' />"
			        + "</div>"
			        + "<div class='anonym2' style='margin: 10px;'>"
			        + "<input type='text' value='" + this.commentContent + " 'id='commentContent' style='border: none; width: 80%;' />"
			        + "<button type='button' id='commentsDel' class='commentsDel' onClick='commentDelete("+this.commentNum+")'>삭제</button>"
					+ "<button type='button' id='commentsEdit' class='commentsEdit' onClick='commentEdit("+this.commentNum+")'>수정</button>"
			        + "</div>"
			        + "</form>"
			        + "</div>";
			    $('#commentsLoad').append(str);
			
			}); //each
	 }//makeList
	 
	 function commentEdit(commentNum) {
			console.log("수정 메서드 시작");
			console.log(commentNum);
			var str = "";
			str += "<form name='commentsEditFrm' method='post var='list'>";
			str += "<div class='col-sm-10' id='commentDiv'>";
			str += "<input class='form-control' id='EditCommentContent' style='height: 100px; width: 580px;' name='commentContent'>";
			str += "</div>";
			str += "<div class='d-grid gap-2 d-md-flex justify-content-md-end'>";
			str += "<button class='btn btn-primary right' onclick='editCommentOkay()' name='commentEditBt' style='scale:0.7;'>댓글 수정</button>";
			str += "</div>";
			str += "<input type='hidden' name='boardNum' value='${map.BOARD_NUM }'>";
			str += "<input type='hidden' name='commentNum' value="+commentNum+">";
			str += "<input type='hidden' name='userNum' value='9999999'>";
			str += "</form>";
			str += "<hr>";
			$('#'+commentNum+'').append(str);
	}
	 

	 function commentDelete(commentNum) {
		console.log("삭제 클릭 시작");
		$.ajax({
			url : "<c:url value='/user/board/boardDetail/ajax_commentsDelete'/>",
			type : 'get',
			data : {
				commentNum: commentNum
			},
			dataType : 'json',
			success:function(){
				alert("삭제되었습니다.");
				location.reload();
			},error:function(xhr, status, error){
				alert(status + " : " + error);
			}
		});
		$('#confirm1').modal('hide');	
	}
	 
	
	loadComment(boardNum);
	
	 function loadComment(boardNum){
		$.ajax({
			url : '<c:url value="/user/board/boardDetail/commentsLoad?boardNum='+boardNum+'&page='+page+'"/>',
			type: 'get',
			success:function(data){
				if(data!=null && data.length>0){
					console.log(page);
					makeList(data);
					page++;
				}else{
					str = "<span>등록된 댓글이 없습니다.</span>";
					$('#commentsMoreDiv').html(str);
					return;
				}
			},
			error:function(xhr, status, error){
				alert(status + " : " + error);
			}
		});//ajax
	 }
		
	 function addList(data) {
		 console.log("추가 메서드 만들기 시작");
			 var str="";
			 var str = "<div class='CommentsBox'  style='border: 1px solid #ccc; width: 600px;'>"
			        + "<form name='CommentsBox' method='post' action='#' var='list' items='" + data.list + "' >"
			        + "<div class='anonym' style='margin: 10px;'>작성자 :"
			        + "<input type='text'  id='com_writer' placeholder='id' name='com_writer' value='" + data.userNum + "' readonly style='width: 80px; border:none;'>"
			        + "<input type='text' value='" + data.commentRegDate + "' style='border: none;' />"
			        + "</div>"
			        + "<div class='anonym2' style='margin: 10px;'>"
			        + "<input type='text' value='" +  data.commentContent + "' style='border: none;' name='commentContent' />"
			        + "<button type='button' id='commentsDel' class='commentsDel' onClick='commentDelete(this)'>삭제</button>"
					+ "<button type='button' id='commentsEdit' class='commentsEdit' onClick='commentEdit(this)'>수정</button>"
			        + "</div>"
			        + "</form>"
			        + "</div>";
			 $('#ajaxComments').append(str);
	 }
	 
	
	function moreComment() {
		$('input[name=addNum]').val(parseInt($('input[name=addNum]').val())+5);
		$.commentsLoad();
	}
	
	function editCommentOkay(){
		event.preventDefault();
		console.log("수정하기 버튼 클릭 시작");
		$.ajax({
			url : "<c:url value='/user/board/boardDetail/ajax_commentsEdit'/>",
			type : 'post',
			data : {
				commentContent:$('#EditCommentContent').val(),
				commentNum:$('input[name=commentNum]').val()
			},
			dataType : 'json',
			success:function(res){
				console.log(res);
				location.reload();
			},error:function(xhr, status, error){
				alert(status + " : " + error);
			}
		});
	}
	
$(function() {

  	$("#commentsMoreDiv").click(function(){
		 loadComment(boardNum); 
	});
	
	if($('#commentOk').val() == 'Y'){
		$.commentsLoad();
	}

	$('#okBt').hide();
	$('#fileList').hide();
	
	$('#fileSpan').click(function() {
		$('#fileList').toggle();
	});
	
	$('form[name=commentsFrm]').submit(function() {
		if($('textarea').val().trim()==''){
			$('#okBt').hide();
			$('#cancelBt').html("확인");
			$('.modal-body').html("댓글을 입력해주세요.");
	        $('#confirm1').modal('show');
			
			event.preventDefault();
		}
	});
	
		$('#sendBt').click(function() {
			event.preventDefault();
			var sendDate = $('form[name=commentsFrm]').serialize(); //입력 양식 내용 쿼리 문자열로 만듬
	        var userId = ${empty sessionScope.userId };
			    $.ajax({
			        url: "<c:url value='/user/board/boardDetail/commentsWrite' />",
			        method: 'post',
			        data: sendDate,
			        success: function(data) {
		                 // data를 사용하여 필요한 작업 수행
		                 // 가져온 data를 이용하여 댓글 목록을 다시 구성
								if(data!=null){
									$('#ajaxComments').html("");
		     						alert("댓글 등록 성공");
		     						$('input[name=commentContent]').val('');
		     						console.log("댓글 추가 성공");
								   location.reload();  						
								}else if(data==null){
									alert("댓글 내용을 입력하세요");
								}//if
			        },//success
			    	error:function(xhr, status, error){
						alert(status + " : " + error);
					}
			    });//ajax
		});//#sendBt
});//#function

</script>

<div class="alleventBox">
	<section class="section1" var="map">
			<div class="eventCard"   >
					<c:if test="${empty map }">  
			  				<td colspan="5" class="align_center">글이 존재하지 않습니다.</td>
				  	</c:if>
				  	<c:if test="${!empty map }">	
							<div class="col align-center">
								 ${map.BOARD_CONTENT } 
							</div>
					</c:if>
			</div>
	</section>
	
	<!-- 댓글 시작 -->
	<section class="section2" >
			<div class="comment-box" >
	             <div class="comment-name">
	             	<form name="commentsFrm" method="post" action="<c:url value='/user/board/boardDetail/commentsWrite'/>">
		                <div class="registering_comment"  style="position: absolute;"  var="vo" items="vo">
							<div class="col-sm-10" id="commentDiv"  >
							<%-- <c:if test="${empty sessionScope.userId }"> --%>
								<input type="text" name="commentContent" id="replyContents" placeholder="로그인 후 글을 작성하실 수 있습니다." style="width: 450px;"/>
				                	<!-- <textarea class="form-control" style="height: 10px" name="commentContent"></textarea> -->
								<button type="button" class="btn btn-primary" id="sendBt" >등록</button>
			                </div>
						<br><br>
						<input type="hidden" name="boardNum" value="${map.BOARD_NUM }"/>							
						<input type="hidden" name="userNum" value="${map.USER_NUM }"/>
						</div> 
					</form>
				
		             <form name="comment-count" var="count" items="${count }" action="#">
		             	<div class="comment-count">
		             	댓글 <span id="commentsContent">(${count })</span>
		             	</div>
		             </form>
		             
	             </div>
             <br>
	             
	         <div id="CommentsBox" >
	             <form name="CommentsBox" method="post" action="#"  var="list1" items="${list1}">
		             	<c:if test="${empty list }">  
			  				<td colspan="5" class="align_center">글이 존재하지 않습니다.</td>
					  	</c:if>
					  	<c:if test="${!empty list }">	
							<div class="col align-center" >
								<!-- 댓글 추가 -->
								<input type="hidden" name="page" > 
								<div id="ajaxComments" var="list1" items="${list1}"> 
								</div>
								<!-- 댓글 로딩 -->
								<div id="commentsLoad" var="list1" items="${list1}"> 
								</div>
								<!-- 댓글 더 보기 -->
								<div id="commentsMoreDiv" > 
									<span> 댓글 더보기 </span>
								</div>
							</div>
						</c:if>
				</form>
			</div>
			
		</div>	
	</section>
	
	<div class="modal fade" id="confirm1" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"><i class="bi bi-exclamation-circle"></i></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="cancelBt"></button>
					<button type="button" class="btn btn-danger" id="okBt"></button>
				</div>
			</div>
		</div>
	</div>
  </div>	
  
<%@ include file="/WEB-INF/views/form/userBottom.jsp" %>
		
