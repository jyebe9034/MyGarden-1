<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../module/bootstrap_cdn.jsp"></jsp:include>
<link href="https://fonts.googleapis.com/css?family=Hi+Melody&display=swap" rel="stylesheet">
<title>First Private Garden</title>
<style>
* {
  box-sizing: border-box;
}
.m_container{
  overflow:hidden;
  position:relative;
  height: 800px;
  width:100%;
}
  
body{
  background: #ffd5be; 
  transition: 3s;
  
}
#sun {
  position:absolute;
  left: 25%;
  top: 18%;
  height: 100px;
  width: 100px;
  transform: scale(2.5);
  border-radius: 50%;
background: linear-gradient(to right, #ff8a5c 40%,#e74c3c 100%);
  transition: all 1s cubic-bezier(0.740, 0, 0.455, 1); 
/* -webkit-transition: all 1s cubic-bezier(0.740, -0.600, 0.455, 1.650); 
   -moz-transition: all 1s cubic-bezier(0.740, -0.600, 0.455, 1.650); 
     -o-transition: all 1s cubic-bezier(0.740, -0.600, 0.455, 1.650);  
        transition: all 1s cubic-bezier(0.740, -0.600, 0.455, 1.650);   */
transition-delay: .4s;
animation: rays 2s infinite;
z-index: -2;
}

/* This is a layer behind the sun that drops the shdow*/
#sun-shadow {
  background: linear-gradient(to right, #ff8a5c 40%,#e74c3c 100%);
-webkit-box-shadow: 31px 38px 11px -23px rgba(0,0,0,0.75);
box-shadow: 31px 38px 60px -23px rgba(0,0,0,0.75);
position:absolute;
  left: 25%;
  top: 18%;
  height: 100px;
  width: 100px;
  transform: scale(2.5);
  border-radius: 50%;
background: linear-gradient(to right, #ff8a5c 40%,#e74c3c 100%);
  transition: all 1s cubic-bezier(0.740, 0, 0.455, 1); 
/* -webkit-transition: all 1s cubic-bezier(0.740, -0.600, 0.455, 1.650); 
   -moz-transition: all 1s cubic-bezier(0.740, -0.600, 0.455, 1.650); 
     -o-transition: all 1s cubic-bezier(0.740, -0.600, 0.455, 1.650);  
        transition: all 1s cubic-bezier(0.740, -0.600, 0.455, 1.650);   */
transition-delay: .4s;
  z-index: -2;

}


/* Moon is down in its initial position */
 #moon {  
  position: absolute;
  height: 100px;
  width: 100px;
  background: silver;
  border-radius: 50%;
/*   left: 40%; */
/*   top: 130%; */
  right: 25%;
  top: 130%;
  transform: scale(2.5);
-webkit-box-shadow: inset -40px 30px 10px -20px rgba(0,0,0,0.48);
-moz-box-shadow: inset -40px 30px 10px -20px rgba(0,0,0,0.48);
box-shadow: inset -40px 30px 10px -20px rgba(0,0,0,0.48), 10px 1px 20px 0px rgba(0,0,0,0.3); 
 transition: all 1s cubic-bezier(0.740, 0, 0.455, 1); 
/* -webkit-transition: all 1s cubic-bezier(0.740, -0.600, 0.455, 1.650); 
   -moz-transition: all 1s cubic-bezier(0.740, -0.600, 0.455, 1.650); 
     -o-transition: all 1s cubic-bezier(0.740, -0.600, 0.455, 1.650);  
        transition: all 1s cubic-bezier(0.740, -0.600, 0.455, 1.650);   */
transition-delay: .4s;
   z-index: -2;
} 

/* this serves for the animation and it's behind the shadow   */
#moon-shadow { 
   position: absolute;
  height: 100px;
  width: 100px;
  background: silver;
  border-radius: 50%;
  right: 25%;
  margin-left:100px;
  top: 130%;
  transform: scale(2.5);
  z-index: -1;
  animation: glowing 5s infinite; 
