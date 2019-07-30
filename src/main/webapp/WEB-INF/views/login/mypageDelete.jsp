<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - 회원 탈퇴</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<style>
#joinBtn{height:57px; position:absolute; top:6px; right:14px; display: inline-block; padding: .5em .75em; color: #4f9c87; font-size: inherit; line-height: normal; vertical-align: middle; background-color: #fdfdfd; cursor: pointer; border: 1px solid #4f9c87; border-bottom-color: #4f9c87; border-radius: .25em; }
#joinBtn:hover{background:#4f9c87; color:#fff;}
.fontGreen{font-weight:bold; color:#4f9c87;}
.onblur{font-size:13px; color:#4f9c87;}
.postCode{position:relative;}
.modal-body{height:400px; overflow-y:scroll;}
input[name=m_social]{pointer-events: none; visibility: hidden;}
.blockSign {
  align-items: center;
  flex-direction: column; 
  justify-content: center;
  width: 100%;
  min-height: 100%;
  padding: 0 20px 20px 20px;
}
#formContent {
  -webkit-border-radius: 0px 0px 10px 10px;
  border-radius: 0px 0px 10px 10px;
  background: #fff;
  padding: 0px;
  max-width: 650px;
  margin: 47px auto;
  position: relative;
  -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  text-align: center;
}
#formFooter {
  background-color: #f6f6f6;
  border-top: 1px solid #dce8f1;
  padding: 25px;
  text-align: center;
  -webkit-border-radius: 0 0 10px 10px;
  border-radius: 0 0 10px 10px;
}
.tab-group:after {
  content: "";
  display: table;
  clear: both;
}
.tab-content > div:last-child {
  display: none;
}
#reset{
  background:#72af9f;
  border: none;
  color: white;
  padding: 15px 80px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  -webkit-box-shadow: 0 10px 30px 0 #65a896;
  box-shadow: 0 10px 30px 0 #65a896;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 5px 20px 40px 20px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}
input[type=button], input[type=submit]  {
  background-color: #4f9c87;
  border: none;
  color: white;
  padding: 15px 80px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  -webkit-box-shadow: 0 10px 30px 0 #65a896;
  box-shadow: 0 10px 30px 0 #65a896;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 5px 20px 40px 20px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}
input[type=button]:hover, input[type=submit]:hover  {
  opacity:0.8;
}
input[type=button]:active, input[type=submit]:active  {
  -moz-transform: scale(0.95);
  -webkit-transform: scale(0.95);
  -o-transform: scale(0.95);
  -ms-transform: scale(0.95);
  transform: scale(0.95);
}
.inputStuff{
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 95%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}
.inputStuff50{
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 46%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}
input[type=text]:focus,input[type=email]:focus, input[type=password]:focus {
  background-color: #fff;
  border-bottom: 2px solid #60a593;
}
input:readonly{
  background:#D1E5DF;
  border: 2px solid #D1E5DF;
}
input[type=text]:placeholder,input[type=email]:placeholder, input[type=password]:placeholder {
  color: #eee;
}
.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}
@-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}
@keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}
/* Simple CSS3 Fade-in Animation */
@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
.fadeIn {
  opacity:0;
  -webkit-animation:fadeIn ease-in 1;
  -moz-animation:fadeIn ease-in 1;
  animation:fadeIn ease-in 1;

  -webkit-animation-fill-mode:forwards;
  -moz-animation-fill-mode:forwards;
  animation-fill-mode:forwards;

  -webkit-animation-duration:1s;
  -moz-animation-duration:1s;
  animation-duration:1s;
}
.fadeIn.first {
  -webkit-animation-delay: 0.4s;
  -moz-animation-delay: 0.4s;
  animation-delay: 0.4s;
}
.fadeIn.second {
  -webkit-animation-delay: 0.6s;
  -moz-animation-delay: 0.6s;
  animation-delay: 0.6s;
}
.fadeIn.third {
  -webkit-animation-delay: 0.8s;
  -moz-animation-delay: 0.8s;
  animation-delay: 0.8s;
}
.fadeIn.fourth {
  -webkit-animation-delay: 1s;
  -moz-animation-delay: 1s;
  animation-delay: 1s;
}
/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
  display: block;
  left: 0;
  bottom: -10px;
  width: 0;
  height: 2px;
  background-color: #86B404;
  content: "";
  transition: width 0.2s;
}
.underlineHover:hover {
  color: #86B404;
}
.underlineHover:hover:after{
  width: 100%;
}
input[type=email]{
  background:#D1E5DF;
  border: 2px solid #D1E5DF;
}
/* OTHERS */
*:focus {
    outline: none;
} 
* {
  box-sizing: border-box;
} 
</style>
</head>
<body>
<script>
	$(function(){
		//slide
		$('.carousel').carousel({
			  interval: 5000
			});
		//input effect
		$('.form').find('input, textarea').on('keyup blur focus', function (e) {
		    var $this = $(this),
		        label = $this.prev('label');
		        if (e.type === 'keyup') {
		              if ($this.val() === '') {
		            label.removeClass('active highlight');
		          } else {
		            label.addClass('active highlight');
		          }
		      } else if (e.type === 'blur') {
		          if( $this.val() === '' ) {
		              label.removeClass('active highlight'); 
		              } else {
		              label.removeClass('highlight');   
		              }   
		      } else if (e.type === 'focus') {
		        if( $this.val() === '' ) {
		              label.removeClass('highlight'); 
		              } 
		        else if( $this.val() !== '' ) {
		              label.addClass('highlight');
		              }
		      }
		  });
		//input form
       	$("#pastPw").on("blur", function(){
       		$.ajax({
       			url:"/pwCheck",
       			type:"post",
       			data:{key:"${memDTO.m_email}", pw:$("#pastPw").val()}
       		}).done(function(resp){
       			if(resp==true){
           			$("#pastPwName").text("");
       			}else{
           			$("#pastPwName").text("비밀번호가 일치하지 않습니다");
           			$("#pastPw").val("");
       			}
       		});
       	});
   		$('#reset').on('click', function(){
   			$(location).attr('href', '/mypageFirst');
   		});
   		$('#delete').on('click', function(){
   			if($('#pastPw').val()!=""){
       			var con = confirm('정말 탈퇴하시겠습니까?');
 				if(con){
                		$('.formSubmit').submit();	
            		}
   			}else{
   				alert('다시 확인 후 제출하세요');
   			}
        });	
	});
