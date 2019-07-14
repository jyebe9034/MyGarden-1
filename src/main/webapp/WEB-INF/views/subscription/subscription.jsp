<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<jsp:include page="../module/bootstrap_cdn.jsp"></jsp:include>
<title>정기 구독</title>
<style>
	#bcolor{
		width : 100%;
		height : 175px;
		background-color : #deca92;		
	}
	#title{
		text-align: center;
		margin : 50px;
	}
	#title div:first-child{
		font-size : 27px;
		font-weight : bold;
		margin-bottom : 10px;
	}
	#title div:last-child{
		font-size : 16px;
	}
	.item{
		border : 1px solid #d1d1d1;
		text-align: center;	
	}
	.item:hover{
		cursor : pointer;
	}
	#item4 .img{
		width : 120px;
		height : 120px;
		margin-top : 15px;
	}
	.imgs{
		margin-top : 50px;
		height : 150px;
	}
	.img{
		width : 150px;
		height : 150px;
		border-radius: 100%;
		margin : auto;
	}
	.name{
		margin-top : 50px;
		margin-bottom : 30px;
		font-size : 18px;
		font-weight : bold;
	}
	.content{
		margin-bottom : 80px;
		font-size : 15px;
	}
	#btnBorder{
		margin-top : 50px; 
	}
	#next{
		width : 250px;
		height : 60px;
		background-color: #44b27d;
		color : white;
		border-top-left-radius : 20px;
		border-top-right-radius : 20px;
		border-bottom-left-radius : 20px;
		border-bottom-right-radius : 20px;
		font-weight: bold;
		font-size : 20px;
	}
	#next:hover{
		background-color: #b4d9b5;
	}
	#nextBtn{
		text-align: center;
		margin : auto;
	}
</style>
</head>
<body>
	<jsp:include page="../module/fixedHeader.jsp"></jsp:include>
	<div id="bcolor"></div>
	<div id="wrapper" class="container">
		<div id="title" class="row">
			<div class="col-12">Select Your Box</div>
			<hr>
			<div class="col-12">정기 구독할 박스를 선택해 주세요!</div>
		</div>
		<div id="items" class="row">
			<div class="col-3">
				<div id="item1" class="item">
					<div class="imgs"><img class="img" src="resources/img/vege.jpeg"></div>
					<div class="name">채소 박스</div>
					<div class="content">공유 정원에서 키워진<br>
					건강한 채소들을<br>
					매주 다르게 구성해드려요.</div>
				</div>
			</div>
			<div class="col-3">
				<div id="item2" class="item">
					<div class="imgs"><img class="img" src="resources/img/fruits.jpg"></div>
					<div class="name">과일 박스</div>
					<div class="content">공유 정원의 재철 과일을<br>
					다양하게 구성해서<br>
					보내드려요.</div>
				</div>
			</div>
			<div class="col-3">
				<div id="item3" class="item">
					<div class="imgs"><img class="img" src="resources/img/salad.jpg"></div>
					<div class="name">채소 + 과일 박스</div>
					<div class="content">샐러드 채소와 함께 구성된<br>
					채소 + 과일 박스로<br>
					간편하게 샐러드를 즐겨보세요.</div>
				</div>
			</div>
			<div class="col-3">
				<div id="item4" class="item">
					<div class="imgs"><img class="img" src="resources/img/question.png"></div>
					<div class="name">나만의 박스</div>
					<div class="content">정기 구독 박스를 <br>
					원하는 품목으로 구성하고 싶다면<br>
					나만의 박스를 만들어 보세요.</div>
				</div>
			</div>
		</div>
		<div id="btnBorder" class="row">
			<div id="nextBtn" class="col-12">
				<input id="next" type="button" class="btn" value="다음 >">
			</div>
		</div>
	</div>
	<jsp:include page="../module/fixedFooter.jsp"></jsp:include>
	
	<script>
		$(".item").on("click", function(){
			$(this).css("border", "1px solid #44b27d");
		})
	</script>
</body>
</html>