<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     
<!--      style -->
<style>
	.imageContainer{height:300px; overflow:hidden;}
	.carousel-inner{margin-top:-120px;}
	.overview{padding:20px 30px 20px 30px;}
	.gardenImg{width:95%px; height:150px; overflow:hidden;}
/* 	.gardenImg img{background-size:cover;} */
	.currentActive{background:#4f9c87; color:#fff;}
	.bg-f5{background: #f5f5f5;}
	.gardenUpdateBtn{ display: inline-block; padding: .5em .75em; color: #4f9c87; font-size: inherit; line-height: normal; vertical-align: middle; background-color:#fff; cursor: pointer; border: 1px solid #4f9c87; border-bottom-color: #4f9c87; border-radius: .25em; }
	.gardenUpdateBtn:hover{background:#4f9c87; color:#fff;}
	.profile{width:130px; height:130px; border-radius:50%; margin:10px auto; overflow:hidden; display:none;}
	.onblur{font-size:13px; color:#4f9c87;}
	.filebox label{ display: inline-block; padding: .5em .75em; color: #4f9c87; font-size: inherit; line-height: normal; vertical-align: middle; background-color: #fdfdfd; cursor: pointer; border: 1px solid #4f9c87; border-bottom-color: #4f9c87; border-radius: .25em; }
	.filebox label:hover{background:#4f9c87; color:#fff;}
	.filebox input[type="file"] { /* 파일 필드 숨기기 */ position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; }
	
</style>    
<!-- js -->
<script>
	$(function(){
		//profile local image insert start
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('.profile').html('<img src='+e.target.result+' width=130 height=130>');
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#ex_file").change(function() {
			var selectedFile = this.files[0];
       		var idxDot = selectedFile.name.lastIndexOf(".") + 1;
       		var extFile = selectedFile.name.substr(idxDot, selectedFile.name.length).toLowerCase();
       		if (extFile == "jpg" || extFile == "jpeg" || extFile == "png" || extFile == "svg" || extFile == "gif") {
       		   //do whatever want to do
       			readURL(this);
       			$('.profile').css('display', 'block');
       		} else {
       		     alert("이미지 파일만 가능합니다");
       		 	 $('.profile').html('<img src="${memDTO.m_profile}" width=130 height=130>');
       		}
		});	
		//profile local image insert end
		
		//input form
       	$("input[name=ex_file]").on("input", function(){
       		if($('#ex_file').val()!=""){
       			$("#fileName").text("");
       		}
       	});
       	$('.gardenUpdateBtn').on('click', function(){
       		$("#gardenName").text("");
       	});
       	$("input[name=m_garden]").on("blur", function(){
       		var regexGarden=/^[가-힣A-z]{2,12}$/;
       		if(regexGarden.exec($("input[name=m_garden]").val())){
           		$.ajax({
           			url:"/gardenCheck",
           			type:"post",
           			data : {key : $("input[name=m_garden]").val()}
           		}).done(function(resp){
           			if(resp==true){
               			$("#gardenName").text("중복되는 정원 이름입니다");
               			$("input[name=m_garden]").val("");
           			}else{
               			$("#gardenName").text("");
           			}
           		});
       		}else{
       			$("#gardenName").text("2~12단어로 이루어진 영어, 한글만 가능합니다");
       			$("input[name=m_garden]").val("");
       		}
       	});
       	$('.changeProfileBtn').on('click', function(){
   			if($('#ex_file').val()!=""){
       			var con = confirm('이대로 제출하시겠습니까?');
				if(con){
               		$('.changeGardenProfile').submit();	
           		}
   			}else{
   				alert('다시 확인 후 제출하세요');
   			}
        });	
       	$('.changeNameBtn').on('click', function(){
   			if($('input[name=m_garden]').val()!=""){
       			var con = confirm('이대로 제출하시겠습니까?');
				if(con){
               		$('.changeGardenName').submit();	
           		}
   			}else{
   				alert('다시 확인 후 제출하세요');
   			}
        });	
	});
</script>
<!--      html -->
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left my">
	<h2>마이페이지</h2><hr>
</div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my">
	<div class="row my">
		<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 border border-white bg-f5 my">
			<div class="row pt-2 my">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 overview my">
					<h4 class="mt-3">${memDTO.m_name}님의</h4> 
					<h4 class="font-weight-bold">${memDTO.m_garden}</h4>
					<button type="button" class="mt-3 btn gardenUpdateBtn" data-toggle="modal" data-target="#changeGardenName">
						<img src="resources/img/edit2.png" width="20" height="20">&nbsp;수정하기
					</button>
					<!-- Modal : Name-->
						<div class="modal fade" id="changeGardenName" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalCenterTitle">정원이름 수정하기</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						      	<form class="changeGardenName p-4" action="changeGardenName" method="post">
					      		  <div class="form-group">
						            <input type="text" class="form-control" placeholder="정원 이름을 입력하세요" name="m_garden">
			                        <span class="onblur" id="gardenName"></span>
						          </div>
						         </form> 
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-primary changeNameBtn">수정하기</button>
						      </div>
						    </div>
						  </div>
						</div>
					<!-- Modal : Profile-->
						<div class="modal fade" id="changeGardenProfile" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalCenterTitle">프로필사진 수정하기</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						      	<form class="changeGardenProfile" action="changeGardenProfile" method="post" enctype="multipart/form-data">
					      		  <div class="filebox pt-4"> 
		                    	  	 <div class="profile"><img id="p_image" src="${memDTO.m_profile}" width="130" height="130"></div>
		                    	  	 <label for="ex_file">프로필&#x02295;</label> 
		                    		 <input type="file" id="ex_file" name="ex_file" accept='image/jpeg,image/gif,image/png' />
		                    		 <p class="onblur" id="fileName"></p>
		                    	  </div>
						         </form> 
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-primary changeProfileBtn">수정하기</button>
						      </div>
						    </div>
						  </div>
						</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 overview my">
					<div class="gardenImg pt-2"><img src="${memDTO.m_profile}" width="200" height="150"></div>
					<button type="button" class="mt-2 btn gardenUpdateBtn" data-toggle="modal" data-target="#changeGardenProfile">
						<img src="resources/img/edit.png" width="20" height="20">
					</button>
				</div>
			</div>	
		</div>
		<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 bg-f5 border border-white overview my">
			<h3 class="text-left mt-4">구독현황 &raquo;</h3>
			<h4 class="text-center mt-2">3/week</h4>
			<p class="text-right mt-2"><a href="#" class="badge badge-primary">more</a></p>
		</div>
		<div class="col-lg-3 col-md- col-sm-6 col-xs-12 bg-f5 border border-white overview my">
			<h3 class="text-left mt-4">보유씨앗 &raquo;</h3>
			<h4 class="text-center mt-2">seed개</h4>
			<p class="text-right mt-2"><a href="#" class="badge badge-primary">more</a></p>
		</div>
	</div>	
</div>


<!-- script -->
<script>
	$(function(){
		
	});
</script>