<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.css">
<title>HOME</title>
<style>
.hero-octonaut {
   position: absolute;
   top: 120px;
   left: calc(50% - 300px);
   animation: lands 2s alternate ease-in-out infinite;
   will-change: transform;
   user-select: none;
   transition-duration:0.5s;
   filter: drop-shadow(5px 5px 5px #00000075);
}

.r1{
   top: 310px;
   left: calc(50% - 270px);
   position: absolute;
   animation: r1 1.5s alternate ease-in-out infinite;
   will-change: transform;
   user-select: none;
   filter: drop-shadow(3px 3px 3px #00000070);
}

.r2{
   top: 350px;
   left: calc(50% - 220px);
   position: absolute;
   animation: r2 3s alternate ease-in-out infinite;
   will-change: transform;
   user-select: none;
   filter: drop-shadow(3px 3px 3px #00000070);
}

.r3{
   top: 390px;
   left: calc(50% - 130px);
   position: absolute;
   animation: r3 3s alternate ease-in-out infinite;
   will-change: transform;
   user-select: none;
   filter: drop-shadow(3px 3px 3px #00000070);
}

.r4{
   top: 420px;
   left: calc(50% - 0px);
   position: absolute;
   animation: r4 5s alternate ease-in-out infinite;
   will-change: transform;
   user-select: none;
   filter: drop-shadow(3px 3px 3px #00000070);
}

.r5{
   top: 370px;
   left: calc(50% + 85px);
   position: absolute;
   animation: r5 3s alternate ease-in-out infinite;
   will-change: transform;
   user-select: none;
   filter: drop-shadow(3px 3px 3px #00000070);
}

.r6{
   top: 330px;
   left: calc(50% + 130px);
   position: absolute;
   animation: r6 1.5s alternate ease-in-out infinite;
   will-change: transform;
   user-select: none;
   filter: drop-shadow(3px 3px 3px #00000070);
}

.flare{
   top: -60px;
   left: calc(50% + 60px);
   position: absolute;
   animation: lands 2s alternate ease-in-out infinite;
   will-change: transform;
   -webkit-user-select: none;
   user-select: none;
   opacity : 0.5;
}

@keyframes lands{
  0%{transform:translateY(-5px);}
  100%{transform:translateY(5px);}

}

@keyframes r1{
100%{transform:translateY(5px);}
  0%{transform:translateY(-5px);} 
}

@keyframes r2{
100%{transform:translateY(10px);}
  0%{transform:translateY(-10px);} 
}

@keyframes r3{
100%{transform:translateY(5px);}
  0%{transform:translateY(-5px);} 
}

@keyframes r4{
100%{transform:translateY(3px);}
  0%{transform:translateY(-3px);} 
}

@keyframes r5{
100%{transform:translateY(10px);}
  0%{transform:translateY(-10px);} 
}

@keyframes r6{
100%{transform:translateY(5px);}
  0%{transform:translateY(-5px);} 
}

.penguin {
    
    /* change code below */
    --penguin-skin: black;
    --penguin-belly: white;
    --penguin-beak: #f5b81f;
    /* change code above */
    
    position: fixed;
    top : 96px;
    left : 45px;
    display: block;
    width: 120px;
    height: 120px;
  }
  
  .penguin-top {
    top: 10%;
    left: 25%;
    background: var(--penguin-skin, black);
    width: 50%;
    height: 45%;
    border-radius: 70% 70% 60% 60%;
  }
  
  .penguin-bottom {
    top: 40%;
    left: 23.5%;
    background: var(--penguin-skin, black);
    width: 53%;
    height: 45%;
    border-radius: 70% 70% 100% 100%;
  }
  
  .right-hand {
    top: 10%;
    left: 25%;
    background: var(--penguin-skin, black);
    width: 30%;
    height: 60%;
    border-radius: 30% 30% 120% 30%;
    transform: rotate(130deg);
    z-index: -1;    
    animation-duration: 2s;
    animation-name: wave;
    animation-iteration-count: infinite;
    transform-origin: 0% 0%;
    animation-timing-function: linear;
  }
  
  .left-hand {
    top: 0%;
    left: 75%;
    background: var(--penguin-skin, black);
    width: 30%;
    height: 60%;
    border-radius: 30% 30% 30% 120%;
    transform: rotate(-45deg);
    z-index: -1;
  }
  
  .right-cheek {
    top: 15%;
    left: 35%;
    background: var(--penguin-belly, white);
    width: 60%;
    height: 70%;
    border-radius: 70% 70% 60% 60%;
  }
  
  .left-cheek {
    top: 15%;
    left: 5%;
    background: var(--penguin-belly, white);
    width: 60%;
    height: 70%;
    border-radius: 70% 70% 60% 60%;
  }
  
  .belly {
    top: 60%;
    left: 2.5%;
    background: var(--penguin-belly, white);
    width: 95%;
    height: 100%;
    border-radius: 120% 120% 100% 100%;
  }
  
  .right-feet {
    top: 85%;
    left: 60%;
    background: var(--penguin-beak, orange);
    width: 15%;
    height: 30%;
    border-radius: 50% 50% 50% 50%;
    transform: rotate(-80deg);
    z-index: -2;  
  }
  
  .left-feet {
    top: 85%;
    left: 25%;
    background: var(--penguin-beak, orange);
    width: 15%;
    height: 30%;
    border-radius: 50% 50% 50% 50%;
    transform: rotate(80deg);
    z-index: -2;  
  }
  
  .right-eye {
    top: 45%;
    left: 60%;
    background: black;
    width: 15%;
    height: 17%;
    border-radius: 50%; 
  }
  
  .left-eye {
    top: 45%;
    left: 25%;
    background: black;
    width: 15%;
    height: 17%;
    border-radius: 50%;  
  }
  
  .sparkle {
    top: 25%;
    left: 15%;
    background: white;
    width: 35%;
    height: 35%;
    border-radius: 50%;  
  }
  
  .blush-right {
    top: 65%;
    left: 15%;
    background: pink;
    width: 15%;
    height: 10%;
    border-radius: 50%;  
  }
  
  .blush-left {
    top: 65%;
    left: 70%;
    background: pink;
    width: 15%;
    height: 10%;
    border-radius: 50%;  
  }
  
  .beak-top {
    top: 60%;
    left: 40%;
    background: var(--penguin-beak, orange);
    width: 20%;
    height: 10%;
    border-radius: 50%;  
  }
  
  .beak-bottom {
    top: 65%;
    left: 42%;
    background: var(--penguin-beak, orange);
    width: 16%;
    height: 10%;
    border-radius: 50%;  
  }

  .shadow {
    top: 83%;
    left: 25%;
    background: #D7D4D4;
    width: 50%;
    height: 10%;
    border-radius: 50%;
    z-index: -3;
  }
  
  .penguin * {
    position: absolute;
  }
	
	.penguin {
	  animation-duration: 10s;
	  animation-name: loop;
	  animation-iteration-count: infinite;
	  transform-origin: 0% 0%;
	  animation-timing-function: linear;
	}
	
	@keyframes wave {
	  10% {
	    transform: rotate(110deg);
	  }
	  30% {
	    transform: rotate(130deg);
	  }
	  50% {
	    transform: rotate(110deg);
	  }
	  80% {
	    transform: rotate(130deg);
	  }
	  100% {
	    transform: rotate(110deg);
	  }
	}
	
	@keyframes loop {
	  0% {
	    transform: rotateY(0deg);
	  }
	  25% {
	    transform: rotateY(-10deg);
	  }
	  50% {
	    transform: rotateY(0deg);
	  }
	  75% {
	    transform: rotateY(10deg);
	  }
	  100% {
	    transform: rotateY(0deg);
	  }
}
	#wrapper{
	   position:relative;
	   top: 110px;
	}

	#speechBubble{
	  	border : 2px solid #6549b3;
	  	width : 350px;
	  	height : 150px;
	  	position : fixed;
	  	left : 160px;
	  	border-top-left-radius : 20px;
	  	border-top-right-radius : 20px;
	  	border-bottom-left-radius: 20px;
	  	border-bottom-right-radius: 20px;
	  	font-size : 14px;
	}
	  
	#bubble{
	 	margin : 15px 10px 8px 10px;
	}
	  
	#herbBtn{
	  	background-color: #7355c9;
	  	float : right;
	  	margin-right : 20px;
	  	font-size : 13px;
	  	padding : 3px;
	  	color : white;
	}
</style>
</head>
<body>
   <div id="wrapper">
      <img class="flare" src="/resources/imgPrivategarden/flare.png" width="300px">
      <img class="hero-octonaut" src="/resources/imgPrivategarden/base.png" width="550px">
      <img class="r1" src="/resources/imgPrivategarden/00.png" width="30px">
      <img class="r2" src="/resources/imgPrivategarden/01.png" width="50px">
      <img class="r3" src="/resources/imgPrivategarden/02.png" width="30px">
      <img class="r4" src="/resources/imgPrivategarden/03.png" width="35px">
      <img class="r5" src="/resources/imgPrivategarden/04.png" width="55px">
      <img class="r6" src="/resources/imgPrivategarden/05.png" width="25px">
   </div>
   
   <div class="penguin">
	  <div class="penguin-bottom">
	    <div class="right-hand"></div>
	    <div class="left-hand"></div>
	    <div class="right-feet"></div>
	    <div class="left-feet"></div>
	  </div>
	  <div class="penguin-top">
	    <div class="right-cheek"></div>
	    <div class="left-cheek"></div>
	    <div class="belly"></div>
	    <div class="right-eye">
	      <div class="sparkle"></div>
	    </div>
	    <div class="left-eye">
	      <div class="sparkle"></div>
	    </div>
	    <div class="blush-right"></div>
	    <div class="blush-left"></div>
	    <div class="beak-top"></div>
	    <div class="beak-bottom"></div>
	  </div>
	  <div class="shadow"></div>
	</div>
   
	<div id="speechBubble">
		<div id="bubble">
			  안녕하세요 :)<br> 저는 여러분을 비밀정원으로 안내할 펭콘이에요<br>
			  비밀정원을 시작하기 위해서는<br>먼저 키우고 싶은 허브를 선택해야해요!
		</div>
		<div id="toherb">
			<!-- Button trigger modal -->
			<button id="herbBtn" class="btn btn-sm" type="button" data-toggle="modal" data-target="#exampleModalCenter">허브 선택 하기</button>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
</html>