/*    transition: all 1s cubic-bezier(0.740, 0, 0.455, 1);   */
/* -webkit-transition: all 1s cubic-bezier(0.740, -0.600, 0.455, 1.650); 
   -moz-transition: all 1s cubic-bezier(0.740, -0.600, 0.455, 1.650); 
     -o-transition: all 1s cubic-bezier(0.740, -0.600, 0.455, 1.650);  
        transition: all 1s cubic-bezier(0.740, -0.600, 0.455, 1.650);   */
  transition-delay: .4s;
     z-index: -4;
}
 
 #switcher {
 cursor: pointer;
display: flex; 
align-items: center;
justify-content: center;
width: 40px;
bax-shadow: rgba(230, 109, 61, 0.3);
color: white;
height:35px;
border-radius: 50%;
position: absolute;
top:170px;
left: 50%;
margin-left:-50px;
z-index: 223;
   transition: 3s;
   filter: drop-shadow(5px 5px 5px #00000075);
}


 #animation-switcher {
cursor: pointer;
display: flex; 
align-items: center;
justify-content: center;
width: 40px;
bax-shadow: rgba(230, 109, 61, 0.3);
color: white;
height:35px;
border-radius: 50%;
position: absolute;
top:170px;
left: 50%;
z-index: 223;
transition: 3s;

}

.mountain { 
	width:100%;
  position: absolute;
  bottom: 0;
  margin-top:-80px; 
  overflow:hidden;
  background-repeat: repeat-x;
  border:none;
}

/* CLOUDS */

#cloud3 {
 position: absolute;
background: linear-gradient(to bottom, #feccb1 45%,#F7AA80 130%);  
   width: 100px;
  height: 40px;
/*   left: 30%; */
  left: 15%;
  top: 20%;
  border-radius: 50px;
  z-index: -1;
  transition: 1s;
  transition-delay: .2s;
-webkit-box-shadow: 10px 10px 30px 0px rgba(0,0,0,0.3);

  animation: move 10s linear infinite   alternate;


} 

#cloud3:after {
  
  content: "";
  position: absolute;
background:  #feccb1;   
  width: 50px;
  height: 50px;
  border-radius: 50%;
  top: -30px;
  left: 10px;
}

#cloud3:before {
  content: "";
  position: absolute;
background:  #feccb1;  
  width: 40px;
  height: 40px;
  border-radius: 50%;
  top: -20px;
  right: 10px;
}

#cloud4 {
  
position: absolute;
background: linear-gradient(to bottom, #feccb1 45%,#F7AA80 130%);  
  width: 200px;
  height: 80px;
/*   left: 50%; */
	left: 25%;
  top: 30%;
  border-radius: 50px;
  transition: 1s;
  transition-delay: .2s;
  animation: move 10s linear infinite   alternate;
  -webkit-box-shadow: 10px 10px 30px 0px rgba(0,0,0,0.1);
  z-index: -1;

} 

#cloud4:after {
  
  content: "";
  position: absolute;
background:  #feccb1;  
  width: 100px;
  height: 100px;
  border-radius: 50%;
  top: -60px;
  left: 10px;
}

#cloud4:before {
  content: "";
  position: absolute;
background: #feccb1;  
  width: 80px;
  height: 80px;
  border-radius: 50%;
  top: -40px;
  right: 40px;
}

#cloud5 {
 position: absolute;
  background: linear-gradient(to bottom, #ffb76b 45%,#ffc889 130%,#ff7f04 100%); 
   width: 100px;
  height: 40px;
/*   left: 35%; */
  left: 35%;
  top: 15%;
  border-radius: 50px;
  z-index: -1;
  transition: 1s;
  transition-delay: .2s;
  -webkit-box-shadow: 10px 10px 30px 0px rgba(0,0,0,0.3);
  animation: move 10s linear infinite   alternate;


} 

#cloud5:after {
  
  content: "";
  position: absolute;
background:#ffb76b;  
  width: 50px;
  height: 50px;
  border-radius: 50%;
  top: -30px;
  left: 10px;
}

#cloud5:before {
  content: "";
  position: absolute;
background: #ffb76b;  
  width: 40px;
  height: 40px;
  border-radius: 50%;
  top: -20px;
  right: 10px;
}

/* STARS */



#star {
    position: absolute;
/*     left: 54%; */
    left: 69%;
/*     top: 40%; */
    top: 25%;
    height: 90px;
    width: 1px;
    background: radial-gradient(ellipse at center, #f9f9f9 9%,#1e5799 98%);
   border-radius: 50%;
    visibility: hidden;
    opacity: 0;

}

