<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../module/bootstrap_cdn.jsp"></jsp:include>
<title>나의 정원 - 공유 정원</title>
<style>
#sharedWrap {
	width: 100%;
	margin: 30px 0 !important;
	padding: 0 15px;
	height: 120px;
}

#sharedFarm {
	width: 100%;
	height: auto;
}

#sharedImgDiv{
	width: 100%;
	height: 100%;
}

#sharedTitle, #engTitle {
	font-size: 30px;
	color: white;
	font-weight: bold;
	position: relative;
	bottom: 75px;
	right: 340px;
}

#engTitle{
	font-size: 20px;
	margin-left: 10px;
}

#wrapper {
	margin: 0px;
	padding: 0px;
}

#viewheight {
	height: 100vh;
	margin: auto;
}

#header {
	overflow: hidden;
	height: 175px;
	background-color: #97c4b8;
	padding: 0;
	margin-bottom: 50px;
}

#wrap {
	text-align: center;
}

.eachImg {
	width: 100%;
	height: 160px;
}

.cards {
	margin: 0 auto;
	float: none;
}

.card-title{
	font-weight: bold;
}

.article {
	width: 100%;
	margin-top: 30px;
	text-align: center;
}

.anker:hover {
	cursor: pointer;
}

.check {
	text-align: left;
}

#adminBtn{
	text-align: left;
	width: 100%;
	margin: 0px 25px;
}

.adBtns {
	background-color: #44b27d;
	color: white;
	margin-left: 10px;
}

.adBtns:hover {
	background-color: #b4d9b5;
	color: white;
}
#listFooter{
	margin-top : 30px;
}
</style>
<script>
	$(function(){
		/* jquery dyanamic binding */
		/*  1. $(staticAncestors).on(eventName, dynamicChild, function() {});
			2. $(selector).live( eventName, function(){} );
			3. $(document).on( eventName, selector, function(){} ); */
		$(".articles").on("click",".anker", function(){
			var pnumber = $(this).attr("pnumber");
 		//	location.href = "productsRead?pnumber=" + pnumber;
// 			location.href = "productsRead?br_p_no=1&currentPage=1&qnaCurrentPage=1&pnumber=" + pnumber;
			location.href = "productsRead?&revPage=1&qnaPage=1&pnumber=" + pnumber;
		})
		
		$("#insertBtn").on("click", function(){
			location.href = "productsAdd";
		})
		
		var arr = [];
		$("#wrap").on("click", ".checkDelete", function(){
			var checked = $(this).val();
			arr.push(checked);
			$("#deleteBtn").on("click", function(){
				location.href = "productsDelete?arr=" + arr;
			})
		})
	})
</script>
</head>
<body>
	<jsp:include page="../module/fixedHeader.jsp" />
	<div id="wrapper">
		<div id="header"></div>
		<div id="viewheight" class="container-fluid p-0">
			<div id="wrap" class="container">
				<div id="sharedWrap" class="row">
					<div class="col-12 sharedImgDiv">
						<img id="sharedFarm" src="resources/img/sharedFarm.jpg">
						<span id ="sharedTitle">공유 정원</span>
						<span id ="engTitle">Public Garden</span>
					</div>
				</div>
				<c:if test="${grade=='admin'}">
					<div class="row">
						<div class="col-12" id=adminBtn>
						<input id="deleteBtn" class="adBtns btn btn-sm" type="button"
							value="삭제"> <input id="insertBtn"
							class="adBtns btn btn-sm" type="button" value="등록">
						</div>
					</div>
				</c:if>
				<div class="row articles">
					<c:forEach var="list" items="${result}">
						<div class="col-4 article">
							<c:if test="${grade=='admin'}">
								<div class="check">
									<input type="checkbox" class="checkDelete" name="checked"
										value="${list.p_no}">
								</div>
							</c:if>
							<div class="card cards anker" style="width: 18rem;" pnumber="${list.p_no}">
								<img src="${list.p_imagepath}" class="card-img-top eachImg">
								<div class="card-body">
									<h5 class="card-title title">${list.p_title}</h5>
									<p class="card-text price">${list.p_price}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="listFooter" style="margin-top:100px;">
				<jsp:include page='../module/fixedFooter.jsp' />
			</div>
		</div>
	</div>


	<script>
		<!-- infinite scroll구현 부분 -->
		var isEnd = false;
		var page = 1;
		var documentHeight, windowHeight, scrollTop;
		var category = "${category}";
		var keyword = "${keyword}";
		
		$(window).scroll(function() {
			documentHeight = $(document).height();
			windowHeight = $(window).height();
			scrollTop = $(window).scrollTop();
			
			if(scrollTop + windowHeight + 250 > documentHeight){
				if(isEnd == true){
					return;
				}else{
					page++;
					$.ajax({
						url : "selectProductsByPage",
						type : "post",
						dataType : "json",
						data : {
							page : page,
							category : category,
							keyword : keyword
						}
					}).done(function(resp){
						if(resp.length < 1){
							isEnd = true;
						}else{
							for(var i = 0; i < resp.length; i++){
								var root = $("<div class='col-4 article'></div>");
								<c:if test="${grade == 'admin'}">
									var tmp = $("<div class='check'></div>");
									tmp.append( "<input type='checkbox' class='checkDelete' name='checked' value=" + resp[i].p_no +">");
									$(root).append(tmp);
								</c:if>
								
								var divCards = $("<div class='card cards anker' style='width: 18rem;' pnumber='" + resp[i].p_no + "'></div>");
								var imgEach = $("<img class='card-img-top eachImg' src='" + resp[i].p_imagepath +"'>");
								var cb_anker = $("<div class='card-body'></div>");
								var h5title = $("<h5 class='card-title title'>" + resp[i].p_title  + "</h5>");
								var priceP = $("<p class='card-text price'>" + numberWithCommas(resp[i].p_price) + "</p>");
								
								$(cb_anker).append(h5title);
								$(cb_anker).append(priceP);
								
								$(divCards).append(imgEach);
								$(divCards).append(cb_anker);
								$(root).append(divCards);
								$(".articles").append(root);
							}
						}
					})
				}
			}
		})
		
		$(".price").html(function(){
			var price = $(this).html();
			var result = numberWithCommas(price);
			$(this).html(result);
		})
	
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
		}
		
	</script>

</body>
</html>