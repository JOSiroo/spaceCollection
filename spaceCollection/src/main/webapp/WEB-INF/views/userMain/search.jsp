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
.row.top.filter{
	padding: 2% 4% 0% 7%;
}
.row.top.filter.facility{
	margin-bottom: 7%;
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
.col-3.filter{
	padding:0% 0% 0% 0%;
}
.filterBtn{
	border : 3px solid rgba(0, 0, 0, 0.3);
	border-radius : 0.7rem;
	background-color: white;
	padding: 0% 8% 0% 8%;
	height: 50px;
    width: 98%;
}
.filterBtn:hover{
	background-color: rgba(255, 208, 20, 0.74);
	border : 3px solid #ffc000;
}
.filterBtn.selected{
	background-color: rgba(255, 208, 20, 0.74);
	border : 3px solid #ffc000;
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
.dropdown-menu.filter.show{
   	display: block;
   	padding: 2% 0% 0% 0% !important;
   	padding-bottom: 0% !important;
   	min-width: 32rem;
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
	    margin-bottom:8%;
	}
	.card-body{
		padding: 6% 8% 4% 8%;
	}
	.h5{
	    	font-weight: bold	
    }
	
	.dropdounUl.filter{
		padding-top:5%;
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
	#filterResetBtn{
		box-sizing: border-box !important;
    	float: left !important;
    	width: 30%;
    	height: 60px;
   	    background: #ffd014;
    	font-weight: bold;
    	border : none;
    	

	}
	#filterApplyBtn{
		box-sizing: border-box !important;
    	float: left !important;
    	width: 70%;
    	height: 60px;
    	background:#193D76;
    	font-weight: bold;
    	color : white;
    	border : none;
	}
	.nodata{
		font-weight:bold;
		text-align: center;
		margin-top:10%;
	}
	
	
	.priceDiv{
		text-align:center;
	}
	.emptySpace{
		display: inline-block;
		width: 20%;
		font-weight	:500;
		font-size: 28px;
	}
	.form-floating{
		width: 30%;
		display: inline-block;
		margin-bottom:8%;
	}
	.form-control{
		border: grey 2px solid;
	}
	.form-control:disabled{
		border: grey 2px solid;
		background: white;
	}
	.noUi-connect{
		background: #ffd014;
	}
	.noUi-handle {
    border: 3px solid rgba(25, 61, 118, 0.5);
    border-radius: 1rem;
    background: #FFF;
    cursor: default;
    box-shadow: inset 0 0 1px #FFF, inset 0 1px 7px #EBEBEB, 0 3px 6px -3px #BBB;
	}
	.noUi-handle:hover{
		background: lightgrey;
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
						<a href="#" class="region-a" onclick="addRegionParam('종로구')"><div class = "col region">종로구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('중구')"><div class = "col region">중구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('용산구')"><div class = "col region">용산구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('성동구')"><div class = "col region">성동구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('광진구')"><div class = "col region">광진구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('동대문구')"><div class = "col region">동대문구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('중랑구')"><div class = "col region">중랑구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('성북구')"><div class = "col region">성북구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('강북구')"><div class = "col region">강북구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('도봉구')"><div class = "col region">도봉구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('노원구')"><div class = "col region">노원구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('은평구')"><div class = "col region">은평구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('서대문구')"><div class = "col region">서대문구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('마포구')"><div class = "col region">마포구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('양천구')"><div class = "col region">양천구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('강서구')"><div class = "col region">강서구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('구로구')"><div class = "col region">구로구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('금천구')"><div class = "col region">금천구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('영등포구')"><div class = "col region">영등포구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('동작구')"><div class = "col region">동작구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('관악구')"><div class = "col region">관악구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('서초구')"><div class = "col region">서초구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('강남구')"><div class = "col region">강남구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('송파구')"><div class = "col region">송파구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('강동구')"><div class = "col region">강동구</div></a>
						<a href="#" class="region-a" ><div class = "col region">-</div></a>
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
									<button  id ="peopleApplyBtn" onclick="addPeopleParam()">인원수 적용하기</button>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div><!-- 인원 -->
	<div class="dropdown">
			<button class="btn btn-outline-dark dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
		   	 	필터
		  	</button>
			<div class="dropdown-menu filter">
				<ul class = "dropdounUl filter">
					<li>
						<div class = "row top filter">
							<div class = "col filter">
									<div class = "priceDiv">
										<div><h5 style="font-weight: bold;text-align: left;">가격</h5></div>
										<br>
										<div class="form-floating">
									      <input type="text" disabled class="form-control" id="slider-snap-value-lower" placeholder="name@example.com" value="<fmt:formatNumber value='100000' pattern='#,###원'/>">
									      <label for="floatingInputGrid">최소가격</label>
									    </div>
									    <div class = "emptySpace"> ~ </div>
										<div class="form-floating">
									      <input type="text" disabled class="form-control" id="slider-snap-value-upper" placeholder="name@example.com" value="<fmt:formatNumber value='100000' pattern='#,###원'/>">
									      <label for="floatingInputGrid">최대가격</label>
									    </div>
										<div id="slider-snap"></div>
									</div>
							</div>
						</div>
					</li>
					<br>
					<br>
					<li>
						<div class = "row top filter">
						<div><h5 style="font-weight: bold">편의 시설</h5></div>
						<br>
						<br>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="WIFI">WI-FI</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="PRINTER">프린터</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="CHAIR_TABLE">의자/테이블</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="SMOKE">흡연장</button>
							</div>
						</div>
						<div class = "row top filter">
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="REST_ROOM">화장실</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="PC">PC/노트북</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="TV">TV/프로젝터</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="WHITE_BOARD">화이트보드</button>
							</div>
						</div>
						<div class = "row top filter">
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="ELEVATOR">엘레베이터</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="PARKING">주차</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="DRINK">음료반입</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="FOOD">음식반입</button>
							</div>
						</div>
						<div class = "row top filter facility">
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="FLOOR">플로어</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="COOK">취사가능</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="PET">애완동반</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="AUDIO">음향장비</button>
							</div>
						</div>
					</li>
					<li>
						<div class = "row top">
							<div class = "col">
								<div class="people-btnGroup">
									<button  id ="filterResetBtn" onclick="">초기화</button>
									<button  id ="filterApplyBtn" onclick="addFilter()">필터 적용하기</button>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div><!-- 인원 -->
</div>
	
	<c:if test="${!empty param.spaceTypeNo }">
		<a href="<c:url value = '/search/map?spaceTypeNo=${param.spaceTypeNo}'/>">
	</c:if>
	<c:if test="${!empty param.spaceName }">
		<a href="<c:url value = '/search/map?spaceName=${param.spaceName}'/>">
	</c:if>
	<button type="button" class="btn btn-outline-dark">지도</button></a>
</div>



<section class = "search-section">
	<div class="container" >
	  <div class="row" id = "data-container">
  </div>
</div>
</section>


<script src="https://cdn.jsdelivr.net/npm/nouislider@15.7.1/dist/nouislider.min.js"></script>
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
		
		$(window).on('scroll', function() {
		    if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
		        loadMoreData();
		    }
		});
		
		$('#filterResetBtn').click(function(){
			$('.filterBtn').removeClass('selected');
		});
		
		$('.filterBtn').click(function(){
			if($(this).hasClass('selected')){
				$(this).removeClass('selected');
			}else{
				$(this).addClass('selected');
			}
		});
});
	var currentPage = 1;
	var page = 1;
	var size = 21;
	var isLoading = false;
	var condition = "";
	var keyword = "";

	if(${!empty param.spaceTypeNo}){
		condition = "spaceTypeNo="+"${param.spaceTypeNo}";
	}else if(${!empty param.spaceName}){
		condition = "spaceName="+"${param.spaceName}";
	}
	
	if(${!empty param.region}){
		condition += "&region="+"${param.region}";
	}
	if(${!empty param.maxPeople}){
		condition += "&maxPeople="+"${param.maxPeople}";
	}
	
	
	var noDataNum = 0;
