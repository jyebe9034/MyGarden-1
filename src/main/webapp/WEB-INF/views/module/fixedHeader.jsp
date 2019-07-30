<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- style -->
<style>
#goToTop {
   position: fixed;
   right: 28px;
   bottom: 28px;
   border-radius: 50%;
   padding: 2px;
   background:rgba(255,255,255,0.5);
   box-shadow: 0 10px 30px 0 rgba(0,0,0,0.3);
   z-index: 999;
   font-size: 15px;
   cursor: pointer;
   animation-duration: 2s;
   animation-delay: 2s;
}
.headerFluid {
   position: absolute;
   z-index: 9999;
   background-color: rgba(255, 255, 255, 0.5);
}
.topAnchor a {
   margin-left: 15px;
   font-size: 13px;
   color: #000;
   font-weight: bold;
}
#myGardenTitle {
   font-family: 'Noto Serif KR', "맑은 고딕";
   font-weight: 1000;
   letter-spacing: 4px; /*text-shadow: 1px 1px 1px gray;*/
   cursor:pointer;
   color:#141414;
}
.topMenuNavbar {
   background-color: rgba(255, 255, 255, 0.1);
   font-size: 14px;
   font-weight: bold; /*text-shadow: 1px 1px 1px #999;*/
}
.topMenuToggleBtn {
   border: none;
}
.menuPosition-fixed {
   position: fixed;
   top: 0;
   left: 0;
   background: #f5f5f5;
   box-shadow: 0 5px 40px 0 rgba(0,0,0,0.3);
}
.navbar-light .navbar-nav .nav-link {
   color: #000; margin-top:11px; margin-left:5px;
}
.dropdown-menu {
   background-color: rgba(255, 255, 255, 0.3);
   box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
   top: 56px;
   border: none;
   border-radius: 0;
}
.dropdown-item {
   font-weight: bold;
   font-size: 14px;
}
.dropdown-item:active {
   background: #86B404;
}
.dropdown-divider {
   color: #86B404;
}
.topAnchorSearch {
   margin: 10px auto;
}
.menuSearch {
   border: 1px solid #6c757d;
   background: none;
}
.menuSearch::placeholder {
   color: #6c757d;
}
.text-shadow {
   text-shadow: 2px 2px 2px gray;
}
.socialEmo img:hover, .nav-link img:hover, .clickToCloseBtn:hover {
   opacity: 0.7;
}
.clickToClose{background:#86B404; padding:10px 0; color:#eee;}
.clickToCloseBtn{width:25px; height:25px; right:2%; cursor:pointer;}
.clickToCloseBtnBorder{width:25px; height:25px; right:2%; border:1px solid #eee; border-radius:50%; cursor:pointer;}

@font-face {
	font-family: 'S-CoreDream-3Light';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
#cart{margin:-10px 0 0 -20px;}

/* 전체 폰트용 코드  */
@font-face {
	font-family: 'Eoe_Zno_L';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/Eoe_Zno_L.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'S-CoreDream-3Light';
}

.mt-2 {
	font-family: 'Eoe_Zno_L';
}
/* 폰트용 코드  */

</style>

<!--    script -->
<script>
   $(function() {
      var topMenuOffset = $('.menuScrollOption').offset(); 
      $(window).scroll(function() {
         if ($(document).scrollTop() > topMenuOffset.top) {
            $('.menuScrollOption').addClass('menuPosition-fixed');
         } else {
            $('.menuScrollOption').removeClass('menuPosition-fixed');
         }
      });
      //아무 창이나 누르면 toggle키가 작동, 메뉴 접힘 시작
//       $('.navbar-toggler').click(function(event){
//           event.stopPropagation();
//           $('#navbarSupportedContent').toggle();
//       });
//       $(document).click(function(){
//           $('#navbarSupportedContent').hide();
//       });
      //아무 창이나 누르면 toggle키가 작동, 메뉴 접힘 끝
      $('#goToTop').on('click', function() {
         $('html, body').stop().animate({
            scrollTop : '0'
         });
      });
//       $("#admin").on("click", function() {
//           $(location).attr("href", "adminView")
//        });
      $("#myGardenTitle").on("click", function() {
         $(location).attr("href", "/")
      });
      /* 검색기능 by 지혜 */
      $("#searchBtn").on("click", function(){
    	  var keyword = $("#keyword").val();
    	  keyword = keyword.replace(/(&nbsp;)+/ig, "");	// 맨 앞 공백, 공백연속으로 쳤을때 &nbsp;
    	  keyword = keyword.replace(/^[ ]+/ig, "");	// &nbsp;자르고나서 또 맨앞에 오는 공백 자르기
    	  keyword = keyword.replace(/(<div><br><\/div>)+/ig, "");// 내용없이 엔터쳤을때
    	  keyword = keyword.replace(/(<div>[ ]*?<\/div>)/ig, "");// 공백만 넣고 엔터쳤을때
    	  $(location).attr("href", "searchKeyword?keyword=" + keyword);  
      })
   });
</script>
       
<!--    html -->
<div id="goToTop" class="animated infinite bounce">
   <img src="resources/img/top.png" width="40" height="40">
</div>
<div class="container-fluid headerFluid my">
	<div class="row my">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
<!-- 	JSTL	 -->
			<c:choose>
		       <c:when test="${loginName!=null}">
		       
				<div class="row">
					<div
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-3 mb-3 text-right topAnchor my">
						<a href="mypageFirst">${loginName }님의 페이지</a> 
<!-- 코드 추가 : admin인 경우 통계 보기로 감!!  -->
						<c:if test="${grade=='admin' }">
						<a href="adminIndex">통계 보기</a>
						</c:if>
<!-- 코드 끝  -->						
						<a href="cart">장바구니</a> <a href="#">고객센터</a> <a href="/logout" class="mr-3">로그아웃</a> 
					</div>
				</div>
			
	       </c:when>
	       <c:otherwise>	
	       
				<div class="row">
					<div
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-3 mb-3 text-right topAnchor my">
						<a href="/login">로그인</a> <a href="/join">회원가입</a> <a href="cart">장바구니</a> <a
							href="#" class="mr-3">고객센터</a>
					</div>
				</div>
	  
	       </c:otherwise>
	    </c:choose>
<!-- 	JSTL	 -->		
			<div
				class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-1 mb-4 text-center my">
				<h3 id="myGardenTitle">나의 정원</h3>
			</div>
		</div>
		<div
			class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-0 menuScrollOption my">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-0 my">
					<nav class="navbar navbar-expand-lg navbar-light p-0 topMenuNavbar">
						<button class="navbar-toggler topMenuToggleBtn" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav m-auto text-center">
								<li class="nav-item active dropdown"><a
									class="nav-link dropdown-toggle" href="#" role="button"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> 상세 카테고리 </a>
									<div class="dropdown-menu text-center"
										aria-labelledby="navbarDropdown">
										  <a class="dropdown-item" href="fruit?category=fruit">과일</a> 
			                              <a class="dropdown-item" href="vegetable?category=vegetable">채소</a>
			                              <a class="dropdown-item" href="egg?category=egg">달걀/유제품</a>
			                              <a class="dropdown-item" href="grain?category=grain">곡물</a>
			                              <a class="dropdown-item" href="source?category=source">소스/조미료</a>
									</div></li>
								<li class="nav-item"><a class="nav-link" href="productsList">공유정원</a></li>
		                        <li class="nav-item"><a class="nav-link" href="privateGarden">비밀정원</a></li>
		                        <li class="nav-item"><a class="nav-link">|</a></li>
		                        <li class="nav-item"><a class="nav-link" href="/aboutMyGarden">About</a></li>
		                        <li class="nav-item"><a class="nav-link" href="subscription">정기구독</a></li>
		                        <li class="nav-item"><a class="nav-link" href="boardFreeList">레시피</a></li>
								<li class="nav-item">
									<form class="form-inline my-2 my-lg-0">
										<div class="input-group topAnchorSearch">
											<input id="keyword" class="form-control menuSearch ml-4" type="search"
												placeholder="Search...">
											<div id="searchBtn" class="input-group-append">
												<button class="btn btn-outline-secondary mr-4" type="button"
													>&telrec;</button>
											</div>
										</div>
									</form>
								</li>
		                        <li class="nav-item d-none d-lg-block"><a class="nav-link" href="cart">  
									<img src="resources/img/shop.png" width="40" height="40" id="cart" data-toggle="tooltip" data-placement="bottom" title="장바구니">
								</a></li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>