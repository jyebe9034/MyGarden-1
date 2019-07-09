<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
.carousel-control-prev-icon, .carousel-control-next-icon {
	margin-top: 60%;
	width: 50px;
	height: 50px;
	border: 8px solid #fff;
	border-radius: 50%;
}

.text-shadow {
	text-shadow: 2px 2px 2px gray;
}

.socialEmo img:hover, .nav-link img:hover, .clickToCloseBtn:hover {
	opacity: 0.7;
}

.clickToClose {
	background: #86B404;
	padding: 10px 0;
	color: #eee;
}

.clickToCloseBtn {
	width: 25px;
	height: 25px;
	right: 50px;
	cursor: pointer;
}

.clickToCloseBtnBorder {
	width: 25px;
	height: 25px;
	right: 50px;
	border: 1px solid #eee;
	border-radius: 50%;
	cursor: pointer;
}
</style>
</head>
<body>
	<!-- script -->
	<script>
		$(function() {
			$("#cart").on("click", function() {
				$(location).attr("href", "cart")
			})
		});
	</script>
	<!-- header -->
	<div
		class="col-lg-12 col-md-12 col-sm-12 col-xs-12 clickToClose text-center">
		<span>회원가입과 함께 <b class="text-body">나만의 정원</b>을 가져 보세요!
		</span> <span class="position-absolute clickToCloseBtnBorder"></span> <span
			class="position-absolute clickToCloseBtn">&Cross;</span>
	</div>
	<jsp:include page="module/fixedHeader.jsp"></jsp:include>
	<!-- 			carousel -->
	<div class="container-fluid my">
		<div class="row my">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-0 p-0 my">
				<div class="bd-example">
					<div id="carouselExampleCaptions" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleCaptions" data-slide-to="0"
								class="active"></li>
							<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
							<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
							<li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item">
								<img
									src="https://i2.wp.com/foxilicious.nl/wp-content/uploads/2018/07/cropped-fresh-green-vegetables-variety-on-rustic-white-background-from-overhead-13.jpg?fit=2000%2C800&ssl=1"
									class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block text-left mb-5">
									<h5>Third slide label</h5>
									<p>Praesent commodo cursus magna, vel scelerisque nisl
										consectetur.</p>
								</div>
							</div>
							<div class="carousel-item">
								<img
									src="http://www.skintherapyrx.com/wp-content/uploads/2018/09/2.jpg"
									class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block text-left mb-5">
									<h5>Second slide label</h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
								</div>
							</div>
							<div class="carousel-item active">
								<img
									src="https://www.eligecuidarte.bmsupermercados.es/wp-content/uploads/2018/01/verduras02-2000.jpg"
									class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block text-left mb-5">
									<h5>First slide label</h5>
									<p>Nulla vitae elit libero, a pharetra augue mollis
										interdum.</p>
								</div>
							</div>
							<div class="carousel-item">
								<img
									src="http://www.wsbentley.co.uk/wp-content/uploads/elementor/thumbs/Mixed-Product-RT-banner-nj5nnpcriv7ujykjbgdolagnr1ftqh1f0vgmkrkev4.jpg"
									class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block text-right mb-5">
									<h5>Third slide label</h5>
									<p>Praesent commodo cursus magna, vel scelerisque nisl
										consectetur.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 	contents -->
	<div class="container my">
		<div class="row text-center mt-5 my">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left my">
				<h2>sort1</h2>
				<hr>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img
					src="https://s3.r29static.com//bin/entry/4db/720x864,85/2175532/could-you-beat-billie-eilish-2175532.webp"
					width="250" height="400">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img
					src="https://s3.r29static.com//bin/entry/4db/720x864,85/2175532/could-you-beat-billie-eilish-2175532.webp"
					width="250" height="400">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img
					src="https://s3.r29static.com//bin/entry/4db/720x864,85/2175532/could-you-beat-billie-eilish-2175532.webp"
					width="250" height="400">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img
					src="https://s3.r29static.com//bin/entry/4db/720x864,85/2175532/could-you-beat-billie-eilish-2175532.webp"
					width="250" height="400">
			</div>
		</div>
		<div class="row text-center mt-4 my">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left my">
				<h2>sort2</h2>
				<hr>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img
					src="https://media.vanityfair.com/photos/5b0ed0614f9cf15aa81ce42b/master/w_1600%2Cc_limit/l-MAG-0618-Summer-Issue-Vanities-Billie-Eilish.jpg"
					width="250" height="400">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img
					src="https://media.vanityfair.com/photos/5b0ed0614f9cf15aa81ce42b/master/w_1600%2Cc_limit/l-MAG-0618-Summer-Issue-Vanities-Billie-Eilish.jpg"
					width="250" height="400">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img
					src="https://media.vanityfair.com/photos/5b0ed0614f9cf15aa81ce42b/master/w_1600%2Cc_limit/l-MAG-0618-Summer-Issue-Vanities-Billie-Eilish.jpg"
					width="250" height="400">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img
					src="https://media.vanityfair.com/photos/5b0ed0614f9cf15aa81ce42b/master/w_1600%2Cc_limit/l-MAG-0618-Summer-Issue-Vanities-Billie-Eilish.jpg"
					width="250" height="400">
			</div>
		</div>
		<div class="row text-center mt-4 my">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left my">
				<h2>sort3</h2>
				<hr>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img
					src="https://air.jordan.com/wp-content/uploads/2018/06/Jordan_Brand_Billie_Eilish_Paris_Fashion_Week_Air_Jordan_3_III_Bordeaux_c-720x1080.jpg"
					width="250" height="400">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img
					src="https://air.jordan.com/wp-content/uploads/2018/06/Jordan_Brand_Billie_Eilish_Paris_Fashion_Week_Air_Jordan_3_III_Bordeaux_c-720x1080.jpg"
					width="250" height="400">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img
					src="https://air.jordan.com/wp-content/uploads/2018/06/Jordan_Brand_Billie_Eilish_Paris_Fashion_Week_Air_Jordan_3_III_Bordeaux_c-720x1080.jpg"
					width="250" height="400">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img
					src="https://air.jordan.com/wp-content/uploads/2018/06/Jordan_Brand_Billie_Eilish_Paris_Fashion_Week_Air_Jordan_3_III_Bordeaux_c-720x1080.jpg"
					width="250" height="400">
			</div>
		</div>
	</div>
	<jsp:include page="module/fixedFooter.jsp"></jsp:include>
</body>
</html>