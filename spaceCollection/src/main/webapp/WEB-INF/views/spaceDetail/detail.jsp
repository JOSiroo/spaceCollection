<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/form/userTop.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/spaceDetail.css">
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<title>스페이스 클라우드</title>
<style type="text/css">

#QNAWrite{
    padding: 0% 0% 0% 0%;
    height: 40px;
    float: right;
    width: 20%;
    margin: 0% 0% 2% 82%;
}
.textLimit.limit{
  	 animation: shake 0.5s 0.08s;
  	 color:red !important;
  }
  .modal-content{
  	margin-top: 50% !important;
  }
  .qnaHead{
  	font-size:20px;
  	font-weight: bold;
  	margin-right:79%;
  	margin-bottom:15px;
  }
  .qnaBody{
  	font-size:16px;
  	padding: 1% 5% 0% 5% !important;
  	text-align: left;
  	color:black;
  	margin-bottom:10px;
  }
  
  
@keyframes shake {
  0%, 100% {
    transform: translateX(0);
  }
  10%, 30%, 50%, 70%, 90% {
    transform: translateX(-5px);
  }
  20%, 40%, 60%, 80% {
    transform: translateX(5px);
  }
  
</style>
<section class = "sapceDetailSection">
	<input type="hidden" value="${userId}" id="userId">
	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>


	<div class="hero page-inner overlay" style="background-image: url('images/hero_bg_3.jpg');">

		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
				<!-- 공간명이 들어갈 자리 -->
					<h1 class="heading" data-aos="fade-up">${vo.spaceName }</h1>
					<h2 class="heading" data-aos="fade-up">${vo.spaceIntro }</h2>
					<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
						<ol class="breadcrumb text-center justify-content-center">
						<c:if test="${!empty vo.spaceTag}">
						    <c:forEach items="${fn:split(vo.spaceTag, '/')}" var="tags">
						        <li class="breadcrumb-item active text-white" aria-current="page">#${tags}</li>
						    </c:forEach>
						</c:if>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
<!--  여기까지 이미지 포함 상단 부분  -->

	<div class="section">
		<div class="container">
			<div class="row justify-content-between" >
			<!-- 섹션의 이미지 슬라이드 부분 -->
				<div class="col-lg-7">
				<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
				  <div class="carousel-indicators">
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				  </div>
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="images/img_2.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="images/img_1.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="images/img_3.jpg" class="d-block w-100" alt="...">
				    </div>
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div>
					
				<br>
				<h1>${vo.spaceName }</h1>
				<br>
				<div class="sticky-top">
					<nav class="navbar navbar-expand-lg bg-light bd-highlight sticky-top custom-nav" style="justify-content:center !important; border-bottom : 1px #6d3bff solid;">
					  <div>
					    <div  id="navbarNav">
					      <ul class="nav nav-pills flex-column flex-sm-row bg-light" style="width: 100%">
					        <li class="nav-item p-2 flex-fill bd-highlight">
					          <a class="nav-link" href="javascript:void(0)">공간소개</a>
					        </li>
					        <li class="nav-item p-2 flex-fill bd-highlight">
					          <a class="nav-link" href="javascript:void(0)">시설안내</a>
					        </li>
					        <li class="nav-item p-2 flex-fill bd-highlight">
					          <a class="nav-link" href="javascript:void(0)">유의사항</a>
					        </li>
					        <li class="nav-item p-2 flex-fill bd-highlight">
					          <a class="nav-link" href="javascript:void(0)">환불정책</a>
					        </li>
					        <li class="nav-item p-2 flex-fill bd-highlight">
					          <a class="nav-link" href="javascript:void(0)">Q&A</a>
					        </li>
					        <li class="nav-item p-2 flex-fill bd-highlight">
					          <a class="nav-link" href="javascript:void(0)">이용후기</a>
					        </li>
					      </ul>
					    </div>
					  </div>
					</nav>
				</div>
				<br><br>
				<div class="detail-content">
					<div class = "detail-navTab">
						<h5 >공간 소개</h5>
						<div class = "nav-bar"></div>
						<p>
							${vo.spaceInfo }
						</p>
					</div>
					
					<div  class = "detail-navTab">
						<h5>시설 안내</h5>
						<div class = "nav-bar"></div>
						<ol>
							<c:if test="${!empty vo.spaceFacility }">
								<c:forEach var="facilities" items="${fn:split(vo.spaceFacility, '||')}">
									<li class = "ol-list"> ${facilities}</li>
									<br>
								</c:forEach>
							</c:if>
						</ol>
						
					</div>
					
					<div  class = "detail-navTab">
						<h5>유의사항</h5>
						<div class = "nav-bar"></div>
						<c:if test="${!empty vo.spaceFacility }">
							<ol>
								<c:forEach var="warns" items="${fn:split(vo.spaceWarn, '||')}">
									<li class = "ol-list"> ${warns}</li>
									<br>
								</c:forEach>
							</ol>
						</c:if>
					</div>
					
					<div class = "detail-navTab">
						<h5>환불정책</h5>
						<div class = "nav-bar"></div>
						<c:if test="${!empty refundVo }">
						<c:set var="refund" value="${refundVo}" />
							<ol>
								<li class = "ol-list">7일전 ${refund.refund7Day}</li>
								<br>
								<li class = "ol-list">6일전 ${refund.refund6Day}</li>
								<br>
								<li class = "ol-list">5일전 ${refund.refund5Day}</li>
								<br>
								<li class = "ol-list">4일전 ${refund.refund4Day}</li>
								<br>
								<li class = "ol-list">3일전 ${refund.refund3Day}</li>
								<br>
								<li class = "ol-list">2일전 ${refund.refund2Day}</li>
								<br>
								<li class = "ol-list">1일전 ${refund.refund1Day}</li>
								<br>
								<li class = "ol-list">당일 ${refund.refundDay}</li>
								<br>
							</ol>
						</c:if>
					</div>
					
					
					<div id="map"style="height:500px; border: 1px solid black"></div>
					<!-- 지도 -->
					
					<div class = "detail-navTab">
						<h5 style="display: inline-block;color:#193D76">Q&A &nbsp; ${fn:length(qnaList)} </h5>
						<span style="display: inline-block; font-weight:bold; font-size:17px;color:#193D76">개</span>
						<div class = "nav-bar"></div>
						<div class = 'row'>
							<button type="button" class="btn btn-primary" id = "QNAWrite"data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">
								질문 등록하기
							</button>
							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header" style=" background: #ffd014;">
							        <h1 class="modal-title fs-5" id="exampleModalLabel" style="font-weight: bold; font-size:24px">질문 작성하기</h1>
							        <button type="button" class="btn-close" onclick="resetQna()" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        <form>
							          <div class="mb-3">
							            <label for="message-text" class="col-form-label" style="float:left; font-size:16px;font-weight: bold;color:black; margin-bottom:1%;">
								            질문:
							            </label>
							            <label class = "textLimit" style="float:left; font-size:16px;color:black;margin-left:50%;margin-top:1%;">최대 0 / 200자 제한</label>
							            
							            <textarea class="form-control" id="message-text" rows="10"></textarea>
							          </div>
							        </form>
							        <p style="color:red"> 단, 공간 및 예약에 대한 문의가 아닌 글은 무통보 삭제될 수 있습니다.</p>
							      </div>
							      <div class="modal-footer" style="padding:2% 30% 2% 0%;">
							        <button type="button" class="btn" onclick="resetQna()" style="background: #ffd014;" data-bs-dismiss="modal">취소</button>
							        <button type="button" onclick="QnAWriteBtn()" class="btn" style="background: #193D76; color:white" >등록</button>
							      </div>
							    </div>
							  </div>
							</div>
						</div>
						<div class = "question-box">
						<c:if test="${empty qnaList }">
							<h4>등록된 질문이 없습니다.</h4>
						</c:if>
						<c:if test="${!empty qnaList }">
							<c:forEach var="qna" items="${qnaList }">
								<div>
									<div class="qnaHead"><span>${qna.USER_ID}</span></div>
									<div class="qnaBody"><span>${qna.QNA_CONTENT}</span></div>
									<div style="font-size:14px;margin-right:81%;color:lightgrey;"><span>${qna.QNA_REG_DATE}</span></div>
								</div>
								<hr>
							</c:forEach>
						</c:if>
						</div>
					</div>
					
					<div class = "detail-navTab">
						<h5>이용 후기</h5>
						<div class = "nav-bar"></div>
						<div class = "review-box">
							<h4>등록된 후기가 없습니다</h4>								
						</div>
					</div>
				</div>
			</div>
			<!-- 여기까지 이미지 슬라이드 -->	
				<div class="col-lg-4">
				<!-- 여기부터 이미지 오른쪽 설명 블럭 -->	
					<div style="margin-bottom : 4%; ">
						<h5 style="font-weight: bold;display : inline-block;padding-top:11px;">세부공간 선택</h5>
						<a href = "javascript:void(0)" onclick="zzim()"><div style = "display : inline-block; float : right; margin-right : 1%;padding-top:5px;" >
							<img alt="" id = "zzim" src="<c:url value = '/img/icons/zzim.png'/>" width="35">
						</div></a>
						
						<a href = ""><div style = "display : inline-block; float : right; margin-right : 5%;" >
							<img alt="" src="<c:url value = '/img/icons/report.png'/>" width="41">
						</div></a>
						
						<a href = ""><div style = "display : inline-block; float : right; margin-right : 4.5%;padding-top:3px;" >
							<img alt="" src="<c:url value = '/img/icons/link.png'/>" width="37">
						</div></a>
					</div>			
					<div class="d-block agent-box p-3" style="border: 4px #193D76 solid;  text-align: left;">
					<h3 class="h5 text" style="margin:4% 1% 5% 1%; text-align: center; font-weight: bold">결제후 바로 예약 확정</h3>
					<p class = "tempP">빠르고 확실한 예약을 위해 스페이스 클라우드에서<br>온라인 결제를 진행하세요 :-)</p>
					<hr style = "border-color:#193D76; height: 3px;">
						<ul class = "accordionUl">
						<c:if test="${!empty map }">
							<c:forEach var="detail" items="${map }">
							  <li class = "accordionLi">
							    <button class="button">
							    <input type="hidden" value="${detail.SD_NUM }">
							    	<span>${detail.SD_TYPE}</span> 
							    	<div style="float: right;">
								    	<span class="price mb-2" style= "color:#193D76;">
											 <fmt:formatNumber value="${detail.SD_PRICE}" pattern="₩#,###"/>
										</span>
										<span style= "color:grey; font-weight: 400">/(시간단위)</span>
									</div>
							    </button>
							    <div id="menu2" class="content">
							    <div style="margin-top: 5px">	
									<img src="images/img_1.jpg" alt="Image" class="img-fluid">
								</div>
								<div class="property-item">
								  <div class="property-content">
									<span class="price mb-2" style= "color:#193D76">
										 <fmt:formatNumber value="${detail.SD_PRICE}" pattern="₩#,###"/>
									</span>
									<span>/(시간단위)</span>
									<hr>
									<div>
										<span class="d-block mb-1 text-black" style="font-weight: bold; font-size: 15px">${vo.spaceZipcode } ${vo.spaceAddress } ${vo.spaceAddressDetail }</span>
									<hr>
										<span class="city d-block mb-3">${vo.spaceAddress }, 대한민국</span>
									<hr>
									<span class="d-block mb-1 text-black">
									${vo.spaceInfo }
									</span>
									<hr>
									<span class="tit">공간유형</span>
									<span class="city text-black">${detail.SD_TYPE}</span>
									<hr>
									<span class="tit">공간면적</span>
									<span class="city text-black">${detail.SD_AREA }㎡</span>
									<hr>
									<span class="tit">수용인원</span>
									<span class="city text-black">최소 ${detail.SD_MIN_PEOPLE }명 ~ 최대${detail.SD_MAX_PEOPLE }명</span>
									<hr>
								    <div class = "facility-box" style = "display: inline-block;">
										<c:forEach var="key" items="${detail.keySet()}">
										    <c:if test="${fn:contains(key, 'FAC_')}" >
												<img class = "facility-icon"src="<c:url value='/img/icons/facilityIcons/${key }.png'/>" width="70" height="70" >
										    </c:if>
										</c:forEach>
									</div>
									<div class="specs d-flex mb-4 " style="border-bottom:#6d3bff solid 2px; margin-top:5px"></div>
									</div>
										<span class="city d-block">예약선택</span>
									<hr>
									<ul class = "inAccordionUl">
									 <li class = "inAccordionLi">
									    <button class="inButton">시간 단위 예약하기(최소 ${detail.SD_MIN_TIME}부터)</button>
									    <div class = "inContent" style="width: 100%">
									    <hr>
									    <!-- 시작시 기본 날짜 설정은 value를 이용 -->
										<div>
											 <input type="text" class="datepicker">
											 <input type="hidden" class = 'selectedDate'>
											 <input type="hidden" class = 'calSdNum' value="${detail.SD_NUM }">
											 <input type="hidden" class = 'calSdPrice' value="${detail.SD_PRICE }">
										</div>
									    <hr>
										 <div class="swiper mySwiper" style="visibility:hidden">
										    <div class="swiper-wrapper">
											    <fmt:parseNumber var="openTime" type="number" value="${detail.SD_OPEN_TIME}" />
											    <fmt:parseNumber var="closeTime" type="number" value="${detail.SD_CLOSE_TIME}" />
											    <c:forEach begin="${openTime}" end="${closeTime}" var="i">
										    			<div class="swiper-slide">
										    					<c:if test="${i == 0}">
												    				<p class = "swiper-p">오전</p>
												    				<p class = "swiper-p">${i}</p>
										    					</c:if>
										    					<c:if test="${i == 12}">
												    				<p class = "swiper-p">오후</p>
												    				<p class = "swiper-p">${i}</p>
										    					</c:if>
										    					<c:if test="${i != 0 && i != 12}">
												    				<p class = "swiper-p">&nbsp;</p>
										    						<p class = "swiper-p">${i}</p>
										    					</c:if>
										    				<button class = "swiper-inBox item-${i }th" value="${detail.SD_PRICE }" id="${i}">
										    					<fmt:formatNumber value="${detail.SD_PRICE}" pattern="#,###"/>
									    					</button>
										    			</div>
										     	</c:forEach>
										    </div>
										  </div>
										  <br>
										  	<input type="hidden" class="hiddenPrice"/>
								     	  	<span class="price mb-2 totalPrice" style= "color:#193D76" ></span>
										  <br><br>
										  <button class="btn btn-primary py-2 px-3" onclick="timeTableReset()" style="width:100%">초기화</button>
										  <br><br>
									    <hr>
									    	<span class="price mb-2" style= "color:#193D76" >인원 선택</span>
									    	<br><br>
									    	<div class="input-group mb-3">
	 											<button class="btn btn-outline-secondary peopleMinus" type="button" >&nbsp;-</button>
		  										<input type="text" class="form-control people" disabled aria-label="Example text with button addon" aria-describedby="button-addon1"  value = "1">
		  										<button class="btn btn-outline-secondary peoplePlus" type="button" >+</button>
											</div>
											<input type= "hidden" class="min-people" value="${detail.SD_MIN_PEOPLE }">
											<input type= "hidden" class="max-people" value="${detail.SD_MAX_PEOPLE }">
										    <div style = "padding:1% 3% 1% 3%; text-align: center;">
										    <a href = "javascript:void(0);" style = "text-decoration: none;">
												<div class="payment_type" value="kakaopay" onclick="paymentType('kakaopay')">
													<img alt="" class = "payment_type" src="<c:url value='/img/paymentIcons/kakaoPay.png'/>"width="75"/>
												</div>
											</a>
											
										    <a href = "javascript:void(0);" style = "text-decoration: none;" onclick="paymentType('kcp')">
													<div class="payment_type" value = "kcp">
														<img alt="" class = "payment_type" src="<c:url value='/img/paymentIcons/card.png'/>" width="75" style="border-radius: 1rem"/>
													</div>
											</a>
											</div>
											<hr>
											<div style="text-align: center;">
												<a href="property-single.html" class="btn btn-primary py-2 px-3" data-bs-toggle="modal" data-bs-target="#myModal" style="width: 40%">전화</a>
												<a onclick="requestPay()"  class="btn btn-primary py-2 px-7" style="width: 40%">결제하기</a>
											</div>
										</div>
							  		</li>
							  		</ul>
								  </li>
								  </c:forEach>
							  </c:if>
							</ul>
						</div> 
					</div>
				</div>
				<div class="modal" id = "myModal" tabindex="-1" >
				  <div class="modal-dialog">
				    <div class="modal-content" style = "font-weight : bold">
				      <div class="modal-header">
				        <h4 class="modal-title" >${vo.spaceName}</h5>
				      </div>
				      <div class="modal-body">
				        <p>전화번호 : ${vo.spacePhoneNum }</p>
				      </div>
				      <div class="modal-footer" style = "justify-content: center;">
				        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
			<!-- 여기까지 오른쪽 부분-->				
			</div>
	<!-- 여기까지 섹션-->				
