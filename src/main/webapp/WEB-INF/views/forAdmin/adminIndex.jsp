<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"></jsp:include>
<title>관리자 페이지 - 메인</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="../../resources/admin/theme/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../../resources/admin/theme/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="../../resources/admin/theme/assets/vendor/linearicons/style.css">
<link rel="stylesheet"
	href="../../resources/admin/theme/assets/vendor/metisMenu/metisMenu.css">
<link rel="stylesheet"
	href="../../resources/admin/theme/assets/vendor/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css">
<link rel="stylesheet"
	href="../../resources/admin/theme/assets/vendor/chartist/css/chartist.min.css">
<link rel="stylesheet"
	href="../../resources/admin/theme/assets/vendor/chartist-plugin-tooltip/chartist-plugin-tooltip.css">
<link rel="stylesheet"
	href="../../resources/admin/theme/assets/vendor/toastr/toastr.min.css">
<!-- MAIN CSS -->
<link rel="stylesheet"
	href="../../resources/admin/theme/assets/css/main.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet"
	href="../../resources/admin/theme/assets/css/demo.css">
<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">
<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76"
	href="../../resources/admin/theme/assets/img/apple-icon.png">
</head>
<style>
.container {
	width: 100%;
}

#bcolor {
	border: 0px;
	width: 100%;
	height: 100px;
	background-color: #f8f9fa;
}

.navbar-fixed-top {
	border: 0px;
}

#myGardenTitle {
	margin: 0 0 20px 0;
	font-size: 28px;
}

.my {
	background-color: #e8e4f0;
}

#dataTable, th {
	text-align: center;
}

th {
	background-color: #9073c9;
	color: white;
}

.table {
	margin: 0 auto;
	padding: 15px;
}

.pagination .active .page-link {
	background-color: #bcdeb4;
	border: 1px solid #bcdeb4;
	font-weight: bold;
}

.pagination .active .page-link:hover {
	background-color: #66b075;
	border: 1px solid #bcdeb4;
	font-weight: bold;
}

.headerFluid {
	position: fixed !important;
	top: 0;
	left: 0;
	opacity: 0.8;
}

#moneyIcon {
	width: 80px;
}

#moneyDiv {
	height: 100px;
	margin: 0 !important;
	line-height: 50px;
}

.number-chart {
	height: 100%;
	padding: 10px;
}

.mini-stat {
	height: 60px;
	margin: 40px 0 0 0 !important;
}

.cmt{
	font-size:16px !important;
	color: #9073c9;
	
}

.metric-inline:hover{
	cursor: pointer;
	background-color:lightgrey;
	transition-duration:0.5	s;
}

