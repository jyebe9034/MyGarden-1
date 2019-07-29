<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp" />
<!--     scroll -->
<link rel="stylesheet" href="resources/css/jquery.mCustomScrollbar.css" />
<link href="https://fonts.googleapis.com/css?family=Merienda+One"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="resources/js/jquery.mCustomScrollbar.js"></script>
<link rel="stylesheet" href="resources/css/recipe.css">
<link href="https://fonts.googleapis.com/css?family=Merienda+One"
	rel="stylesheet">
<style>
.clickToClose {
	background: #86B404;
	padding: 10px 0;
	color: #eee;
}

.clickToCloseBtn {
	width: 25px;
	height: 25px;
	right: 2%;
	cursor: pointer;
}

.clickToCloseBtnBorder {
	width: 25px;
	height: 25px;
	right: 2%;
	border: 1px solid #eee;
	border-radius: 50%;
	cursor: pointer;
}

.scrollBar {
	padding: 20px;
	overflow: auto;
	border-radius: 5px;
	box-shadow: 0 20px 50px 0 rgba(0, 0, 0, 0.4);
}

#clickToClose {
	display: none;
}

.carousel-caption {
	text-shadow: 2px 2px 2px #444;
}

.nav-tabs a {
	color: #495057;
}

.lastBtn button {
	border: 1px solid #4f9c87;
	color: #4f9c87;
	font-family: 'Eoe_Zno_L';
}

.lastBtn button:hover {
	background: #4f9c87;;
	color: #f4f4f4;
}

#chatboxWrap {
	border-radius: 5px;
	width: 350px;
	height: 500px;
	display: none;
}

#chatBox {
	position: fixed;
	left: 20px;
	bottom: 100px;
}

#chatWrap {
	width: 70px;
	height: 70px;
	position: fixed;
	left: 30px;
	bottom: 25px;
}

#chatBtn {
	width: 70px;
	height: 70px;
}

#chatBtn:hover {
	cursor: pointer;
}

.special:hover {
	filter: brightness(80%);
	cursor: pointer;
}

h1 {
	font-family: 'Merienda One', cursive;
	color: #3a5c19;
}

.rvWrapper {
	width: 90%;
	margin: 0 auto;
	margin-top: 50px;
}

.rvCard {
	width: 90%;
	margin: auto;
	height: 400px;
	margin: 0 auto;
}


#recipeImg {
	
 } 

.contentsBox {
	height: 60%;
}

.contentsBox .card-body {
	height: 100%;
}

.rvContents {
	height: 60%;
	text-overflow: ellipsis;
	display: block;
}

.rvContents span {
	width: 100%;
	/*       		height:40%; */
	font-size: 18px;
	font-weight: bold;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2; /* 라인수 */
	-webkit-box-orient: vertical;
	word-wrap: break-word;
	line-height: 1.2em;
	height: 2.5em;
	/* line-height 가 1.2em 이고 2라인을 자르기 때문에 height는 1.2em * 2 = 2.6em */
}

.rvContents p {
	width: 100%;
	font-size: 13px;
	/*       		margin-bottom: 10px; */
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	word-wrap: break-word;
	line-height: 1.2em;
	height: 3.6em;
}

.rvBottom {
	height: 25%;
}

.rvBottom a {
	border: 1px solid #4f9c87;
	background-color: white;
	color: #4f9c87;
}

.rvBottom a:hover {
	border: 1px solid white;
	background-color: #4f9c87;
	color: white;
}

.rvCard:hover {
	cursor: pointer;
	filter: brightness(90%);
}

#rvModal {
	margin-top: 50px;
}

.md_rvImgBox img {
	margin-bottom: 20px;
}

.rvMdCloseBtn {
	border: 1px solid white;
	background-color: #4f9c87;
	color: white;
}

.rvMdCloseBtn:hover {
	border: 1px solid #4f9c87;
	background-color: white;
	color: #4f9c87;
}

