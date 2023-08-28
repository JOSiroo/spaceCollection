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
    border: 3px solid rgba(0, 0, 0, 0.3);
    border-radius: 0.7rem;
    background-color: white;
    padding: 3% 8% 0% 8%;
    height: 50px;
    width: 98%;
    margin: 0% 1% 2% 1%;
}
.col.region:hover{
	background-color: rgba(255, 208, 20, 0.74);
	border : 3px solid #ffc000;
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
	padding-left: 5%;
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

.menu{
	width:100% !important; 
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
    padding: 4% 0% 10% 0%;
	text-align:center;
	font-weight:bold;
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
    padding: 3% 0% 2% 0%;
    background: rgba(45, 90, 205, 0.95);
    height: 200px;
    color:white;
    font-weight: bold;
    font-size: 23px;
    
    .btn-group{
		width: 28%;
	}
	.dropdown{
		margin-left: 2%;
		width: 26%;
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
	.btn.btn-outline-dark{
		border: lightgrey 2px solid !important;
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
	.order-select{
	    width: 8%;
	    margin-left: 64.2%;
	    padding-top: 36px;
	}
	#order-selectBox{
		margin-bottom:15px;
	}
	.select-option:hover{
		background-color: #ffd014 !important;
	}
	.all-reset{
		display : inline-block;
		text-align:center;
		padding: 0% 0% 0% 0%;
		width: 100%;
	}
	
	#all-resetBtn{
		border: rgba(204,140,40, 0.6) 10px solid;
		font-weight:bold;
		font-size : 15px;
	    background: #ffd014;
		border-radius: 30px;
	    padding-top: 15px;
	    padding-bottom: 15px;
	    padding-left: 30px;
	    padding-right: 30px;
	    border-width: 2px;
	}
	#all-resetBtn:hover{
		border: #ffd014 4px solid;
		background: white;
	}
	
	#headerKeyword{
	    font-weight: bold !important;
	    color: white;
	    border: 2.5px white solid;
	    border-radius: 4rem;
	    background: rgba(255, 255, 255, 0.2);
	    width: 20%;
	    padding: 2% 0% 2% 0%;
	    margin-left: 39%;
        margin-top: 5%;
	}
</style>
<div class="hero page-inner overlay" style="background-image: url('images/collection_bg.png');">
		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
				<!-- 공간명이 들어갈 자리 -->
					<h5 id="headerKeyword"  data-aos="fade-up" >
						워케이션 기획전
					</h5>
					<h1 class="heading" data-aos="fade-up" style="padding-top:8%;">산으로 바다로<br>휴가지에서 출근해요</h1>
					<h5  data-aos="fade-up" style="font-weight: 400 !important; color:white">
						일(work)과 휴가(vacation)를 동시에!<br>
						퇴근 후 서핑, 맛집 탐방 어때요?<br>
						가볍게 노트북만 챙겨오세요
					</h5>
				</div>
			</div>
		</div>
	</div>
<div class = "asd">
여름휴가를 멋지게 보내는 법<br>
전국 워케이션 공간을 만나보세요
</div>
<div class="search-wrapper">
	<h2>
		혼자 오롯이 집중<br>
		코워킹 스페이스 자유석
	</h2>
	<br>
	<p>
		자연과 가까운 낯선 장소에서<br>
		몰입의 즐거움을 느껴보세요<br>
		새로운 영감이 떠오를 거예요!<br>
	</p>
</div>
<section class = "search-section">
	<div class="container" >
	<hr>
	<h2>${collectionName}</h2>
		<div class="row" id = "data-container">
		</div>
  	</div>
</section>


<script src="https://cdn.jsdelivr.net/npm/nouislider@15.7.1/dist/nouislider.min.js"></script>
<script type="text/javascript">

	//ajax이용 무한스크롤 페이징 관련 변수들
	var currentPage = 1;
	var page = 1;
	var size = 21;
	var isLoading = false;
	
	
	//무한스크롤 ajax 함수 영역
	var noDataNum = 0;
function loadMoreData() {
    if (isLoading) {
        return;
    }
    
    isLoading = true;

    $.ajax({
        url: '<c:url value="/getCollection?page='+page+'&size='+size+'&scNum='+${param.scNum}+'"/>',
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
        complete: function(data) {
            isLoading = false;
        }
    });
}
loadMoreData();

	// ajax로 불러온 데이터들 html 생성하는 함수
	var num =1;
	function makeList(data) {
	    var htmlStr = "";
	    $.each(data, function() {

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
	
	//ajax로 불러올 데이터가 없을때 호출하는 함수
	function noData(){
		 var htmlStr = "<h1 class='nodata'>표시 할 공간이 없어요</h1>";
		 $('#data-container').append(htmlStr);
		 isLoading = true;
	 }
	
	//#,### 포멧 적용시키는 정규식 함수
	 function addComma(value){
		    value = value+"";
	        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        return value; 
	    }
	 //html태그(element)의 클래스명에 className이 포함되는지 검사하는 함수
	 function hasClass(element, className) {
		    return element.classList.contains(className);
		}
</script>
<%@ include file="/WEB-INF/views/form/userBottom.jsp" %>