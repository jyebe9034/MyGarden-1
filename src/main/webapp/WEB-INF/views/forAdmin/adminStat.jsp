<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"></jsp:include>
<title>관리자 페이지 - 통계</title>
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
	font-size:28px;
}

.my {
	background-color: #e8e4f0;
}

.headerFluid {
   position: fixed !important;
   top: 0;
   left: 0;
   opacity: 0.8;
}

</style>
<body>
	<jsp:include page="/WEB-INF/views/module/fixedHeader.jsp"></jsp:include>
	<div id=bcolor></div>
	<!-- WRAPPER -->
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
					<li class=""><a href="adminIndex"><i
							class="lnr lnr-home"></i> <span>전체 보기</span></a></li>
					<li class=""><a href="adminMembers" class="has-arrow"
						aria-expanded="false"><i class="lnr lnr lnr-user"></i> <span>회원
								관리</span></a>
<!-- 						<ul aria-expanded="true"> -->
<!-- 							<li class=""><a href="#">공유정원 회원</a></li> -->
<!-- 							<li class=""><a href="#">비밀정원 회원</a></li> -->
<!-- 						</ul></li> -->
					<li class="active"><a href="adminStat" aria-expanded="false"><i
							class="lnr lnr-chart-bars"></i> <span>통계</span></a></li>
					<li class=""><a
						href="#"><i
							class="lnr lnr-alarm"></i> <span>공지사항</span> <span
							class="badge bg-danger">15</span></a></li>
				</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN CONTENT -->
		<div id="main-content">
			<div class="container-fluid">
				<h1 class="sr-only">Dashboard</h1>
				<!-- WEBSITE ANALYTICS -->
				<div class="dashboard-section">
					<div class="section-heading clearfix">
						<h2 class="section-title">
							<i class="fa fa-pie-chart"></i> 전체 통계
						</h2>
					</div>
					<div class="panel-content">
						<div class="row">
							<div class="col-md-3 col-sm-6">
								<div class="number-chart">
									<div class="mini-stat">
										<div id="number-chart1" class="inlinesparkline">23,65,89,32,67,38,63,12,34,22</div>
										<p class="text-muted">
											<i class="fa fa-caret-up text-success"></i> 19% compared to
											last week
										</p>
									</div>
									<div class="number">
										<span>$22,500</span> <span>총 수익</span>
									</div>
								</div>
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="number-chart">
									<div class="mini-stat">
										<div id="number-chart2" class="inlinesparkline">77,44,10,80,88,87,19,59,83,88</div>
										<p class="text-muted">
											<i class="fa fa-caret-up text-success"></i> 24% compared to
											last week
										</p>
									</div>
									<div class="number">
										<span>245</span> <span>판매 금액</span>
									</div>
								</div>
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="number-chart">
									<div class="mini-stat">
										<div id="number-chart3" class="inlinesparkline">99,86,31,72,62,94,50,18,74,18</div>
										<p class="text-muted">
											<i class="fa fa-caret-up text-success"></i> 44% compared to
											last week
										</p>
									</div>
									<div class="number">
										<span>561,724</span> <span>방문자 수</span>
									</div>
								</div>
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="number-chart">
									<div class="mini-stat">
										<div id="number-chart4" class="inlinesparkline">28,44,70,21,86,54,90,25,83,42</div>
										<p class="text-muted">
											<i class="fa fa-caret-down text-danger"></i> 6% compared to
											last week
										</p>
									</div>
									<div class="number">
										<span>372,500</span> <span>후기 수</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<!-- 인기상품 -->
							<div class="panel-content">
								<h2 class="heading">
									<i class="fa fa-square"></i> 인기 상품
								</h2>
								<div id="demo-pie-chart" class="ct-chart"></div>
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
			<!-- CAMPAIGN -->
			<div class="dashboard-section">
				<div class="section-heading clearfix">
					<h2 class="section-title">
						<i class="fa fa-flag-checkered"></i> Campaign
					</h2>
					<a href="#" class="right">View All Campaigns</a>
				</div>
				<div class="panel-content">
					<div class="row margin-bottom-15">
						<div class="col-md-8 col-sm-7 left">
							<div id="demo-line-chart" class="ct-chart"></div>
						</div>
						<div class="col-md-4 col-sm-5 right">
							<div class="row margin-bottom-30">
								<div class="col-xs-4">
									<p class="text-right text-larger">
										<span class="text-muted">Impression</span> <br>
										<strong>32,743</strong>
									</p>
								</div>
								<div class="col-xs-4">
									<p class="text-right text-larger">
										<span class="text-muted">Clicks</span> <br>
										<strong>1423</strong>
									</p>
								</div>
								<div class="col-xs-4">
									<p class="text-right text-larger">
										<span class="text-muted">CTR</span> <br>
										<strong>4,34%</strong>
									</p>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-4">
									<p class="text-right text-larger">
										<span class="text-muted">Cost</span> <br>
										<strong>$42.69</strong>
									</p>
								</div>
								<div class="col-xs-4">
									<p class="text-right text-larger">
										<span class="text-muted">CPC</span> <br>
										<strong>$0,03</strong>
									</p>
								</div>
								<div class="col-xs-4">
									<p class="text-right text-larger">
										<span class="text-muted">Budget</span> <br>
										<strong>$200</strong>
									</p>
								</div>
							</div>
						</div>
					</div>
			</div>
			</div>
			<!-- END CAMPAIGN -->
			<!-- SOCIAL -->
			<div class="dashboard-section no-margin">
				<div class="section-heading clearfix">
					<h2 class="section-title">
						<i class="fa fa-user-circle"></i> Social <span
							class="section-subtitle">(7 days report)</span>
					</h2>
					<a href="#" class="right">View Social Reports</a>
				</div>
				<div class="panel-content">
					<div class="row">
						<div class="col-md-3 col-sm-6">
							<p class="metric-inline">
								<i class="fa fa-thumbs-o-up"></i> +636 <span>LIKES</span>
							</p>
						</div>
						<div class="col-md-3 col-sm-6">
							<p class="metric-inline">
								<i class="fa fa-reply-all"></i> +528 <span>FOLLOWERS</span>
							</p>
						</div>
						<div class="col-md-3 col-sm-6">
							<p class="metric-inline">
								<i class="fa fa-envelope-o"></i> +1065 <span>SUBSCRIBERS</span>
							</p>
						</div>
						<div class="col-md-3 col-sm-6">
							<p class="metric-inline">
								<i class="fa fa-user-circle-o"></i> +201 <span>USERS</span>
							</p>
						</div>
					</div>
				</div>
			</div>
			<!-- END SOCIAL -->
        
		</div>
	</div>
	<!-- END MAIN CONTENT -->
	<div class="clearfix"></div>
	<footer>
	<p class="copyright">
		&copy; 2017 <a href="https://www.themeineed.com" target="_blank">Theme
			I Need</a>. All Rights Reserved.
	</p>
	</footer>
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

	<script>
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
			var dataPie = {
				series : [ 45, 25, 30 ]
			};

			var labels = [ '초당옥수수', '페퍼민트', '토마토' ];
			var sum = function(a, b) {
				return a + b;
			};

			new Chartist.Pie('#demo-pie-chart', dataPie, {
				height : "270px",
				labelInterpolationFnc : function(value, idx) {
					var percentage = Math.round(value
							/ dataPie.series.reduce(sum) * 100)
							+ '%';
					return labels[idx] + ' (' + percentage + ')';
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