#recipeContBox{
	margin: 0 !important;
}
#recipeImg { 
	width: 100%;
	height: 100%;
} 
#recipeImg img{
	width: 100%;
	height: auto;
}
</style>
</head>
<body>
	<!-- script -->
	<script>
   $(function(){       
       $("#chatWrap").on("click", function(){
            console.log("클릭함");
            if($("#chatboxWrap").css("display") == "none"){
               $("#chatboxWrap").show();
            }else{
               $("#chatboxWrap").hide();
            }
         })
          //poplayher cookie
         function getCookie(cname) {
             var name = cname + "=";
             var ca = document.cookie.split(';');
             for(var i=0; i<ca.length; i++) {
                 var c = ca[i];
                 while (c.charAt(0)==' ') c = c.substring(1);
                 if (c.indexOf(name) != -1) return c.substring(name.length,c.length);
             }
             return "";
         }
         function setCookie(cname, cvalue, exdays) {
             var d = new Date();
             d.setTime(d.getTime() + (exdays*24*60*60*1000));
             var expires = "expires="+d.toUTCString();
             document.cookie = cname + "=" + cvalue + "; " + expires;
         }
         function couponClose(){
             setCookie("close","Y",1);
             $("#clickToClose").slideUp();
         }
          cookiedata = document.cookie;
          if(cookiedata.indexOf("close=Y")<0){
              $("#clickToClose").css('display', 'block');
          }else{
              $("#clickToClose").css('display', 'none');
          }
          $(".clickToCloseBtn").click(function(){
              couponClose();
          });
          $(".special").on('click', function(){
             $(location).attr('href', $(this).attr('href'));
          });
         //scroll
         $(".scrollBar").mCustomScrollbar({
            axis:"y",
            theme:"rounded-dark",
            autoExpandScrollbar:true,
            advanced:{autoExpandHorizontalScroll:true},
            setWidth: "100%",
            setHeight: 500,
            scrollButtons:{ enable: true }
         });
         $('.lastBtn button').on('click', function(){
            $(location).attr('href', $(this).attr('href'));
         });
   });
   
	
   $(".goPboardBtn").on("click",function(){
	   $(".rvCard").attr("data-target","");
   })
   
   $(document).on("click",".rvCard",function(){ //best리뷰 전체내용 모달창
		   var imgSrc = $(this).children().val();
		   var rvTitile = $(this).children().next().val();
		   var rvContent = $(this).children().next().next().val();
		   console.log("imgSrc : " + imgSrc);
		   console.log("rvTitile : " + rvTitile);
		   console.log("rvContent : " + rvContent);
		   $("#md_rvTitle").text(rvTitile);
		   $(".md_rvImgBox img").attr("src",imgSrc);
		   $(".md_rvContent").text(rvContent);
	   })
	   
   
   </script>

	<!-- advertise header -->
	<c:choose>
		<c:when test="${loginId!=null}">

			<style>
