<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - About</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
	<!--     scroll -->
		<link rel="stylesheet" href="resources/css/jquery.mCustomScrollbar.css"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="resources/js/jquery.mCustomScrollbar.js"></script>
<style>
	body{background:url(resources/img/space.jpg) repeat; background-size:20%;}
	.imageContainer{height:300px; overflow:hidden;}
	.intromg{color:#f5f5f5; font-family: 'Noto Serif KR', serif; font-size:50px; overflow:hidden; background:url(resources/img/space.jpg) repeat; background-size:50%; box-shadow: 0px 0px 55px #222;}
	.mg{color:#f5f5f5; font-family: 'Noto Serif KR', serif; font-size:30px;}
	.planetIcon img{cursor: pointer; animation-duration: 2s; animation-delay: 2s;}
	.hero1{animation: hero-octonaut1 2s alternate ease-in-out infinite;}
	.hero2{animation: hero-octonaut2 2s alternate ease-in-out infinite;}
	.planetIcon img:hover{opacity:0.7;}
	.scrollBar, .scrollBar-lg{padding:20px; overflow: auto; border-radius:5px; box-shadow: 0px 0px 15px #222;}
	@keyframes hero-octonaut1{
	  0%{transform:translateY(-18px);}
	  100%{transform:translateY(18px);}
	}
	@keyframes hero-octonaut2{
	  0%{transform:translateY(18px);}
	  100%{transform:translateY(-18px);}
	}
/* 	animation */
#header{
	height:830px;
}
.center{
	width:10px;
	height:10px;
	background:gray;
	border-radius: 50%;
	position:absolute;
	top:430px;
	left:50%;
	margin-left:-10px;
}
.spin1 {
	height: 30px;
	width: 70px;
	border-radius: 50%;
	border:solid 5px gray;
   
	-webkit-animation-name: spin;
	-webkit-animation-duration: 18.5s;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
  
	position:absolute;
	top:420px;
	left:50%;
	margin-left:-40px;
}
.spin2 {
	height: 30px;
	width: 70px;
	border-radius: 50%;
	border:solid 5px white;
   
	-webkit-animation-name: spin;
	-webkit-animation-duration: 18.5s;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
	-webkit-animation-direction:reverse;
  
	position:absolute;
	top:420px;
	left:50%;
	margin-left:-40px;
}
.spin3 {
	height: 70px;
	width: 30px;
	border-radius: 50%;
	border:solid 5px #ddd;
   
	-webkit-animation-name: spin;
	-webkit-animation-duration: 18.5s;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
  
	position:absolute;
	top:400px;
	left:50%;
	margin-left:-20px;
}
.spin4 {
	height: 70px;
	width: 30px;
	border-radius: 50%;
	border:solid 5px #b9b9c8;
   
	-webkit-animation-name: spin;
	-webkit-animation-duration: 18.5s;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
	-webkit-animation-direction:reverse;
  
	position:absolute;
	top:400px;
	left:50%;
	margin-left:-20px;
}
/* animation */
.spin5 {
	width: 680px;
	height: 680px;
	border-radius: 50%;
	border-top:dotted 3px #fff;
	border-left:dashed 2px #fff;
	border-bottom:dashed 1px #fff;
	border-right:solid 1px #fff;
  
	-webkit-animation-name: spin;
	-webkit-animation-duration: 10.5s;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
  
	position:absolute;
	top:90px;
	left:50%;
	margin-left:-355px;
}
	.spin5_1 {  
	-webkit-animation-name: spin;
	-webkit-animation-duration: 10.5s;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
  
	position:absolute;
	top:65px;
	left:15px;
}
	.inner_spin1_1{
	width: 700px;
	height: 700px;
	border-radius: 50%;
	border-top:dotted 1px #ffffbf;
	border-left:solid 1px #ffffbf;
	border-bottom:solid 1px #ffffbf;
	border-right:solid 1px #ffffbf;
  
	-webkit-animation-name: spin;
	-webkit-animation-duration: 10.5s;
		-webkit-animation-iteration-count: infinite;
		-webkit-animation-timing-function: linear;
	-webkit-animation-direction:reverse;
	
	position:absolute;
	top:80px;
	left:50%;
	margin-left:-365px;
	}
	.inner_spin1_2{
	width: 670px;
	height: 670px;
	border-radius: 50%;
	border:dashed 1px #f00;
  
	-webkit-animation-name: spin;
	-webkit-animation-duration: 10.5s;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
  
	position:absolute;
	top:95px;
	left:50%;
	margin-left:-350px;
	}
	.inner_spin1_3{
	width: 580px;
	height: 580px;
	border-radius: 50%;
	border-top:solid 1px #00d9d9;
	border-left:dotted 2px #00d9d9;
	border-bottom:dashed 1px #00d9d9;
	border-right:solid 2px #00d9d9;
  
	-webkit-animation-name: spin;
	-webkit-animation-duration: 10.5s;
		-webkit-animation-iteration-count: infinite;
		-webkit-animation-timing-function: linear;
	-webkit-animation-direction:reverse;
  
	position:absolute;
	top:140px;
	left:50%;
	margin-left:-305px;
	}
.spin6 {
	width: 480px;
	height: 480px;
	border-radius: 50%;
	border-top:dotted 3px #ddd;
	border-left:dashed 2px #ddd;
	border-bottom:dashed 1px #ddd;
	border-right:solid 1px #ddd;
  
	-webkit-animation-name: spin;
	-webkit-animation-duration: 12.5s;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
	-webkit-animation-direction:reverse;
  
	position:absolute;
	top:190px;
	left:50%;
	margin-left:-260px;
}
	.spin6_1 {  
	-webkit-animation-name: spin;
	-webkit-animation-duration: 12.5s;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
	-webkit-animation-direction:reverse;
  
	position:absolute;
	top:15px;
	left:5px;
}
	.inner_spin2_1{
	width: 500px;
	height: 500px;
	border-radius: 50%;
	border:dotted 1px #ffa64c;
  
	-webkit-animation-name: spin;
	-webkit-animation-duration: 10.5s;
		-webkit-animation-iteration-count: infinite;
		-webkit-animation-timing-function: linear;
	-webkit-animation-direction:reverse;
  
	position:absolute;
	top:180px;
	left:50%;
	margin-left:-265px;
	}
	.inner_spin2_2{
	width: 430px;
	height: 430px;
	border-radius: 50%;
	border-top:dotted 1px #ffbf00;
	border-left:dotted 1px #ffff00;
	border-bottom:dotted 2px #ffff73;
	border-right:dashed 1px #ffff73;
  
	-webkit-animation-name: spin;
	-webkit-animation-duration: 10.5s;
		-webkit-animation-iteration-count: infinite;
		-webkit-animation-timing-function: linear;
  
	position:absolute;
	top:217px;
	left:50%;
	margin-left:-230px;
	}
.spin7 {
	width: 280px;
	height: 280px;
	border-radius: 50%;
	border-top:dotted 3px #ddd;
	border-left:dashed 2px #ddd;
	border-bottom:dashed 2px #ddd;
	border-right:solid 2px #ddd;
  
	-webkit-animation-name: spin;
	-webkit-animation-duration: 10.5s;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
  
	position:absolute;
	top:290px;
	left:50%;
	margin-left:-153px;
}
	.spin7_1 {  
	-webkit-animation-name: spin;
	-webkit-animation-duration: 14.5s;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
  
	position:absolute;
	top:5px;
	left:5px;
}
	.spin7_2 {  
	-webkit-animation-name: spin;
	-webkit-animation-duration: 10.5s;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
  
	position:absolute;
	top:-35px;
	left:-25px;
}
	.inner_spin3_1{
	width: 290px;
	height: 290px;
	border-radius: 50%;
	border:solid 1px #ff4c79;
	border-left:solid 1px #ff4c79;
	border-bottom:solid 1px #ff265c;
	border-right:solid 1px #ff7396;
  
	-webkit-animation-name: spin;
	-webkit-animation-duration: 10.5s;
		-webkit-animation-iteration-count: infinite;
		-webkit-animation-timing-function: linear;
	-webkit-animation-direction:reverse;
  
	position:absolute;
	top:285px;
	left:50%;
	margin-left:-158px;
	}
	.inner_spin3_2{
	width: 300px;
	height: 300px;
	border-radius: 50%;
	border-top:solid 1px #0080ff;
	border-left:solid 1px #0080ff;
	border-bottom:solid 1px #006cd9;
	border-right:dashed 1px #0036d9;
  
	-webkit-animation-name: spin;
	-webkit-animation-duration: 10.5s;
		-webkit-animation-iteration-count: infinite;
		-webkit-animation-timing-function: linear;
	-webkit-animation-direction:reverse;
  
	position:absolute;
	top:280px;
	left:50%;
	margin-left:-163px;
	}
	.inner_spin3_3{
	width: 200px;
	height: 200px;
	border-radius: 50%;
	border-top:solid 1px #ffffbf;
	border-left:solid 0px #ffffbf;
	border-bottom:solid 2px #ddd;
	border-right:solid 0px #ddd;
  
	-webkit-animation-name: spin;
	-webkit-animation-duration: 10.5s;
		-webkit-animation-iteration-count: infinite;
		-webkit-animation-timing-function: linear;
	-webkit-animation-direction:reverse;
  
	position:absolute;
	top:330px;
	left:50%;
	margin-left:-115px;
	}
.stop1,.stop2,.stop3{
	cursor:pointer;
}
.stop1:hover,.stop2:hover,.stop3:hover{
	opacity:0.7;
}

@-webkit-keyframes spin {
  from   {  -webkit-transform: rotate(0deg); }
  to   {  -webkit-transform: rotate(360deg); }
}
</style>
</head>
<body>
<!-- script -->
	<script>
		$(function(){
			//planet, spin 클릭시 정지
			$(".chooseSpin").hover(
		    function() { 
		     $(this).css({ 
		     "animation-play-state" : "paused", 
		     "-webkit-animation-play-state" : "paused", 
		     "-moz-animation-play-state" : "paused", 
		     "-o-animation-play-state" : "paused" 
		     }); 
		    }, 
		    function() { 
		     $(this).css({ 
		     "animation-play-state": "running", 
		     "-webkit-animation-play-state": "running", 
		     "-moz-animation-play-state": "running", 
		     "-o-animation-play-state": "running" 
		     }); 
		    } 
		); 
		//planet, spin 클릭 시 해당 메뉴로 스크롤 이동	
			$('.move').bind('click', function() {
		    $('html').animate({scrollTop:$($(this).attr('href')).offset().top-30});
		  });
			//scroll
			$(".scrollBar").mCustomScrollbar({
				axis:"y",
				theme:"light",
				autoExpandScrollbar:true,
				advanced:{autoExpandHorizontalScroll:true},
				setWidth: "100%",
				setHeight: 550,
				scrollButtons:{ enable: true }
			});
			$(".scrollBar-lg").mCustomScrollbar({
				axis:"xy",
				theme:"light",
				autoExpandScrollbar:true,
				advanced:{autoExpandHorizontalScroll:true},
				setWidth: "100%",
				setHeight: 500,
				scrollButtons:{ enable: true }
			});
		});
	</script>
<!-- header -->
	<jsp:include page="/WEB-INF/views/module/fixedHeader.jsp"/>
	
<!-- 	contents -->
	<div class="container-fluid imageContainer m-0 p-0 my"></div>
	<div class="container text-center my">
		<div id="row my">
			<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 p-4 bg-dark m-auto intromg my">
				<p class="text-left">이 광활한 우주에서 </p>
				<p class="text-right">나의 정원을 소유한다는 것</p>
			</div>	
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-4 m-auto d-none d-lg-block my">
			<!-- animation header -->
				<div id="header">
				<!-- animation logo -->
						<div class="center"></div>
						<div class="spin1"></div>
						<div class="spin2"></div>
						<div class="spin3"></div>
						<div class="spin4"></div>
				<!-- animation -->
						<div class="inner_spin1_1"></div>
						<div class="inner_spin1_2"></div>
						<div class="inner_spin1_3"></div>
						<div class="spin5 stop1 chooseSpin">
							<div class="spin5_1 move"><img src="resources/img/planet1.png"  width="120" height="120" alt=""></div>
						</div>
						<div class="inner_spin2_1"></div>
						<div class="inner_spin2_2"></div>
						<div class="spin6 stop2 chooseSpin">
							<div class="spin6_1 move"><img src="resources/img/planet3.png"  width="140" height="110" alt=""></div>
						</div>
						<div class="inner_spin3_1"></div>
						<div class="inner_spin3_2"></div>
						<div class="inner_spin3_3"></div>
						<div class="spin7 stop3 chooseSpin">
							<div class="spin7_1 stop3 move"><img src="resources/img/planet2.png"  width="90" height="90" alt="">
								<div class="spin7_2 stop4 move"><img src="resources/img/planet4.png" width="50" height="50" alt=""></div>
							</div>
						</div>
					</div>
	<!-- 		animation -->
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-4 mg my">
				STEP1. 나의 정원에서 제공하는 서비스를 알아보세요
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my">
			 	<div class="row mt-1">
		            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mx-auto scrollBar-lg mb-5 my">
		            	<img src="resources/img/greeners.png">
		            </div>
		        </div>
		    </div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-4 mg my">
				STEP2. &Lang;나의 정원&Rang;에서 나만의 정원을 생성해 보세요!
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-4 my">
			 	<div class="row mt-1 pl-2 pr-2">
		            <div class="col-lg-8 col-md-10 col-sm-12 col-xs-12 mx-auto scrollBar mb-2 my">
		                <div class="contents bg-dark text-light text-left">
		                   <h5 class="ml-2 text-muted">// 회원가입 시 정원 생성 기본 로직</h5>
							<h5 class="ml-2">public class MyGarden implements Greeners{</h5><br>
							   <h5 class="ml-4">private String seed;  <span class="text-muted">//비밀정원에 필요한 씨앗</span></h5><br>
							   <h5 class="ml-4">public MyGarden() { };  <span class="text-muted">//공유정원 생성자</span> </h5><br>
							   <h5 class="ml-4">public MyGarden(String seed) {  <span class="text-muted">//비밀정원 생성자</span></h5>
							      <h5 class="ml-5">this.seed = seed;</h5>
							   <h5 class="ml-4">}</h5><br>
							<h5 class="ml-2">}</h5>
							<br><br>
							<h5 class="ml-2 text-muted">// 비밀정원 만들기</span>
							<h5 class="ml-2">public class Garden {</h5><br>
							  <h5 class="ml-4"> public static void main(String[] args) {</h5><br>
							         <h5 class="ml-4">MyGarden publicGarden = new MyGarden();  <span class="text-muted">//공유정원 생성 (정원 생성의 디폴트)</span></h5><br>
							        <h5 class="ml-4"> MyGarden privateGarden = new MyGarden(“페퍼민트”);  <span class="text-muted">//실물 땅을 인자로 갖는 개인정원 생성</span></h5><br>
							   <h5 class="ml-4">}</h5><br>
							<h5 class="ml-2">}</h5>
		                </div>
		            </div>
		        </div>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-4 mg my">
				STEP3. 스마트팜 기반으로 운영되는 똑똑한 작물들을 나만의 정원에서 매일 수확할 수 있습니다
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-4 mg my">
				STEP4. 비밀정원에서는 ....................
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-4 m-auto d-none d-md-block planetIcon my">
				<img src="resources/img/planet1.png"  width="130" height="130" alt="" class="p-3 hero1">
				<img src="resources/img/planet2.png"  width="100" height="100" alt="" class="p-3 hero2">
				<img src="resources/img/planet3.png"  width="170" height="140" alt="" class="p-3 hero1">
				<img src="resources/img/planet4.png" width="70" height="70" alt="" class="p-3 hero2">
			</div>
		</div>
	</div>
	
<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
</body>
</html>