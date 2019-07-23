<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../module/bootstrap_cdn.jsp"></jsp:include>
<title>Private Garden Manage</title>
<style>
	#bcolor{
      width : 100%;
      height : 175px;
      background-color : #deca92;      
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

	.penguin {
	    /* change code below */
	    --penguin-skin: black;
	    --penguin-belly: white;
	    --penguin-beak: #f5b81f;
	    /* change code above */
	    
	    position: fixed;
	    top : 280px;
	    left : 390px;
	    display: block;
	    width: 150px;
	    height: 170px;
  	}

	#speechBubble{
	  	border : 2px solid #6549b3;
	  	width : 350px;
	  	height : 110px;
	  	position : fixed;
	  	top : 210px;
	  	left : 550px;
	  	border-top-left-radius : 20px;
	  	border-top-right-radius : 20px;
	  	border-bottom-left-radius: 20px;
	  	border-bottom-right-radius: 20px;
	  	font-size : 14px;
	  	margin-top : 30px;
	}
	  
	#bubble{
	 	margin : 15px 10px 8px 15px;
	}

	#wrapper{
		position : relative;
	}
	
	#test {
	  display: flex;
	  justify-content: center;
	  padding: 3em 0;
	  margin-top : 150px;
	}

.plant {
			animation: grow 1s linear;
			transform-origin: bottom;
			transform-box: fill-box;
		}

		.leaves-right {
			animation: leaves 2s linear;
			transform-origin: bottom right;
			transform-box: fill-box;
		}

		.leaves-left {
			animation: leaves 2s linear;
			transform-origin: bottom left;
			transform-box: fill-box;
		}

		@keyframes leaves {
			0% {
				transform: scale(0);
			}

			45% {
				transform: scale(0);
			}

			100% {
				transform: scale(1);
			}
		}

		@keyframes grow {
			0% {
				transform: scale(0);
			}

			100% {
				transform: scale(1);
			}
</style>
</head>
<body>
	<jsp:include page="../module/fixedHeader.jsp"></jsp:include>
	<div id="bcolor"></div>
	
	<div id="wrapper" class="container">
		<div class="row">
			<div class="penguin col-12">
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
					  자 이제 펭콘과 함께 허브를 키워볼까요?<br>
					  허브를 키우기 위해서는 3가지 조건이 필요해요<br>오른쪽 상단의 버튼을 이용해 온도, 습도, 빛을 설정해보세요.
				</div>
			</div>
		</div>
		<div class="row">
			<div id="test" class="container">
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve" width="512px" height="512px" class="">
				<g><g id="plant">
					<path style="fill:#9AD14B;" d="M285.017,64.165c12.558,12.57,20.334,29.922,20.334,49.097c-38.35,0-69.431-31.081-69.431-69.431   C255.084,43.831,272.447,51.607,285.017,64.165z" data-original="#9AD14B" class="leaves-right"/>
					<path style="fill:#9AD14B;" d="M354.291,135.926c0,27.024-21.916,48.94-48.94,48.94c0-13.512,5.47-25.744,14.333-34.607   C328.535,141.408,340.767,135.926,354.291,135.926z" data-original="#9AD14B" class="leaves-left"/>
					<path style="fill:#9AD14B;" d="M305.352,113.262c0-27.809,11.266-52.985,29.499-71.206c18.221-18.221,43.397-29.499,71.206-29.499   C406.057,68.174,360.969,113.262,305.352,113.262z" data-original="#9AD14B" class="leaves-left"/>
					<rect x="296.295" y="104.207" style="fill:#9AD14B;" width="18.112" height="118.455" data-original="#9AD14B" class="plant"/>
				</g>
			</div>
		</div>
	</div>

</body>
</html>