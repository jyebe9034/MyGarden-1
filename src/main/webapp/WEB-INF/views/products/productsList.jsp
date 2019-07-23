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
		height : 100vh;
		margin : auto;
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
	.check{
		text-align : left;
	}
	#deleteBtn{
		background-color : #44b27d;
		color : white;
	}
	#deleteBtn:hover{
		background-color : #b4d9b5;
		color : white;
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
	<jsp:include page="../module/fixedHeader.jsp"/>
	<div id="wrapper">
		<div id="header">
			<img id="titleImg" src="resources/img/smtomato.jpg">
		</div>
		<div id="viewheight" class="container-fluid">
			<div id="wrap" class="container">
				<div id="sharedWrap" class="row">
					<img id="sharedFarm" src="resources/img/sharedFarm.jpg">
					<div id="sharedTitle">공유 정원</div>
				</div>
				<c:if test="${grade=='admin'}">
					<div class="row">
						<input id="deleteBtn" class="btn btn-sm" type="button" value="삭제">
					</div>
				</c:if>
				<div class="row articles">
					<c:forEach var="list" items="${result}">
						<div class="col-4 article">
							<c:if test="${grade=='admin'}">
								<div class="check">
									<input type="checkbox" class="checkDelete" name="checked" value="${list.p_no}">
								</div>
							</c:if>
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
			<div id="listFooter">
				<jsp:include page='../module/fixedFooter.jsp'/>
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
								
								var divCards = $("<div class='card cards' style='width: 18rem;'></div>");
								var imgEach = $("<img class='card-img-top eachImg' src='" + resp[i].p_imagepath +"'>");
								var cb_anker = $("<div class='card-body anker' pnumber='" + resp[i].p_no + "'></div>");
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