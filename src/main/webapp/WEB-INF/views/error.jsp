<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - error</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<style>
.imageContainer{height:175px; overflow:hidden; background:#fff;}
.contents{height:500px; margin-bottom:100px;} 
.contents h2{color:#f5f5f5;}
.contents h1{color:#f5f5f5; font-size:60px;}
.btn-outline-light:hover{color:#4f9c87;}
body { 
  background: #65a896;
}
.loop-wrapper {
  margin: 0 auto;
  padding-top:100px;
  position: relative;
  display: block;
  width: 80%;
  height: 250px;
  overflow: hidden;
  border-bottom: 3px solid #fff;
  color: #fff;
}
.mountain {
  position: absolute;
  right: -900px;
  bottom: -20px;
  width: 2px;
  height: 2px;
  box-shadow: 
    0 0 0 50px #4DB6AC,
    60px 50px 0 70px #4DB6AC,
    90px 90px 0 50px #4DB6AC,
    250px 250px 0 50px #4DB6AC,
    290px 320px 0 50px #4DB6AC,
    320px 400px 0 50px #4DB6AC
    ;
  transform: rotate(130deg);
  animation: mtn 20s linear infinite;
}
.hill {
  position: absolute;
  right: -900px;
  bottom: -50px;
  width: 400px;
  border-radius: 50%;
  height: 20px;
  box-shadow: 
    0 0 0 50px #4DB6AC,
    -20px 0 0 20px #4DB6AC,
    -90px 0 0 50px #4DB6AC,
    250px 0 0 50px #4DB6AC,
    290px 0 0 50px #4DB6AC,
    620px 0 0 50px #4DB6AC;
  animation: hill 4s 2s linear infinite;
}
.tree, .tree:nth-child(2), .tree:nth-child(3) {
  position: absolute;
  height: 100px; 
  width: 35px;
  bottom: 0;
  background: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/130015/tree.svg) no-repeat;
}
.rock {
  margin-top: -17%;
  height: 2%; 
  width: 2%;
  bottom: -2px;
  border-radius: 20px;
  position: absolute;
  background: #ddd;
}
.truck, .wheels {
  transition: all ease;
  width: 85px;
  margin-right: -60px;
  bottom: 0px;
  right: 50%;
  position: absolute;
  background: #eee;
}
.truck {
  background: url(resources/img/truck.png) no-repeat;
  background-size: contain;
  height: 60px;
}
.truck:before {
  content: " ";
  position: absolute;
  width: 25px;
  box-shadow:
    -30px 28px 0 1.5px #fff,
     -35px 18px 0 1.5px #fff;
}
.wheels {
  background: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/130015/wheels.svg) no-repeat;
  height: 15px;
  margin-bottom: 0;
}

.tree  { animation: tree 3s 0.000s linear infinite; }
.tree:nth-child(2)  { animation: tree2 2s 0.150s linear infinite; }
.tree:nth-child(3)  { animation: tree3 8s 0.050s linear infinite; }
.rock  { animation: rock 4s   -0.530s linear infinite; }
.truck  { animation: truck 4s   0.080s ease infinite; }
.wheels  { animation: truck 4s   0.001s ease infinite; }
.truck:before { animation: wind 1.5s   0.000s ease infinite; }


@keyframes tree {
  0%   { transform: translate(1350px); }
  50% {}
  100% { transform: translate(-50px); }
}
@keyframes tree2 {
  0%   { transform: translate(650px); }
  50% {}
  100% { transform: translate(-50px); }
}
@keyframes tree3 {
  0%   { transform: translate(2750px); }
  50% {}
  100% { transform: translate(-50px); }
}

@keyframes rock {
  0%   { right: -200px; }
  100% { right: 2000px; }
}
@keyframes truck {
  0%   { }
  6%   { transform: translateY(0px); }
  7%   { transform: translateY(-6px); }
  9%   { transform: translateY(0px); }
  10%   { transform: translateY(-1px); }
  11%   { transform: translateY(0px); }
  100%   { }
}
@keyframes wind {
  0%   {  }
  50%   { transform: translateY(3px) }
  100%   { }
}
@keyframes mtn {
  100% {
    transform: translateX(-2000px) rotate(130deg);
  }
}
@keyframes hill {
  100% {
    transform: translateX(-2000px);
  }
}
</style>
</head>
<body>
<!-- script -->
	<script>
		$(function(){
			$('.goBack').on('click', function(){
				history.back();
			});
			$('.goHome').on('click', function(){
				$(location).attr('href', '/');
			});
		});
	</script>
<!-- header -->
	<jsp:include page="/WEB-INF/views/module/fixedHeader.jsp"/>
<!-- 	images -->
	<div class="container-fluid imageContainer m-0 p-0 my">
		<div class="row my">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my">
			</div>
		</div>
	</div>
<!-- 	contents -->
	<div class="container-fluid contents my">
		<div id="row m-auto my">
			<div class="col-lg-6 col-md-8 col-sm-10 col-xs-12 pl-5 pr-5 loop-wrapper">
			  <div class="mountain"></div>
			  <div class="hill"></div>
			  <div class="tree"></div>
			  <div class="tree"></div>
			  <div class="tree"></div>
			  <div class="rock"></div>
			  <div class="truck"></div>
			  <div class="wheels"></div>
			</div> 
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pt-4 text-center">
				<h1 class="font-weight-bold">404</h1>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pt-3 pb-2 text-center">
				<h2 class="font-weight-bold">에러가 발생했습니다!</h2>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
				<button type="button" class="btn btn-outline-light btn-lg mt-2 mr-2 goBack">이전 페이지로 가기</button>
				<button type="button" class="btn btn-outline-light btn-lg mt-2 goHome">홈으로 가기</button>
			</div>
		</div>	
	</div>
<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
</body>
</html>