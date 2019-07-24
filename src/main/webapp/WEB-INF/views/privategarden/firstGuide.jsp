<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../module/bootstrap_cdn.jsp"></jsp:include>
<link href="https://fonts.googleapis.com/css?family=Hi+Melody&display=swap" rel="stylesheet">
<title>First Private Garden</title>
<style>
	#bcolor{
      width : 100%;
      height : 175px;
      background-color : #deca92;      
    }
.hero-octonaut {
   position: absolute;
   top: 10px;
   left: calc(50% - 450px);
   animation: lands 2s alternate ease-in-out infinite;
   will-change: transform;
   user-select: none;
   transition-duration:0.5s;
   filter: drop-shadow(5px 5px 5px #00000075);
}

.r1{
   top: 300px;
   left: calc(50% - 360px);
   position: absolute;
   animation: r1 1.5s alternate ease-in-out infinite;
   will-change: transform;
   user-select: none;
   filter: drop-shadow(3px 3px 3px #00000070);
}

.r2{
   top: 350px;
   left: calc(50% - 260px);
   position: absolute;
   animation: r2 3s alternate ease-in-out infinite;
   will-change: transform;
   user-select: none;
   filter: drop-shadow(3px 3px 3px #00000070);
}

.r3{
   top: 440px;
   left: calc(50% - 130px);
   position: absolute;
   animation: r3 3s alternate ease-in-out infinite;
   will-change: transform;
   user-select: none;
   filter: drop-shadow(3px 3px 3px #00000070);
}

.r4{
   top: 430px;
   left: calc(50% - 0px);
   position: absolute;
   animation: r4 5s alternate ease-in-out infinite;
   will-change: transform;
   user-select: none;
   filter: drop-shadow(3px 3px 3px #00000070);
}

.r5{
   top: 380px;
   left: calc(50% + 100px);
   position: absolute;
   animation: r5 3s alternate ease-in-out infinite;
   will-change: transform;
   user-select: none;
   filter: drop-shadow(3px 3px 3px #00000070);
}

.r6{
   top: 340px;
   left: calc(50% + 180px);
   position: absolute;
   animation: r6 1.5s alternate ease-in-out infinite;
   will-change: transform;
   user-select: none;
   filter: drop-shadow(3px 3px 3px #00000070);
}

.flare{
   top : -300px;
   left: calc(50% + 150px);
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
	}
	
	#penguinWrap{
		height : 350px;
	}
	
	#spimg{
		width : 400px;
		height : 200px;
		z-index : 0;
	}
	
	#island{
		position : relative;
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
		top : -150px;
		left : 50px; 
		width : 300px;
	}
	
	#wrapper{
		height : 1000px;
	}
	
	.garden:hover{
		cursor : pointer;
	}
	
	#bubbleWrap{
		display : none;
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
						  안녕하세요 :)<br> 저는 여러분을 비밀정원으로 안내할 펭콘이에요<br>
						  비밀정원을 시작하기 위해서는<br>먼저 키우고 싶은 허브를 선택해야해요!<br>
						<button id="hurbBtn" type="button" class="btn btn-sm">허브 선택 하기</button>
					</div>
				</div>
			</div>
			
			<div id="island" class="col-12 mb-5">
			  <img class="garden flare" src="/resources/imgPrivategarden/flare4.PNG" width="300px">
			  <img class="garden hero-octonaut" src="/resources/imgPrivategarden/base.png" width="800px">
			  <img class="garden r1" src="/resources/imgPrivategarden/00.png" width="40px">
			  <img class="garden r2" src="/resources/imgPrivategarden/01.png" width="60px">
			  <img class="garden r3" src="/resources/imgPrivategarden/02.png" width="45px">
			  <img class="garden r4" src="/resources/imgPrivategarden/03.png" width="50px">
			  <img class="garden r5" src="/resources/imgPrivategarden/04.png" width="65px">
			  <img class="garden r6" src="/resources/imgPrivategarden/05.png" width="45px">	   
		    </div>
		</div>
	</div>
	
	<script>
		$("#penguin").on("click", function(){
			$("#bubbleWrap").css("display", "block");
			/* $("#privategarden", parent.document).attr("src", "testModal"); */
		})
		
		$("#hurbBtn").on("click", function(){
			$(location).attr("href", "toSelectHurb");
		})
	</script>
</body>
</html>