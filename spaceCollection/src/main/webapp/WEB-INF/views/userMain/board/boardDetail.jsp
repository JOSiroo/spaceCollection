<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시즌 이벤트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
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
        position: absolute;
        max-width: 1200px;
        margin: 0 auto;  
        margin-left: 450px;
        margin-bottom: 500px;
	}
	
	div#ajaxComments {
    margin: 20px;
	}
	
</style>
<script>

function addComma(value){
	//2023-08-29T06:44:05.000+00:00
     value = value+"";
     value = value.replace(/^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$/);
     return value; 
 }	
	
 function makeList(data) {
    $.each(data, function() {
       console.log(data);
       var formattedDate = addComma(this.commentRegDate);
       var str = "2023-08-29T06:44:05.000+00:00";
       var resultStr = str.split("T");   // [0] = 2023-08-29, [1] = 06:44:05.000+00:00
       var formattedDate = resultStr[0] + " " + resultStr[1].substring(0, 5); 
       console.log(formattedDate);  // Output: 2023-08-29 06:44

       str = "<div class='CommentsBox'  style='border: 1px solid #ccc; width: 600px;'>"
       		+ "<form name='CommentsBox' method='post' action='#' var='vo' items='"+this.vo+"' >"
			+ "<div class='anonym' style='margin: 10px;'>작성자 :"
			+ "<input type='text' class='form-control' id='com_writer' placeholder='id' name ='com_writer' value='"+this.userNum+"' readonly style='width: 80px; border:none;'>"
			+ "<input type='text' value='"+formattedDate+"' style='border: hidden;' />"
			+ "</div>"
			+ "<div class='anonym2' style='margin: 10px;'>"
			+ ""+this.commentContent+""
			+ "<button type='button' class='commentEditBt' id='commentEditBt'>수정</button>"
			+ "<button type='button' class='commentsDel' id='delBt'>삭제</button>"
			+ "</div>"
			+ "</form>";
			+ "</div>";
			$('#ajaxComments').append(str);
    });
}
 
 
$(function() {
			var boardNum = ${param.boardNum};
			$.ajax({
				url : "<c:url value='/user/board/boardDetail/commentsLoad?boardNum="+boardNum+"'/>",
				type: 'get',
				success:function(data){
					var str = "";
					if(data!=null && data.length>0){
						console.log(data);
						makeList(data);
					}else{
						str = "<span>등록된 댓글이 없습니다.</span>";
						$('#ajaxComments').append(str);
					}
				},
				error:function(xhr, status, error){
					alert(status + " : " + error);
				}
			});//ajax

		$('#sendBt').click(function() {
			event.preventDefault();
			var sendDate = $('form[name=commentsFrm]').serialize(); //입력 양식 내용 쿼리 문자열로 만듬
			    $.ajax({
			        url: "<c:url value='/user/board/boardDetail/commentsWrite' />",
			        method: 'post',
			        data: sendDate,
			        success: function(data) {
		                 // data를 사용하여 필요한 작업 수행
		                 // 가져온 data를 이용하여 댓글 목록을 다시 구성
			        	/* var str = ""; */
						if(data!=null){
							$('#ajaxComments').html("");
								$.each(data, function() {
									/* str = this.commentNum + this.userNum + this.commentRegDate + "<br>"
										+ this.commentContent + "<br>"
										+ "<button type='button' class='btn' id='editBt'>수정</button>"
			     						+ "<button type='button' class='btn' id='delBt'>삭제</button>"; */
								});
			        				console.log(data);
									$('#ajaxComments').append(data);
			        				makeList(data);
		     						$('form[name=commentsFrm]').val('');
		     						alert("댓글 등록 성공"); 
							 /* if($('input[name=addNum]').val() == data.length){
								$('#commentsMoreDiv').html("<span onClick='moreComment()'>댓글 더 보기</span>");
							}else{
								$('#commentsMoreDiv').html("");
							}  */
							
						}else if(data==null){
							alert("댓글 내용을 입력하세요");
							$('#ajaxComments').append(data);
						}
						alert("3333");
			        },
					error:function(xhr, status, error){
						alert(status + " : " + error);
					}
			    });
		});//#sendBt2
		
		/* $('#sendBt').click(function(event) {
	    event.preventDefault();

	    var comments = $('#commentContent').val();
	    var boardNum = $('input[name="boardNum"]').val();
	    var userNum = $('input[name="userNum"]').val();

	    $.ajax({
	        url: "<c:url value='/user/board/boardDetail/commentsWrite' />",
	        type: 'post',
	        data: {
	            comments: comments,
	            boardNum: boardNum,
	            userNum: userNum
	        },
	        success: function(data) {
	            alert("등록 성공");
	            $('#ajaxComments').html("");
	            $.each(data, function() {
	                var str = this.commentNum + this.userNum + this.commentRegDate + "<br>"
	                        + this.commentContent + "<br>"
	                        + "<button type='button' class='commentEditBt' id='commentEditBt'>수정</button>"
	                        + "<button type='button' class='btn' id='delBt'>삭제</button>";
	                $('#ajaxComments').append(str);
	            });
	        },
	        error: function(xhr, status, error) {
	            alert("등록 실패");
	            alert(status + " : " + error + xhr);
	        }
	    });
	});//#sendBt1 열 오류 */
	
	/* $('#sendBt').click(function() {
		event.preventDefault();
		var comments = document.getElementById("commentContent").serialize();
		var boardNum = document.getElementById("boardNum").serialize();
		var userNum = document.getElementById("userNum").serialize();
		console.log(comments,boradNum,userNum);
		    $.ajax({
		        url: "<c:url value='/user/board/boardDetail/commentsWrite' />",
		        type: 'post',
		        data : {
		        	comments : $('form[name="commentContent"]').serializeArray(),
		        	boradNum: $('input[name="boardNum"]').val(), 
		        	userNum : $('input[name="userNum"]').val() 
		        },
		        success:function(data){
						//DOM 조작 함수호츨 등 가능
		                 // data를 사용하여 필요한 작업 수행
		                 // 가져온 data를 이용하여 댓글 목록을 다시 구성
						if(data!=null && data.length>0){
								$('#ajaxComments').html("");
								$.each(data, function() {
									commentAdd(data)
									$('#ajaxComments').append(str);	
								});
							}else if(data==null && date.length==0){
							str = "<span>등록된 댓글이 없습니다.</span>"
							alert("댓글을 입력하세요.");
							$('#ajaxComments').append(str);
						}
						$('#replyContents').val('') //댓글 등록시 댓글 등록창 초기화
						getReplyList(); //등록후 댓글 목록 불러오기 함수 실행 
						alert("등록 성공");
						$('#ajaxComments').html("");
						$.each(data, function() {
							commentAdd(data)
							$('#ajaxComments').append(str);	
						});
		        },
				error:function(xhr, status, error){
					alert("등록 실패")
					alert(status + " : " + error + xhr);
				}
	   	 });//ajax
	});//#sendBt */
	
	function commentAdd(data) {
		var str = "";
		str = this.commentNum + this.userNum + this.commentRegDate + "<br>"
		+ this.commentContent + "<br>"
		+ "<button type='button' class='commentEditBt' id='commentEditBt'>수정</button>"
		+ "<button type='button' class='btn' id='delBt'>삭제</button>";
	} 
		
	function commentEdit(evt) {
		var str = "";
		str += "<form name='commentsEditFrm' method='post>";
		str += "<div class='col-sm-10' id='commentDiv'>";
		str += "<textarea class='form-control' style='height: 100px' name='commentContent'></textarea>";
		str += "</div>";
		str += "<div class='d-grid gap-2 d-md-flex justify-content-md-end'>";
		str += "<button type='submit' class='btn btn-primary right commentEditBt' name='commentEditBt'>댓글 수정</button>";
		str += "</div>";
		str += "<input type='hidden' name='boardNum' value='${map.BOARD_NUM }'>";
		str += "<input type='hidden' name='commentNum'>";
		str += "<input type='hidden' name='userNum' value='${map.USER_NUM }'>";
		str += "</form>";
		str += "<hr>";
		var commentNum = $(evt).parent().prev().val();
		
		$(evt).parent().replaceWith(str);
		$('input[name=commentNum]').val(commentNum);
		
		$('#commentEditBt').click(function() {
			event.preventDefault();
			var commentEdit = $('form[name=commentContent]').serialize();
			$.ajax({
				url : "<c:url value='/user/board/boardDetail/ajax_commentsEdit'/>",
				type : 'post',
				data : $('form[name=commentsEditFrm]').serializeArray(),
				dataType : 'json',
				success:function(){
					$.commentsLoad();
				},error:function(xhr, status, error){
					alert(status + " : " + error);
				}
			});
		});
	}
		
}); //function	
</script>

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
							<input type="text" name="commentContent" id="replyContents" placeholder="로그인 후 글을 작성하실 수 있습니다." style="width: 500px;"/>
			                	<!-- <textarea class="form-control" style="height: 10px" name="commentContent"></textarea> -->
							<button type="button" class="btn btn-primary btn-lg" id="sendBt" style="scale: 0.8;">등록</button>
		                </div>
					<br><br>
					<input type="hidden" name="boardNum" value="${map.BOARD_NUM }">							
					<input type="hidden" name="userNum" value="${map.USER_NUM }">
					</div> 
				</form>
				
	             <form name="comment-count" var="count" items="${count }" action="#">
	             <div class="comment-count">
	             	댓글 <span id="commentsContent">(${count })</span></div>
	             </div><br>
	             </form>
	             
         <div id=""  var="list" items="${list}">
	             <form name="CommentsBox" method="post" action="#">
	             	<c:if test="${empty list }">  
		  				<td colspan="5" class="align_center">글이 존재하지 않습니다.</td>
				  	</c:if>
				  	<c:if test="${!empty list }">	
					<div class="col align-center" >
						<!-- 댓글 추가 -->
						<input type="hidden" name="addNum" value="3"> <!-- 댓글 더 보기 -->
						<div id="commentsLoad" var="list" items="${list}"> </div>
						<div id="ajaxComments"> </div>
						<div id="commentsMoreDiv"> </div>
						
						</form>
					
						</div>
					</c:if>
				</form>
			</div>
			
				
		</div>	
	</section>
 	
  	
    <!-- Modal -->
	<!-- <div class="modal fade" id="confirm1" tabindex="-1">
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
	</div> -->
	<!-- EndModal -->
        
		
		
