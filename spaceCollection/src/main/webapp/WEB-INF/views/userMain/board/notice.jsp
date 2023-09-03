<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/form/userTop.jsp" %>

<style type="text/css">
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
	input[name=searchKeyword]{
		font-size:25px;
		width: 65%;
		height: 60px;
		margin-left: 3%;
		padding-left:1%;
		border : 3px solid lightgrey;
		border-radius: 0.5rem;
	
		
	}
	input[name=searchKeyword]::placeholder{
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

<script type="text/javascript">
/* $(function() {
	$('#searchBt').click(function() {
		if($('#searchKeyword').val().length<1){
			event.preventDefault();
			$('#confirm1 .modal-body').html("검색어를 입력해주세요.");
			$('#confirm1').modal("show");
		}
	});
	
});	 */

function search(target){
	  // elementary, middle, high
	    var schoolType = $('input[name="schoolType"]:checked').val(); 

	    $.ajax({
	        type: 'GET',
	        dataType: 'JSON',
	        url: `asset/${schoolType}_school.json`, 
	        error: function(err){
	            console.log(err);
	        },
	        success: function(data){
	            var checkWord = $("#schoolInput").val();
	            var schoolList = $("#schoolList");
	            console.log(checkWord);

	            schoolList.empty();
	            data.forEach((school)=>{
	                if(school['name'].includes(checkWord)){
	                    schoolList.append(`<span style="cursor: pointer;" onclick="select(this);"> ${school['name']} </span> <br/>`);                
	                }
	            })
	        }
	    })
	}  
	
function select(target){
    const selected = document.getElementById("selected");
    selected.innerText = target.innerText;
}
</script>

<!-- /** 검색키워드 */ searchVO
	private String searchKeyword = ""; -->
	


<section>

<form class="row gx-3 gy-2 align-items-center" id="boardFrm" method="post" 
	action="<c:url value='/user/notice'/>">
	<div class="reservation-header">
		<div class="search-box">
			<label style="font-size: 18px; font-weight: bold"> 공지 사항 검색</label>
				<input type="text" id = "searchKeyword" name = "searchKeyword" placeholder="검색어를 입력하세요." 
				<c:if  test="${!empty param.keyword}"> value="${param.keyword}"</c:if>> 
			<button class="searchBt" id="searchBt" onclick="searchFunction();">검색</button>
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

</form>
		  
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
