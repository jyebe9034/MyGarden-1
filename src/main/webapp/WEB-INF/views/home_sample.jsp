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
<!-- header -->
	<div id="goToTop" class="animated infinite bounce">
		<img src="resources/img/top.png" width="40" height="40">
	</div>
	<div class="container-fluid headerFluid my">
		<div class="row my">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 clickToClose text-center">
				<span>회원가입과 함께 <b class="text-body">나만의 정원</b>을 가져 보세요!</span>
				<span class="position-absolute clickToCloseBtnBorder"></span>
				<span class="position-absolute clickToCloseBtn">&Cross;</span>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-3 mb-3 text-right topAnchor my">
						<a href="#">로그인</a>
						<a href="#">회원가입</a>
						<a href="#">공지사항</a>
						<a href="#">고객센터</a>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-1 mb-4 text-center my">
					<h3 id="myGardenTitle">나의 정원</h3>
				</div>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-0 menuScrollOption my">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-0 my">
						<nav class="navbar navbar-expand-lg navbar-light p-0 topMenuNavbar">
						  <button class="navbar-toggler topMenuToggleBtn" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						    <span class="navbar-toggler-icon"></span>
						  </button>
						  <div class="collapse navbar-collapse" id="navbarSupportedContent">
						    <ul class="navbar-nav m-auto text-center">
						      <li class="nav-item active dropdown">
						        <a class="nav-link dropdown-toggle mt-2" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						        	상품 전체보기
						        </a>
						        <div class="dropdown-menu text-center" aria-labelledby="navbarDropdown">
						          <a class="dropdown-item" href="#">분류1</a>
						          <a class="dropdown-item" href="#">분류2</a>
						          <div class="dropdown-divider"></div>
						          <a class="dropdown-item" href="#">하위분류1</a>
						        </div>
						      </li>
						      <li class="nav-item"><a class="nav-link mt-2" href="#">공유정원</a></li>
						      <li class="nav-item"><a class="nav-link mt-2" href="#">개인정원</a></li>
						      <li class="nav-item"><a class="nav-link mt-2" href="#">About&nbsp;&nbsp;|</a></li>
						      <li class="nav-item"><a class="nav-link mt-2" href="#">자유게시판</a></li>
						      <li class="nav-item">
						      	<a class="nav-link" href="#">
						      		<img src="resources/img/person.png" width="40" height="40">
						      		<img src="resources/img/shop.png" width="40" height="40">
						      	</a>
						      </li>
						      <li class="nav-item ml-3">
							    <form class="form-inline my-2 my-lg-0">
									<div class="input-group topAnchorSearch">
									  <input class="form-control menuSearch ml-4" type="search" placeholder="Search..." aria-label="Search" aria-describedby="basic-addon2">
									  <div class="input-group-append">
									    <button class="btn btn-outline-secondary mr-4" type="button" id="button-addon2">&telrec;</button>
									  </div>
									</div>
							    </form>
						      </li>
						    </ul>
						  </div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>	
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
	<div class="container-fluid footer p-4 mt-5 text-center my">
		<div class="row m-auto">
			<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 m-auto my">
				<div class="row m-auto">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 text-center text-shadow m-auto p-2 footerContactBox my">
						<h4 class="font-weight-bold">고객센터</h4>
						<h4 class="font-weight-bold">1588-0000</h4>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 mt-4 mb-2 text-center text-shadow my">
						<h5 class="font-weight-bold">평일 9:00 - 18:00</h5>
						<h6 class="font-weight-bold">(주말 및 공휴일 OFF)</h6>
					</div>
				</div>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-2 text-shadow socialEmo my">
				<span><a href="#"><img src="resources/img/facebook.png" width="50" height="50"></a></span>
				<span><a href="#"><img src="resources/img/twitter.png" width="50" height="50"></a></span>
				<span><a href="#"><img src="resources/img/youtube.png" width="50" height="50"></a></span>
				<span><a href="#"><img src="resources/img/instagram.png" width="50" height="50"></a></span>
				<span><a href="#"><img src="resources/img/share.png" width="50" height="50"></a></span>
			</div>	
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-1 footerEnd my">
				<span><a href="#">인재채용</a></span>
				<span><a href="#">이용약관</a></span>
				<span><a href="#">개인정보처리방침</a></span>
				<span><a href="#">이용안내</a></span>
				<li>제휴 및 광고 문의 : mygarden@gmail.com</li>
				<li>상호: 농업회사법인그리너스주식회사 | 대표: 김경성, 이연지, 임지혜, 이해영, 도슬기</li>
				<li>사업자등록번호:419-76-12257 <a href="#">[사업자정보확인]</a> | 통신판매업신고:제2019-서울종로-0049호</li>
				<li>서울 종로구 청계천로 419-92 | T. 02-123-4567 | info@greeners.co.kr | 개인정보관리자:김경성 | ©2019 GREENERS ALL RIGHTS RESERVED.</li>
			</div>	
		</div>	
	</div>
</body>
</html>