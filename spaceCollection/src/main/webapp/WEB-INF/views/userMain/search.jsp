<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/userTop.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.row{
	padding: 5% 0% 0% 0%;
}
.row.top{
	padding : 0% 0% 0% 0%;
}
.row.region{
	padding : 0% 0% 0% 0%;
}
.col.region{
	text-align: center;
   	padding: 5% 0% 3% 0%;
    border: 1px rgba(2, 0, 5, 0.2) solid;
}
.region-find{
	margin-bottom:8%;
}


.row.people{
	padding: 9% 7% 5% 9%;
}
.col.people{
	padding:0% 0% 0% 0%;
}


#searchText{
	width : 65%;
	height: 35px;
}

.region-findBtn{
	border:none;
	background:#193D76;
	color : white;
	width : 23%;
	height: 35px;
}

.region-a{
	display:contents;
}


.dropdown-menu.region.show {
   	padding: 10% 8% 6% 8%;
    margin: 0% 0% 0% 2% !important;
    min-width: 24rem;
}
.dropdown-menu.people.show{
   	display: block;
   	padding: 2% 0% 0% 0% !important;
   	padding-bottom: 0% !important;
   	min-width: 22rem;
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
	.card-body{
		padding: 6% 8% 4% 8%;
	}
	.h5{
	    	font-weight: bold	
    }
	
	
	.dropdounUl{
		list-style-type: none;
   		/*padding: 10% 5% 5% 5% !important;*/
   		padding-left:0 !important;
   		margin-bottom:0 !important;
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
		
    	padding-top: 10px !important;
		padding-bottom: 10px !important;
		padding-left: 20px !important;
		padding-right: 20px !important;
	}
	#peoplePlus{
		border: #193D76 solid 2px !important;
		
    	padding-top: 10px !important;
		padding-bottom: 10px !important;
		padding-left: 20px !important;
		padding-right: 20px !important;
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
    	height: 60px;
   	    background: #ffd014;
    	font-weight: bold;
    	border : none;
    	

	}
	#peopleApplyBtn{
		box-sizing: border-box !important;
    	float: left !important;
    	width: 70%;
    	height: 60px;
    	background:#193D76;
    	font-weight: bold;
    	color : white;
    	border : none;
	}
	
