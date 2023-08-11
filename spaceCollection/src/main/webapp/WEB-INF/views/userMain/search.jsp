<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/userTop.jsp" %>
<style>
.row{
	padding: 5% 0% 0% 0%;
}
.col.region{
	text-align: center;
	padding: 0% 0% 0% 0%;
}

.dropdown-menu.show {
   	display: block;
   	padding: 10% 10% 10% 10%;
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
		width: 28%;
	}
	.dropdown{
		width:100%;
	}
	.dropdown-toggle{
		width:100%;
	}
	.input-group.mb-3{
		width:70%;
		float: right;
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
	.dropdounUl{
		list-style-type: none;
   		padding: 10% 5% 5% 5% !important;
	}
	.dropdownPeople{
		padding:4% 3% 3% 3%;;
		min-width: 25rem;
		display: block;
	}
	.people-btnGroup{
		padding:0% 0% 0% 0%;
	}
	.people-numGroup{
		padding:0% 0% 0% 0%;
	}
	#peopleMinus{
		border: #193D76 solid 2px !important;
	}
	#peoplePlus{
		border: #193D76 solid 2px !important;
	}
	#people{
		border: grey solid 2px !important;
	    height: auto;
	    text-align: center;
	    font-size: 18px;
	    font-weight: bold;
	}
	
	#peopleResetBtn{
		box-sizing: border-box !important;
    	float: left !important;
    	width: 30%;
	}
	#peopleApplyBtn{
		box-sizing: border-box !important;
    	float: left !important;
    	width: 60%;
	}
	
</style>
<div class="search-wrapper"></div>
<div class = "asd">
<div class="btn-group">
	<div class="dropdown">
		  <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
		    지역
		  </button>
		  <div class="dropdown-menu">
			<div><input type="text" id="searchText"></div>
				<ul class = "dropdounUl">
					<li>
					<div class = "row">
						<div class = "col region">종로구</div><div class = "col region">중구</div>
					</div>
					<div class = "row">
						<div class = "col region">용산구</div><div class = "col region">성동구</div>
					</div>
					<div class = "row">
						<div class = "col region">광진구</div><div class = "col region">동대문구</div>
					</div>
					<div class = "row">
						<div class = "col region">중랑구</div><div class = "col region">성북구</div>
					</div>
					<div class = "row">
						<div class = "col region">강북구</div><div class = "col region">도봉구</div>
					</div>
					<div class = "row">
						<div class = "col region">노원구</div><div class = "col region">은평구</div>
					</div>
					<div class = "row">
						<div class = "col region">서대문구</div><div class = "col region">마포구</div>
					</div>
					<div class = "row">
						<div class = "col region">양천구</div><div class = "col region">강서구</div>
					</div>
					<div class = "row">
						<div class = "col region">구로구</div><div class = "col region">금천구</div>
					</div>
					<div class = "row">
						<div class = "col region">영등포구</div><div class = "col region">동작구</div>
					</div>
					<div class = "row">
						<div class = "col region">관악구</div><div class = "col region">서초구</div>
					</div>
					<div class = "row">
						<div class = "col region">강남구</div><div class = "col region">송파구</div>
					</div>
					<div class = "row">
						<div class = "col region">강동구</div><div class = "col region">-</div>
					</div>
					</li>
				</ul>
		</div><!-- 지역 -->
	</div>
		<div class="dropdown">
			<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
		   	 	인원
		  	</button>
			<div class="dropdown-menu">
				<ul class = "dropdounUl">
					<li>
						<div class = "row">
							<div class = "col region">
								<div class="dropdown-menu">
									<h5 style="float: left; margin-top:5%; font-weight: bold;">인원</h5>
									<div class = "people-numGroup">
										<div class="input-group mb-3">
											 <input type="text" class="form-control" id = "people" disabled aria-label="Recipient's username with two button addons" value="1">
											  <button class="btn btn-outline-secondary" id = "peopleMinus" type="button">-</button>
											  <button class="btn btn-outline-secondary" id = "peoplePlus" type="button">+</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class = "row">
							<div class = "col">
								<div class="people-btnGroup">
									<button class="btn btn-yellow filter" id ="peopleResetBtn">초기화</button>
									<button class="btn btn-violet filter" id ="peopleApplyBtn">인원수 적용하기</button>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div><!-- 인원 -->
</div>
	<button type="button" class="btn btn-outline-dark">필터</button>
	<a href="<c:url value = '/userMain/search/map'/>"><button type="button" class="btn btn-outline-dark">지도</button></a>
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
