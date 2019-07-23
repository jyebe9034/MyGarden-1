<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../module/bootstrap_cdn.jsp"></jsp:include>
<link href="https://fonts.googleapis.com/css?family=Hi+Melody&display=swap" rel="stylesheet">
<title>Private Garden Manage</title>
<style>
	#bcolor{
      width : 100%;
      height : 175px;
      background-color : #deca92;      
    }
	
	#test {
	  display: flex;
	  justify-content: center;
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
		}
		
		#pot{
			width : 300px;
			height : auto;
			margin : auto;
			position : relative;
			top : 10px;
			left : 150px;
			z-index : 0;
		}
		
		#Layer_1{
			width : 200px;
			height : auto;
			position : relative;
			top : -39px;
			left : 380px;
			z-index : 1;
		}
		
		#speechBubble{
	  	width : 350px;
	  	height : 150px;
	  	z-index : 1;
	  	
	}
	  
	#bubble{
	 	text-align: center;
	 	position : relative;
	 	top : -328px;
	 	left : -302px;
	 	color : white;
	 	font-family: 'Hi Melody', cursive;
	 	font-size : 18px;
	}
	
	#hurbBtn{
	  	background-color: #0078c2;
	  	font-size : 13px;
	  	padding : 3px;
	  	color : white;
	  	text-align: center;
	  	z-index : 1;
	}
	
	#contentsWrap{
		position : relative;
		height : 400px;
	}
	
	#penguinWrap{
		height : 350px;
	}
	
	#spimg{
		width : 400px;
		height : 200px;
		z-index : 0;
	}
		
	#penguin{
		width : 150px;
		height : 170px;
		position : relative;
		top : 210px;
		left : 75px;
		cursor : pointer;
	}
	
	#bubbleimg{
		position : relative;
		top : -155px;
		left : 50px; 
		width : 300px;
	}
	
	#wrapper{
		height : 700px;
	}
		
	#bubbleWrap{
		display : none;
		height : 0;
	}
</style>
</head>
<body>
	<jsp:include page="../module/fixedHeader.jsp"></jsp:include>
	<div id="bcolor"></div>
	
	<div id="wrapper" class="container">
		<div id="contentsWrap" class="row">
		    <div id="penguinWrap" class="col-12">
				<img id="penguin" src="/resources/imgPrivategarden/penguin.png">
				<div id="bubbleWrap">
					<div id="bubbleimg"><img id="spimg" src="/resources/imgPrivategarden/speechbubble01.png"></div>
					<div id="bubble">
						  자 이제 펭콘과 함께 허브를 키워볼까요?<br>
						  허브를 키우기 위해서는 3가지 조건이 필요해요<br>
						  오른쪽 상단의 버튼을 이용해<br>온도, 습도, 빛을 설정해보세요.
					</div>
				</div>
			</div>
		</div>
		<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve" width="250px" height="250px" class="">
				<g><g id="plant">
					<path style="fill:#9AD14B;" d="M285.017,64.165c12.558,12.57,20.334,29.922,20.334,49.097c-38.35,0-69.431-31.081-69.431-69.431   C255.084,43.831,272.447,51.607,285.017,64.165z" data-original="#9AD14B" class="leaves-right"/>
					<path style="fill:#9AD14B;" d="M354.291,135.926c0,27.024-21.916,48.94-48.94,48.94c0-13.512,5.47-25.744,14.333-34.607   C328.535,141.408,340.767,135.926,354.291,135.926z" data-original="#9AD14B" class="leaves-left"/>
					<path style="fill:#9AD14B;" d="M305.352,113.262c0-27.809,11.266-52.985,29.499-71.206c18.221-18.221,43.397-29.499,71.206-29.499   C406.057,68.174,360.969,113.262,305.352,113.262z" data-original="#9AD14B" class="leaves-left"/>
					<rect x="296.295" y="104.207" style="fill:#9AD14B;" width="18.112" height="118.455" data-original="#9AD14B" class="plant"/>
				</g>
				<img id="pot" src="/resources/imgPrivategarden/pot.png">
	</div>
	
	<script>
		$("#penguin").on("click", function(){
			$("#bubbleWrap").css("display", "block");
		})
	</script>

</body>
</html>