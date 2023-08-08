<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>SpaceCollection - 공간에 사람을 더하다.</title>
<script type="text/javascript"
	src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
		$(function() {
			$('#logoutBtn').click(function() {
				location.href="<c:url value='/admin/adminLogout'/>";
			});
		});
	</script>
<meta content="" name="description">
<meta content="" name="keywords">

<link href="<c:url value='/css/adminLogin.css'/>" rel="stylesheet">

<!-- Favicons -->
<link href="<c:url value='/NiceAdmin-pro/assets/img/favicon.png'/>"
	rel="icon">
<link
	href="<c:url value='/NiceAdmin-pro/assets/img/apple-touch-icon.png'/>"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/bootstrap-icons/bootstrap-icons.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/boxicons/css/boxicons.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/quill/quill.snow.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/quill/quill.bubble.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/remixicon/remixicon.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/simple-datatables/style.css'/>"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="<c:url value='/NiceAdmin-pro/assets/css/style.css'/>"
	rel="stylesheet">
<link href="<c:url value='/css/adminLogin.css'/>" rel="stylesheet"/>
</head>
<body>
	<section class="section" style="text-align: center;">
		<div class="mb-3">
			<form name="frm" action="<c:url value='/admin/adminLogin'/>" method="post">
				<h4>Space Collection(관리자용)</h4>
  				<div class="mb-3" id="center">
    				<label for="exampleInputEmail1" class="form-label">아이디</label>
    				<input type="text" class="form-control" id="userId" name="adminId" value="${cookie.ck_adminId.value }">
  				</div>
  				<div class="mb-3" id="center">
    				<label for="exampleInputPassword1" class="form-label">비밀번호</label>
    				<input type="password" class="form-control" id="pwd" name="adminPwd">
  				</div>
  				<div class="mb-3 form-check" id="chk">
					<input type="checkbox" class="form-check-input" id="exampleCheck1" name="chkSave" 
					<c:if test="${!empty cookie.ck_adminId }">
						checked
					</c:if>>
					
					<label class="form-check-label" for="exampleCheck1">아이디 저장</label>
  				</div>
  				<button type="submit" class="btn btn-primary">로그인</button>
			</form>
		</div>
	</section>

	<!-- Vendor JS Files -->
	<script
		src="<c:url value='/NiceAdmin-pro/assets/vendor/apexcharts/apexcharts.min.js'/>"></script>
	<script
		src="<c:url value='/NiceAdmin-pro/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
	<script
		src="<c:url value='/NiceAdmin-pro/assets/vendor/chart.js/chart.umd.js'/>"></script>
	<script
		src="<c:url value='/NiceAdmin-pro/assets/vendor/echarts/echarts.min.js'/>"></script>
	<script
		src="<c:url value='/NiceAdmin-pro/assets/vendor/quill/quill.min.js'/>"></script>
	<script
		src="<c:url value='/NiceAdmin-pro/assets/vendor/simple-datatables/simple-datatables.js'/>"></script>
	<script
		src="<c:url value='/NiceAdmin-pro/assets/vendor/tinymce/tinymce.min.js'/>"></script>
	<script
		src="<c:url value='/NiceAdmin-pro/assets/vendor/php-email-form/validate.js'/>"></script>

	<!-- Template Main JS File -->
	<script src="<c:url value='/NiceAdmin-pro/assests/js/main.js'/>"></script>

</body>

</html>