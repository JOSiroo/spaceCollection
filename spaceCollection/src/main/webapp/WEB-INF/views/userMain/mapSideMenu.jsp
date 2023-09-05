<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
.offcanvas-header{
	background: rgba(255, 208, 20, 0.6);
}
.offcanvas-title{
	font-weight: bold;
}
::-webkit-scrollbar {
    width: 10px;
    background-color: white;
  }
::-webkit-scrollbar-thumb{
	background: #193D76;
	border-radius: 1rem;
	trans
} 
.offcanvas-start{
	scroll-behavior: smooth;
	transition: all 0.4s ease;
}
#orderBtn{
	background:#193D76;
	color:white;
}
.movePoint{
	text-decoration: none;
	color:black;
}
</style>

<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasExampleLabel">${title}</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
  <div class="dropdown mt-3">
      <button id="orderBtn" class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown">
        정렬
      </button>
      <span id="orderParam"></span>
      <br>
      <br>
      <hr>
      <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="#">최신순</a></li>
        <li><a class="dropdown-item" href="#">가격 낮은순</a></li>
        <li><a class="dropdown-item" href="#">가격 높은순</a></li>
      </ul>
    </div>
    <div>
      <c:forEach var="map" items="${spaceMap}">
      <c:set var="vo" value="${map}" />
      	<a style="cursor:pointer" onclick="panTo('${vo.key.latitude}',${vo.key.longitude})" class="movePoint">${vo.key.spaceName}</a>
      	<hr>
      </c:forEach>
    </div>
  </div>
</div>