</style>
<body>
	<jsp:include page="/WEB-INF/views/module/fixedHeader.jsp"></jsp:include>
	<div id=bcolor></div>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
		<div class="navbar-btn">
			<button type="button" class="btn-toggle-offcanvas">
				<i class="lnr lnr-menu"></i>
			</button>
		</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="left-sidebar" class="sidebar">
			<button type="button"
				class="btn btn-xs btn-link btn-toggle-fullwidth">
				<span class="sr-only">Toggle Fullwidth</span> <i
					class="fa fa-angle-left"></i>
			</button>
			<div class="sidebar-scroll">
				<div class="user-account">
					<img src="../../resources/admin/theme/assets/img/user.png"
						class="img-responsive img-circle user-photo"
						alt="User Profile Picture" width=150px> <br> <strong>${loginName }</strong>님,
					안녕하세요!
				</div>
				<nav id="left-sidebar-nav" class="sidebar-nav">
				<ul id="main-menu" class="metismenu">
					<li class="active"><a href="adminIndex"><i
							class="lnr lnr-home"></i> <span>전체 보기</span></a></li>
					<li class=""><a href="adminMembers" class="has-arrow"
						aria-expanded="false"><i class="lnr lnr lnr-user"></i> <span>회원
								관리</span></a> <!-- <ul aria-expanded="true">
							<li class=""><a href="#">공유정원 회원</a></li>
							<li class=""><a href="#">비밀정원 회원</a></li>
						</ul> --></li>
					<li class=""><a href="adminStat" aria-expanded="false"><i
							class="lnr lnr-chart-bars"></i> <span>통계</span></a></li>
					<li class=""><a href="#"><i class="lnr lnr-alarm"></i> <span>공지사항</span>
							<span class="badge bg-danger">15</span></a></li>
				</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN CONTENT -->
		<div id="main-content">
			<div class="container-fluid">
				<!-- WEBSITE ANALYTICS -->
				<div class="dashboard-section">
					<div class="section-heading clearfix">
						<h2 class="section-title">
							<i class="fa fa-pie-chart"></i> 수익
						</h2>
					</div>
					<div class="panel-content">
						<div class="row">
							<div class="col-md-3 col-sm-6">
								<div class="number-chart">
									<div id=moneyDiv>
										<img
											src="../../resources/admin/theme/assets/img/money-icon.png"
											id=moneyIcon>
									</div>
									<div class="number moveNum">
										<span><fmt:formatNumber value="${totalSale}"
												pattern="#,###원" /></span> <span>총 판매 금액</span>
									</div>
								</div>
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="number-chart">
									<div class="mini-stat">
										<div id="progress-striped-active"
											class="progress progress-striped active">
											<div class="progress-bar progress-bar-primary"
												data-transitiongoal="${(realSale/totalSale)*100}">
												<fmt:formatNumber value="${realSale/totalSale}"
													pattern=".0%" />
											</div>
										</div>
									</div>
									<div class="number moveNum">
										<span><fmt:formatNumber value="${realSale}"
												pattern="#,###원" /></span> <span>구매 확정</span>
									</div>
								</div>
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="number-chart">
									<div class="mini-stat">
										<div id="progress-striped-active"
											class="progress progress-striped active">
											<div class="progress-bar progress-bar-danger"
												data-transitiongoal="${(totalCancel/totalSale)*100}">
												<fmt:formatNumber value="${totalCancel/totalSale}"
													pattern=".0%" />
											</div>
										</div>
									</div>
									<div class="number">
										<span><fmt:formatNumber value="${totalCancel}"
												pattern="#,###원" /></span> <span>구매 취소</span>
									</div>
								</div>
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="number-chart">
									<div id=moneyDiv>
										<img src="../../resources/admin/theme/assets/img/moneybag.png"
											id=moneyIcon>
									</div>
									<div class="number moveNum">
										<span><fmt:formatNumber value="${realSale*0.1}"
												pattern="#,###원" /></span> <span>수익</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<!-- 인기상품 -->
							<div class="section-heading clearfix">
								<h2 class="section-title">
									<i class="fa fa-heart"></i> 인기 품목
								</h2>
								<div id="demo-donut-chart" class="ct-chart"></div>
							</div>
							<!-- 인기상품 끝 -->
						</div>
						<div class="col-md-6">
							<!-- 방문자 -->
							<div class="panel-content">
								<h2 class="heading">
									<i class="fa fa-square"></i> 방문자
								</h2>
								<ul class="list-unstyled list-referrals">
									<li>
										<p>
											<span class="value">3,454</span><span class="text-muted">여성,
												20대</span>
										</p>
										<div
											class="progress progress-xs progress-transparent custom-color-blue">
											<div class="progress-bar" data-transitiongoal="33"></div>
										</div>
									</li>
									<li>
										<p>
											<span class="value">2,874</span><span class="text-muted">여성,
												30대</span>
										</p>
										<div
											class="progress progress-xs progress-transparent custom-color-purple">
											<div class="progress-bar" data-transitiongoal="28"></div>
										</div>
									</li>
									<li>
										<p>
											<span class="value">2,150</span><span class="text-muted">남성,
												20대</span>
										</p>
										<div
											class="progress progress-xs progress-transparent custom-color-green">
											<div class="progress-bar" data-transitiongoal="21"></div>
										</div>
									</li>
									<li>
										<p>
											<span class="value">1,870</span><span class="text-muted">남성,
												30대</span>
										</p>
										<div
											class="progress progress-xs progress-transparent custom-color-yellow">
											<div class="progress-bar" data-transitiongoal="18"></div>
										</div>
									</li>
								</ul>
							</div>
							<!-- 방문자 끝 -->
						</div>
					</div>
				</div>
			</div>
			<!-- END WEBSITE ANALYTICS -->
			<!-- 수익 통계 -->
			<div class="dashboard-section">
				<div class="section-heading clearfix">
					<h2 class="section-title">
						<i class="fa fa-shopping-basket"></i> 수익 통계
					</h2>
				</div>
				<div class="row">
					<div class="col-md-3">
						<div class="panel-content">
							<h3 class="heading">
								<i class="fa fa-square"></i> 오늘
							</h3>
							<ul class="list-unstyled list-justify large-number">
								<li class="clearfix">Earnings <span>$215</span></li>
								<li class="clearfix">Sales <span>47</span></li>
							</ul>
						</div>
					</div>
					<div class="col-md-9">
						<div class="panel-content">
							<h3 class="heading">
								<i class="fa fa-square"></i> Sales Performance
							</h3>
							<div class="row">
								<div class="col-md-6">
									<table class="table">
										<thead>
											<tr>
												<th>&nbsp;</th>
												<th>Last Week</th>
												<th>This Week</th>
												<th>Change</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th>Earnings</th>
												<td>$2752</td>
												<td><span class="text-info">$3854</span></td>
												<td><span class="text-success">40.04%</span></td>
											</tr>
											<tr>
												<th>Sales</th>
												<td>243</td>
												<td>
													<div class="text-info">322</div>
												</td>
												<td><span class="text-success">32.51%</span></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="col-md-6">
									<div id="chart-sales-performance">Loading ...</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8">
						<div class="panel-content">
							<h3 class="heading">
								<i class="fa fa-square"></i> Recent Purchases
							</h3>
							<div class="table-responsive">
								<table class="table table-striped no-margin">
									<thead>
										<tr>
											<th>Order No.</th>
											<th>Name</th>
											<th>Amount</th>
											<th>Date &amp; Time</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><a href="#">763648</a></td>
											<td>Steve</td>
											<td>$122</td>
											<td>Oct 21, 2016</td>
											<td><span class="label label-success">COMPLETED</span></td>
										</tr>
										<tr>
											<td><a href="#">763649</a></td>
											<td>Amber</td>
											<td>$62</td>
											<td>Oct 21, 2016</td>
											<td><span class="label label-warning">PENDING</span></td>
										</tr>
										<tr>
											<td><a href="#">763650</a></td>
											<td>Michael</td>
											<td>$34</td>
											<td>Oct 18, 2016</td>
											<td><span class="label label-danger">FAILED</span></td>
										</tr>
										<tr>
											<td><a href="#">763651</a></td>
											<td>Roger</td>
											<td>$186</td>
											<td>Oct 17, 2016</td>
											<td><span class="label label-success">SUCCESS</span></td>
										</tr>
										<tr>
											<td><a href="#">763652</a></td>
											<td>Smith</td>
											<td>$362</td>
											<td>Oct 16, 2016</td>
											<td><span class="label label-success">SUCCESS</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="panel-content">
							<h3 class="heading">
								<i class="fa fa-square"></i> Top Products
							</h3>
							<div id="chart-top-products" class="chartist"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- END SALES SUMMARY -->
			<!-- SOCIAL -->
			<div class="dashboard-section no-margin">
				<div class="section-heading clearfix">
					<h2 class="section-title">
						<i class="fa fa-user-circle"></i>주문 관리
					</h2>
				</div>
				<div class="panel-content" id=orderContents>
					<div class="row">
						<div class="col-md-6 col-sm-6" id=deposit>
							<p class="metric-inline">
								<i class="fa fa-bell"></i>+${depositWait }<span>입금 대기</span>
								<i class="fa fa-check-circle cmt"> 입금을 확인해주세요.</i>
							</p>
						</div>
						<div class="col-md-6 col-sm-6" id=shipping>
							<p class="metric-inline">
								<i class="fa fa-truck"></i> +${shippingWait } <span>결제 완료</span>
								<i class="fa fa-check-circle cmt"> 배송을 시작해주세요.</i>
							</p>
						</div>
					</div>
				</div>
			</div>
			<!-- END SOCIAL -->

			<!-- DataTables Example -->
			<div class="dashboard-section">
				<div class="section-heading clearfix">
					<h2 class="section-title">
						<i class="fa fa-user-circle"></i> 회원관리
					</h2>
				</div>
				<div class="table">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>연락처</th>
								<th>가입일자</th>
								<th>IP주소</th>
								<th>등급</th>
								<th>포인트</th>
								<th>성별</th>
								<th>정원 이름</th>
							</tr>
						</thead>
						<tbody>
							<div id=mTable>
								<c:forEach var="tmp" items="${member}">
									<tr>
										<td>${tmp.m_email }</td>
										<td>${tmp.m_name }</td>
										<td>${tmp.m_phone }</td>
										<td>${tmp.m_joindate }</td>
										<td>${tmp.m_ipaddress }</td>
										<td>${tmp.m_grade }</td>
										<td>${tmp.m_point }</td>
										<td>${tmp.m_gender }</td>
										<td>${tmp.m_garden }</td>
									</tr>
								</c:forEach>
							</div>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- END MAIN CONTENT -->
	<div class="clearfix"></div>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script
		src="../../resources/admin/theme/assets/vendor/jquery/jquery.min.js"></script>
	<script
		src="../../resources/admin/theme/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="../../resources/admin/theme/assets/vendor/metisMenu/metisMenu.js"></script>
	<script
		src="../../resources/admin/theme/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script
		src="../../resources/admin/theme/assets/vendor/jquery-sparkline/js/jquery.sparkline.min.js"></script>
	<script
		src="../../resources/admin/theme/assets/vendor/bootstrap-progressbar/js/bootstrap-progressbar.min.js"></script>
	<script
		src="../../resources/admin/theme/assets/vendor/chartist/js/chartist.min.js"></script>
	<script
		src="../../resources/admin/theme/assets/vendor/chartist-plugin-tooltip/chartist-plugin-tooltip.min.js"></script>
	<script
		src="../../resources/admin/theme/assets/vendor/chartist-plugin-axistitle/chartist-plugin-axistitle.min.js"></script>
	<script
		src="../../resources/admin/theme/assets/vendor/chartist-plugin-legend-latest/chartist-plugin-legend.js"></script>
	<script
		src="../../resources/admin/theme/assets/vendor/toastr/toastr.js"></script>
	<script src="../../resources/admin/theme/assets/scripts/common.js"></script>


	<!-- 데이터 테이블용!!! -->
	<!-- Core plugin JavaScript-->
	<script
		src="../../resources/admin/theme/assets/vendor/dataTable/jquery.easing.min.js"></script>
	<!-- Page level plugin JavaScript-->
	<script
		src="../../resources/admin/theme/assets/vendor/dataTable/jquery.dataTables.js"></script>
	<script
		src="../../resources/admin/theme/assets/vendor/dataTable/dataTables.bootstrap4.js"></script>
	<!-- Custom scripts for all pages-->
	<script
		src="../../resources/admin/theme/assets/vendor/dataTable/sb-admin.min.js"></script>
	<!-- Demo scripts for this page-->
	<script
		src="../../resources/admin/theme/assets/vendor/dataTable/datatables-demo.js"></script>
	<script>
		$("#deposit").on("click",function(){
			$("#orderContents").html("");
			//ajax 로 입금확인인 리스트 가져오고 테이블 넣기
		})
	
	
		$(function() {

			// sparkline charts
			var sparklineNumberChart = function() {

				var params = {
					width : '140px',
					height : '30px',
					lineWidth : '2',
					lineColor : '#20B2AA',
					fillColor : false,
					spotRadius : '2',
					spotColor : false,
					minSpotColor : false,
					maxSpotColor : false,
					disableInteraction : false
				};

				$('#number-chart1').sparkline('html', params);
				$('#number-chart2').sparkline('html', params);
				$('#number-chart3').sparkline('html', params);
				$('#number-chart4').sparkline('html', params);
			};

			sparklineNumberChart();

			// 인기상품
			var dataDonut = {
				series : [ '${count[0]}', '${count[1]}', '${count[2]}',
						'${count[3]}', '${count[4]}' ],
				labels : [ '${popular[0].s_p_title}'+"("+${count[0]}+"%)",
							'${popular[1].s_p_title}'+"("+${count[1]}+"%)", 
							'${popular[2].s_p_title}'+"("+${count[2]}+"%)",
							'${popular[3].s_p_title}'+"("+${count[3]}+"%)", 
							'${popular[4].s_p_title}'+"("+${count[4]}+"%)"]
			};
			
			new Chartist.Pie('#demo-donut-chart', dataDonut, {
				height : "270px",
				donut : true,
				donutWidth : 80,
				donutSolid : true,
				startAngle : 270,
				showLabel : true
			});
			
			var labels = [ '${popular[0].s_p_title}',
					'${popular[1].s_p_title}', '${popular[2].s_p_title}',
					'${popular[3].s_p_title}', '${popular[4].s_p_title}' ];

// 			var sum = function(a, b) {
// 				return a + b;
// 			};

// 			new Chartist.Pie('#demo-pie-chart', dataPie, {
// 				height : "270px",
// 				labelInterpolationFnc : function(value, idx) {
// 					var percentage = Math.round(value
// 							/ dataPie.series.reduce(sum) * 100)
// 							+ '%';
// 					return labels[idx] + ' (' + percentage + ')';
// 				}
// 			});

// 			var dataDonut = {
// 				series : [ 20, 10, 30, 40 ]
// 			};

// 			new Chartist.Pie('#demo-donut-chart', dataDonut, {
// 				height : "270px",
// 				donut : true,
// 				donutWidth : 60,
// 				donutSolid : true,
// 				startAngle : 270,
// 				showLabel : true
// 			});

			// stacked bar chart
			var dataStackedBar = {
				labels : [ 'Q1', 'Q2', 'Q3', 'Q4' ],
				series : [ [ 800000, 1200000, 1400000, 1300000 ],
						[ 200000, 400000, 500000, 300000 ],
						[ 100000, 200000, 400000, 600000 ] ]
			};

			new Chartist.Bar('#demo-stackedbar-chart', dataStackedBar, {
				height : "270px",
				stackBars : true,
				axisX : {
					showGrid : false
				},
				axisY : {
					labelInterpolationFnc : function(value) {
						return (value / 1000) + 'k';
					}
				},
				plugins : [ Chartist.plugins.tooltip({
					appendToBody : true
				}), ]
			}).on('draw', function(data) {
				if (data.type === 'bar') {
					data.element.attr({
						style : 'stroke-width: 30px'
					});
				}
			});

			// progress bars
			$('.progress .progress-bar').progressbar({
				display_text : 'none'
			});

			// line chart
			var data = {
				labels : [ 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat' ],
				series : [ [ 200, 380, 350, 480, 410, 450, 550 ], ]
			};

			var options = {
				height : "200px",
				showPoint : true,
				showArea : true,
				axisX : {
					showGrid : false
				},
				lineSmooth : false,
				chartPadding : {
					top : 0,
					right : 0,
					bottom : 30,
					left : 30
				},
				plugins : [ Chartist.plugins.tooltip({
					appendToBody : true
				}), Chartist.plugins.ctAxisTitle({
					axisX : {
						axisTitle : 'Day',
						axisClass : 'ct-axis-title',
						offset : {
							x : 0,
							y : 50
						},
						textAnchor : 'middle'
					},
					axisY : {
						axisTitle : 'Reach',
						axisClass : 'ct-axis-title',
						offset : {
							x : 0,
							y : -10
						},
					}
				}) ]
			};

			new Chartist.Line('#demo-line-chart', data, options);

			// sales performance chart
			var sparklineSalesPerformance = function() {

				var lastWeekData = [ 142, 164, 298, 384, 232, 269, 211 ];
				var currentWeekData = [ 352, 267, 373, 222, 533, 111, 60 ];

				$('#chart-sales-performance').sparkline(
						lastWeekData,
						{
							fillColor : 'rgba(90, 90, 90, 0.1)',
							lineColor : '#5A5A5A',
							width : ''
									+ $('#chart-sales-performance')
											.innerWidth() + '',
							height : '100px',
							lineWidth : '2',
							spotColor : false,
							minSpotColor : false,
							maxSpotColor : false,
							chartRangeMin : 0,
							chartRangeMax : 1000
						});

				$('#chart-sales-performance').sparkline(currentWeekData, {
					composite : true,
					fillColor : 'rgba(60, 137, 218, 0.1)',
					lineColor : '#3C89DA',
					lineWidth : '2',
					spotColor : false,
					minSpotColor : false,
					maxSpotColor : false,
					chartRangeMin : 0,
					chartRangeMax : 1000
				});
			}

			sparklineSalesPerformance();

			var sparkResize;
			$(window).on('resize', function() {
				clearTimeout(sparkResize);
				sparkResize = setTimeout(sparklineSalesPerformance, 200);
			});

			// top products
			var dataStackedBar = {
				labels : [ 'Q1', 'Q2', 'Q3' ],
				series : [ [ 800000, 1200000, 1400000 ],
						[ 200000, 400000, 500000 ], [ 100000, 200000, 400000 ] ]
			};

			new Chartist.Bar('#chart-top-products', dataStackedBar, {
				height : "250px",
				stackBars : true,
				axisX : {
					showGrid : false
				},
				axisY : {
					labelInterpolationFnc : function(value) {
						return (value / 1000) + 'k';
					}
				},
				plugins : [ Chartist.plugins.tooltip({
					appendToBody : true
				}), Chartist.plugins.legend({
					legendNames : [ 'Phone', 'Laptop', 'PC' ]
				}) ]
			}).on('draw', function(data) {
				if (data.type === 'bar') {
					data.element.attr({
						style : 'stroke-width: 30px'
					});
				}
			});

			// notification popup
			toastr.options.closeButton = true;
			toastr.options.positionClass = 'toast-bottom-right';
			toastr.options.showDuration = 1000;
			toastr['info']
					('Hello, welcome to DiffDash, a unique admin dashboard.');

		});

		$(".menuScrollOption").hide();
		$(".clickToClose").hide();
	</script>
</body>
</html>