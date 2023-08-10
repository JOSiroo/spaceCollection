<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/userTop.jsp" %>
<style>
.row{
	padding: 1% 0% 2% 0%;
}

.search-wrapper{
	height:144.5px;
}
.search-section{
	height:100%;
	padding-bottom:3%;
}
.dropdown-toggle{
	display:inline-block;
}
.asd{
	text-align: center;
    padding: 2% 0% 2% 0%;
    
    .btn-group{
		width: 8%;
	}
	.dropdown{
		width:100%;
	}
	.dropdown-toggle{
		width:100%;
	}
}

</style>
<div class="search-wrapper"></div>
<div class = "asd">
<div class="btn-group">
	<div class="dropdown">
		  <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
		    지역
		  </button>
		  <ul class="dropdown-menu">
		    <li><a class="dropdown-item" href="#">Action</a></li>
		    <li><a class="dropdown-item" href="#">Another action</a></li>
		    <li><a class="dropdown-item" href="#">Something else here</a></li>
		  </ul>
		</div><!-- 지역 -->
	</div>
	<div class="btn-group">
		<div class="dropdown">
		  <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
		    인원
		  </button>
		  <ul class="dropdown-menu">
		    <li><a class="dropdown-item" href="#">Action</a></li>
		    <li><a class="dropdown-item" href="#">Another action</a></li>
		    <li><a class="dropdown-item" href="#">Something else here</a></li>
		  </ul>
		</div><!-- 인원 -->
	</div>
	<button type="button" class="btn btn-outline-dark">필터</button>
	<button type="button" class="btn btn-outline-dark">지도</button>
</div>
<section class = "search-section">
	<div class="container">
	  <div class="row">
	    <div class="col">
	      <div id="carouselExample" class="carousel slide">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
	    </div>
	    <div class="col">
	       <div id="carouselExample" class="carousel slide">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
	    </div>
	    <div class="col">
	      <div id="carouselExample" class="carousel slide">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
	    </div>
	  </div>
	  <div class="row">
	    <div class="col">
	      <div id="carouselExample" class="carousel slide">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
	    </div>
	    <div class="col">
	       <div id="carouselExample" class="carousel slide">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
	    </div>
	    <div class="col">
	       <div id="carouselExample" class="carousel slide">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
	    </div>
	  </div>
	  <div class="row">
	    <div class="col">
	       <div id="carouselExample" class="carousel slide">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
	    </div>
	    <div class="col">
	      <div id="carouselExample" class="carousel slide">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
	    </div>
	    <div class="col">
	      <div id="carouselExample" class="carousel slide">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
	    </div>
	  </div>
	  <div class="row">
	    <div class="col">
	      <div id="carouselExample" class="carousel slide">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
	    </div>
	    <div class="col">
	       <div id="carouselExample" class="carousel slide">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
	    </div>
	    <div class="col">
	       <div id="carouselExample" class="carousel slide">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value='/images/img_8.jpg'/>" class="d-block w-100" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
	    </div>
	  </div>
	</div>

</section>


<%@ include file="/WEB-INF/views/form/userBottom.jsp" %>
