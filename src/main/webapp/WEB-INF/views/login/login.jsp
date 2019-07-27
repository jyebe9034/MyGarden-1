<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - 로그인</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<style>	
.imageContainer{height:300px; overflow:hidden;}
.carousel-inner{margin-top:-120px;}
.form-check-label, #formFooter{font-size:15px;}
.joinSuggestion{color:#4f9c87; border:1px solid #4f9c87; margin-top:-8px;}
.joinSuggestion:hover{color:#fff; border:1px solid #4f9c87; background:#4f9c87;}
span.mr-2{font-size:25px; display:inline-block; margin-bottom:20px;}
.event{background:rgba(0,0,0,0.3); text-shadow: 1px 1px #444; max-width:250px; font-size:17px; padding:20px; bottom:20%; right:15%; color:#fff;}
.onblur{font-size:13px; color:#4f9c87;}
#newPw{display:none;}
.tab-group a {
  text-decoration: none;
  color: #1ab188;
  transition: .5s ease;
}
.tab-group a:hover {
  color: #179b77;
}
.blockSign {
  align-items: center;
  flex-direction: column; 
  justify-content: center;
  width: 100%;
  min-height: 100%;
  padding: 20px;
}
#formContent {
  -webkit-border-radius: 10px 10px 10px 10px;
  border-radius: 10px 10px 10px 10px;
  background: #fff;
  padding: 0px;
  max-width: 500px;
  margin: 40px auto;
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
.tab-group {
  list-style: none;
  padding: 0;
  margin: 0 0 40px 0;
}
.tab-group:after {
  content: "";
  display: table;
  clear: both;
}
.tab-group li a {
  display: block;
  text-decoration: none;
  padding: 15px;
  background:#65a896;
  color: #e3f5f2;
  font-size: 20px;
  float: left;
  width: 50%;
  text-align: center;
  cursor: pointer;
  transition: .5s ease;
}
.tab-group li a:hover {
  opacity:0.8;
  color: #ffffff;
}
.tab-group .active a {
  background:#399078;
  color: #ffffff;
}
.tab-content > div:last-child {
  display: none;
}
input[type=button], input[type=submit], input[type=reset]  {
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
input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
  opacity:0.8;
}
input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
  -moz-transform: scale(0.95);
  -webkit-transform: scale(0.95);
  -o-transform: scale(0.95);
  -ms-transform: scale(0.95);
  transform: scale(0.95);
}
input[type=text],input[type=email], input[type=password]{
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 85%;
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
input[type=text]:placeholder,input[type=email]:placeholder, input[type=password]:placeholder {
  color: #cccccc;
}
.socialButton{
  border: none;
  color: white;
  font-weight:bold;
  font-size:19px;
  padding: 15px 80px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 5px 20px 40px 20px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
	width:90%; height:50px;
}
.bg-success{
  -webkit-box-shadow: 0 10px 30px 0 #91D2A0!important;
  box-shadow: 0 10px 30px 0 #91D2A0!important;
}
.bg-warning{
  -webkit-box-shadow: 0 10px 30px 0 #FFD761!important;
  box-shadow: 0 10px 30px 0 #FFD761!important;
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
<!-- script -->
	<script>
		$(function(){
			$('.carousel').carousel({
				  interval: 5000
				});
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
			  $('.tab a').on('click', function (e) {
			    e.preventDefault();
			    $(this).parent().addClass('active');
			    $(this).parent().siblings().removeClass('active');
			    target = $(this).attr('href');
			    $('.tab-content > div').not(target).hide();
			    $(target).fadeIn(600);
			  });
			  $('.joinSuggestion').on('click', function(){
				  $(location).attr('href', '/join');
			  });
		      $('input[name=loginId]').on('blur', function(){
	           		var regexMail=/^[^\d](\w*|\d)@([a-z]*.?)*[a-z]$/;
	           		if(regexMail.exec($("input[name=loginId]").val())){
	               		$.ajax({
	               			url:"/emailCheck",
	               			type:"post",
	               			data : {key : $("input[name=loginId]").val()}
	               		}).done(function(resp){
	               			if(resp==true){
	    	           			$("#loginId").text("");
	               			}else{
	    	           			$("#loginId").text("존재하지 않는 메일입니다");
	    	           			$("input[name=loginId]").val("");
	               			}
	               		});
	           		}else{
	           			$("#loginId").text("사용할 수 없는 형식의 메일입니다");
	           			$("input[name=loginId]").val("");
	           		}
	           	});
              $('#loginBtn').on('click', function(){
              	if($('input[name=loginId]').val()=="" || $('input[name=loginPw]').val()==""){
              		alert('아이디 혹은 비밀번호를 입력하세요');
              	}else{
              		$('#loginForm').submit();
              	}
              });
              $('input').keypress(function(event){
            	     if ( event.which == 13 ) {
            	    	 if($('input[name=loginId]').val()=="" || $('input[name=loginPw]').val()==""){
                       		alert('아이디 혹은 비밀번호를 입력하세요');
                       	}else{
                       		$('#loginForm').submit();
                       	}
            	     }
              });
              $('.idModal').on('click', function(){
              	$('#m_phone').val("");
              	$("#m_email").html("");
		    	$("#findPwMail").attr("readonly", false);
		    	$("#findPwMail").val("");
		    	$("#findPw").attr("class", "d-none");
		    	$("#newPw").removeAttr("class");
              });
		      $('#findId').on('click', function(){
		    	  if($("#m_phone").val()!=""){
		           		var regexPhone=/^01[01789]-[\d]{3,4}-[\d]{4}$/;
		           		if(regexPhone.exec($("#m_phone").val())){
					      	$.ajax({
					      		url:"/findId",
					      		type:"post",
					      		data:{key:$('#m_phone').val()}
					      	}).done(function(resp){
					      		if(resp==""){
					      			$("#m_email").html("<h6 class='mb-2'>해당 번호에 대한 아이디가 존재하지 않습니다<h6>");
					      		}else if(resp.m_social=="kakao"){
					      			$("#m_email").html("<h6 class='mb-2'>카카오 소셜 회원입니다. 소셜 로그인 바랍니다.<h6>");
					      		}else if(resp.m_social=="naver"){
					      			$("#m_email").html("<h6 class='mb-2'>네이버 소셜 회원입니다. 소셜 로그인 바랍니다.<h6>");
					      		}else{
						      		$("#m_email").html("<h6 class='mb-2'>해당 번호에 대한 아이디는 <span class='font-weight-bold'>" + resp.m_email + "</span> 입니다</h6>");
					      		}
					      	});
		           		}else{
		           			$("#m_phone").val("");
		           			$("#m_email").text("형식에 맞지 않는 번호입니다");
		           		}
		    	  }else{
		    		  $("#m_email").text("번호를 입력하세요"); 
		    	  }
			  });
		      var pwCode;
		      $('#sendMail').on('click', function(){
	           		var regexMail=/^[^\d](\w*|\d)@([a-z]*.?)*[a-z]$/;
	           		var regexMail2=/^_$/;
	           		if(regexMail.exec($("#findPwMail").val())){
	               		$.ajax({
	               			url:"/emailCheck",
	               			type:"post",
	               			data : {key : $("#findPwMail").val()}
	               		}).done(function(resp){
	               			if(resp==true){
	               				$("#findPwMail").attr("readonly", true);
	    	           			$("#result").text("");
	         		        	$("#findPw").removeAttr("class", "d-block");
	         		        	$("#newPw").attr("class", "d-block btn btn-primary");
	         		        	$.ajax({
	         		        		url:"/findPwGetCode",
	         		        		type:"post",
	         		        		data:{key:$("#findPwMail").val()}
	         		        	}).done(function(resp){
	         		        		pwCode=resp;
	         		        	});
	               			}else{
	    	           			$("#result").text("존재하지 않는 메일입니다");
	         		        	$("#findPw").attr("class", "d-none");
	         		        	$("#newPw").removeAttr("class");
	    	           			$("#findPwMail").val("");
	               			}
	               		});
	           		}else{
	           			$("#findPwMail").val("");
	           			$("#result").text("사용할 수 없는 형식의 메일입니다");
	           		}
	           	});
		        $('#newPw').on('click', function(){
		        	if($('#findPw').val()==""){
		        		$('#result').text("임시 비밀번호를 입력하세요");
		        	}else{
		        		$('#result').text("");
		        		if($('#findPw').val()==pwCode){
		        			$.ajax({
		        				url:"/findPwChange",
		        				type:"post",
		        				data:{email:$("#findPwMail").val(), pw:$('#findPw').val()}
		        			}).done(function(resp){
		        				$(location).attr('href', '/findAccountAfterLogin');
		        			});
		        		}else{
		        			$('#findPw').val("");
		        			$('#result').text("임시 비밀번호가 맞지 않습니다");
		        		}
		        	}
		        });
		        //social login
		        $('.bg-success').on('click', function(){
		        	$.ajax({
		        		url:"/naverLogin",
		        		type:"post"
		        	}).done(function(resp){
		        		$(location).attr('href', resp);
		        	});	
		        });
		        $('.bg-warning').on('click', function(){
		        	$.ajax({
		        		url:"/kakaoLogin",
		        		type:"post"
		        	}).done(function(resp){
		        		$(location).attr('href', resp);
		        	});	
		        });
 		        //cookie
		        function cookieToJson(cookie){
					var cookieJson = {};
				 	var cookies = document.cookie;
				 	var trimedCookies = cookies.replace(/ /g, "");
				 	var cookieArr = trimedCookies.split(";");
				 	for(var i=0; i<cookieArr.length; i++){
						var entry = cookieArr[i].split("=");
						cookieJson[entry[0]] = entry[1];
				 	}
				 	return cookieJson;
			 	}
				$(function(){
					if(document.cookie!=""){
						var cookies = cookieToJson(document.cookie);
						$("input[name=loginId]").val(cookies.userID);
						$("input[type=checkbox]").prop("checked", true);
					}
				});
				$('input').on('change', function(){
					var exdate = new Date();
					if($("input[type=checkbox]").is(":checked")){
						exdate.setDate(exdate.getDate()+30);
						document.cookie = "userID=" + $("input[name=loginId]").val() + ";expires=" + exdate.toGMTString(); 
					}else{
						exdate.setDate(exdate.getDate()-1);
						document.cookie = "userID=" + $("input[name=loginId]").val() + ";expires=" + exdate.toGMTString();
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
				      <img src="resources/img/login1.jpg" align="bottom" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="resources/img/login2.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="resources/img/login3.jpg" class="d-block w-100" alt="...">
				    </div>
				  </div>
				</div>
			</div>
		</div>
	</div>
<!-- 	contents -->
	<div class="container-fluid my">
		<div id="row my">
			<div class="col-lg-6 col-md-10 col-sm-10 col-xs-6 loginForm pl-3 pr-3 pb-5 m-auto my">
				<div class="blockSign">
			        <div id="formContent">
			            <ul class="tab-group">
			                <li class="tab active font-weight-bold"><a href="#signin">Login</a></li>
			                <li class="tab font-weight-bold"><a href="#signup">Social Login</a></li>
			            </ul>
			            <div class="tab-content">
			                <div id="signin">
			                    <h3 class="m-3 font-weight-bold text-dark">나의 정원 로그인</h3>
			                    <form action="/isLoginOk" method="post" id="loginForm">
			                        <input type="email" placeholder="이메일을 입력하세요" name="loginId"
			                            class="fadeIn" />
			                            <div class="onblur" id="loginId"></div>
			                        <input type="password" placeholder="비밀번호를 입력하세요" name="loginPw"
			                            class="fadeIn mb-4">
			                        <div class="fadeIn mb-2">
								      <label><input type="checkbox" class="form-check-input text-muted"/>이 계정을 기억합니다</label>
								    </div>
			                        <input type="button" class="font-weight-bold mt-2" id="loginBtn" value="로그인"></input>
			                        <p id="formFooter">
			                        	<a href="#" class="text-muted idModal" data-toggle="modal" data-target="#exampleModalCenter1">아이디 / </a>
			                        	<a href="#" class="text-muted idModal" data-toggle="modal" data-target="#exampleModalCenter2">비밀번호 찾기</a>
			                        </p>
			                    </form> 
		                       	<!-- Modal id -->
									<div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
									  <div class="modal-dialog modal-dialog-centered" role="document">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h5 class="modal-title" id="exampleModalCenterTitle">아이디 찾기 </h5>
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									          <span aria-hidden="true">&times;</span>
									        </button>
									      </div>
									      <div class="modal-body">
									          <div class="form-group">
									          	<label for="m_phone" class="col-form-label">가입 당시 기재한 핸드폰 번호를 입력하세요</label>
									            <input type="text" class="form-control" placeholder="000-0000-0000" id="m_phone">
									          </div>
									          <div id="m_email"></div>
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-primary" id="findId">아이디 찾기</button>
									      </div>
									    </div>
									  </div>
									</div>
								<!-- modal id end -->
		                       	<!-- Modal pw -->
									<div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
									  <div class="modal-dialog modal-dialog-centered" role="document">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h5 class="modal-title" id="exampleModalCenterTitle">비밀번호 찾기</h5>
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									          <span aria-hidden="true">&times;</span>
									        </button>
									      </div>
									      <div class="modal-body">
									          <div class="form-group">
									          	<label for="findPwMail" class="col-form-label">*소셜로그인 사용자는 해당 서비스를 이용할 수 없습니다</label>
									            <input type="email" class="form-control" placeholder="나의 정원에 가입한 메일주소를 입력하세요" id="findPwMail">
									          </div>
									          <div class="form-group">							            
									  		    <input type="password" class="form-control d-none" placeholder="발송된 임시 비밀번호를 입력하세요" id="findPw">
									          </div>
									          <div id="result"></div>
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-primary" id="sendMail">메일 발송하기</button>
									        <button type="button" class="btn btn-primary" id="newPw">임시 비밀번호로 변경하기</button>
									      </div>
									    </div>
									  </div>
									</div>
								<!-- modal pw end -->
			                    
			                </div>
			                <div id="signup">
			                    <h3 class="m-3 font-weight-bold text-dark">나의 정원 소셜로그인</h3>
			                    <form class="p-4">
			                        <input type="button" class="socialButton mb-3 bg-success" value="네이버">
			                        <input type="button" class="socialButton mb-4 bg-warning" value="카카오">
			                    </form>
		                        <p id="formFooter">
		                        	<a href="#" class="text-muted" data-toggle="modal" data-target="#exampleModalCenter3">소셜로그인 개인정보수집방침</a>
		                       	<!-- Modal pw -->
									<div class="modal fade" id="exampleModalCenter3" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
									  <div class="modal-dialog modal-dialog-centered" role="document">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h5 class="modal-title" id="exampleModalCenterTitle">소셜로그인 개인정보수집방침</h5>
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									          <span aria-hidden="true">&times;</span>
									        </button>
									      </div>
									      <div class="modal-body">
									          <div>사용자의 이메일 주소, 이름, 성별, 생일 등<br>회원 식별에 필요한 정보를 수집합니다</div>
									      </div>
									      <div class="modal-footer">
									   		   <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
									      </div>
									    </div>
									  </div>
									</div>
								<!-- modal pw end -->
		                        </p>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>	
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center p-4 my">
				<span class="mr-2 font-weight-bold text-dark">아직 정원을 개설하지 않으셨나요?</span>
				<button type="button" class="btn btn-lg joinSuggestion font-weight-bold">가입하고 정원 개설하러 가기</button>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-112 col-xs-12 text-center pb-5 my">
				<img src="resources/img/cookie.jpg" width="80%" class="position-relative rounded-lg">
				<p class="position-absolute event text-left font-weight-bold p-3">유기농 채소로 만들어진 비건 쿠키 증정 이벤트
				<br><a href="#">체험하기 go &#x0226B;</a></p>
			</div>
		</div>
	</div>
<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
</body>
</html>