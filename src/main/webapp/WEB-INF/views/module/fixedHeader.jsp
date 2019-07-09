<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <link rel="shortcut icon" type="image⁄x-icon" href="resources/img/favicon.png">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> 
<style>
	@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap');
/* 		.my{border:1px solid #000;} */
		.headerFluid{position:absolute; z-index:9999; background-color:rgba(255,255,255,0.5);}
		.topAnchor a{margin-left:15px; font-size:13px; color:#000; font-weight:bold;}
		#myGardenTitle{font-family:'Noto Serif KR', "맑은 고딕"; font-weight:1000; letter-spacing:4px; /*text-shadow: 1px 1px 1px gray;*/}
		.topMenuNavbar{background-color:rgba(255,255,255,0.1); font-size:14px; font-weight:bold; /*text-shadow: 1px 1px 1px #999;*/}
		.navbar-light .navbar-nav .nav-link{color:#000;}
		.dropdown-menu{background-color:rgba(255,255,255,0.3); top:56px; border:none; border-radius:0;}
		.dropdown-item{font-weight:bold;}
		.dropdown-item:active{background:#86B404;}
		.topAnchorSearch{margin:10px auto;}
		.menuSearch{border:1px solid #6c757d; background:none;}
		.menuSearch::placeholder{color:#6c757d;}
</style> 
<div class="container-fluid headerFluid my">
		<div class="row my">
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
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-0 my">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-0 my">
						<nav class="navbar navbar-expand-lg navbar-light p-0 topMenuNavbar">
						  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
						      		<img src="resources/img/shop.png" width="40" height="40" id="cart">
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