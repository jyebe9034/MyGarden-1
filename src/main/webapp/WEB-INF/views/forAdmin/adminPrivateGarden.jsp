<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"></jsp:include>
<title>나의 정원 - 관리자 페이지 | 회원관리</title>
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

.headerFluid {
	position: fixed !important;
	top: 0;
	left: 0;
	opacity: 0.8;
}

.ct-start{
	width: 50px !important;
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
					<img src="${profileImg }"
						class="img-responsive img-circle user-photo"
						alt="User Profile Picture" width=150px> <br> <strong>${loginName }</strong>님,
					안녕하세요!
				</div>
				<nav id="left-sidebar-nav" class="sidebar-nav">
				<ul id="main-menu" class="metismenu">
					<li class="active"><a href="adminIndex"> <i
							class="lnr lnr-home"></i><span>전체 보기</span></a></li>
					<li class=""><a href="adminPrivateGarden"> <i
							class="lnr lnr lnr-leaf"></i><span>비밀 정원</span></a></li>
				</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN CONTENT -->
		<div id="main-content">
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
								<th>정원 이름</th>
								<th>정원 생성일</th>
								<th>허브 종류</th>
								<th>온도</th>
								<th>습도</th>
								<th>빛</th>
								<th>상태</th>
								<th>소비여부</th>
							</tr>
						</thead>
						<tbody>
							<div id=mTable>
								<c:forEach var="tmp" items="${list}">
									<tr>
										<td>${tmp.g_email }</td>
										<td>${tmp.g_name }</td>
										<td>${tmp.g_gardenname }</td>
										<td><fmt:formatDate value="${tmp.g_enrolldate }"
												pattern="yyyy-MM-dd" /></td>
										<td>${tmp.g_herb }</td>
										<td>${tmp.g_temper }</td>
										<td>${tmp.g_humid }</td>
										<td>${tmp.g_light }</td>
										<c:choose>
											<c:when test="${tmp.g_process == 'y'}">
												<td>재배 중</td>
											</c:when>
											<c:otherwise>
												<td>재배 완료</td>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${tmp.g_process == 'y'}">
												<td>-</td>
											</c:when>
											<c:otherwise>
												<td>${tmp.g_process}</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</div>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="panel-content">
						<h3 class="section-title">
							<i class="fa fa-leaf"></i> 허브 선호도
						</h3><br>
						<div id="demo-bar-chart" class="ct-chart"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
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
	<!-- Bootstrap core JavaScript-->
	<script
		src="../../resources/admin/theme/assets/vendor/dataTable/jquery.min.js"></script>
	<script
		src="../../resources/admin/theme/assets/vendor/dataTable/bootstrap.bundle.min.js"></script>
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
		$(".menuScrollOption").hide();
		$(".clickToClose").hide();

		var data = {
				labels : ${herbList},
				series : [ ${herbCount} ]
			};

		// line chart
		options = {
			height: "300px",
			showPoint: true,
			axisX: {
				showGrid: false
			},
			lineSmooth: false,
			plugins: [
				Chartist.plugins.tooltip({
					appendToBody: true
				}),
			]
		};

		new Chartist.Bar('#demo-bar-chart', data, options);

	</script>
</body>
</html>