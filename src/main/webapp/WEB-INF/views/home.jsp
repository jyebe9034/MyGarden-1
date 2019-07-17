<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
</head>
<body>
<!-- script -->
	<script>
	$(function(){
		 $('.clickToCloseBtn').on('click', function(){
			 $('.clickToClose').addClass('d-none');
		 });
	});
	</script>


<!-- header -->
	<jsp:include page="/WEB-INF/views/module/fixedHeader.jsp"/>
	
	
<!-- 			carousel -->
	<div class="container-fluid my">
		<div class="row my">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-0 p-0 my">
				<div class="bd-example">
				  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
				    <ol class="carousel-indicators">
				      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
				      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
				      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
				      <li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
				    </ol>
				    <div class="carousel-inner">
				      <div class="carousel-item">
				        <img src="resources/img/carousel1.jpg" class="d-block w-100" alt="...">
				        <div class="carousel-caption d-none d-md-block text-left mb-5">
				          <h5>Third slide label</h5>
				          <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
				        </div>
				      </div>
				      <div class="carousel-item">
				        <img src="resources/img/carousel2.jpg" class="d-block w-100" alt="...">
				        <div class="carousel-caption d-none d-md-block text-left mb-5">
				          <h5>Second slide label</h5>
				          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
				        </div>
				      </div>
				      <div class="carousel-item active">
				        <img src="resources/img/carousel3.jpg" class="d-block w-100" alt="...">
				        <div class="carousel-caption d-none d-md-block text-left mb-5">
				          <h5>First slide label</h5>
				          <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
				        </div>
				      </div>
				      <div class="carousel-item">
				        <img src="resources/img/carousel4.jpg" class="d-block w-100" alt="...">
				        <div class="carousel-caption d-none d-md-block text-right mb-5">
				          <h5>Third slide label</h5>
				          <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
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
				<h2>sort1</h2><hr>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img src="https://s3.r29static.com//bin/entry/4db/720x864,85/2175532/could-you-beat-billie-eilish-2175532.webp" width="250" height="400">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img src="https://s3.r29static.com//bin/entry/4db/720x864,85/2175532/could-you-beat-billie-eilish-2175532.webp" width="250" height="400">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img src="https://s3.r29static.com//bin/entry/4db/720x864,85/2175532/could-you-beat-billie-eilish-2175532.webp" width="250" height="400">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img src="https://s3.r29static.com//bin/entry/4db/720x864,85/2175532/could-you-beat-billie-eilish-2175532.webp" width="250" height="400">
			</div>
		</div>
		<div class="row text-center mt-4 my">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left my">
				<h2>sort2</h2><hr>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img src="https://media.vanityfair.com/photos/5b0ed0614f9cf15aa81ce42b/master/w_1600%2Cc_limit/l-MAG-0618-Summer-Issue-Vanities-Billie-Eilish.jpg" width="250" height="400">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img src="https://media.vanityfair.com/photos/5b0ed0614f9cf15aa81ce42b/master/w_1600%2Cc_limit/l-MAG-0618-Summer-Issue-Vanities-Billie-Eilish.jpg" width="250" height="400">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img src="https://media.vanityfair.com/photos/5b0ed0614f9cf15aa81ce42b/master/w_1600%2Cc_limit/l-MAG-0618-Summer-Issue-Vanities-Billie-Eilish.jpg" width="250" height="400">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img src="https://media.vanityfair.com/photos/5b0ed0614f9cf15aa81ce42b/master/w_1600%2Cc_limit/l-MAG-0618-Summer-Issue-Vanities-Billie-Eilish.jpg" width="250" height="400">
			</div>
		</div>
		<div class="row text-center mt-4 my">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left my">
				<h2>sort3</h2><hr>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img src="https://air.jordan.com/wp-content/uploads/2018/06/Jordan_Brand_Billie_Eilish_Paris_Fashion_Week_Air_Jordan_3_III_Bordeaux_c-720x1080.jpg" width="250" height="400">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img src="https://air.jordan.com/wp-content/uploads/2018/06/Jordan_Brand_Billie_Eilish_Paris_Fashion_Week_Air_Jordan_3_III_Bordeaux_c-720x1080.jpg" width="250" height="400">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img src="https://air.jordan.com/wp-content/uploads/2018/06/Jordan_Brand_Billie_Eilish_Paris_Fashion_Week_Air_Jordan_3_III_Bordeaux_c-720x1080.jpg" width="250" height="400">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2 my">
				<img src="https://air.jordan.com/wp-content/uploads/2018/06/Jordan_Brand_Billie_Eilish_Paris_Fashion_Week_Air_Jordan_3_III_Bordeaux_c-720x1080.jpg" width="250" height="400">
			</div>
		</div>
	</div>
	
<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
</body>
</html>