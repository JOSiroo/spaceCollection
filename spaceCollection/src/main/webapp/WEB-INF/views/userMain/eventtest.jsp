<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="https://code.jquery.com/jquery-1.11.3.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

</head>
<body>
	 <div class="comment-box">
                    
      <div class="comment-count">댓글 <span id="count">0</span></div>

      	   <!-- <span class="c-icon"><i class="fa-solid fa-user"></i>  -->
      <div class="comment-name">
         <span class="anonym">작성자 : 
     	    <input type="text" class="form-control" id="com_writer" placeholder="이름" name ="com_writer" value='${login.userId}' readonly  style="width: 100px; border:none;">
         </span>
       </div>   
         	
         <!-- </span> -->
     <!--<img src="/익명.jpg" width ="50px" alt="My Image"><!-->
    <div class="comment-sbox">
        <textarea class="comment-input" id="com_content" cols="80" rows="2" name="com_content" ></textarea>
        <!-- <span class="com-function-btn" type="hidden">
            
            <a href="#"><i class="fa-solid fa-pen-to-square"></i></a>
            <a href="#"><i class="fa-solid fa-trash-can"></i></a>
         </span> -->
    </div>
    	<div class="regBtn">
    		<button id="Comment_regist"> 댓글등록</button>
		</div>
		
		<div class="comment_Box" style="border:1px solid gray;">
		 <!-- 댓글이 들어갈 박스 -->
		</div>
  </div>
		
<script type="text/javascript">
	/* $.ajax({
		type:'GET', //요청 메서드'
		url: 'eventtest' //요청 uri
		success : function(result){ //콜백 함수
			$("#commentsList").html(toHtml(result));
		
			//댓글 작성 후 목록 출력시 댓글 input 공백
			$("input[name=comments]").val('');
		},
		error : function({ alart("error") } //에러 시 알림
	}); */
/* 	
	$(document).ready(function(){
		let user = {id:"abc", pwd:10};
		let user2 = {};
		$("#sendBtn").click(function(){
			$.ajax({
				type:'POST', //요청 메서드'
				url: '/eventtest' //요청 uri
				success : function(result){ //콜백 함수
					user2 = JSON.parse(result); //서버로부터 응답이 도착하면 호출될 함수
					alert("received="+result);
					$("#commentsList").html("name="+user2.id+", pwd="+user2.pwd);
				},
				error : function(){ alart("error") } //에러 시 알림
			}); //$.ajax()
			alert("the request is sent")
		});
	}); */
	
	$('#Comment_regist').click(function() {
		
			//Json으로 전달할 파라미터 변수선언
			const com_bno = ${board_no};
			const com_writer = $('#com_writer').val();
			const com_content = $('#com_content').val();
			
			console.log(com_bno);
			console.log(com_writer);
			console.log(com_content);
		
			if(com_writer == ''){
				alert('로그인 후 이용해주세요');
				return;
			}else if(com_content == '') {
				alert('내용을 입력하세요');
			}
			
			$.ajax({
				type:'post',
				url:'<c:url value="/Comment/InsertComment"/>',
				data: JSON.stringify(
					{
						"com_bno":com_bno,
						"com_writer":com_writer,
						"com_content":com_content
					}		
				),
				contentType: 'application/json',
				success:function(data){
					console.log('통신성공' + data);
					if(data === 'InsertSuccess') {
						alert('댓글 등록이 완료되었습니다.');
						console.log('댓글 등록 완료');
						$('#com_writer').val(com_writer);
	   					$('#com_content').val('');
	   					getList();
					} else {
						alert('로그인 이후 이용해주시기 바랍니다.');
						console.log('댓글 등록 실패');
					}
				},
				error:function(){
					alert('통신실패');
				}
			});// 댓글 비동기 끝
			
	});// 댓글등록 이벤트 끝
	
	getList();
	
	function getList() {
		
		const com_bno = ${board_no};
		const com_writer = $('#com_writer').val();
			const com_content = $('#com_content').val();
			/* const com_no = ${com}; */
		$.getJSON(
			"<c:url value='/Comment/CommentList/'/>"+com_bno,
			function(data) {
				if(data.total > 0){
					var list = data.list;
					
					var comment_html = "<div>";
					
					$('#count').html(data.total);
					for(i = 0;i < list.length;i++){
						var content = list[i].com_content;
						var writer = list[i].com_writer;
						comment_html += "<div><span id='com_writer'><strong>" + writer + "</strong></span><br/>";
						comment_html += "<span id='com-content'>" + content + "</span><br>";
						if(writer === $("#com_writer").val()){
							 comment_html += "<span id='delete' style='cursor:pointer;' data-id ="+content+">[삭제]</span><br></div><hr>";
							 
						}
						else{
							comment_html += "</div><hr>";
						}
					}
					
					$(".comment_Box").html(comment_html);
					
					
				}
				else{
					var comment_html = "<div>등록된 댓글이 없습니다.</div>";
					$(".comment_Box").html(comment_html);
				}
		
			
			}
			);//getJson

	
</script>
		
</body>


</html>