function loadMoreData() {
    if (isLoading) {
        return;
    }
    
    isLoading = true;

    $.ajax({
        url: '<c:url value="/getSearchData?page='+page+'&size='+size+'&'+condition+'"/>',
        type:'get',
        dataType: 'json',
        success: function(data) {
        	if(data != null){
				makeList(data);
                page++;
			}
        	if(data.length == 0 ){
				if(noDataNum == 0){
					noData();
				}
				noDataNum++;
				return;
        	}
			
        },
        complete: function() {
            isLoading = false;
        }
    });
}
	// Initial data load
	loadMoreData();

	var num =1;
	function makeList(data) {
	    var htmlStr = "";
	    $.each(data, function() {
	    	console.log(data);

	        htmlStr += '<div class="col-sm-4">';
	        htmlStr += '<div class="card" style="width: 18rem;">';
	        htmlStr += '<div id="carouselExample'+num+'" class="carousel slide">';
	        htmlStr += '<div class="carousel-inner">';
	        htmlStr += '<div class="carousel-item active">';
	        htmlStr += '<img src="<c:url value="/images/img_8.jpg"/>" class="d-block w-100" alt="...">';
	        htmlStr += '</div>';
	        htmlStr += '<div class="carousel-item">';
	        htmlStr += '<img src="<c:url value="/images/img_8.jpg"/>" class="d-block w-100" alt="...">';
	        htmlStr += '</div>';
	        htmlStr += '<div class="carousel-item">';
	        htmlStr += '<img src="<c:url value="/images/img_8.jpg"/>" class="d-block w-100" alt="...">';
	        htmlStr += '</div>';
	        htmlStr += '</div>';
	        htmlStr += '<button class="carousel-control-prev" type="button" data-bs-target="#carouselExample'+num+'" data-bs-slide="prev">';
	        htmlStr += '<span class="carousel-control-prev-icon" aria-hidden="true"></span>';
	        htmlStr += '<span class="visually-hidden">Previous</span>';
	        htmlStr += '</button>';
	        htmlStr += '<button class="carousel-control-next" type="button" data-bs-target="#carouselExample'+num+'" data-bs-slide="next">';
	        htmlStr += '<span class="carousel-control-next-icon" aria-hidden="true"></span>';
	        htmlStr += '<span class="visually-hidden">Next</span>';
	        htmlStr += '</button>';
	        htmlStr += '</div>';
	        htmlStr += '<div class="card-body">';
	        htmlStr += '<a href = "<c:url value = "/detail?spaceNum=' + this.SPACE_NUM + '"/>"><h5 class="h5">' + this.SPACE_NAME + '</h5></a>';
	        htmlStr += '<p>(우편) '+this.SPACE_ZIPCODE+',<br> '+this.SPACE_ADDRESS +this.SPACE_ADDRESS_DETAIL +' '+ this.SPACE_LOCATION+ '</p>';
	        htmlStr += '<h5 style="font-weight:bold">'+addComma(this.AVGPRICE)+'원</h5> 평균최대 인원'+this.AVGMAXPEOPLE+' 명';
	        htmlStr += '</div>';
	        htmlStr += '</div>';
	        htmlStr += '</div>';
	        num++;
	    });
	    $('#data-container').append(htmlStr);
	}
	
	function noData(){
		 var htmlStr = "<h1 class='nodata'>표시 할 공간이 없어요</h1>";
		 $('#data-container').append(htmlStr);
		 isLoading = true;
	 }

	 function addComma(value){
		    value = value+"";
	        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        return value; 
	    }
	 
	 
	 function addRegionParam(region){
		 
		 var currentUrl = window.location.pathname; 
		 var currentParam = window.location.search.substring(1);
		 
		 var resultUrl = "";
		 var resultParam = "?";
		 
		 if(${!empty param.region}){
			var tempParam = currentParam.split('&');
			 for(var i = 0; i < tempParam.length; i++){
				 if(tempParam[i].indexOf('region') != -1){
					tempParam[i] = "region=" + region;
				 }
				 if(i > 0){
					 resultParam += "&" + tempParam[i]; 
				 }else{
					 resultParam += tempParam[i]; 
				 }
			 }
			 resultUrl = currentUrl + resultParam;
			 
		 }else{
			 var addRegion = "&region="+region;
			 resultUrl = currentUrl + "?" + currentParam + addRegion;
		 }
		 location.href = resultUrl; 
	 }
	 
	 
	 
	 
	 function addPeopleParam(){
		 var people = document.getElementById('people').value;
		 var currentUrl = window.location.pathname; 
		 var currentParam = window.location.search.substring(1);
		 
		 var resultUrl = "";
		 var resultParam = "?";
		 
		 if(${!empty param.maxPeople}){
			var tempParam = currentParam.split('&');
			 for(var i = 0; i < tempParam.length; i++){
				 if(tempParam[i].indexOf('maxPeople') != -1){
					tempParam[i] = "maxPeople=" + people;
				 }
				 if(i > 0){
					 resultParam += "&" + tempParam[i]; 
				 }else{
					 resultParam += tempParam[i]; 
				 }
			 }
			 resultUrl = currentUrl + resultParam;
			 
		 }else{
			 var addPeople = "&maxPeople="+people;
			 resultUrl = currentUrl + "?" + currentParam + addPeople;
		 }
		 location.href = resultUrl; 	 
	 }
	 

		
//부트스트랩 드롭다운 요소들을 가져옴
var dropdownItems = document.querySelectorAll('.dropdown-menu');

// 각 드롭다운 요소에 클릭 이벤트 리스너 추가
dropdownItems.forEach(function(item) {
  item.addEventListener('click', function(event) {
    event.stopPropagation(); // 클릭 이벤트 전파 중단
  });
});


var snapSlider = document.getElementById('slider-snap');

noUiSlider.create(snapSlider, {
    start: [5000, 300000],
    connect: true,
    range: {
        'min': 5000,
        'max': 300000
    },
	format: {
    	to: (value) => parseFloat(value).toFixed(0),
    	from: (value) => parseFloat(value).toFixed(0)
	},
});

var snapValues = [
	    document.getElementById('slider-snap-value-lower'),
	    document.getElementById('slider-snap-value-upper')
	];

	snapSlider.noUiSlider.on('update', function (values, handle) {
	    snapValues[handle].value = addComma(values[handle])+"원";
	});
	var priceRange = snapValues;

</script>
<%@ include file="/WEB-INF/views/form/userBottom.jsp" %>
