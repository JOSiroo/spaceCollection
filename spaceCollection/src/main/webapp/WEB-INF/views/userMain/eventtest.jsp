<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
const instaForm = document.querySelector("#instaForm");
const commentsContainer = document.querySelector("#comments");
instaForm.addEventListener("submit", function (e) {
  e.preventDefault();
  const usernameInput = instaForm.elements.username;
  const commentInput = instaForm.elements.comment;
  addComment(usernameInput.value, commentInput.value);
  usernameInput.value = "";
  commentInput.value = "";
});

const addComment = (username, comment) => {
const newComment = document.createElement("li");
const bTag = document.createElement("b");
bTag.append(username);
newComment.append(bTag);
newComment.append(`- ${comment}`);
commentsContainer.append(newComment);
};
</script>
<style>
	div#eventText {
	background: gray;
	width: 900px;
	height: 10px;
	}
</style>

</head>
<body>
	<td style="width: 80%;">
		<div class = "form=group">
			<label for="usr"></label>
			<input type="text" class="form-control" id="usr" placeholder="로그인 후 댓글을 작성해주세요" style="height: 30px;" name={userNum}'>
		</div>
	</td>
</body>
<td><button class="btn btn-sm btn-success" onclick="insertReply()">등록</button></td>

</html>