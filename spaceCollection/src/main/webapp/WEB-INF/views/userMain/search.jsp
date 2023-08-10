<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/userTop.jsp" %>
<style>
.row{
	padding: 5% 0% 0% 0%;
}

.search-wrapper{
	height:144.5px;
}
.search-section{
	height:100%;
	padding-bottom:3%;
	background: rgb(246, 246, 246);
	min-height: 648px;
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

	.card {
	    position: relative;
	    display: -webkit-box;
	    display: -ms-flexbox;
	    display: flex;
	    -webkit-box-orient: vertical;
	    -webkit-box-direction: normal;
	    -ms-flex-direction: column;
	    flex-direction: column;
	    min-width: 0;
	    word-wrap: break-word;
	    background-color: #fff;
	    background-clip: border-box;
	    border: 1px solid rgba(0, 0, 0, 0.125);
	    border-radius: 0.25rem;
	    width:95% !important;
	    margin: 0% 0% 0% 0%;
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
	    <div class="col-sm-4">
		    <div class="card" style="width: 18rem;">
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
			  	<div class="card-body">
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			  </div>
			</div>
	    </div>
	    <div class="col-sm-4">
		    <div class="card" style="width: 18rem;">
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
			  	<div class="card-body">
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			  </div>
			</div>
	    </div>
	    <div class="col-sm-4">
		    <div class="card" style="width: 18rem;">
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
			  	<div class="card-body">
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			  </div>
			</div>
	    </div>
	  </div>
	  
	  <div class="row">
	    <div class="col-sm-4">
		    <div class="card" style="width: 18rem;">
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
			  	<div class="card-body">
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			  </div>
			</div>
	    </div>
	    <div class="col-sm-4">
		    <div class="card" style="width: 18rem;">
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
			  	<div class="card-body">
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			  </div>
			</div>
	    </div>
	    <div class="col-sm-4">
		    <div class="card" style="width: 18rem;">
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
			  	<div class="card-body">
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			  </div>
			</div>
	    </div>
	  </div>
	  
	  <div class="row">
	    <div class="col-sm-4">
		    <div class="card" style="width: 18rem;">
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
			  	<div class="card-body">
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			  </div>
			</div>
	    </div>
	    <div class="col-sm-4">
		    <div class="card" style="width: 18rem;">
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
			  	<div class="card-body">
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			  </div>
			</div>
	    </div>
	    <div class="col-sm-4">
		    <div class="card" style="width: 18rem;">
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
			  	<div class="card-body">
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			  </div>
			</div>
	    </div>
	  </div>
  </div>
	  
</section>


<%@ include file="/WEB-INF/views/form/userBottom.jsp" %>
