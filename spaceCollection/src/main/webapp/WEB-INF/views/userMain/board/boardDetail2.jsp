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
	
	#commentsMoreDiv{
		text-align: center;
	}
	
	#commentsMoreDiv>span{
		color: #555555;
		cursor: pointer;
	}
</style>
<script>

function addComma(value){
	//2023-08-29T06:44:05.000+00:00
     value = value+"";
     value = value.replace(/^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$/);
     return value; 
 }	//addComma
	
 function makeList(data) {
    $.each(data, function() {
       console.log(data);
      /*  var formattedDate = addComma(this.commentRegDate);
       var str = "2023-08-29T06:44:05.000+00:00";
       var resultStr = str.split("T");   // [0] = 2023-08-29, [1] = 06:44:05.000+00:00
       var formattedDate = resultStr[0] + " " + resultStr[1].substring(0, 5); 
       console.log(formattedDate);  // Output: 2023-08-29 06:44 */

       str = "<div class='CommentsBox'  style='border: 1px solid #ccc; width: 600px;'>"
       		+ "<form name='CommentsBox' method='post' action='#' var='list' items='"+this.list+"' >"
			+ "<div class='anonym' style='margin: 10px;'>작성자 :"
			+ "<input type='text' class='form-control' id='com_writer' placeholder='id' name ='com_writer' value='"+this.USER_ID+"' readonly style='width: 80px; border:none;'>"
			+ "<input type='text' value='"+this.COMMENT_REG_DATE+"' style='border: hidden;' />"
			+ "</div>"
			+ "<div class='anonym2' style='margin: 10px;'>"
			+ ""+this.COMMENT_CONTENT+""
			+ "<button type='button' class='commentEditBt' id='EditBt'>수정</button>"
			+ "<button type='button' class='commentsDel' id='delBt'>삭제</button>"
			+ "</div>"
			+ "</form>"
			+ "</div>";
			
			$('#ajaxComments').append(str);
    });
    
    /* var inputValue = $('input[name=addNum]').val();
    var dataLength = 5; 

    if (inputValue == dataLength) {
        $('#commentsMoreDiv').html("<span onClick='moreComment()'>댓글 더 보기</span>");
    } else {
        $('#commentsMoreDiv').html("");
    }
	 */
    if($('input[name=addNum]').val() == data.length){
		$('#commentsMoreDiv').html("<span onClick='moreComment()'>댓글 더 보기</span>");
	}else{
		$('#commentsMoreDiv').html("");
	}
	
}//makeList

function moreComment() {
	$('input[name=addNum]').val(parseInt($('input[name=addNum]').val())+5);
	$.loadComment();
}
 
/* $(document).ready(function() {
    var inputValue = $('input[name=addNum]').val();
    var dataLength = 5; 

    if (inputValue == dataLength) {
        $('#commentsMoreDiv').html("<span onClick='moreComment()'>댓글 더 보기</span>");
    } else {
        $('#commentsMoreDiv').html("");
    }
});
 */ 
 $.loadComment=function(boardNum) {
		$.ajax({
			url : "<c:url value='/user/board/boardDetail/commentsLoad?boardNum="+boardNum+"&addNum=5'/>",
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
	} //loadComment

	function commentEdit(commentNum) {
		var str = "";
		 + "<br><form name='commentEditFrm' method='post' var='vo' items='{vo }'>"
		 + "<div class='col-sm-10' id='commentDiv'>"
		 + "<textarea class='form-control' style='height: 10px' name='commentContent'></textarea>"
		 + "</div>"
		 + "<div class='d-grid gap-2 d-md-flex justify-content-md-end'>"
		 + "<button type='submit' class='btn btn-primary right commentEditBt' id='EditBt' name='commentEditBt'>댓글 수정</button>"
		 + "</div>"
		 + "<input type='text' name='boardNum' value='${vo.BOARD_NUM }'>"
		 + "<input type='text' name='commentNum' value='${vo.USER_NUM }'>"
		 + "<input type='text' name='userNum' value='${vo.USER_NUM }'>"
		 + "</form>"
		 + "<hr>";
		var commentNum = $(evt).parent().prev().val();
		
		$(evt).parent().replaceWith(str);
		$('input[name=commentNum]').val(commentNum);
	}//commentEdit
	
$(function() {
		var boardNum = ${param.boardNum};
		$.loadComment(boardNum);
		
			
		$('#EditBt').click(function() {
			event.preventDefault();
			var commentEdit = $('form[name=commentContent]').serialize();
			$.ajax({
				url : "<c:url value='/user/board/boardDetail/ajax_commentsEdit'/>",
				type : 'post',
				data : $('form[name=commentEditFrm]').serializeArray(),
				dataType : 'json',
				success:function(){
					alert("댓글이 수정되었습니다.");
					$.loadComment(boardNum);
					$.commentsLoad();
					  
				},error:function(xhr, status, error){
					alert(status + " : " + error);
				}
			});
		});
			
		
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
						if(data!=null){
							$('#ajaxComments').html("");
			        	/* var str = ""; */
								str = "<div class='CommentsBox'  style='border: 1px solid #ccc; width: 600px;'>"
									 + "<form name='CommentsBox' method='post' action='#' var='vo' items='"+data.vo+"' >"
									 + "<div class='anonym' style='margin: 10px;'>작성자 :"
									 + "<input type='text' class='form-control' id='com_writer' placeholder='id' name ='com_writer' value='"+data.commentNum+"' readonly style='width: 80px; border:none;'>"
									 + "<input type='text' value='"+data.commentRegDate+"' style='border: hidden;' />"
									 + "</div>"
									 + "<div class='anonym2' style='margin: 10px;'>"
									 + ""+data.commentContent+""
									 + "<button type='button' class='commentEditBt' id='EditBt'>수정</button>"
									 + "<button type='button' class='commentsDel' id='delBt'>삭제</button>"
									 + "</div>"
									 + "</form>"
									 + "</div>";
								    /* str = data.commentNum + data.userNum + data.commentRegDate + "<br>"
										+ data.commentContent + "<br>"
										+ "<button type='button' class='btn' id='editBt'>수정</button>"
			     						+ "<button type='button' class='btn' id='delBt'>삭제</button>";  */
			     						
									/* $('#ajaxComments').append(str); */
		     						alert("댓글 등록 성공");
		     						$('input[name=commentContent]').val('');
		     						$.loadComment(boardNum);
		     						console.log(data);
		     							 
						}else if(data==null){
							alert("댓글 내용을 입력하세요");
						}
			        },
					error:function(xhr, status, error){
						alert(status + " : " + error);
					}
			        
			    });
		});//#sendBt
		
	/* 	$('#EditBt').click(function(){
			
		});//EditBt
		
		$('#delBt').click(function(){
			
		});//delBt
		 */
	
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
							<input type="hidden" name="addNum" value="5"> <!-- 댓글 더 보기 -->
							<div id="ajaxComments"> </div>
							<div id="commentsLoad" var="list" items="${list}"> </div>
							<div id="commentsMoreDiv"> </div>
							
							<input type="hidden" name="addNum" value="5">
								<div id="ajaxComments">
								
								</div>
								<div id="commentsMoreDiv">
									
								</div>
						
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
        
		
		