</section>

    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/tiny-slider.js"></script>
    <script src="js/aos.js"></script>
    <script src="js/navbar.js"></script>
    <script src="js/counter.js"></script>
    <script src="js/custom.js"></script>
    <script src="js/spaceDetail.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=daa469d4ff476714bf26432374f5ebff"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
	<script type="text/javascript">
	$(function(){

		$('.peopleMinus').click(function(){
			var people = $(this).siblings('.people');
		    var minPeople = parseInt($(this).parent().siblings('.min-people').val());
		    
		    if(people.val() > minPeople){
		        people.val(parseInt(people.val())-1);
		    } else {
		        alert('예약가능 최소 인원은' + minPeople + '명 입니다');
		    }
		});
		
		$('.peoplePlus').click(function(){
			var people = $(this).siblings('.people');
		    var maxPeople = parseInt($(this).parent().siblings('.max-people').val());
		    if(people.val() < maxPeople ){
		    	people.val(parseInt(people.val())+1);
		    } else {
		        alert('예약가능 최대 인원은' + maxPeople + '명 입니다');
		    }
		});
		
		
		$('.nav-item').click(function(){
			$(this).css('background', '#ffd014');
			$('.nav-item').not($(this)).css('background', 'white');
		})
		
			
			  $(".datepicker").each(function(index, element) {
			  var datepickerId = $(element).data("id");
			  var sdNum = $(this).siblings('.calSdNum'); 
			  var sdPrice = $(this).siblings('.calSdPrice');
			  
			  $(element).datepicker({
			    language: 'ko',
			    inline: true,
			    minDate: new Date(),
			    maxDate: new Date(new Date().setMonth(new Date().getMonth() + 1)),
			    onSelect: function(selectedDates, instance) {
			      console.log("선택한 날짜:", selectedDates);
			      console.log("선택한 데이트피커의 sd_Num:", sdNum.val());
			      $('.selectedDate').val(selectedDates);
			      $('.mySwiper').css('visibility', 'visible');
			      $('.swiper-inBox').removeClass('on');
			      var requestData = {
			                sdNum: sdNum.val(),
			                selectedDates: selectedDates+""
			            };
			      
			      $.ajax({
			    	  url: 'reservation/ajaxSelectRes', // 서버의 엔드포인트 URL
                      method: 'get', // 
                      dataType:'json',
                      data: requestData,
                      success: function(data) {
                          // AJAX 요청이 성공한 경우
                          console.log('data:', data);
                          var begin = parseInt(data.startHour);
                          var end = parseInt(data.endHour);
                          var result = data.result;
                          if(result === 2){
                        	  console.log('예약내역 없음');
                        	  makeTimeTable(result, begin, end, sdNum,sdPrice);                              
                          } else if (result === 1){
							  console.log('예약내역 있음');
                        	  makeTimeTable(result, begin, end, sdNum,sdPrice);                              
                          }
                      },
                      error: function(xhr, status, error) {
                          // AJAX 요청이 실패한 경우
                          console.error('Error:', error);
                      }
			      })
			      
			    }
			  });
			});
		function makeTimeTable(result, begin, end, sdNum, sdPrice){
			console.log("makeTimeTable");
			console.log('sdPrice = '+ sdPrice.val());
			console.log('result = '+ result);
			console.log('begin = '+ begin);
			console.log('end = ' + end);
			console.log('sdNum = ' + sdNum.val());
			var parent = sdNum.closest('.inAccordionLi');
			var times = parent.children('.swiper-inBox');
			
			
			if(result == 1){	//예약내역 있음!
				for(var i = begin; i <= end; i++){
					parent.find('.swiper-inBox.item-'+i+'th').addClass('reserved');
					parent.find('.swiper-inBox.item-'+i+'th').prop('disabled', true);
					parent.find('.swiper-inBox.item-'+i+'th').html('예약됨');
				}	
			}else{
				parent.find('.swiper-inBox').removeClass('reserved');
				parent.find('.swiper-inBox').prop('disabled', false);
				parent.find('.swiper-inBox').html(addComma(sdPrice.val()));
				parent.find('.swiper-inBox').val(sdPrice.val());
			}
		}

	});
	
	
		$('.totalPrice').text("예약 시간을 선택해주세요.");
			$('.swiper-inBox').click(function(){
			   	var result = 0;
			   	var formattedTotalPrice = "";
			   	if($('.swiper-inBox.on').length > 0){
				    $('.swiper-inBox.on').each(function(){
				        result += parseInt($(this).val());
				    });
				    $('.hiddenPrice').val(result);
				    
				    formattedTotalPrice = addComma(result);
				    $('.totalPrice').text("₩" + formattedTotalPrice + "원");
			   	}else{
					$('.totalPrice').text("예약 시간을 선택해주세요.");
				}
			});
	
		function QnAWriteBtn(){
			var qnaContent = document.getElementById('message-text').value;
			var userId = document.getElementById('userId').value;
			var spaceNum = ${vo.spaceNum};
			if(userId == null || userId == ""){
				alert('질문을 하려면 로그인을 해야합니다.')
				return false;
			}
			console.log(qnaContent + ", " + userId + ", " + spaceNum);
			 $.ajax({
				url:"<c:url value='/writeQnA'/>",
				type:"POST",
				dataType:"json",
				data:{
					qnaContent:qnaContent,
					spaceNum:spaceNum
				},
				success:function(rsp){
					if(rsp === 1){
						alert('QnA 등록 완료!');
					}else if(rsp === 0){
						alert('QnA 등록 실패!');
					}
				},
				complete:function(rsp){
					alert(rsp);
				}
			 });
		 }
	
	function resetQna(){
		document.getElementById('message-text').value="";
	}
			
			
			
	 function addComma(value){
		    value = value+"";
	        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        return value; 
	    }
	 
	 
	 
	 var qnaText = document.getElementById('message-text');
	 var textLimit = document.getElementsByClassName('textLimit');
	 	qnaText.addEventListener('input',function(){
	 		if(this.value.length >= 200){
				var truncatedValue = this.value.substring(0, 200); // 200자로 잘라낸 값
		        this.value = truncatedValue;
				textLimit[0].classList.add('limit');
		        textLimit[0].textContent = "최대 200/ 200자 제한";
	 		}else{
	 			textLimit[0].classList.remove('limit');
	 			textLimit[0].textContent="최대 " + this.value.length + "/ 200자 제한";
	 		}
	 });
	 
	</script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도의 중심좌표
	    mapOption = { 
	        center: new kakao.maps.LatLng(${vo.latitude}, ${vo.longitude}), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    }; 
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 지도에 마커를 표시합니다 
		var marker = new kakao.maps.Marker({
		    map: map, 
		    position: new kakao.maps.LatLng(${vo.latitude}, ${vo.longitude})
		});
		
		// 커스텀 오버레이에 표시할 컨텐츠 입니다
		// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
		// 별도의 이벤트 메소드를 제공하지 않습니다 
		var content = '<div class="wrap">' + 
		            '    <div class="info">' + 
		            '        <div class="title">' + 
		            '            ${vo.spaceName}' + 
		            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
		            '        </div>' + 
		            '        <div class="body">' + 
		            '            <div class="img">' +
		            '                <img src="images/img_1.jpg" width="73" height="70">' +
		            '           </div>' + 
		            '            <div class="desc">' + 
		            '                <div class="ellipsis">${vo.spaceAddress} ${vo.spaceAddressDetail}</div>' + 
		            '                <div class="jibun ellipsis">(우) ${vo.spaceZipcode} </div>' + 
		            '                <div><a href="http://localhost:9091/spaceCollection/" target="_blank" class="link">홈페이지</a></div>' + 
		            '            </div>' + 
		            '        </div>' + 
		            '    </div>' +    
		            '</div>';
		
		// 마커 위에 커스텀오버레이를 표시합니다
		// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		var overlay = new kakao.maps.CustomOverlay({
		    content: content,
		    map: map,
		    position: marker.getPosition()       
		});
		
		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		kakao.maps.event.addListener(marker, 'click', function() {
		    overlay.setMap(map);
		});
		
		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay() {
		    overlay.setMap(null);     
		}
	</script>
	
	<script>
	//스와이프 스크립트
    var swiper = new Swiper(".mySwiper", {
      slidesPerView: 6,
      spaceBetween: 0,
      freeMode: true,
      on: {
          transitionEnd: function () {
              // 활성 슬라이드의 인덱스를 가져옵니다.
              const activeSlideIndex = this.activeIndex;

              // 활성 슬라이드에 있는 'on' 클래스를 유지합니다.
              const activeSlideSlots = document.querySelectorAll('.swiper-slide-active .swiper-inBox.on');
              activeSlideSlots.forEach(function (slot) {
                  slot.classList.add('on');
              });
          }
      }
  });
  	</script>
  	<script>
	
		var payType = "";
		var sdNum = "";
		var sdName = "";
	    function paymentType(type){
	        payType = type;
	    }
	    const sdBt = document.querySelectorAll('.button');

	    sdBt.forEach(function(button) {
	        button.addEventListener('click', function(e) {
	            e.preventDefault();

	            const hiddenNum = this.querySelector('input[type="hidden"]');
	            const hiddenName = this.querySelector('span').innerHTML;
	            if (hiddenNum !== null) {
	                const inputValue = hiddenNum.value;
	                sdNum = inputValue;
	                sdName = hiddenName;
	                console.log("Input value: " + inputValue + "," + sdNum + "," + sdName + ", " + hiddenName);
	            } else {
	                console.log("Input element not found.");
	            }
	        });
	    });

      
        var IMP = window.IMP; 
        IMP.init("imp04807210"); 
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;

        
        
        function requestPay() {
            console.log(paymentType);
            console.log($('.hiddenPrice').val());
            
            // 아래 변수들을 선언
            var buyerEmail = "";
            var buyerName = "";
            var buyerTel = "";
            var buyerAddr = "";
            var buyerPostcode = "";
            
			
            $.ajax({
                url: 'guest/getUserInfo',
                method: 'get',
                //dataType: 'json',
                data: "userId=" + $('#userId').val(),
                success: function(rsp) {
                	
                	if(rsp==""){
                		alert('로그인 정보가 옳바르지 않습니다.');
                		return false;
                	}
                	
                    buyerEmail = rsp.userNum;
                    buyerName = rsp.userId;
                    buyerTel = rsp.userHp;
                    buyerAddr = rsp.address + " " + rsp.addressDetail;
                    buyerPostcode = rsp.zipcode;
                    console.log("userid = " + rsp.userId);

                    // $.ajax 요청이 완료된 후에 IMP.request_pay 함수 실행
                    callIMP(buyerEmail, buyerName, buyerTel, buyerAddr, buyerPostcode);
                },
                error: function(xhr, status, error) {
                	alert(status + " : " + error);
                }
            });
        }
		
        
       
        
        function callIMP(buyerEmail, buyerName, buyerTel, buyerAddr, buyerPostcode) {
       		var selectedDate = $('.selectedDate').val();
            var startHour = $('.swiper-inBox.on').first().attr('id');
            var endHour = $('.swiper-inBox.on').last().attr('id');
             
            IMP.request_pay({
                pg: payType,
                pay_method: 'card',
                merchant_uid: ${vo.spaceNum} + "_" + sdNum + new Date().getTime(),
                name: ${vo.spaceNum} + "_" + sdName,
                amount: $('.hiddenPrice').val(),
                custom_data: {
                    START_DAY: selectedDate,
                    START_HOUR: startHour,
                    END_DAY: selectedDate,
                    END_HOUR: endHour,
                    SD_NUM: sdNum,
                    RESERVE_PEOPLE: $('.people').val()
                },
                buyer_email: buyerEmail,
                buyer_name: buyerName,
                buyer_tel: buyerTel,
                buyer_addr: buyerAddr,
                buyer_postcode: buyerPostcode
            }, function(rsp) {
                if (rsp.success) {
                    console.log(rsp.custom_data);
                    console.log(rsp);
                    var msg = '결제가 완료되었습니다.';
                    $.ajax({
                        url: 'reservation/ajaxReservation',
                        method: 'GET',
                        data: rsp,
                        success: function(rsp) {
                            //$('#result').html(data.message);
	                		console.log(rsp);
	        				location.href = "<c:url value='/reservation/showReservation?reservationNum="+rsp+"'/>"
                        },
                        error: function(xhr, status, error) {
                            console.error('Error:', error);
                        }
                    });

                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
	                alert(msg);
                }
            });
        }
        
   	var imgElement = document.getElementById('zzim');
    function zzim(){
    	
		$.ajax({
			url : "<c:url value = '/zzim?spaceNum=${vo.spaceNum}'/>",
			method : 'get',
			success:function(data){
				if(data == 4){
					imgElement.src = '<c:url value="/img/icons/zzim on.png"/>';
				}else if(data == 5){
					imgElement.src = '<c:url value="/img/icons/zzim.png"/>';
				}else if(data == 0){
					alert('로그인 해주세요ㅋ');
					return false;
				}
			},
			error:function(xht, status, error){
				console.error('Error : ', error);
			}
		});
    }
    
    $.ajax({
		url : "<c:url value = '/showZzim?spaceNum=${vo.spaceNum}'/>",
		method : 'get',
		success:function(data){
			if(data == 1){
				imgElement.src = '<c:url value="/img/icons/zzim on.png"/>';
			}else if(data == 2){
				imgElement.src = '<c:url value="/img/icons/zzim.png"/>';
			}
		},
		error:function(xht, status, error){
			console.error('Error : ', error);
		}
	});
    
    </script>
	<script src="<c:url value='/js/datepickerJs/datepicker.js'/>"></script>
	<!--한국어  달력 쓰려면 추가 로드-->
	<script src="<c:url value='/js/datepickerJs/i18n/datepicker.ko.js'/>"></script> 
<%@ include file="../form/userBottom.jsp" %>
