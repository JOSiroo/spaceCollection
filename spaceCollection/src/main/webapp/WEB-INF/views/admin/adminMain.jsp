<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../form/adminTop.jsp"%>
<style type="text/css">
	.dropdown-item{
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	$(function() {
		$.loadReservationCnt();
		$.loadReservationTotalPrice();
		$.loadReservationType();
		
		$('#rd').click(function() {
			$('#intervalStandard').val('');
			$.loadReservationCnt();
		});
		$('#rm').click(function() {
			$('#intervalStandard').val('month');
			$.loadReservationCnt();
		});
		$('#ry').click(function() {
			$('#intervalStandard').val('year');
			$.loadReservationCnt();
		});
		
		$('#md').click(function() {
			$('#intervalStandardPrice').val('');
			$.loadReservationTotalPrice();
		});
		$('#mm').click(function() {
			$('#intervalStandardPrice').val('month');
			$.loadReservationTotalPrice();
		});
		$('#my').click(function() {
			$('#intervalStandardPrice').val('year');
			$.loadReservationTotalPrice();
		});
		
		$('#td').click(function() {
			$('#intervalStandardType').val('');
			$.loadReservationType();
		});
		$('#tm').click(function() {
			$('#intervalStandardType').val('month');
			$.loadReservationType();
		});
		$('#ty').click(function() {
			$('#intervalStandardType').val('year');
			$.loadReservationType();
		});
		
		
	})
	
	$.loadReservationCnt = function() {
		$.ajax({
			url : "<c:url value = '/admin/adminMain/Ajax_getTotalReservation'/>",
			type : 'get',
			data : "intervalStandard=" + $('#intervalStandard').val(),
			dataType: 'json',
			success : function(res) {
				var str1 = "";
				var str2 = "";
				
				str1 += "| "+res.standard;
				
				str2 += "<h6>"+res.precentCnt+" 건</h6>";
				str2 += "<span class='text-muted small pt-2 ps-1'>("+res.str+"</span><span class='text-muted small pt-2 ps-1'>"+res.pastCnt+"건)</span>";
				str2 += "<br>";
				if(res.percentage>0){
					str2 += "<span class='text-success small pt-1 fw-bold'>"+res.percent+"% </span><span class='text-muted small pt-2 ps-1'>increase</span>";
				}else if(res.percentage<0){
					str2 += "<span class='text-danger small pt-1 fw-bold'>"+res.percent+"% </span><span class='text-muted small pt-2 ps-1'>decrease</span>";
				}else{
					str2 += "<span class='small pt-1 fw-bold'>"+res.percent+"% </span><span class='text-muted small pt-2 ps-1'>-</span>";
				}
				
				$('#rStandard').html(str1);
				$('#totalReservationCnt').html(str2);
			},
			error : function(xhr, status, error) {
				alert(status + " : " + error);
				alert(str);
			}
		});
	}
	
	$.loadReservationTotalPrice = function() {
		$.ajax({
			url : "<c:url value = '/admin/adminMain/Ajax_getTotalReservationPrice'/>",
			type : 'get',
			data : "intervalStandard=" + $('#intervalStandardPrice').val(),
			dataType: 'json',
			success : function(res) {
				var str1 = "";
				var str2 = "";
				
				str1 += "| "+res.standard;
				
				str2 += "<h6>"+res.precentTotalPrice+"원</h6>";
				str2 += "<span class='text-muted small pt-2 ps-1'>("+res.str+"</span><span class='text-muted small pt-2 ps-1'>"+res.pastTotalPrice+"원)</span>";
				str2 += "<br>";
				if(res.percentage>0){
					str2 += "<span class='text-success small pt-1 fw-bold'>${pastPrice}% </span><span class='text-muted small pt-2 ps-1'>increase</span>";
				}else if(res.percentage<0){
					str2 += "<span class='text-danger small pt-1 fw-bold'>"+res.percent+"% </span><span class='text-muted small pt-2 ps-1'>decrease</span>";
				}else{
					str2 += "<span class='small pt-1 fw-bold'>"+res.percent+"% </span><span class='text-muted small pt-2 ps-1'>-</span>";
				}
				
				
				$('#mStandard').html(str1);
				$('#totalReservationPrice').html(str2);
			},
			error : function(xhr, status, error) {
				alert(status + " : " + error);
				alert(str);
			}
		});
	}
	
	$.loadReservationType = function() {
		$.ajax({
			url : "<c:url value = '/admin/adminMain/Ajax_getReservationTypeByInterverStandard'/>",
			type : 'get',
			data : "intervalStandard=" + $('#intervalStandardType').val(),
			dataType: 'json',
			success : function(res) {
				var str1 = "";
				var str2 = "";
				
				var dataSet = [];
				console.log(Object.keys(res.list));
				$.each(res.list, function() {
					dataSet.push({
					    name: this.SPACE_TYPE_NAME,
					    value: this.RESERVATIONCNT
					  });
				}) 
					
				str2 += "| "+res.standard;
				$('#tStandard').html(str2);
				if(res.list.length>0){
					echarts.init(document.querySelector("#trafficChart")).setOption({
				           tooltip: {
				             trigger: 'item'
				           },
				           legend: {
				             top: '5%',
				             left: 'center'
				           },
				           series: [{
				             name: 'Access From',
				             type: 'pie',
				             radius: ['40%', '70%'],
				             avoidLabelOverlap: false,
				             label: {
				               show: false,
				               position: 'center'
				             },
				             emphasis: {
				               label: {
				                 show: true,
				                 fontSize: '18',
				                 fontWeight: 'bold'
				               }
				             },
				             labelLine: {
				               show: false
				             },
				             data: dataSet
				           }]
				         });
				}else{
					str1 += "진행된 예약이 없습니다.";
					$('#trafficChart').html(str1);
				}
				
			},
			error : function(xhr, status, error) {
				alert(status + " : " + error);
			}
		});
	}
	 
         
     
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>메인보드</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item active">메인보드</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section dashboard">
		<div class="row">

			<!-- Left side columns -->
			<div class="col-lg-8">
				<div class="row">

					<!-- 일일 예약건수 -->
					<div class="col-xxl-4 col-md-6">
						<div class="card info-card sales-card">
							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu" id="reservationCnt">
								 		<li><a class="dropdown-item" href="#" id="rd">일</a></li>
								    	<li><a class="dropdown-item" href="#" id="rm">월</a></li>
								    	<li><a class="dropdown-item" href="#" id="ry">년</a></li>
									</ul>
							</div>
							<div class="card-body">
								<h5 class="card-title" style="font-weight: bold;">
									예약 건수 <span id="rStandard"><!-- ajax 출력 --></span>
								</h5>
								<div class="d-flex align-items-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-cart"></i>
									</div>
									<input type="hidden" name="intervalStandard"
										id="intervalStandard" value="">
									<div class="ps-3" id="totalReservationCnt">
										<!-- ajax 출력 -->
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- 일일 예약건수 -->

					<!-- 일일 예약금액 -->
					<div class="col-xxl-4 col-md-6">
						<div class="card info-card revenue-card">

							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu">
								 		<li><a class="dropdown-item" href="#" id="md">일</a></li>
								    	<li><a class="dropdown-item" href="#" id="mm">월</a></li>
								    	<li><a class="dropdown-item" href="#" id="my">년</a></li>
									</ul>
							</div>
							<div class="card-body">
								<h5 class="card-title" style="font-weight: bold;">
									예약 금액 <span id="mStandard"><!-- ajax 출력 --></span>
								</h5>

								<div class="d-flex align-items-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-currency-dollar"></i>
									</div>
									<input type="hidden" name="intervalStandardPrice"
										id="intervalStandardPrice" value="">
									<div class="ps-3" id="totalReservationPrice">
										<!-- ajax 출력 -->
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- 일일 예약금액 -->

					<!-- 일일 방문자 수 -->
					<div class="col-xxl-4 col-xl-12">

						<div class="card info-card customers-card">
						

							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
							</div>

							<div class="card-body">
								<h5 class="card-title" style="font-weight: bold;">
									방문자 수 <span>| Today</span>
								</h5>

								<div class="d-flex align-items-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-people"></i>
									</div>
									<div class="ps-3">
										<h6>1244 명</h6>
										<span class="text-danger small pt-1 fw-bold">12%</span> <span
											class="text-muted small pt-2 ps-1">decrease</span>

									</div>
								</div>

							</div>
						</div>

					</div>
					<!-- 일일 방문자 수 -->

					<!-- Reports -->
					<div class="col-12">
						<div class="card">

							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
							</div>

							<div class="card-body">
								<h5 class="card-title" style="font-weight: bold;">
									종합 그래프 <span>/Today</span>
								</h5>

								<!-- Line Chart -->
								<div id="reportsChart"></div>

								<script>
                    document.addEventListener("DOMContentLoaded", () => {
                      new ApexCharts(document.querySelector("#reportsChart"), {
                        series: [{
                          name: 'Sales',
                          data: [31, 40, 28, 51, 42, 82, 56, 40, 52],
                        }, {
                          name: 'Revenue',
                          data: [11, 32, 45, 32, 34, 52, 41, 42, 51]
                        }, {
                          name: 'Customers',
                          data: [15, 11, 32, 18, 9, 24, 11, 21, 34]
                        }],
                        chart: {
                          height: 350,
                          type: 'area',
                          toolbar: {
                            show: false
                          },
                        },
                        markers: {
                          size: 4
                        },
                        colors: ['#4154f1', '#2eca6a', '#ff771d'],
                        fill: {
                          type: "gradient",
                          gradient: {
                            shadeIntensity: 1,
                            opacityFrom: 0.3,
                            opacityTo: 0.4,
                            stops: [0, 90, 100]
                          }
                        },
                        dataLabels: {
                          enabled: false
                        },
                        stroke: {
                          curve: 'smooth',
                          width: 2
                        },
                        xaxis: {
                          type: 'datetime',
                          categories: ["2023-08-01 00:00:000", "2018-09-19T03:00:00.000", "2018-09-19T06:00:00.000", "2018-09-19T09:00:00.000", "2018-09-19T12:00:00.000", 
                        	  "2018-09-19T15:00:00.000", "2018-09-19T18:00:00.000", "2018-09-19T21:00:00.000", "2018-09-20T24:00:00.000"]
                        },
                        tooltip: {
                          x: {
                            format: 'yyyy/MM/dd HH:mm'
                          },
                        }
                      }).render();
                    });
                  </script>
								<!-- End Line Chart -->

							</div>

						</div>
					</div>
					<!-- End Reports -->

					<!-- Recent Sales -->
					<div class="col-12">
						<div class="card recent-sales overflow-auto">

							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
								<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
									<li class="dropdown-header text-start">
										<h6>Filter</h6>
									</li>

									<li><a class="dropdown-item" href="#">Today</a></li>
									<li><a class="dropdown-item" href="#">This Month</a></li>
									<li><a class="dropdown-item" href="#">This Year</a></li>
								</ul>
							</div>

							<div class="card-body">
								<h5 class="card-title">
									Recent Sales <span>| Today</span>
								</h5>

								<table class="table table-borderless datatable">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">Customer</th>
											<th scope="col">Product</th>
											<th scope="col">Price</th>
											<th scope="col">Status</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row"><a href="#">#2457</a></th>
											<td>Brandon Jacob</td>
											<td><a href="#" class="text-primary">At praesentium
													minu</a></td>
											<td>$64</td>
											<td><span class="badge bg-success">Approved</span></td>
										</tr>
										<tr>
											<th scope="row"><a href="#">#2147</a></th>
											<td>Bridie Kessler</td>
											<td><a href="#" class="text-primary">Blanditiis
													dolor omnis similique</a></td>
											<td>$47</td>
											<td><span class="badge bg-warning">Pending</span></td>
										</tr>
										<tr>
											<th scope="row"><a href="#">#2049</a></th>
											<td>Ashleigh Langosh</td>
											<td><a href="#" class="text-primary">At recusandae
													consectetur</a></td>
											<td>$147</td>
											<td><span class="badge bg-success">Approved</span></td>
										</tr>
										<tr>
											<th scope="row"><a href="#">#2644</a></th>
											<td>Angus Grady</td>
											<td><a href="#" class="text-primar">Ut voluptatem id
													earum et</a></td>
											<td>$67</td>
											<td><span class="badge bg-danger">Rejected</span></td>
										</tr>
										<tr>
											<th scope="row"><a href="#">#2644</a></th>
											<td>Raheem Lehner</td>
											<td><a href="#" class="text-primary">Sunt similique
													distinctio</a></td>
											<td>$165</td>
											<td><span class="badge bg-success">Approved</span></td>
										</tr>
									</tbody>
								</table>

							</div>

						</div>
					</div>
					<!-- End Recent Sales -->

					<!-- Top Selling -->
					<div class="col-12">
						<div class="card top-selling overflow-auto">

							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
								<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
									<li class="dropdown-header text-start">
										<h6>Filter</h6>
									</li>

									<li><a class="dropdown-item" href="#">Today</a></li>
									<li><a class="dropdown-item" href="#">This Month</a></li>
									<li><a class="dropdown-item" href="#">This Year</a></li>
								</ul>
							</div>

							<div class="card-body pb-0">
								<h5 class="card-title">
									Top Selling <span>| Today</span>
								</h5>

								<table class="table table-borderless">
									<thead>
										<tr>
											<th scope="col">Preview</th>
											<th scope="col">Product</th>
											<th scope="col">Price</th>
											<th scope="col">Sold</th>
											<th scope="col">Revenue</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row"><a href="#"><img
													src="assets/img/product-1.jpg" alt=""></a></th>
											<td><a href="#" class="text-primary fw-bold">Ut
													inventore ipsa voluptas nulla</a></td>
											<td>$64</td>
											<td class="fw-bold">124</td>
											<td>$5,828</td>
										</tr>
										<tr>
											<th scope="row"><a href="#"><img
													src="assets/img/product-2.jpg" alt=""></a></th>
											<td><a href="#" class="text-primary fw-bold">Exercitationem
													similique doloremque</a></td>
											<td>$46</td>
											<td class="fw-bold">98</td>
											<td>$4,508</td>
										</tr>
										<tr>
											<th scope="row"><a href="#"><img
													src="assets/img/product-3.jpg" alt=""></a></th>
											<td><a href="#" class="text-primary fw-bold">Doloribus
													nisi exercitationem</a></td>
											<td>$59</td>
											<td class="fw-bold">74</td>
											<td>$4,366</td>
										</tr>
										<tr>
											<th scope="row"><a href="#"><img
													src="assets/img/product-4.jpg" alt=""></a></th>
											<td><a href="#" class="text-primary fw-bold">Officiis
													quaerat sint rerum error</a></td>
											<td>$32</td>
											<td class="fw-bold">63</td>
											<td>$2,016</td>
										</tr>
										<tr>
											<th scope="row"><a href="#"><img
													src="assets/img/product-5.jpg" alt=""></a></th>
											<td><a href="#" class="text-primary fw-bold">Sit
													unde debitis delectus repellendus</a></td>
											<td>$79</td>
											<td class="fw-bold">41</td>
											<td>$3,239</td>
										</tr>
									</tbody>
								</table>

							</div>

						</div>
					</div>
					<!-- End Top Selling -->

				</div>
			</div>
			<!-- End Left side columns -->

			<!-- Right side columns -->
			<div class="col-lg-4">

				<!-- Recent Activity -->
				<div class="card">
					<div class="filter">
						<a class="icon" href="#" data-bs-toggle="dropdown"><i
							class="bi bi-three-dots"></i></a>
						<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
							<li class="dropdown-header text-start">
								<h6>Filter</h6>
							</li>

							<li><a class="dropdown-item" href="#">Today</a></li>
							<li><a class="dropdown-item" href="#">This Month</a></li>
							<li><a class="dropdown-item" href="#">This Year</a></li>
						</ul>
					</div>

					<div class="card-body">
						<h5 class="card-title">
							Recent Activity <span>| Today</span>
						</h5>

						<div class="activity">

							<div class="activity-item d-flex">
								<div class="activite-label">32 min</div>
								<i
									class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
								<div class="activity-content">
									Quia quae rerum <a href="#" class="fw-bold text-dark">explicabo
										officiis</a> beatae
								</div>
							</div>
							<!-- End activity item-->

							<div class="activity-item d-flex">
								<div class="activite-label">56 min</div>
								<i
									class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
								<div class="activity-content">Voluptatem blanditiis
									blanditiis eveniet</div>
							</div>
							<!-- End activity item-->

							<div class="activity-item d-flex">
								<div class="activite-label">2 hrs</div>
								<i
									class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>
								<div class="activity-content">Voluptates corrupti
									molestias voluptatem</div>
							</div>
							<!-- End activity item-->

							<div class="activity-item d-flex">
								<div class="activite-label">1 day</div>
								<i
									class='bi bi-circle-fill activity-badge text-info align-self-start'></i>
								<div class="activity-content">
									Tempore autem saepe <a href="#" class="fw-bold text-dark">occaecati
										voluptatem</a> tempore
								</div>
							</div>
							<!-- End activity item-->

							<div class="activity-item d-flex">
								<div class="activite-label">2 days</div>
								<i
									class='bi bi-circle-fill activity-badge text-warning align-self-start'></i>
								<div class="activity-content">Est sit eum reiciendis
									exercitationem</div>
							</div>
							<!-- End activity item-->

							<div class="activity-item d-flex">
								<div class="activite-label">4 weeks</div>
								<i
									class='bi bi-circle-fill activity-badge text-muted align-self-start'></i>
								<div class="activity-content">Dicta dolorem harum nulla
									eius. Ut quidem quidem sit quas</div>
							</div>
							<!-- End activity item-->

						</div>

					</div>
				</div>
				<!-- End Recent Activity -->

				<!-- 공간 타입별 예약 건수 시작 -->
				<div class="card">
					<div class="filter">
						<a class="icon" href="#" data-bs-toggle="dropdown"><i
							class="bi bi-three-dots"></i></a>
						<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
							<li class="dropdown-header text-start">
								<h6>Filter</h6>
							</li>

							<li><a class="dropdown-item" id="td">Today</a></li>
							<li><a class="dropdown-item" id="tm">This Month</a></li>
							<li><a class="dropdown-item" id="ty">This Year</a></li>
						</ul>
					</div>

					<div class="card-body pb-0">
						<h5 class="card-title" style="font-weight: bold;">
							공간 타입별 예약 건수 <span id="tStandard"><!-- Ajax 출력 --></span>
						</h5>
						<input type="hidden" name="intervalStandard"
										id="intervalStandardType" value="">
						<div id="trafficChart" style="min-height: 400px;" class="echart text-center">
						</div>
						<script id="script">
						
						</script>

					</div>
				</div>
				<!-- 공간 타입별 예약 건수 끝 -->

				<!-- News & Updates Traffic -->
				<div class="card">
					<div class="filter">
						<a class="icon" href="#" data-bs-toggle="dropdown"><i
							class="bi bi-three-dots"></i></a>
						<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
							<li class="dropdown-header text-start">
								<h6>Filter</h6>
							</li>

							<li><a class="dropdown-item" href="#">Today</a></li>
							<li><a class="dropdown-item" href="#">This Month</a></li>
							<li><a class="dropdown-item" href="#">This Year</a></li>
						</ul>
					</div>

					<div class="card-body pb-0">
						<h5 class="card-title">
							News &amp; Updates <span>| Today</span>
						</h5>

						<div class="news">
							<div class="post-item clearfix">
								<img src="assets/img/news-1.jpg" alt="">
								<h4>
									<a href="#">Nihil blanditiis at in nihil autem</a>
								</h4>
								<p>Sit recusandae non aspernatur laboriosam. Quia enim
									eligendi sed ut harum...</p>
							</div>

							<div class="post-item clearfix">
								<img src="assets/img/news-2.jpg" alt="">
								<h4>
									<a href="#">Quidem autem et impedit</a>
								</h4>
								<p>Illo nemo neque maiores vitae officiis cum eum turos elan
									dries werona nande...</p>
							</div>

							<div class="post-item clearfix">
								<img src="assets/img/news-3.jpg" alt="">
								<h4>
									<a href="#">Id quia et et ut maxime similique occaecati ut</a>
								</h4>
								<p>Fugiat voluptas vero eaque accusantium eos. Consequuntur
									sed ipsam et totam...</p>
							</div>

							<div class="post-item clearfix">
								<img src="assets/img/news-4.jpg" alt="">
								<h4>
									<a href="#">Laborum corporis quo dara net para</a>
								</h4>
								<p>Qui enim quia optio. Eligendi aut asperiores enim
									repellendusvel rerum cuder...</p>
							</div>

							<div class="post-item clearfix">
								<img src="assets/img/news-5.jpg" alt="">
								<h4>
									<a href="#">Et dolores corrupti quae illo quod dolor</a>
								</h4>
								<p>Odit ut eveniet modi reiciendis. Atque cupiditate libero
									beatae dignissimos eius...</p>
							</div>

						</div>
						<!-- End sidebar recent posts-->

					</div>
				</div>
				<!-- End News & Updates -->

			</div>
			<!-- End Right side columns -->

		</div>
	</section>

</main>
<!-- End #main -->
<!-- End #main -->
<%@ include file="../form/adminBottom.jsp"%>

