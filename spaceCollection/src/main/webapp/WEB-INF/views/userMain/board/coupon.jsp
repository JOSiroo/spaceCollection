<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>랜덤 쿠폰</title>
    <script type="text/JavaScript" src="<c:url value='/js/jquery-3.7.0.min.js'/>" ></script>
</head>
<body>
    <ul id="couponList"></ul>
    <button id="generateButton">랜덤 쿠폰 발급</button>
    <script src="<c:url value='/board/couponscript.js'/>"></script>
</body>
</html>
