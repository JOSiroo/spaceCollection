<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

/* 
$.ajax({
    url: "<c:url value='/board/boardDetail/url>", // 수정된 URL -> 처리할 주소(입력 컨트롤러 매핑)
    method: "post",
    data : sendDate//보낼 데이터 ->제목/내용
    dataType: 'json', //객체화 -> 전달 받을 값 타입
    success:function(res){//성공
		
	},
	error:function(xhr, status, error){//실패
		alert(status+" : " + error);
	}
}); */

$(function(){
	
	$('#sendBt').click(function() {
		event.preventDefault();
		var sendDate = $('form[name=commentsFrm]').serialize();
            // 성공 시에 commentsLoad 함수 호출하여 list 값을 다시 로딩
            alert("1");
            $.ajax({
                url: "<c:url value='/user/board/boardDetail/commentsWrite'/>", // 수정된 URL
                method: "post",
                data : sendDate,//보낼 데이터 ->제목/내용
                dataType: 'json', //객체화 -> 전달 받을 값 타입
                success:function(res){//성공
                	console.log(res); // 서버 응답 확인
                	var d="<div class="anonym2" style="margin: 10px;">";
                	d+="${list.commentContent}123123";
                	
                	
                	
                },
                	
		        error: function(xhr, status, error) {
		            alert(status + " : " + error);
		        }
			});
      });
});




</script>

<body>

</body>
</html>