#star:before {
     position: absolute;
    content: '';
    height: 90px;
    width: 1px;
background: radial-gradient(ellipse at center, #f9f9f9 29%,#1e5799 98%);     
  border-radius: 50%;
    transform: rotate(90deg);

}

#star:after {
  position: absolute;
  content: '';
  height: 90px;
  width: 1px;
background: radial-gradient(ellipse at center, #f9f9f9 29%,#1e5799 98%);
  border-radius: 50%;
  transform: rotate(-45deg);
}

#star1 {
    position: absolute;
/*     left: 30%; */
    right:20%;
/*     top: 20%; */
    top: 15%;
    height: 60px;
    width: 1px;
    visibility: hidden;
    opacity: 0;
    background: radial-gradient(ellipse at center, #f9f9f9 29%,#1e5799 98%);
   border-radius: 50%;
    transform: rotate(45deg);
}

#star1:before {
     position: absolute;
     content: '';
     height: 60px;
     width: 1px;
background: radial-gradient(ellipse at center, #f9f9f9 29%,#1e5799 98%);     
  border-radius: 50%;
  transform: rotate(90deg);

}

#star1:after {
  position: absolute;
  content: '';
  height: 60px;
  width: 1px;
background: radial-gradient(ellipse at center, #f9f9f9 29%,#1e5799 98%);
  border-radius: 50%;
  transform: rotate(-45deg);
  z-index: -1;
}

#star2 {
    position: absolute;
/*     left: 52%; */
    left: 67%;
    top: 10%;
    height: 60px;
    width: 1px;
    visibility: hidden;
    opacity: 0;
    background: radial-gradient(ellipse at center, #f9f9f9 29%,#1e5799 98%);
   border-radius: 50%;
    transform: rotate(45deg);
}

#star2:before {
     position: absolute;
     content: '';
     height: 60px;
     width: 1px;
background: radial-gradient(ellipse at center, #f9f9f9 29%,#1e5799 98%);     
  border-radius: 50%;
  transform: rotate(90deg);

}

#star2:after {
  position: absolute;
  content: '';
  height: 60px;
  width: 1px;
background: radial-gradient(ellipse at center, #f9f9f9 29%,#1e5799 98%);
  border-radius: 50%;
  transform: rotate(-45deg);
  z-index: -1;
}


/*ANIMATIONS*/

@keyframes rays
{
  0% {
    box-shadow: 0 0 0 0px rgba(255, 26, 0, 0.2);
  }
  100% {
    box-shadow: 0 0 0 35px rgba(0, 0, 0, 0);
  }
}

@keyframes move {
  0%, 100% {
    transform: translate(0, 0);
  }
  
  50% {
    transform: translate(50px, 0);
  }
  
  100% {
    transform: translate(-50px, 0);
  }
}

