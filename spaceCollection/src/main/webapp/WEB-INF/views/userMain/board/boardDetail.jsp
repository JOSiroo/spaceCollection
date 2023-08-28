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
<script type="text/javascript"
	src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
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
		/* position: fixed; */
        /* flex-wrap: wrap;
        gap: 20px;
        justify-content: center;
        max-width: 1200px;
        margin: 0 auto;   */
        margin-left: 500px;
        margin-bottom: 500px;
	}
	
</style>
<script>
	$(function() {
		$.commentsLoad();
		
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
				$('#okBt').hide();
				$('#cancelBt').html("확인");
				$('.modal-body').html("댓글을 입력해주세요.");
		        $('#confirm1').modal('show');
				
				event.preventDefault();
			}
		});
		
		$.commentsLoad = function(){
			$.ajax({
				url : "<c:url value='/admin/board/boardDetail/ajax_commentLoad'/>",
				type: 'get',
				data: "boardNum=" + $('input[name=boardNum]').val() + "&addNum=" + $('input[name=addNum]').val(),
				dataType: 'json',
				success:function(res){
					var str = "";
					if(res!=null && res.length>0){
						$('#ajaxComments').html("");
						
						$.each(res, function() {
							str = "<input type='hidden' class='commentNum' value='"+this.COMMENT_NUM+"'>"
								+ "<div>"					
								+ "<a href='#'><i class='bi bi-person-fill'></i><span>"+this.USER_ID+"</span></a>"
								+ "<span id='commentsDel' class='commentsDel' onClick='commentDelete(this)'>삭제</span>"
								+ "<span id='commentsEdit' class='commentsEdit' onClick='commentEdit(this)'>수정</span>"
								+ "<p style='white-space: pre;'>"+this.COMMENT_CONTENT+"</p>"
								+ "<span>"+this.COMMENT_REG_DATE+"</span>"
								+ "<input type='hidden' name='commentNum' value='"+this.COMMENT_NUM+"'>"
								+ "<hr>"
								+ "</div>";
							$('#ajaxComments').append(str);
						});
						
						if($('input[name=addNum]').val() == res.length){
							$('#commentsMoreDiv').html("<span onClick='moreComment()'>댓글 더 보기</span>");
						}else{
							$('#commentsMoreDiv').html("");
						}
						
					}else{
						str = "<span>등록된 댓글이 없습니다.</span>"
						$('#ajaxComments').append(str);
					}
					
				},
				error:function(xhr, status, error){
					alert(status + " : " + error);
				}
			});
		}
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
		<form name="commentsFrm" method="post" action="<c:url value='/userMain/board/boardDetail/commentsWrite'/>">
			<div class="comment-box" >
	             <div class="comment-name">
	                <div class="registering_comment"  style="position: absolute;" >
					<input type="text" name="comments" placeholder="로그인 후 글을 작성하실 수 있습니다." style="width: 500px;"/>
					<button type="button" class="btn btn-primary btn-lg" id="sendBt" style="scale: 0.8;">등록</button>
					</div> <br><br>
	             <div class="comment-count">
	             	댓글 <span id="count">0</span></div>
	             </div>   
	             
	             <div id="ajaxComments"  var="list">
	             
	             	<c:if test="${empty list }">  
		  				<td colspan="5" class="align_center">글이 존재하지 않습니다.</td>
				  	</c:if>
				  	<c:if test="${!empty list }">	
						<div class="col align-center" >
							<c:forEach var="list" items="${list}">
				            <div class="CommentsBox"  style="border: 1px solid #ccc; width: 600px;">
					            <div class="anonym" style="margin: 10px;">작성자 : 
				            	    <input type="text" class="form-control" id="com_writer" placeholder='id' name ="com_writer" 
				            	    	value='${list.userNum}' readonly style="width: 80px; border:none;">
					                <fmt:parseDate value="${list.commentRegDate}" pattern="yyyy-MM-dd HH:mm" var="parsedDate" />
					                <fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm"/>
				                </div>
				                <div class="anonym2" style="margin: 10px;">
					         	   ${list.commentContent}
					            <button type="button" class="btn" id="editBt">수정</button>
	     						<button type="button" class="btn" id="delBt">삭제</button>
	     						</div>
     						</div>
					        </c:forEach>
						</div>
					</c:if>
					
	     				
				</div>
				
	        </div>
        </form>
  	</section>
        
        
		
		
