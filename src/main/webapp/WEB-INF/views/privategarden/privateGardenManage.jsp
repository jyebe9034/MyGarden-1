<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../module/bootstrap_cdn.jsp"></jsp:include>

<title>Private Garden Manage</title>
<style>
@font-face { font-family: '777Newyorkers'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/777Newyorkers.woff') format('woff'); font-weight: normal; font-style: normal; }
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
			position : relative;
			top : 10px;
			left : 50px;
			z-index : 0;
		}
		
		#Layer_1{
			width : 200px;
			height : auto;
			position : relative;
			top : -39px;
			left : 285px;
			z-index : 1;
		}
		
		#speechBubble{
	  	width : 350px;
	  	height : 150px;
	  	z-index : 1;
	  	
	}
	
	#herbBtn{
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
		left : 55px; 
		width : 300px;
	}
	
	#wrapper{
		height : 800px;
		margin-bottom: 100px;
	}
		
	#clickHere img{
		width: 50px;
		transform : rotate(180deg)
	}
	
	#clickWrap{
		height: 60px;
		position: relative;
		top:190px;
		left: 80px;
	}
	
	#bubbleWrap{
		display : none;
		height : 0;
	}
	
	#controlWrap{
		text-align: center;
	}
	
	#controls{
		position : relative;
	}
	
	.control{
		width : 100px;
		height : auto;
		margin-left : 50px; 
	}
	
	#water{
		height : 95px;
	}
	
	#thermo{
		height : 85px;
	}
	
	#lightView{
		position : relative;
		top : 10px;
		left : 70px;
	}
	
	#waterView{
		position : relative;
		top : -42px;
		left : 225px;
	}
	
	#thermoView{
		position : relative;
		top : -93px;
		left : 380px;
	}
	
	.inputs{
		text-align: center;
		background-color: #f2edda; 
		border : 0;
		font-family: '777Newyorkers';
		font-size : 25px;
	}
	
	.btns{
		background-color : #728c78;
		color : white;
		position : relative;
		top : -75px;
	}
	
	.btns:hover{
		background-color : #607d67;
		color : white;
	}
	
	#btn1{
		left : -50px;
	}
	
	#btn2{
		left : -35px;
	}
	
	#btn3{
		left : 15px;
	}
	
	#btn4{
		left : 30px;
	}
	
	#btn5{
		left : 80px;
	}
	
	#btn6{
		left : 95px;
	}
	
	#gardenInfo{
		margin : auto;
		font-size : 21px;
		text-align: center;
	}
	
	#gardenName{
		background-color: #728c78;
		color : white;
		width : 200px;
		height : 50px;
		line-height: 50px;
		margin-left : 190px;
		border-radius : 5px;
	}
	.infos{
		margin-bottom : 15px;
		font-family: '777Newyorkers';
		font-size : 25px;
	}
	
	label{
		width : 180px;
		font-size : 20px;
	}
	
	#save{
		margin : 0 30px; 
		color : #728c78;
		border : 1px solid #728c78;
		font-family: '777Newyorkers';
		font-size : 25px;
		position : relative;
		top : -28px;
	}
	
	#cloudFrame{
		width:260px;
		height:280px;
		border:none;
		border-radius:5px;
        box-sizing: border-box;
		box-shadow: 0 0 15px 15px rgba(79,115,135,1);
	}
	#cloud{
		position:absolute;
		top:240px;
		left:36%;
		border:none;
		box-sizing: border-box;
	}
	#sunFrame{
		width:900px;
		height:600px;
		border:none;
		border-radius:50%;
        box-sizing: border-box; 
	}
	#sun{
		position:absolute;
		top:80px;
		left:24%;
		border:none;
		box-sizing: border-box;
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
	<div id="bcolor"></div>
	
	<div id="wrapper" class="container">
		
		<div id="contentsWrap" class="row">
			<div id="clickWrap" class="col-12">
			<span id="clickHere"><img src="/resources/imgPrivategarden/clickHere.png">클릭해주세요!</span>
			</div>
		    <div id="penguinWrap" class="col-6">
				<img id="penguin" src="/resources/imgPrivategarden/penguin.png" class="growup">
				<div id="bubbleWrap" flag="true">
					<div id="bubbleimg"><img id="spimg" src="/resources/imgPrivategarden/speech.PNG"></div>
				</div>
			</div>
			<div id="gardenInfo" class="col-6">
				<div id="gardenName" class="infos">${result.g_gardenname}</div>
				<div id="herb" class="infos"><label>허브 종류 : </label>${result.g_herb}</div>
				<div id="enrolldate" class="infos"><label>정원 개설일 : </label><fmt:formatDate value="${result.g_enrolldate}" pattern="yyyy-MM-dd"/></div>
			</div>
		</div>
		<div id="cloud">		
			<iframe src="cloud" id="cloudFrame"></iframe>
		</div>
		<div id="sun">		
			<iframe src="sun" id="sunFrame"></iframe>
		</div>
		<div id="controlWrap" class="row">
			<div id="sproutWrap" class="col-6">
			<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve" width="250px" height="250px" class="">
				<g><g id="plant">
					<path style="fill:#9AD14B;" d="M285.017,64.165c12.558,12.57,20.334,29.922,20.334,49.097c-38.35,0-69.431-31.081-69.431-69.431   C255.084,43.831,272.447,51.607,285.017,64.165z" data-original="#9AD14B" class="leaves-right"/>
					<path style="fill:#9AD14B;" d="M354.291,135.926c0,27.024-21.916,48.94-48.94,48.94c0-13.512,5.47-25.744,14.333-34.607   C328.535,141.408,340.767,135.926,354.291,135.926z" data-original="#9AD14B" class="leaves-left"/>
					<path style="fill:#9AD14B;" d="M305.352,113.262c0-27.809,11.266-52.985,29.499-71.206c18.221-18.221,43.397-29.499,71.206-29.499   C406.057,68.174,360.969,113.262,305.352,113.262z" data-original="#9AD14B" class="leaves-left"/>
					<rect x="296.295" y="104.207" style="fill:#9AD14B;" width="18.112" height="118.455" data-original="#9AD14B" class="plant"/></g>
				</g>
			</svg>
			<img id="pot" src="/resources/imgPrivategarden/pot.png">
			</div>
			<div id="controls" class="col-6">
				<img id="light" class="control" src="/resources/imgPrivategarden/light.png">
				<img id="water" class="control" src="/resources/imgPrivategarden/water.png">
				<img id="thermo" class="control" src="/resources/imgPrivategarden/thermometer.png">
				<input id="lightView" class="w-25 inputs form-control" type="text" value="${result.g_light}" readonly>
				<input id="waterView" class="w-25 inputs form-control" type="text" value="${result.g_humid}" readonly>
				<input id="thermoView" class="w-25 inputs form-control" type="text" value="${result.g_temper} ℃" readonly>
				<input id="btn1" type="button" class="btn btns" value="▲">
				<input id="btn2" type="button" class="btn btns" value="▼">
				<input id="btn3" type="button" class="btn btns" value="▲">
				<input id="btn4" type="button" class="btn btns" value="▼">
				<input id="btn5" type="button" class="btn btns" value="▲">
				<input id="btn6" type="button" class="btn btns" value="▼">
				<input id="save" type="button" class="btn btn-outline-light btn-block" value="이 상태를 유지합니다.">
			</div>
		</div>
	</div>
	<jsp:include page="../module/fixedFooter.jsp"></jsp:include>
	<script>
		$("#save").on("click", function(){
			var sun = $("#lightView").val();
			var humid = $("#waterView").val();
			var temp = $("#thermoView").val();
			
			var regex = /\d{2}/g;
			var result = regex.exec(temp);
			temp = result[0];
			
			$.ajax({
				url : "updateState",
				type : "post",
				data : {
					light : sun,
					humid : humid,
					temper : temp
				}
			}).done(function(resp){
				if(resp == "잘 다녀옴"){
					alert("펭콘이 이 상태를 기억했습니다!");
				}
			})
		})
	
		var light = 3;
		var water = 3;
		var temper = 3;
		$("#btn1").on("click",function(){
			$("#sun").fadeIn();
			$("#sun").delay(2000).fadeOut();
			if(light < 6 && light != 0){
				light = light + 1;
			}else if(light == 0){
				light = light + 2;
			}
			lightView(light);
		})
		$("#btn2").on("click", function(){
			if(light > 0 && light != 6){
				light = light - 1;
			}else if(light == 6){
				light = light - 2;
			}
			lightView(light);
		})
		
		function lightView(light){
			if(light == 6){
				alert("허브가 더 강한 빛을 좋아하지 않아요.");
			}else if(light == 5){
				$("#lightView").val("아주 강함");
			}else if(light == 4){
				$("#lightView").val("약간 강함");
			}else if(light == 3){
				$("#lightView").val("보통");
			}else if(light == 2){
				$("#lightView").val("조금 약함");
			}else if(light == 1){
				$("#lightView").val("아주 약함");
			}else if(light == 0){
				alert("허브는 빛 없이 살 수 없어요.");
			}
		}
		
		$("#btn3").on("click",function(){
			$("#cloud").fadeIn();
			$("#cloud").delay(2000).fadeOut();
			if(water < 6 && water != 0){
				water = water + 1;
			}else if(water == 0){
				water = water + 2;
			}
			waterView(water);
		})
		$("#btn4").on("click", function(){
			if(water > 0 && water != 6){
				water = water - 1;
			}else if(water == 6){
				water = water - 2;
			}
			waterView(water);
		})
		
		function waterView(water){
			if(water == 6){
				alert("허브는 너무 습한 걸 좋아하지 않아요.");
			}else if(water == 5){
				$("#waterView").val("아주 습함");
			}else if(water == 4){
				$("#waterView").val("약간 습함");
			}else if(water == 3){
				$("#waterView").val("보통");
			}else if(water == 2){
				$("#waterView").val("조금 건조함");
			}else if(water == 1){
				$("#waterView").val("아주 건조함");
			}else if(water == 0){
				alert("허브는 수분 없이 살 수 없어요.");
			}
		}
		
		$("#btn5").on("click",function(){
			if(temper < 6 && temper != 0){
				temper = temper + 1;
			}else if(temper == 0){
				temper = temper + 2;
			}
			temperView(temper);
		})
		$("#btn6").on("click", function(){
			if(temper > 0 && temper != 6){
				temper = temper - 1;
			}else if(temper == 6){
				temper = temper - 2;
			}
			temperView(temper);
		})
		
		function temperView(temper){
			var temp = ${result.g_temper};
			if(temper == 6){
				alert("허브는 너무 더운 걸 좋아하지 않아요.");
			}else if(temper == 5){
				$("#thermoView").val(temp+2 + " ℃");
			}else if(temper == 4){
				$("#thermoView").val(temp+1 + " ℃");
			}else if(temper == 3){
				$("#thermoView").val(temp + " ℃");
			}else if(temper == 2){
				$("#thermoView").val(temp-1 + " ℃");
			}else if(temper == 1){
				$("#thermoView").val(temp-2 + " ℃");
			}else if(temper == 0){
				alert("허브는 추운 걸 싫어해요.");
			}
		}
	
		$("#penguin").on("click", function(){
			if($("#bubbleWrap").attr("flag")=="true"){
				$("#bubbleWrap").css("display", "block");
				$("#clickHere").hide();
				$("#bubbleWrap").attr("flag","false");
			}else{
				$("#bubbleWrap").css("display", "none");
				$("#clickHere").show();
				$("#bubbleWrap").attr("flag","true");
			}
		})
		
		$("#cloud").hide();
		$("#sun").hide();
	</script>

</body>
</html>