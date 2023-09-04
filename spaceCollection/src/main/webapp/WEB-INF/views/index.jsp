<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/userTop.jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
*{
font: 'nanum gothic', 맑은 고딕, 한컴돋움, 돋움;
}

.narrow-w.form-search.d-flex.align-items-stretch.mb-3.aos-init.aos-animate {
    margin-top: 20px;
    margin-right: 190px;
}

a.logo.m-0.float-start {
    font-size: 40px;
    font-weight: bolder;
}
#hboldfont{
font-weight: bold;
}
a.btn.btn-primary.py-2.px-3 {
    margin-bottom: 20px;
}

.property-items-container {
    display: flex;
    flex-direction: row; /* Display items in a row */
    justify-content: flex-end; /* Align items to the right */
    gap: 20px; /* Add some spacing between items */
   
}

.img-fluid{
    border-top-left-radius: 1rem;
    border-top-right-radius: 1rem;
    
}
.property-content{
 box-shadow: 5px 5px 15px 10px rgba(0, 0, 0, 0.2) !important;
 padding:3% 6% 0% 6%!important;
 border-bottom-left-radius: 1rem;
 border-bottom-right-radius: 1rem;
 }
.property-item {
    /* Add any specific styles for each property item */
     
}

.icon-star-half-reverse {
        transform: scaleX(-1);
 }
 .nav-bar{
    width: 400px;
    height: 4px;
    background: #ffd014;
    margin-top:15px;
     box-shadow: 0px 7px 10px 5px rgba(0, 0, 0, 0.15) !important;
 }
</style>
   <div class="hero">
      <div class="hero-slide">
         <div class="img overlay" style="background-image: url('images/hero_bg_3.jpg')"></div>
         <div class="img overlay" style="background-image: url('images/hero_bg_2.jpg')"></div>
         <div class="img overlay" style="background-image: url('images/hero_bg_1.jpg')"></div>
      </div>
      
      <div class="container">
         <div class="row justify-content-center align-items-center">
            <div class="col-lg-9 text-center">
               <h1 class="heading" data-aos="fade-up">Space Collection에 오신 것을 환영합니다.</h1>
            </div>
         </div>
      </div>
   </div>

<div class="section">
      <%@ include file="/WEB-INF/views/userMain/userMain.jsp" %>
    </div>
    
   <div class="section">
      <div class="container">
      
	         <div class="row mb-5 align-items-center">
	            <div class="col-lg-6">
	               <h2 class="font-weight-bold heading text-primary mb-4 mb-md-0" id="hboldfont">신규 스페이스 컬렉션</h2>
	            <div class="nav-bar"></div>
	            </div>
	            <div class="col-lg-6 text-lg-end">
	               <p><a href="<c:url value='/search?page=1'/>" target="_blank" class="btn btn-primary text-white py-3 px-4">등록된 공간 전체 보기</a></p>
	            </div>
	         </div>
	         <div class="row">
				<div class="col-12">
					<div class="property-slider-wrap">
						<div class="property-slider">
							<c:forEach var="map" items="${list}">
							  	  <div class="property-item">
							  	  <a href="<c:url value='/detail'/>?spaceNum=${map.SPACE_NUM}" class="img">
										<img src="images/img_1.jpg" alt="Image" class="img-fluid">
									</a>
									<div class="property-content">
										<div class="price mb-2"><span>
										<fmt:formatNumber value="${map.AVGPRICE }" pattern="#,###원" />
										</span></div>
										<div>
											<span class="d-block mb-2 text-black-50">${map.SPACE_TAG}</span>
											<span class="city d-block mb-3">${map.SPACE_ADDRESS}</span>
											<a href="<c:url value='/detail'/>?spaceNum=${map.SPACE_NUM}" class="btn btn-primary py-2 px-3">상세보기</a>
										</div>
									</div>
							  	</div>
					    	</c:forEach>
				    	</div>
				    	 <div id="property-nav" class="controls" tabindex="0" aria-label="Carousel Navigation">
				             <span class="prev" data-controls="prev" aria-controls="property" tabindex="-1">이전</span>
				             <span class="next" data-controls="next" aria-controls="property" tabindex="-1">다음</span>
				       </div> 
			    	</div>
		    	</div>
			</div>
       </div>
     
     </div>

               

   <section class="features-1">
      <div class="container">
         <div class="row">
            <div class="col-6 col-lg-3"  data-aos="fade-up" data-aos-delay="300">
               <div class="box-feature">
                  <span class="flaticon-house"></span>
                  <h3 class="mb-3" id="hboldfont">새로운 공간보기</h3>
                  <p><a href="search?order=spaceRegDate_desc" class="learn-more">Learn More</a></p>
               </div>
            </div>
            <div class="col-6 col-lg-3"  data-aos="fade-up" data-aos-delay="500">
               <div class="box-feature">
                  <span class="flaticon-building"></span>
                  <h3 class="mb-3" id="hboldfont">공간 판매하기</h3>
                  <p><a href="host/index" class="learn-more">Learn More</a></p>
               </div>
            </div>
            <div class="col-6 col-lg-3"  data-aos="fade-up" data-aos-delay="400">
               <div class="box-feature">
                  <span class="flaticon-house-3"></span>
                  <h3 class="mb-3" id="hboldfont">시즌 이벤트</h3>
                  <p><a href="<c:url value='/user/boardList'/>" class="learn-more">Learn More</a></p>
               </div>
            </div>
            <div class="col-6 col-lg-3"  data-aos="fade-up" data-aos-delay="600">
               <div class="box-feature">
                  <span class="flaticon-house-1"></span>
                  <h3 class="mb-3" id="hboldfont">공간 기획전</h3>
                  <p><a href="https://www.spacecloud.kr/focus/25" class="learn-more">Learn More</a></p>
               </div>
            </div>   
         </div>
      </div>
   </section>