</style>
<div class="search-wrapper"></div>
<div class = "asd">
<div class="btn-group">
	<div class="dropdown">
		  <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
		    지역
		  </button>
		  <div class="dropdown-menu region">
			<div class = "region-find">
				<svg width="25" height="25" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
					<path d="M9.55026 9.55053L13 13M9.46531 2.45285C11.4021 4.38973 11.4021 7.5297 9.46531 9.46709C7.52957 11.403 4.3888 11.403 2.45256 9.46709C0.515813 7.5297 0.515813 4.38973 2.45256 2.45285C4.38931 0.515464 7.52907 0.51597 9.46531 2.45285Z" stroke="#767676"/>
				</svg>
				<input type="text" id="searchText">
				<button class = "region-findBtn">찾기</button>
			</div>
				<ul class = "dropdounUl">
					<li>
					<div class = "row region">
						<a href="#" class="region-a"><div class = "col region">종로구</div></a>
						<a href="#" class="region-a"><div class = "col region">중구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a"><div class = "col region">용산구</div></a>
						<a href="#" class="region-a"><div class = "col region">성동구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a"><div class = "col region">광진구</div></a>
						<a href="#" class="region-a"><div class = "col region">동대문구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a"><div class = "col region">중랑구</div></a>
						<a href="#" class="region-a"><div class = "col region">성북구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a"><div class = "col region">강북구</div></a>
						<a href="#" class="region-a"><div class = "col region">도봉구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a"><div class = "col region">노원구</div></a>
						<a href="#" class="region-a"><div class = "col region">은평구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a"><div class = "col region">서대문구</div></a>
						<a href="#" class="region-a"><div class = "col region">마포구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a"><div class = "col region">양천구</div></a>
						<a href="#" class="region-a"><div class = "col region">강서구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a"><div class = "col region">구로구</div></a>
						<a href="#" class="region-a"><div class = "col region">금천구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a"><div class = "col region">영등포구</div></a>
						<a href="#" class="region-a"><div class = "col region">동작구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a"><div class = "col region">관악구</div></a>
						<a href="#" class="region-a"><div class = "col region">서초구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a"><div class = "col region">강남구</div></a>
						<a href="#" class="region-a"><div class = "col region">송파구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a"><div class = "col region">강동구</div></a>
						<a href="#" class="region-a"><div class = "col region">-</div></a>
					</div>
					</li>
				</ul>
		</div><!-- 지역 -->
	</div>
		<div class="dropdown">
			<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
		   	 	인원
		  	</button>
			<div class="dropdown-menu people">
				<ul class = "dropdounUl">
					<li>
						<div class = "row top people">
							<div class = "col people">
									<h5 style="float: left; margin-top:3%; font-weight: bold;">인원</h5>
									<div class="input-group mb-3">
										<button class="btn btn-outline-secondary" id = "peopleMinus" type="button">-</button>
										<input type="text" class="form-control" id = "people" disabled aria-label="Recipient's username with two button addons" value="1">
										<button class="btn btn-outline-secondary" id = "peoplePlus" type="button">+</button>
									</div>
							</div>
						</div>
					</li>
					<li>
						<div class = "row top">
							<div class = "col">
								<div class="people-btnGroup">
									<button  id ="peopleResetBtn">초기화</button>
									<button  id ="peopleApplyBtn">인원수 적용하기</button>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div><!-- 인원 -->
</div>
	<button type="button" class="btn btn-outline-dark">필터</button>
	<a href="<c:url value = '/search/map'/>"><button type="button" class="btn btn-outline-dark">지도</button></a>
</div>



<section class = "search-section">
	<div class="container">
	<br>
	<c:if test="${!empty totalRecord }">
		<h4>총 ${totalRecord }건이 검색되었습니다</h4>
	</c:if>
	  <div class="row">
	  <c:if test="${!empty spaceMap }">
	  	<c:forEach var="space" items="${spaceMap}">
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
					</div><!-- 여까지 캐러셀 -->
				  	<div class="card-body">
					  	<a href = "<c:url value = '/detail?spaceNo=${space.key.spaceNum}'/>"><h5 class="h5">${space.key.spaceName}</h5></a>
						  	<c:set var="tag" value=""/>
						  	<c:forEach items="${fn:split(space.key.spaceTag, '/')}" var="tags">
							    <span>#${tags }</span>
						    </c:forEach>
					    <h5 class = "h5" style="color:#193D76">
					    <fmt:formatNumber value="${space.value}" pattern="₩#,###"/>원
					    </h5>
				  </div>
				</div>
		    </div>
	    </c:forEach>
	    </c:if>
  </div>
</div>
	  
	
</section>
<script type="text/javascript">
$(function(){
		$('#peopleMinus').click(function(){
			var people = $(this).siblings('#people');
			if(people.val() > 1){
		        people.val(parseInt(people.val())-1);
			}
		});
		
		$('#peoplePlus').click(function(){
			var people = $(this).siblings('#people');
		    	people.val(parseInt(people.val())+1);
		});
});

//부트스트랩 드롭다운 요소들을 가져옴
var dropdownItems = document.querySelectorAll('.dropdown-menu.people');

// 각 드롭다운 요소에 클릭 이벤트 리스너 추가
dropdownItems.forEach(function(item) {
  item.addEventListener('click', function(event) {
    event.stopPropagation(); // 클릭 이벤트 전파 중단
  });
});
</script>
<%@ include file="/WEB-INF/views/form/userBottom.jsp" %>