</script>
<!-- header -->
	<jsp:include page="/WEB-INF/views/module/fixedHeader.jsp"/>
<!-- 	images -->
	<div class="container-fluid imageContainer m-0 p-0 my">
		<div class="row my">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my">
				<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="resources/img/mypage1.jpg" align="bottom" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="resources/img/mypage2.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="resources/img/mypage3.jpg" class="d-block w-100" alt="...">
				    </div>
				  </div>
				</div>
			</div>
		</div>
	</div>
<!-- 	contents -->
	<div class="container my">
		<div class="row text-center mt-5 my">
		
		<jsp:include page="/WEB-INF/views/module/mypage.jsp"/>
		
			<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12 pt-5 my">
				<div class="list-group">
				  <a href="/mypageFirst" class="list-group-item list-group-item-action">Overview</a>
				  <a href="/mypageInfo" class="list-group-item list-group-item-action">내 정보 수정</a>
				  <a href="orderList" class="list-group-item list-group-item-action">구매 내역</a>
				  <a href="subsList" class="list-group-item list-group-item-action">정기 구독</a>
				  <c:if test="${grade == 'admin'}">
				  		<a href="productsAdd" class="list-group-item list-group-item-action">상품 등록</a>
				  		<a href="chatManage" class="list-group-item list-group-item-action">채팅 문의 관리</a>
				  </c:if>
				  <a href="/mypageDelete" class="list-group-item list-group-item-action currentActive">탈퇴하기</a>
				</div>
			</div>
			<div class="col-lg-9 col-md-12 col-sm-12 col-xs-12 my">	
				<div class="blockSign">
			        <div id="formContent">
			                <div id="signin">
			                    <h3 class="font-weight-bold text-dark pt-5 pr-2">나의 정원 탈퇴하기
			                    </h3>
			                    <h6 class="pt-2 text-muted mr-2 ml-2">모든 정보는 영구삭제되며, 복구할 수 없습니다</h6>
			                    <!-------------------- jstl ------------------------->
			                        <c:choose>
										<c:when test="${memDTO.m_social=='MG'}">  
						                    <form class="pt-4 pl-5 pr-5 formSubmit" action="delete" method="post">	
						                        <input type="password" placeholder="이전 비밀번호를 입력하세요*" class="fadeIn inputStuff" id="pastPw">
						                        	<div class="onblur" id="pastPwName"></div>
						                        <input type="button" class="mt-4 mb-1" value="취소하기" id="reset">
						                        <input type="button" value="탈퇴하기" id="delete">
						                    </form>
				                    	</c:when>
				                    	<c:otherwise>
						                    <form class="pt-4 pl-5 pr-5 formSubmit" action="delete" method="post">
						                        <input type="button" class="mt-4 mb-1" value="취소하기" id="reset">
						                        <input type="button" value="탈퇴하기" id="delete">
						                    </form>
				                    	</c:otherwise>
				                    </c:choose>
				                 <!-------------------- jstl ------------------------->   
		                        <p id="formFooter">
		                        	<a href="#" class="text-muted" data-toggle="modal" data-target="#exampleModalCenter">서비스 이용약관 및 개인정보취급방침</a>
		                       	</p>
		                       	<!-- Modal -->
									<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
									  <div class="modal-dialog modal-dialog-centered" role="document">
									    <div class="modal-content">
									      <div class="modal-header">
								    	    <h5 class="modal-title" id="exampleModalCenterTitle">서비스 이용약관 및 개인정보취급방침</h5>
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									          <span aria-hidden="true">&times;</span>
									        </button>
									      </div>
									      <div class="modal-body text-left">
								         	<jsp:include page="/WEB-INF/views/module/contract.jsp"/>
								     	 </div>
									      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
									      </div>
									    </div>
									  </div>
									</div>
								<!-- modal end -->
			                </div>
			                <div id="signup">
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
		</div>
	</div>	
	
<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
</body>
</html>