<!-- 리뷰 시작 -->
   <div class="section sec-testimonials">
      <div class="container">
      
         <div class="row mb-5 align-items-center">
            <div class="col-md-6">
               <h2 class="font-weight-bold heading text-primary mb-4 mb-md-0" id="hboldfont">생생한 이용자 리뷰</h2>
            </div>
            <div class="col-md-6 text-md-end">
               <div id="testimonial-nav">
                  <span class="prev" data-controls="prev">이전</span>
                  
                  <span class="next" data-controls="next">다음</span>
               </div>
            </div>
         </div>

         <div class="row">
            <div class="col-lg-4">
               
            </div>
         </div>
         
		<div class="testimonial-slider-wrap">
		<div class="testimonial-slider">
			 <c:forEach var="map" items="${map}">
				 <div class="item">
			        <div class="testimonial">
			            <a href="<c:url value='/detail'/>?spaceNum=${map.SPACE_NUM}" class="img">
			                <img src="images/person_1-min.jpg" alt="Image" class="img-fluid w-140 mb-4 rounded">
			                <%-- ${map.IMG_ORIGINAL_NAME} --%>
			            </a>
			            <div class="rate">
			                 <c:forEach begin="1" end="${map.REVIEW_RATE/2 - 1}">
			                    <span class="icon-star text-warning"></span>
			                </c:forEach>
			                <c:choose>
			                    <c:when test="${map.REVIEW_RATE%1 < 1}">
			                        <span class="icon-star-half icon-star-half-reverse text-warning"></span>
			                    </c:when>
			                    <c:otherwise>
			                        <span class="icon-star-empty text-warning"></span>
			                    </c:otherwise>
			                </c:choose> 
								<%-- <c:set var="count" value="0"/>
								<c:forEach var="i" begin="1" end="${reviewMap['REVIEW_RATE'] }">
									<img alt="별.png" src="<c:url value='/images/fullStar.png'/>" id="star">
									<c:set var="count" value="${count+1 }" />
								</c:forEach>
								<c:if test="${reviewMap['REVIEW_RATE']%1 >0 }">
									<img alt="별.png" src="<c:url value='/images/halfStar.png'/>" id="star">
									<c:set var="count" value="${count+1 }" />
								</c:if>
								<c:forEach var="j" begin="${count}" end="4">
									<img alt="별.png" src="<c:url value='/images/emptyStar.png'/>" id="star">
								</c:forEach> --%>
			            </div>
			            <!-- 리뷰 -->
			            <h3 class="h5 text-primary mb-4" style="font-weight: bold;"> ${map.SPACE_NAME}(${map.SD_TYPE})</h3>
			            <blockquote>
			                <p>&ldquo;리뷰내용 ${map.REVIEW_CONTENT }&rdquo;</p>
			            </blockquote>
			            <p class="text-black-50">가격정보(1박 기준) ${map.SD_PRICE }</p>
			        </div>
			    </div>
			</c:forEach>


               <!-- <div class="item">
                  <div class="testimonial">
                     <img src="images/person_2-min.jpg" alt="Image" class="img-fluid rounded-circle w-25 mb-4" id="revimg">
                     <div class="rate">
                        <span class="icon-star text-warning"></span>
                        <span class="icon-star text-warning"></span>
                        <span class="icon-star text-warning"></span>
                        <span class="icon-star text-warning"></span>
                        <span class="icon-star text-warning"></span>
                     </div>
                     <h3 class="h5 text-primary mb-4">Mike Houston</h3>
                     <blockquote>
                        <p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
                     </blockquote>
                     <p class="text-black-50">Designer, Co-founder</p>
                  </div>
               </div> -->
         
         

             <!--   <div class="item">
                  <div class="testimonial">
                     <img src="images/person_3-min.jpg" alt="Image" class="img-fluid rounded-circle w-25 mb-4">
                     <div class="rate">
                        <span class="icon-star text-warning"></span>
                        <span class="icon-star text-warning"></span>
                        <span class="icon-star text-warning"></span>
                        <span class="icon-star text-warning"></span>
                        <span class="icon-star text-warning"></span>
                     </div>
                     <h3 class="h5 text-primary mb-4">Cameron Webster</h3>
                     <blockquote>
                        <p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
                     </blockquote>
                     <p class="text-black-50">Designer, Co-founder</p>
                  </div>
               </div> -->

               <!-- <div class="item">
                  <div class="testimonial">
                     <img src="images/person_4-min.jpg" alt="Image" class="img-fluid rounded-circle w-25 mb-4">
                     <div class="rate">
                        <span class="icon-star text-warning"></span>
                        <span class="icon-star text-warning"></span>
                        <span class="icon-star text-warning"></span>
                        <span class="icon-star text-warning"></span>
                        <span class="icon-star text-warning"></span>
                     </div>
                     <h3 class="h5 text-primary mb-4">Dave Smith</h3>
                     <blockquote>
                        <p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
                     </blockquote>
                     <p class="text-black-50">Designer, Co-founder</p>
                  </div>
               </div> -->

            </div>
         </div>
      </div>
   </div>
