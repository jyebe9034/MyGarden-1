<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../module/bootstrap_cdn.jsp"></jsp:include>
<title>공유 정원</title>
<style>
	#sharedWrap{
		position : relative;
	}
	#sharedFarm{
		width : 100%;
		height : 200px;
		margin : 30px auto;
	}
	#sharedTitle{
		font-size : 30px;
		text-align : center;
		position : absolute;
		top : 50%;
		left : 45%;
	}
	#wrapper{
		margin : 0px;
		padding : 0px;
	}
	#viewheight{
		height : 100vh;;
	}
	#header{
		overflow : hidden;
		height : 600px;
		padding : 0;
		margin-bottom : 50px;
	}
	#wrap{
		text-align: center;
	}
	.eachImg{
		width : 100%;
		height : 250px;
	}
	.cards{
		margin: 0 auto; 
        float: none;
	}
	.article{
		width : 100%;
		margin-top : 30px;
		text-align : center;
	}
	.anker:hover{
		cursor : pointer;
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
			location.href = "productsRead?pnumber=" + pnumber;
		})
	})
</script>
</head>
<body>
	<jsp:include page="../module/fixedHeader.jsp"/>
	<div id="wrapper">
		<div id="header">
			<img id="titleImg" src="resources/img/smtomato.jpg">
		</div>
		<div id="viewheight" class="container">
			<div id="sharedWrap" class="row">
				<img id="sharedFarm" src="resources/img/sharedFarm.jpg">
				<div id="sharedTitle">공유 정원</div>
			</div>
			<div id="wrap">
				<div class="row articles">
					<c:forEach var="list" items="${result}">
						<div class="col-4 article">
							<div class="card cards" style="width: 18rem;">
							  <img src="${list.p_imagepath}" class="card-img-top eachImg">
							  <div class="card-body anker" pnumber="${list.p_no}">
							    <h5 class="card-title title">${list.p_title}</h5>
							    <p class="card-text price">${list.p_price}</p>
							  </div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<%-- <div id="listFooter">
		<jsp:include page='../module/fixedFooter.jsp'/>
	</div> --%>
	
	<script>
		<!-- infinite scroll구현 부분 -->
		var isEnd = false;
		var page = 1;
		var documentHeight, windowHeight, scrollTop;
		var category = "${category}";
		
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
							category : category
						}
					}).done(function(resp){
						if(resp.length < 1){
							isEnd = true;
						}else{
							for(var i = 0; i < resp.length; i++){
								$(".articles").append("<div class='col-4 article'><div class='card cards' style='width: 18rem;'>"
								+ "<img class='card-img-top eachImg' src='" + resp[i].p_imagepath +"'>"
								+ "<div class='card-body anker' pnumber='" + resp[i].p_no + "'><h5 class='card-title title'>" + resp[i].p_title 
								+ "</h5><p class='card-text price'>" + numberWithCommas(resp[i].p_price) + "</p></div></div></div>");
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