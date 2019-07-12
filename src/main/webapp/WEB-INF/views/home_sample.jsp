<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원</title>
<link rel="shortcut icon" type="image⁄x-icon" href="resources/img/favicon.png">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
	<style>
		@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap');
/* 		.my{border:1px solid #000;} */
		#goToTop{position:fixed; right:28px; bottom:28px; border-radius:50%; padding:2px; box-shadow:1px 1px 5px 1px #999; z-index:999; font-size:15px; cursor:pointer; animation-duration:2s; animation-delay:2s;}
		.clickToClose{background:#86B404; padding:10px 0; color:#eee;}
		.clickToCloseBtn{width:25px; height:25px; right:2%; cursor:pointer;}
		.clickToCloseBtnBorder{width:25px; height:25px; right:2%; border:1px solid #eee; border-radius:50%; cursor:pointer;}
		.headerFluid{position:absolute; z-index:9999; background-color:rgba(255,255,255,0.5);}
		.topAnchor a{margin-left:15px; font-size:13px; color:#000; font-weight:bold;}
		#myGardenTitle{font-family:'Noto Serif KR', "맑은 고딕"; font-weight:1000; letter-spacing:4px; /*text-shadow: 1px 1px 1px gray;*/}
		.topMenuNavbar{background-color:rgba(255,255,255,0.1); font-size:14px; font-weight:bold; /*text-shadow: 1px 1px 1px #999;*/}
			.topMenuToggleBtn{border:none;}
			.menuPosition-fixed{position:fixed; top:0; left:0; background:#eee;}
		.navbar-light .navbar-nav .nav-link{color:#000;}
		.dropdown-menu{background-color:rgba(255,255,255,0.3); top:56px; border:none; border-radius:0;}
		.dropdown-item{font-weight:bold;}
		.dropdown-item:active{background:#86B404;}
		.topAnchorSearch{margin:10px auto;}
		.menuSearch{border:1px solid #6c757d; background:none;}
		.menuSearch::placeholder{color:#6c757d;}
		.carousel-control-prev-icon, .carousel-control-next-icon{margin-top:60%; width:50px; height:50px; border:8px solid #fff; border-radius:50%;}
		.footer{color:#fff; background:url(https://i1.wp.com/www.socialnews.xyz/wp-content/uploads/2019/04/23/dcad5bdae031628e01c872cd31805974.jpg?quality=90&zoom=1&ssl=1) no-repeat top center; background-size:cover;}
		.footerContactBox{border:3px solid #fff; box-shadow:0 5px 10px -5px gray; text-shadow: 2px 2px 2px gray;}
		.footerEnd a{color:#fff; font-size:15px; font-weight:bold; margin-left:10px; text-shadow: 2px 2px 2px gray;}
		.footerEnd li{font-size:13px; list-style:none; text-shadow: 2px 2px 2px gray;}
		.text-shadow{text-shadow: 2px 2px 2px gray;}
		.socialEmo img:hover, .nav-link img:hover, .clickToCloseBtn:hover{opacity:0.7;}
	</style>
</head>
<body>
<!-- script -->
	<script>
		$(function(){
// 			setInterval(function(){
// 				var color = '';
// 				var letters = ['#A5DF00', '#86B404', '#088A08', '#5FB404', '#04B404', '#129634', '#31B404', '#298A08'];
// 				color += letters[Math.floor(Math.random() * letters.length)];
// 				$(".clickToClose").css("background", color);
// 			},2000);
			var topMenuOffset=$('.menuScrollOption').offset();
			 $(window).scroll(function() {
		          if ($(document).scrollTop() > topMenuOffset.top){
		            $('.menuScrollOption').addClass('menuPosition-fixed');
		          }
		          else {
		            $('.menuScrollOption').removeClass('menuPosition-fixed');
		          }
		     });
			 $('.clickToCloseBtn').on('click', function(){
				 $('.clickToClose').addClass('d-none');
			 });
			 $('#goToTop').on('click', function(){
				 $('html, body').stop().animate({scrollTop:'0'});
			 });
		});
	</script>

<!-- 			carousel -->
	<jsp:include page="module/fixedHeader.jsp"></jsp:include>
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
	<jsp:include page="module/fixedFooter.jsp"></jsp:include>
</body>
</html>