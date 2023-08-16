<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/userTop.jsp" %>


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
</style>

   <div class="hero">

      <div class="hero-slide">
         <div class="img overlay" style="background-image: url('images/hero_bg_3.jpg')"></div>
         <div class="img overlay" style="background-image: url('images/hero_bg_2.jpg')"></div>
         <div class="img overlay" style="background-image: url('images/hero_bg_1.jpg')"></div>
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

<div class="searchform">
      <%@ include file="/WEB-INF/views/userMain/userMain.jsp" %>
    </div>

   <div class="section">
      <div class="container">
      
         <div class="row mb-5 align-items-center">
            <div class="col-lg-6">
               <h2 class="font-weight-bold heading text-primary mb-4 mb-md-0" id="hboldfont">신규 스페이스 컬렉션</h2>
            </div>
            <div class="col-lg-6 text-lg-end">
               <p><a href="#" target="_blank" class="btn btn-primary text-white py-3 px-4">등록된 공간 전체 보기</a></p>
            </div>
         </div>
         
         
    <div class="row">
    <div class="col-12">
       <div class="property-slider-wrap">
          <div class="property-slider">
                     
            <div class="property-item">
	          	  <c:if test="${empty list}">
				    <div class="line">해당하는 상품이 없습니다.</div>
					</c:if>
					<c:if test="${!empty list}">
					    <!-- 반복 시작 -->
					    <c:forEach var="vo" items="${list}">
					        <div class="property-item">
					            <a href="<c:url value='/detail'/>?spaceNum=${vo.spaceNum}" class="img">
					                <img src="<c:url value='images/img_1.jpg'/>" alt="Image" class="img-fluid">
					                <div class="property-content">
					                    <div class="price mb-2"><span>${vo.spaceName}</span></div>
					                    <div>
					                        <span class="d-block mb-2 text-black-50">${vo.spaceTag}</span>
					                        <span class="city d-block mb-3">${vo.spaceAddress}</span>
					                        <a href="property-single.html" class="btn btn-primary py-2 px-3">상세보기</a>
					                    </div>
					                </div>
					            </a>
					        </div>
					    </c:forEach>
					    <!-- 반복 끝 -->
					</c:if>
            </div>
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
                  <p><a href="search" class="learn-more">Learn More</a></p>
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
                  <p><a href="https://www.spacecloud.kr/focus/24" class="learn-more">Learn More</a></p>
               </div>
            </div>
            <div class="col-6 col-lg-3"  data-aos="fade-up" data-aos-delay="600">
               <div class="box-feature">
                  <span class="flaticon-house-1"></span>
                  <h3 class="mb-3" id="hboldfont">시즌 공간 기획전</h3>
                  <p><a href="https://www.spacecloud.kr/event/2" class="learn-more">Learn More</a></p>
               </div>
            </div>   
         </div>
      </div>
   </section>


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
               <div class="item">
                  <div class="testimonial">
                     <img src="images/person_1-min.jpg" alt="Image" class="img-fluid  w-140 mb-4 rounded">
                     <div class="rate">
                        <span class="icon-star text-warning"></span>
                        <span class="icon-star text-warning"></span>
                        <span class="icon-star text-warning"></span>
                        <span class="icon-star text-warning"></span>
                        <span class="icon-star text-warning"></span>
                     </div>
                     
                     <!-- 리뷰 -->
                     <h3 class="h5 text-primary mb-4" >공간이름</h3>
                     <blockquote>
                        <p>&ldquo;리뷰내용&rdquo;</p>
                     </blockquote>
                     <p class="text-black-50">가격정보(시간)</p>
                  </div>
               </div>

               <div class="item">
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
               </div>

               <div class="item">
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
               </div>

               <div class="item">
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
               </div>

            </div>
         </div>
      </div>
   </div>



   <div class="section section-15 bg-light">
      <div class="container">
         
      <div id="cccc" style="padding-left: 113px;">
         <div class="row section-counter ">
            <div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
               <div class="counter-wrap mb-5 mb-lg-0">
                  <span class="number"><span class="countup text-primary">3298</span></span>
                  <span class="caption text-black-50"># 누적 공간 구매 사용자</span>
               </div>
            </div>
            <div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="400">
               <div class="counter-wrap mb-5 mb-lg-0">
                  <span class="number"><span class="countup text-primary">2181</span></span>
                  <span class="caption text-black-50"># 누적 공간 판매 사용자</span>
               </div>
            </div>
            <div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="500">
               <div class="counter-wrap mb-5 mb-lg-0">
                  <span class="number"><span class="countup text-primary">9316</span></span>
                  <span class="caption text-black-50"># 누적 공간 사용자</span>
               </div>
            </div>
            <div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="600">
               <div class="counter-wrap mb-5 mb-lg-0">
                  <span class="number"><span class="countup text-primary">7191</span></span>
                  <span class="caption text-black-50"># 판매되는 공간 수</span>
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