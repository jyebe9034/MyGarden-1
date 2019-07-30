<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"></jsp:include>
<title>나의 정원 - 관리자 페이지 | 메인</title>
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
	background-color: #8e74a8;
	color: white;
}

td {
	text-align: center;
}

#orderContents th {
	width: 20% !important;
}

.table {
	margin: 0 auto;
	padding: 15px;
}

.pagination .active .page-link {
	background-color: #bcdeb4;
	border: 1px solid #bcdeb4;
	font-weight: bold;
	color: white;
}

.pagination .active .page-link:hover {
	background-color: #66b075;
	border: 1px solid #bcdeb4;
	font-weight: bold;
}

.back {
	margin-left: 20px;
	font-size: 15px;
	height: 30px;
	border-radius: 5px;
	background-color: white;
	border: 1px solid #66b075;
	color: #66b075;
}

.back:hover {
	background-color: #66b075;
	color: white;
}

h4 {
	color: #28a745;
	font-weight: bold !important;
}

.moneyCheck, .shippingCheck, .subsCheck {
	color: #d6d6d6;
	background-color: white;
	border: 0px;
	font-size: 25px;
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

.cmt {
	font-size: 16px !important;
	color: #9073c9;
}

.metric-inline:hover {
	cursor: pointer;
	background-color: lightgrey;
	transition-duration: 0.5 s;
}

.none {
	margin-left: 50px;
	color: #b093c7;
	font-weight: bold;
	font-size: 16px;
}

.remark {
	text-align: left;
	font-size: 18px;
	color: #8e74a8;
	font-weight: bold;
}

.none span {
	font-size: 23px;
}

#sellCount li {
	margin-bottom: 10px;
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
					<img src="${profileImg }" class="img-responsive img-circle user-photo"
						alt="User Profile Picture" width=150px> <br> <strong>${loginName }</strong>님,
					안녕하세요!
				</div>
				<nav id="left-sidebar-nav" class="sidebar-nav">
				<ul id="main-menu" class="metismenu">
					<li class="active"><a href="adminIndex"> <i
							class="lnr lnr-home"></i><span>전체 보기</span></a></li>
					<li class=""><a href="adminPrivateGarden"> <i
							class="lnr lnr lnr-leaf"></i><span>비밀 정원</span></a></li>
					<li class=""><a href="adminQnACheck"> <i
							class="lnr lnr lnr-leaf"></i><span>문의 글 목록</span></a></li>
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
								<div id="demo-donut-chart" class="ct-chart">
									<br> <br>
								</div>
							</div>
							<p class=col-6 class=none></p>
							<!-- 인기상품 끝 -->
						</div>
						<div class="col-md-6">
							<!-- 판매 건수 -->
							<div class="panel-content" id=sellCount>
								<h2 class="heading">
									<i class="fa fa-square"></i> 판매 건수
								</h2>
								<ul class="list-unstyled list-referrals">
									<c:forEach var="tmp" begin="0" end="4" items="${popular}"
										varStatus="status">
										<li>
											<p>
												<span class="value">${tmp.s_p_title }</span><span
													class="text-muted">${tmp.s_p_count } 건</span>
											</p>
											<div
												class="progress progress-xs progress-transparent custom-color-blue"
												id="count${status.index}">
												<div class="progress-bar"
													data-transitiongoal="${count[status.index] }"></div>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
							<!-- 판매 건수 끝 -->
						</div>
					</div>
				</div>
			</div>
			<div class="dashboard-section no-margin">
				<div class="section-heading clearfix">
					<h2 class="section-title">
						<i class="fa fa-shopping-basket"></i>주문 관리
					</h2>
				</div>
				<div class="panel-content" id=orderContents>
					<div class="row" id=originHide>
						<div class="col-md-6 col-sm-6" id=deposit>
							<p class="metric-inline">
								<i class="fa fa-bell"></i>+${depositWait + subsWait }<span>입금
									대기</span> <i class="fa fa-check-circle cmt"> 입금을 확인해주세요.</i>
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
			<!-- 	orderContents 숨김용 		-->
			<div class="modal fade" tabindex="-1" role="dialog"
				aria-labelledby="mySmallModalLabel" aria-hidden="true" id="mi-modal">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel"></h4>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" id="modal-btn-si">네</button>
							<button type="button" class="btn btn-primary" id="modal-btn-no">아니오</button>
						</div>
					</div>
				</div>
			</div>

			<div id=orderCheck class="col-12">
				<h4>
					<i class="fa fa-bell"> 입금 대기 목록</i>
					<button class=back>
						<i class="lnr lnr-undo"></i>
					</button>
				</h4>
				<div class="table">
					<p class=remark>공유정원 입금 내역</p>
					<c:choose>
						<c:when test="${fn:length(depositCheckList) == 0}">
							<p class=none>
								<span class="lnr lnr-sad"></span> 내역이 없습니다.
							</p>
						</c:when>
						<c:otherwise>
							<table class="table table-bordered" width="100%" cellspacing="0">
								<thead>
									<tr>
										<th>주문번호</th>
										<th>주문자</th>
										<th>연락처</th>
										<th>주문 금액</th>
										<th>입금 확인</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="tmp" items="${depositCheckList}">
										<tr>
											<td class=orNo>${tmp.s_orderno }</td>
											<td>${tmp.s_email }</td>
											<td>${tmp.s_phone }</td>
											<td><fmt:formatNumber value="${tmp.s_p_count}"
													pattern="#,###원" /></td>
											<td><button class=moneyCheck>
													<i class="fa fa-check-circle"></i>
												</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="table">
					<p class=remark>정기구독 입금 내역</p>
					<c:choose>
						<c:when test="${fn:length(subsCheckList) == 0}">
							<p class=none>
								<span class="lnr lnr-sad"></span> 내역이 없습니다.
							</p>
						</c:when>
						<c:otherwise>
							<table class="table table-bordered" width="100%" cellspacing="0">
								<thead>
									<tr>
										<th>주문번호</th>
										<th>주문자</th>
										<th>연락처</th>
										<th>주문 금액</th>
										<th>입금 확인</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="tmp" items="${subsCheckList}">
										<tr>
											<td class=orNo>${tmp.s_orderno }</td>
											<td>${tmp.s_email }</td>
											<td>${tmp.s_phone }</td>
											<td><fmt:formatNumber value="${tmp.s_p_price}"
													pattern="#,###원" /></td>
											<td><button class=subsCheck>
													<i class="fa fa-check-circle"></i>
												</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<div id=shippingCheck class="col-12">
				<h4>
					<i class="fa fa-truck"> 배송 대기 목록</i>
					<button class=back>
						<i class="lnr lnr-undo"></i>
					</button>
				</h4>
				<c:choose>
					<c:when test="${fn:length(shippingCheckList) == 0}">
						<p class=none>
							<span class="lnr lnr-sad"></span> 내역이 없습니다.
						</p>
					</c:when>
					<c:otherwise>
						<div class="table">

							<table class="table table-bordered" width="100%" cellspacing="0">
								<thead>
									<tr>
										<th>주문번호</th>
										<th>주문자</th>
										<th>연락처</th>
										<th>주문 금액</th>
										<th>배송 확인</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="tmp" items="${shippingCheckList}">
										<tr>
											<td class=orNo>${tmp.s_orderno }</td>
											<td>${tmp.s_email }</td>
											<td>${tmp.s_phone }</td>
											<td><fmt:formatNumber value="${tmp.s_p_count}"
													pattern="#,###원" /></td>
											<td><button class=shippingCheck>
													<i class="fa fa-check-circle"></i>
												</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
					</c:otherwise>
				</c:choose>
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
		
	for(var i=0; i < ${fn:length(count)}; i++){
		if(i==1){
			$("#count"+i).attr("class","progress progress-xs progress-transparent custom-color-green");
		}else if(i==2){
			$("#count"+i).attr("class","progress progress-xs progress-transparent custom-color-yellow");
		}else if(i==3){
			$("#count"+i).attr("class","progress progress-xs progress-transparent custom-color-purple");
		}else if(i==4){
			$("#count"+i).attr("class","progress progress-xs progress-transparent custom-color-orange");
		}
		}
		
		$("#orderCheck").hide();
		$("#deposit").on("click",function(){
			$("#orginHide").hide();
			$("#orderContents").html($("#orderCheck").html());
		})
		
		$(document).on("click",".moneyCheck",function(){
			var no = $(this).parent().parent().children('.orNo').text();
			confirm('주문번호 '+no+'의 입금을 확인 하시겠습니까?');
			$.ajax({
				url:"moneyStatChange",
				data: {
					"no":no
						},
				type:"post"
			}).done(function (resp) {
				$(".moneyCheck").each(function (i,item) {
					var order = $(this).parent().parent().children('.orNo').text();
					var no = resp.orderNo;
					if(order==no && resp.result>0){
						$(this).css("color","#66b075");
					}
				})
				})		
			})
			
			var modalConfirm = function(callback){
 
  $("#modal-btn-si").on("click", function(){
    callback(true);
    $("#mi-modal").modal('hide');
  });
  
  $("#modal-btn-no").on("click", function(){
    callback(false);
    $("#mi-modal").modal('hide');
  });
};

modalConfirm(function(confirm){
  if(confirm){
    //Acciones si el usuario confirma
    $("#result").html("CONFIRMADO");
  }else{
    //Acciones si el usuario no confirma
    $("#result").html("NO CONFIRMADO");
  }
});
		
		$(document).on("click",".subsCheck",function(){
			
			var no = $(this).parent().parent().children('.orNo').text();
			  $("#btn-confirm").on("click", function(){
				    $("#mi-modal").modal('show');
				  });

			//confirm('주문번호 '+no+'의 입금을 확인하시겠습니까?');
			$.ajax({
				url:"subscribeStatChange",
				data: {
					"no":no
						},
				type:"post"
			}).done(function (resp) {
				$(".subsCheck").each(function (i,item) {
					var order = $(this).parent().parent().children('.orNo').text();
					var no = resp.orderNo;
					if(order==no && resp.result>0){	
						$(this).css("color","#66b075");
					}
				})
				})		
			})
		
		$("#shippingCheck").hide();
		$("#shipping").on("click",function(){
			$("#orginHide").hide();
			$("#orderContents").html($("#shippingCheck").html());
		})
		$(document).on("click",".shippingCheck",function(){
			var no = $(this).parent().parent().children('.orNo').text();
			confirm('주문번호 '+no+'의 배송을 시작하시겠습니까?');
			$.ajax({
				url:"shippingStatChange",
				data: {
					"no":no
						},
				type:"post"
			}).done(function (resp) {
				$(".shippingCheck").each(function (i,item) {
					var order = $(this).parent().parent().children('.orNo').text();
					var no = resp.orderNo;
					if(order==no && resp.result>0){	
						$(this).css("color","#66b075");
					}
				})
				})		
			})
		
		$(document).on("click",".back",function(){
			 location.reload(true);
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

			if(${fn:length(count)==0}){
				$("#demo-donut-chart").hide();
				$("#sellCount").hide();
				$(".none").html('<span class="lnr lnr-sad"></span>  회원들의 구매내역이 없습니다.');
			}
			
			var dataDonut = {
				series : ${count},
				labels : ${popularProduct}
			};
			
			new Chartist.Pie('#demo-donut-chart', dataDonut, {
				height : "270px",
				donut : true,
				donutWidth : 80,
				donutSolid : true,
				startAngle : 270,
				showLabel : true
			});
			
			
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
			toastr.options.positionClass = 'toast-bottom-left';
			toastr.options.showDuration = 1000;
			toastr['info']
					("'나의 정원' 관리자 페이지입니다.");

		});

		$(".menuScrollOption").hide();
		$(".clickToClose").hide();
	</script>
</body>
</html>