@keyframes glowing {
 0% { box-shadow: 0 0 90px #ecf0f1; }
  40% { box-shadow: 0 0 60px #ecf0f1; }
  60% { box-shadow: 0 0 60px #ecf0f1; }
  100% { box-shadow: 0 0 90px #ecf0f1; }
}

@keyframes color {
  
  0% {
    transform: scale(2.5);
  
    
  ;} 
  50% {
   transform: scale(3.5);

  ;}
  100% {
    transform: scale(2.5);

  ;}
}

.run-animation {
  position: relative;
  animation: color 2s ease ;
}

.hero-octonaut {
   position: absolute;
   top: 10px;
   left: calc(50% - 450px);
   animation: hero-octonaut 2s alternate ease-in-out infinite;
   will-change: transform;
   user-select: none;
   transition-duration:0.5s;
   filter: drop-shadow(5px 5px 5px #00000075);
}
.hero-octonaut2 {
   position: absolute;
   top: 350px;
   left: calc(50% - 350px);
   animation: hero-octonaut 2s alternate ease-in-out infinite;
   will-change: transform;
   user-select: none;
   transition-duration:0.5s;
   filter: drop-shadow(5px 5px 5px #00000075);
}
.hero-octonaut3 {
   animation: hero-octonaut3 2s alternate ease-in-out infinite;
   will-change: transform;
   user-select: none;
   transition-duration:0.5s;
   filter: drop-shadow(5px 5px 5px #00000075);
}
@keyframes hero-octonaut{
100%{transform:translateY(-15px);}
  0%{transform:translateY(-5px);} 
}
@keyframes hero-octonaut3{
100%{transform:translateY(-5px);}
  0%{transform:translateY(-15px);} 
}
@keyframes hero-octonaut2{
100%{transform:translateY(-15px);}
  0%{transform:translateY(-5px);} 
}
.imageContainer{height:175px; overflow:hidden; background:none;}
.bootstrapContent{height:350px;}
#bubbleWrap{
  box-shadow: 0 20px 60px 0 rgba(0,0,0,0.3);
	position : relative;
	top:200px;
	left:50%;
	margin-left:-200px;
	z-index :9998;
	background:rgba(255,255,255,0.3);
	width:400px;
	height:340px;
	padding:20px;
	border-radius:10px;
}
#penguin{
	position : absolute;
	width : 200px;
	height : 230px;
	top : 100px;
	left : 50%;
	margin-left:-60px;
	cursor : pointer;
	z-index :9999;
	}
#bubble{
	position : absolute;
	top : 15px;
	left:5%;
	font-size:14px;
}
#bubbleimg{
	top:0px;
	z-index:9998;
}
.growup{
   animation: growup 2s alternate ease-in-out infinite;
   will-change: transform;
   user-select: none;
   transition-duration:0.5s;
   filter: drop-shadow(5px 5px 5px #00000075);
}
@keyframes growup {
    0% {
        transform: rotate(-3deg);
    }
    85% {
        transform: rotate(3deg);
    }
    90% {
        transform: rotate(-5deg);
    }
    95% {
        transform: rotate(3deg);
    }
    100% {
        transform: rotate(0deg);
    }
}
</style>
</head>
<body>
	<jsp:include page="../module/fixedHeader.jsp"></jsp:include>
	
<!-- 	vain room -->
<div class="container-fluid imageContainer m-0 p-0 my">
	<div class="row my">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my">
		</div>
	</div>
</div>

<!-- 	body -->
	<div class="m_container">
		<div id="sun"></div>
		<div id="sun-shadow"> </div>
		<div id="moon"> </div><!-- line 77 -->
		<div id="moon-shadow"> </div><!-- line 99 -->
		<div id="star"> </div><!-- line 290 -->
		<div id="star1"> </div>
		<div id="star2"> </div>
		<!--    This serves to trigger all the movements and color changes -->
		  <div id="switcher" class="hero-octonaut3"><p><img src="resources/img/planet2.png" width="40" height="40"></p></div>
		<div id="signal"></div>
		<!--   This serves to trigger on hover animation for sun and moon -->
		  <div id="animation-switcher" class="hero-octonaut"><p><img src="resources/img/planet3.png" width="50" height="40"></p></div>
		  <div id="animation-signal"></div>		  
		  
<!-- 		  bootstrap -->
	 		<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-3 mb-3 bootstrapContent my">
					<div id="bubbleWrap">
						<img id="penguin" class="growup" src="/resources/imgPrivategarden/penguin.png">
						<div id="bubble">	
							  안녕하세요 :)<br> 저는 여러분을 비밀정원으로 안내할 펭콘이에요<br>
							  비밀정원을 시작하기 위해서는<br>먼저 키우고 싶은 허브를 선택해야해요!<br>
							<p id="herbBtn"><button type="button" class="btn btn-outline-secondary mt-2">허브 선택하기</button></p>
						</div>
					</div>
				</div>
			</div>
		  
		<img class="mountain"src="https://static1.squarespace.com/static/5a26ed548c56a81692179d79/t/5d0af6b02367b300019f9423/1560999606194/kisspng-mountain-graphic-design-clip-art-mountain-peak-5b26b5d7e0aae0.1417446715292635759203.png?format=2500w">
		  <div id="cloud3"></div>
		  <div id="cloud4"></div>
		  <div id="cloud5"></div>

	</div>
</body> 
		<!-- partial -->
		  <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
		<script  src="resources/js/mountain.js"></script>
	
	<script>
		$("#herbBtn").on("click", function(){
			$(location).attr("href", "toSelectHerb");
			/* $("#privategarden", parent.document).attr("src", "testModal"); */
		})
	</script>
	
	<!-- footer -->
   <jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
	
</body>
</html>