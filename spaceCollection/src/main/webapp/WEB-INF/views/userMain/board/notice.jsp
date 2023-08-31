<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/userTop.jsp" %>
<style type="text/css">
	/* *{
	font-family: NanumBarunGothic,"나눔바른고딕",
	NanumGothic,"돋움",Dotum,Helvetica,"Apple SD Gothic Neo",Sans-serif!important;
	} */
	
	.reservation-header{
		margin-top :120px;
		padding:5% 16% 5% 16%;
	}
	.search-box{
		border : 5px solid #193D76;
		border-radius : 1rem;
		padding: 4% 4% 4% 4%;
		color: transparent;
 		text-shadow: 0 0 0 black;
		
	}
	input[name=reservationInfo]{
		font-size:25px;
		width: 65%;
		height: 60px;
		margin-left: 3%;
		padding-left:1%;
		border : 3px solid lightgrey;
		border-radius: 0.5rem;
	
		
	}
	input[name=reservationInfo]::placeholder{
		color:lightgrey;
		font-weight: bold;
		font-size: 18px;
		
	}
	.searchBt{
		border: none;
		width: 10%;
		padding: 1.3% 0% 1% 0%;
		margin-bottom:1%;
		margin-left:4%;
		color: white;
		font-weight: bold;
		background: #ffd014;
		font-size: 20px;
		caret-color:none;
		color: transparent;
 		text-shadow: 0 0 0 black;
		border-radius: 1rem;
	}
	.orderSelector{
		width: 100%;
	}
	.statusSelector{
		width: 100%;
	}
	.calendarBtn{
		width: 80%;
		padding:4% 0% 4% 0%;
		border:none;
		background: #ffd014;
		color: black;
		font-size:18px;
		font-weight: bold;
		border-radius: 1rem;
	}
	.row{
		margin-top:2%;
		color: transparent;
 		text-shadow: 0 0 0 black;
	}
	select{
		height: 45px;
		border: lightgrey solid 2px;
		padding:0% 0% 0% 4%;
		border-radius: 1rem;
	}
	.reservationData{
		border: 3px solid lightgrey;
	}
	.row.dataTitle{
		/*border: 2px solid lightgrey;*/
		padding:1% 0% 1% 0%;
		margin-bottom:2%;
		font-size:16px;
		font-weight: bold;
	}
	.row.data{
		border: 2px solid lightgrey;
		padding:0% 2% 0% 2%;
		margin-top:0;
		height: 70px;
		font-size:16px;
		font-weight: bold;
	}
	.row.data .col-1{
		padding:1.8% 0% 0% 0%;
	}
	.row.data .col-2{
		padding:1.8% 0% 0% 0%;
	}
	.row.data .col-4{
		padding:1.8% 0% 0% 0%;
	}
	
	
	.checkReservation{
		border : none;
		border-radius: 0.5rem;
		background : #ffd014;
		width:100%;
		padding: 0% 0% 0% 0%;
		height: 30px;
		
	}
	.pageBox{
		width:20%;
		padding: 3% 47% 0% 47%;	
	}
	/* h2.accordion-header {
	    border-top: 0.5px solid #193D76;
	} */
	div#accordionFlushExample {
    /* margin-top: 30px; */
	}
	h2.accordion-header {
    background-color: #93c8d8;
    /* border-top: 1px solid #193D76;
    border-bottom: 1px solid #193D76; */
	}
	button.accordion-button.collapsed {
	}
	#accordionFlushExample{
	
	}
	div#accordionFlushExample {
    align-content: center;
	}
	.divBox2 {
	border-top: 2.5px solid #656565;
    border-bottom: 2.5px solid #656565;
    margin-top: 40px;
    width: 90%;
    margin-left: 60px;
    background-color: #656565;
	}
	span#span1 {
    font-weight: bold;
	}
	span#span2 {
    margin-left: 60px;
	}
	.search-box {
    text-align: center;
	}
	.accordion-body {
    border: 30px solid #ffffff;
    }
</style>


<section>
	<div class="reservation-header">
		<div class="search-box">
			<label style="font-size: 18px; font-weight: bold"> 공지 사항 검색</label>
			<!-- https://www.spacecloud.kr/board/notice?page=1&q=tlwms -->
			<input type="text" id = "searchKeyword" name = "reservationInfo" placeholder="검색어를 입력하세요."
				<c:if test="${!empty param.keyword}"> value="${param.keyword}"</c:if>>  
			<button class="searchBt" onclick="search()">검색</button>
		</div>
	
<div class="divBox2">
<c:forEach var="item" items="${list}" varStatus="loop">
    <div class="accordion accordion-flush" id="accordionFlushExample">
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#flush-collapse${loop.index}" aria-expanded="false"
                        aria-controls="flush-collapse${loop.index}"
                        style="background-color: ${loop.index % 2 == 0 ? '#eef1f3' : 'white'};">
                    <span id="span1">[ 공지사항 ]</span><span id="span2">${item.boardTitle}</span>
                </button>
            </h2>
            <div id="flush-collapse${loop.index}" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    ${item.boardContent}
                </div>
            </div>
        </div>
    </div>
</c:forEach>
</div>
		  
		  <!-- <div class="accordion-item">
		    <h2 class="accordion-header">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
		      data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
		       <span>[취소]</span><p>&nbsp 천재지변/감염병으로 인한 예약취소는 어떻게 하나요?
		      </button>
		    </h2>
		    <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body">
		       <ul>
		       <li>천재지변(기상악화), 법정 감염병 등 불가항력적인 사유로 제휴점 이용이 불가할 경우 고객행복센터로 예약내역 및 증빙서류(결항확인서, e-티켓, 진단확인서 등)를 보내주시면 확인 후 예약취소 가능 여부를 확인해 드립니다.</li>
		        <br><li>다만, 당사는 판매 중개 플랫폼의 입장으로 제휴점에 대하여 취소/환불을 강제할 수 없어 각 제휴점의 규정에 근거하여 상황에 따라 수수료가 발생하거나 취소가 어려울 수 있는 점 양해 부탁드립니다.</li>
		        </ul>
		       </div>
		    </div>
		  </div> -->
		  
		
		<div class="pageBox">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			    <li class="page-item">
			      <a class="page-link" id="previous" href="<c:url value='/host/reservation?page=${param.page-1}'/>" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <li class="page-item">
			      <a class="page-link" id="next" href="<c:url value='/host/reservation?page=${param.page+1}'/>" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/form/userBottom.jsp" %>

<script type="text/javascript">



</script>