<!-- 리뷰 끝 -->


   <div class="section section-15 bg-light">
      <div class="container">
         
	        <div  class="content-center text-center" style= "margin-top: 20px;">
            <div class="row section-counter" var="map" items="${usercount}">
		        <div class="col-4 col-sm-4 col-md-4 col-lg-4" data-aos="fade-up" data-aos-delay="">
		            <div class="counter-wrap mb-5 mb-lg-0">
		                <span class="number"><span class="countup text-primary">${usercount.SPACE_COUNT}</span></span>
		                <span class="caption text-black-50"># 공간 예약 수</span>
		            </div>
		        </div>
		        <div class="col-5 col-sm-6 col-md-6 col-lg-4" data-aos="fade-up" data-aos-delay="400">
		            <div class="counter-wrap mb-5 mb-lg-0">
		                <span class="number"><span class="countup text-primary">${usercount.RESERVATION_COUNT}</span></span>
		                <span class="caption text-black-50"># 공간 예약 사용자</span>
		            </div>
		        </div>
		        <div class="col-5 col-sm-6 col-md-6 col-lg-4" data-aos="fade-up" data-aos-delay="">
		            <div class="counter-wrap mb-5 mb-lg-0">
		                <span class="number"><span class="countup text-primary">${usercount.USER_COUNT}</span></span>
		                <span class="caption text-black-50"># 판매되는 공간</span>
		            </div>
		        </div>
			</div>
			</div>
      
            <div class="row justify-content-center  text-center mb-15" style= "margin-top: 40px;">
            <div class="col-lg-15">
               <h2 class="font-weight-bold heading text-primary mb-4" style= "font-weight: bold;"> SpaceCollection을 선택해주신 많은 고객님들께 감사드립니다. </h2>
               <p class="text-black-50">우리의 다양한 공간 옵션은 회의, 세미나, 워크샵, 파티룸 및 이벤트 등 다양한 목적에 부합하도록 구성되었습니다. 
               <br>당신의 아이디어와 목표를 현실로 이끌어 줄 공간을 찾아보세요. 지금 바로 예약하여 성공적인 첫 걸음을 내딛어보세요.</p>
            </div>
            </div>
         
      </div>
   </div>

   <%@ include file="/WEB-INF/views/form/userBottom.jsp" %>