#clickToClose {
	display: none;
}
</style>

		</c:when>
		<c:otherwise>

			<div class="container-fluid my" id="clickToClose">
				<div class="row my">
					<div
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 clickToClose text-center">
						<span>회원가입과 함께 <a class="text-body font-weight-bold"
							href="/join">나만의 정원</a>을 가져 보세요!
						</span> <span class="position-absolute clickToCloseBtnBorder"></span> <span
							class="position-absolute clickToCloseBtn">&Cross;</span>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>

	<!-- header -->
	<jsp:include page="/WEB-INF/views/module/fixedHeader.jsp" />

	<!--          carousel -->
	<div class="container-fluid my">
		<div class="row my">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-0 p-0 my">
				<div class="bd-example">
					<div id="carouselExampleCaptions" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleCaptions" data-slide-to="0"
								class="active"></li>
							<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
							<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
							<li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="resources/img/carousel1.jpg" class="d-block w-100"
									alt="...">
								<div class="carousel-caption d-none d-md-block text-center mb-5">
									<h5 class="font-weight-bold"">나의 정원에서 수확합니다</h5>
									<p class="font-weight-bold"">나만의 정원에서는 언제든 신선한 채소를 만나볼 수
										있어요!</p>
								</div>
							</div>

							<div class="carousel-item">
								<img src="resources/img/caro1.jpg" class="d-block w-100"
									alt="...">
								<div class="carousel-caption d-none d-md-block text-left mb-5">
									<h5 class="font-weight-bold"">어디에도 없는 하나 뿐인 샐러드</h5>
									<p class="font-weight-bold"">직접 키운 허브로 만들어보세요!</p>
								</div>
							</div>
							<div class="carousel-item">
								<img src="resources/img/carousel3.jpg" class="d-block w-100"
									alt="...">
								<div class="carousel-caption d-none d-md-block text-left mb-5">
									<h5 class="font-weight-bold">어린 잎, 맑은 콩</h5>
									<p class="font-weight-bold">상큼하고 신선한 어린 잎과 고소한 콩으로 여는 아침</p>
								</div>
							</div>
							<div class="carousel-item">
								<img src="resources/img/carousel2.jpg" class="d-block w-100"
									alt="...">
								<div class="carousel-caption d-none d-md-block text-right mb-5">
									<h5 class="font-weight-bold"">여름을 닮은 허브 잼</h5>
									<p class="font-weight-bold"">계절을 품은 푸른빛 향신료 즐기기</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--    contents -->
	<div class="container pt-5 my">
		<div class="row text-center m-auto p-0 my">
			<div
				class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pt-5 pb-2 text-center my">
				<h1 class="pb-2">Wire the Organic</h1>
				<hr>
				<h4 class="pt-2 pb-4">나의 정원에서 가질 수 있는 특별한 네가지</h4>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-0 my">
				<h5 class="pt-2 pb-1">내가 소유하는</h5>
				<h5 class="pb-2">나만의 정원!</h5>
				<img src="resources/img/main1.jpg" width="250" height="360"
					class="special" href="mypageFirst">
				<h6 class="pt-3">계좌를 개설하는 것처럼</h6>
				<h6 class="pb-2">정원을 개설할 수 있습니다</h6>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-0 my">
				<h5 class="pt-2 pb-1">유기농 작물</h5>
				<h5 class="pb-2">커스터마이징!</h5>
				<img src="resources/img/main3.jpg" width="250" height="360"
					class="special" href="privateGarden">
				<h6 class="pt-3">비밀정원에서 나만의</h6>
				<h6 class="pb-2">작물을 직접 관리해 보세요</h6>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-0 my">
				<h5 class="pt-2 pb-1">매일매일 사계절</h5>
				<h5 class="pb-2">제철음식을 식탁에!</h5>
				<img src="resources/img/main2.jpg" width="250" height="360"
					class="special" href="/productsList">
				<h6 class="pt-3">똑똑한 정원은 사계절에</h6>
				<h6 class="pb-2">구애받지 않습니다</h6>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-0 my">
				<h5 class="pt-2 pb-1">수십가지 검수와</h5>
				<h5 class="pb-2">까다로운 관리!</h5>
				<img src="resources/img/main4.jpg" width="250" height="360"
					class="special" href="/productsList">
				<h6 class="pt-3">스마트팜 기반 관리 시스템이</h6>
				<h6 class="pb-2">오너의 건강까지 생각합니다</h6>
			</div>
		</div>
		<div class="row text-center mt-5 my">
			<div
				class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pt-5 text-center my">
				<h1 class="pb-2">Best of My Garden</h1>
				<hr>
				<h4 class="pt-2 pb-2">나의 정원에서 자라는 작물들을 만나보세요!</h4>
			</div>
			<div
				class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pt-4 pb-4 m-auto my">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active" id="home-tab"
						data-toggle="tab" href="#best" role="tab" aria-controls="home"
						aria-selected="true">Best</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#bestReviews" role="tab"
						aria-controls="profile" aria-selected="false">Best Reviews</a></li>
					<li class="nav-item"><a class="nav-link" id="contact-tab"
						data-toggle="tab" href="#review" role="tab"
						aria-controls="contact" aria-selected="false">Review</a></li>
					<li class="nav-item" style="padding-top: 2px;"><a
						class="nav-link border-0 font-weight-bold" href="/productsList">More
							+</a></li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="best" role="tabpanel"
						aria-labelledby="home-tab">
						<div class="row pt-3 m-auto">
							<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-0 my">
								<img src="resources/img/salad.jpg" width="95%" height="250"
									class="special" href="#">
								<h5 class="pt-2 pb-3">dddddddd</h5>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-0 my">
								<img src="resources/img/salad.jpg" width="95%" height="250"
									class="special" href="#">
								<h5 class="pt-2 pb-3">dddddddd</h5>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-0 my">
								<img src="resources/img/salad.jpg" width="95%" height="250"
									class="special" href="#">
								<h5 class="pt-2 pb-3">dddddddd</h5>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-0 my">
								<img src="resources/img/salad.jpg" width="95%" height="250"
									class="special" href="#">
								<h5 class="pt-2 pb-3">dddddddd</h5>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-0 my">
								<img src="resources/img/salad.jpg" width="95%" height="250"
									class="special" href="#">
								<h5 class="pt-2 pb-3">dddddddd</h5>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-0 my">
								<img src="resources/img/salad.jpg" width="95%" height="250"
									class="special" href="#">
								<h5 class="pt-2 pb-3">dddddddd</h5>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-0 my">
								<img src="resources/img/salad.jpg" width="95%" height="250"
									class="special" href="#">
								<h5 class="pt-2 pb-3">dddddddd</h5>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-0 my">
								<img src="resources/img/salad.jpg" width="95%" height="250"
									class="special" href="#">
								<h5 class="pt-2 pb-3">dddddddd</h5>
							</div>
						</div>
					</div>

					<div class="tab-pane fade" id="bestReviews" role="tabpanel"
						aria-labelledby="profile-tab">
						<div class="row rvWrapper">
							<c:forEach var="topReviews" items="${topReviews }">
								<div class="col-lg-4 col-md-6 col-sm-6 rvCardBox p-3">
									<div class="card mb-3 rvCard" data-toggle="modal"
										data-target="#rvModal">
										<input type="hidden" value="${topReviews.br_imagepath }">
										<input type="hidden" value="${topReviews.br_title }">
										<input type="hidden" value="${topReviews.br_content }">

										<div class="imageBox">
											<img src="${topReviews.br_imagepath }" class="card-img"
												onerror="this.src='/resources/free/noImg.png'">
										</div>
										<div class="contentsBox">
											<div class="card-body">
												<div class="rvContents">
													<span class="card-title">${topReviews.br_title }</span>
													<p class="card-text">${topReviews.br_content }</p>
												</div>
												<div class="rvBottom">
													<p class="card-text">
														<small class="text-muted"> <fmt:formatDate
																pattern="yyyy-MM-dd" value="${topReviews.br_date }" />
														</small>
													</p>
													<a
														href="productsRead?&revPage=1&qnaPage=1&pnumber=${topReviews.br_p_no }"
														class="btn btn-lg goPboardBtn">상품 보러 가기</a>

												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<!-- Modal for Reviews -->
					<div class="modal fade" id="rvModal" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="md_rvTitle"></h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="md_rvImgBox">
										<img src="" class="card-img"
											onerror="this.src='/resources/free/noImg.png'">
									</div>
									<div class="md_rvContentBox">
										<div class="md_rvContent"></div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn rvMdCloseBtn btn-lg"
										data-dismiss="modal">Close</button>
									<!-- 			        <button type="button" class="btn btn-primary">상품 보러 가기</button> -->
								</div>
							</div>
						</div>
					</div>

					<div class="tab-pane fade" id="review" role="tabpanel"
						aria-labelledby="contact-tab">...</div>
				</div>
			</div>
		</div>
		<div class="row text-center mt-4 my">
			<div
				class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pt-5 text-center my">
				<h1 class="pb-2">Collaboration</h1>
				<hr>
				<h5 class="p-1">나의 정원 x 월드컵 축구대표팀</h5>
				<h4 class="pt-2 pb-3">국가대표가 추천하는 건강 식단</h4>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 p-2 my">
				<h5 class="pt-2 pb-2">조소현 선수</h5>
				<img src="resources/img/player1.jpg" width="330" height="340"
					class="special" href="/productsList">
				<h6 class="pt-3 pb-2">&ldquo;규칙적인 샐러딩 습관이 중요합니다 &rdquo;</h6>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 p-2 my">
				<h5 class="pt-2 pb-2">지소연 선수</h5>
				<img src="resources/img/player2.jpg" width="330" height="340"
					class="special" href="/productsList">
				<h6 class="pt-3 pb-2">&ldquo;나의 정원에서 제철과일을 즐겨 먹어요&rdquo;</h6>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 p-2 my">
				<h5 class="pt-2 pb-2">문미라 선수</h5>
				<img src="resources/img/player3.jpg" width="330" height="340"
					class="special" href="/productsList">
				<h6 class="pt-3 pb-1">&ldquo;나의 정원에선 채소뿐만 아니라</h6>
				<h6 class="pb-2">다른 유기농 유제품도 함께 수확할 수 있어서 좋아요&rdquo;</h6>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 p-2 my">
				<h5 class="pt-2 pb-2">손화연 선수</h5>
				<img src="resources/img/player4.jpg" width="330" height="340"
					class="special" href="/productsList">
				<h6 class="pt-3 pb-1">&ldquo;영양과 맛, 두가지를 다 잡은</h6>
				<h6 class="pb-2">저만의 오트밀 레시피를 알려드리겠습니다&rdquo;</h6>
			</div>
		</div>
		<div class="row text-center mt-3 my">
		 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pt-5 text-center my">
            <h1 class="pb-2">Owner's Recipe</h1><hr>
            <h4 class="pt-2 pb-4">정원 오너들이 공유하는 레시피</h4>
         </div>
      
          <div class="col-lg-9 col-md-10 col-sm-12 col-xs-12 mx-auto text-left mb-5 my scrollBar">
             	<div class=row>
                <div class="col-lg-6 col-sm-12" id=recipeImg></div>
                 <div class="col-lg-6 col-sm-12" id=recipeContBox>
                    <h5 class="font-weight-bold text-center ">- ${recipe.bf_title } -</h5><br>
                    <div id=recipeCont></div>
                 </div>
        		</div>
         </div>
    
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-4 my">
				<!-- partial:index.partial.html -->
				<div class="slider">
					<img
						src="https://www.maggiesadler.com/wp-content/uploads/2015/10/10004088_1491055334449687_1187165020_n.jpg"
						class="special" href="/" /> <img
						src="https://www.maggiesadler.com/wp-content/uploads/2015/10/10817863_856543214397968_517239188_n.jpg" />
					<img
						src="https://www.maggiesadler.com/wp-content/uploads/2015/10/10919749_326992714172441_299394464_n.jpg" />
					<img
						src="https://www.maggiesadler.com/wp-content/uploads/2015/10/10617007_939025979457209_6938406_n.jpg" />
					<img
						src="https://www.maggiesadler.com/wp-content/uploads/2015/10/1168617_1435408473368301_409182770_n.jpg" />
					<img
						src="https://www.maggiesadler.com/wp-content/uploads/2015/10/11189836_754178218029431_2102772742_n.jpg" />
					<img
						src="https://www.maggiesadler.com/wp-content/uploads/2015/10/10843869_1658219887738208_2033326788_n.jpg" />
					<img
						src="https://www.maggiesadler.com/wp-content/uploads/2015/10/1515054_1379051609022475_1394148610_n.jpg" />
				</div>
				<!-- partial -->
				<!--               <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js'></script> -->
				<script src="resources/js/recipe.js"></script>
			</div>
			<div
				class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mb-5 pt-4 pb-5 lastBtn my">
				<button type="button" class="btn btn-lg mt-2 mr-2"
					href="/boardFreeList">더 보기</button>
				<button type="button" class="btn btn-lg mt-2" href="/aboutMyGarden">About
					나의 정원</button>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp" />

	<c:if test="${grade == 'public' || grade == 'private'}">
		<div id="chatWrap">
			<img id="chatBtn" src="/resources/img/chat.png">
		</div>
		<div id="chatboxWrap">
			<iframe id="chatBox" src="toChat" width="350px" height="496px"
				frameborder=0 framespacing=0 marginheight=0 marginwidth=0
				scrolling=no vspace=0 />
		</div>
	</c:if>
</body>

<script>

//----- 레시피 시작 ------
var recipe = '${recipe.bf_content}';
var rRegex = /(<img.+?.>).?(<img.+?.>)/g;
var rimg = rRegex.exec(recipe);
$("#recipeImg").append(rimg[1]);
$("#recipeImg").append(rimg[2]);
console.log(rimg);
var rcon = recipe.replace(rRegex, "");


$("#recipeCont").html(rcon);
//----- 레시피 끝 -----

</script>

</html>