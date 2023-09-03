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
    position: absolute;
    max-width: 1200px;
    margin: 0 auto;  
    margin-left: 300px;
    margin-bottom: 500px;
	}
	
	div#ajaxComments {
    margin: 20px;
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
    margin: 200px;
    padding-bottom: 500px;
	}
	div#commentDiv {
    width: 1000px;
    margin-top: 20px;
    margin-left: 3px;
	}

	div#CommentsBox {
    margin-top: 40px;
	}
	
	button#sendBt {
    scale: 0.7;
	}   
	
	button.btbt{
	border-radius: 10px;
    background-color: white;
	}
	
	button#EditBt {
    margin-left: 460px;
	}
		
</style>

<script>

 function makeList(data) {
		 $.each(data, function() {
		    var str = "<div class='CommentsBox'  style='border: 1px solid #ccc; width: 600px;'>"
		        + "<form name='CommentsBox' method='post' action='#' var='list' items='" + this.list + "' >"
		        + "<div class='anonym' style='margin: 10px;'>작성자 :"
		        + "<input type='text'  id='com_writer' placeholder='id' name='com_writer' value='" + this.userNum + "' readonly style='width: 80px; border:none;'>"
		        + "<input type='text' value='" + this.commentRegDate + "' style='border: none;' />"
		        + "</div>"
		        + "<div class='anonym2' style='margin: 10px;'>"
		        + "" + this.commentContent +""
		        + "<button type='button' class='btbt' id='EditBt'>수정</button>"
		        + "<button type='button' class='btbt' id='delBt' >삭제</button>"
		        + "</div>"
		        + "</form>"
		        + "</div>";
		    $('#commentsLoad').append(str);
		}); //each

	}//makeList

 	$.loadComment=function(boardNum) {
		$.ajax({
			url : '<c:url value="/user/board/boardDetail/commentsLoad?boardNum='+boardNum+'&page='+page+'"/>',
			type: 'get',
			success:function(data){
				var str = "";
				if(data!=null && data.length>0){
					console.log(data);
					makeList(data);
					page++
				}else{
					str = "<span>등록된 댓글이 없습니다.</span>";
					$('#commentsLoad').append(str);
				}
			},
			error:function(xhr, status, error){
				
				alert(status + " : " + error);
			}
		});//ajax
	}//loadComment
	
	$("#commentsMoreDiv").click(function(){
		 loadComment(boardNum); 
	});

	function commentEdit(commentNum) {
		console.log("수정 메서드 만들기 시작");
		
		var str = "";
		 + "<div class='col-sm-10' id='commentNum'"+commentNum+">"
		 + "<strong>작성자 : </strong>" + userNum
		 + "<textarea class='form-control' id='commentContent' style='height: 10px' name='commentContent'></textarea>"
		 + "</div>"
		 + "<div class='d-grid gap-2 d-md-flex justify-content-md-end'>"
		 + "<button type='button' class='btn btn-outline-success' id='EditBt' "
		 + "onclick='updateBtn("+commentNum+ ",\" "+commentContent+" name='commentEditBt'>댓글 수정</button>"
		 + "<button type='button' class='btn btn-outline-success' onclick='getContent'>취소</button>"
		 + "</div>"
		 + "<hr>";
		 $("#commentList").append(html);
	}//commentEdit 
	
		var page = 1;
		var boardNum = ${param.boardNum};
		$.loadComment(boardNum);
	
$(function() { 
		
		function loadMoreData() {
		    if (isLoading) {
		        return;
		    }
		    isLoading = true;

		    $.ajax({
		        url: '<c:url value="/user/board/boardDetail/commentsLoad?page='+page+'&boardNum='+boardNum+'"/>',
		        type:'get',
		        dataType: 'json',
		        success: function(data) {
		           if(data != null){
		            makeList(data);
		                page++;
		         }
		           if(data.length == 0 ){
		            if(noDataNum == 0){
		               noData();
		            }
		            noDataNum++;
		            return;
		           }
		         
		        },
		        complete: function() {
		            isLoading = false;
		        }
		    });
		}

		
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
		                  function handleButtonClick() {
					        if (userId=="" && userId.isEmpty ) {
					        	alert("댓글 등록 성공");
					        } else {
									if(data!=null){
										$('#ajaxComments').html("");
											str = "<div class='CommentsBox'  style='border: 1px solid #ccc; width: 600px;'>"
												 + "<form name='CommentsBox' method='post' action='#' var='vo' items='"+data.vo+"' >"
												 + "<div class='anonym' style='margin: 10px;'>작성자 :"
												 + "<input type='text'  id='com_writer' placeholder='id' "
												 + "name ='com_writer' value='"+data.commentNum+"' readonly style='width: 80px; border:none;'>"
												 + "<input type='text' value='"+data.commentRegDate+"' style='border: hidden;' />"
												 + "</div>"
												 + "<div class='anonym2' style='margin: 10px;'>"
												 + ""+data.commentContent+""
												 + "<button type='button' class='comment_edit' id='EditBt'>수정</button>"
												 + "<button type='button' class='comment_delete' id='delBt'>삭제</button>"
												 + "</div>"
												 + "</form>"
												 + "</div>";
												 
					     						alert("댓글 등록 성공");
					     						$('input[name=commentContent]').val('');
					     						$.loadComment(boardNum);
					     						console.log(data);
						     							 
									}else if(data==null){
										alert("댓글 내용을 입력하세요");
									}
					        }
					            console.log("Button clicked!");
					        }
			        },
					error:function(xhr, status, error){
						alert(status + " : " + error);
					}
			    });//ajax
		});//#sendBt
		 
});		

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
	             <form name="CommentsBox" method="post" action="#"  var="list" items="${list}">
		             	<c:if test="${empty list }">  
			  				<td colspan="5" class="align_center">글이 존재하지 않습니다.</td>
					  	</c:if>
					  	<c:if test="${!empty list }">	
							<div class="col align-center" >
								<!-- 댓글 추가 -->
								<input type="hidden" name="addNum" > 
								<div id="ajaxComments"> 
								</div>
								<div id="commentsLoad" var="list" items="${list}"> 
								</div>
								<!-- 댓글 더 보기 -->
								<div id="commentsMoreDiv"> 
									<span> 댓글 더보기 </span>
								</div>
							</div>
						</c:if>
				</form>
			</div>
		</div>	
	</section>
  </div>	
<%@ include file="/WEB-INF/views/form/userBottom.jsp" %>
		
