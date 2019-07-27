<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - 문의글</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<style>
	div{
/* 		border: 1px solid black; */
	}
	
	#qnaHeaderImg{
		width: 100% !important;
		
	}
	
	#wrapper{
		width: 1000px;
		margin: 50px auto;
	}
		
	#qnaHeaderTitle {
	    width: 85%;
	    margin: auto;
	    color: #53782f;
	}
	
	#writeQnAForm{
		width: 90%;
		margin: 0 auto;
	    border-radius: 30px;
	    
	}	
	.inputTitleRow{		
	   width: 98%;
	   height: 85px;
	   margin: auto;
	   padding-top : 25px;
	}
	#inputTitle{
		background-color: #e8ede190;
		border-radius: 20px;
		height: 50px;
	}
	
	.secretBtnRow{
		 width: 90%;
 		 position: relative; 
 		 left: 15px; 
	}
	
	#secretBtn{
 		position: relative; 
	 	left: 25px; 
	}
	
	.inputContentRow{
		 width:98%;
		 margin: auto;
	}
	
	#inputContent{
		height: 500px;
		border: 1px solid lightgrey;
		border-radius: 15px;
		background-color: #e8ede190;
		padding: 20px;
	}
	
	.inputImagesRow{
		width:98%;
		margin: 20px auto;
	}
	
	.imagesBox img{
		height:100px;
		max-width: 30%;
	}
	
	.imgEditBtns{
		background-color: #b4d9b5;
		color: white;
		font-size: 13px;
		font-weight: bold;
		border: 0px;
		cursor: pointer;
		width:87px;
		height:30px;
		line-height: 25%;
		margin:auto;
	}
	.imgEditBtns:hover{
		background-color: #b4d9b5;
		color: #44b27d;
		font-weight: bold;
		border: 0px;
		cursor: pointer;
	}
	
	.btnsRow{
		width: 98%;
    	margin: auto;
    	text-align: right;
	}
	.btns button{
		margin-left: 5px;
		margin-bottom: 30px;
	}
	.writeBtn{
		background-color: #44b27d;
		color: white;
		font-weight: bold;
		border: 0px;
	}
	.goBackBtn{
		border: 1px solid #44b27d;
		color: #44b27d;
		font-weight: border;
	}
	.writeBtn:hover{
		background-color: #b4d9b5;
		color: #44b27d;
		font-weight: bold;
		border: 0px;
		cursor: pointer;
	}
	.goBackBtn:hover {
		background-color: #b4d9b5;
		color: white;
		font-weight: bold;
		border: 0px;
		cursor: pointer;
	}
</style>

<!-- script -->
<script>
	$(function(){
		$(".goBackBtn").on("click",function(){
			history.back();
		})
		
		
		$('#inputTitle').on('keyup', function() { //제목 글자수 입력 제한
			if ($(this).val().length > 30) {
				$(this).val($(this).val().substring(0, 30));
				alert("제목은 30자 이내만 입력이 가능합니다.");
			}
		});
		$('#inputContent').on('keyup', function() { //내용 글자수 입력 제한
			var inputContent = $(this).text();
			var content = $("#content").val(inputContent);
				if ($(content).val().length > 1000) {
					$(this).text($(content).val().substring(0, 1500)); 
					alert("내용은 1500자 이내만 입력이 가능합니다.");
				}
		});
		
		$(".writeBtn").on("click",function(){
			var checkedSecret = $("#secretBtn").prop("checked"); 
			alert(checkedSecret);
			$("#secretBtn").val(checkedSecret);
			var inputContent = $("#inputContent").html();
			$("#content").val(inputContent);
			$("#writeQnAForm").submit();
		})
		
		
	
		$("input[name=images]").each(function(){
			$(this).on("change",function(){
				var imageTag = $(this).prev();
				//alert("imageTag : " + imageTag);
		    	 var formData = new FormData();
		    	 formData.append("formData",$(this)[0].files[0]);
		    	 // formData = $(this)[0].files[0];
// 		    	  id = $(this).attr("id");
// 		    	  alert("id : " + id);
// 		    	  alert("formData : " + formData);
		    	  
		    	  $.ajax({
		    		  url:"getImgs",
		    		  type:"post",
		    		  processData:false,
		    		  contentType:false,
		    		  data: formData
		    	  }).done(function(resp){
		    		  console.log(resp);
		    		  //console.log(image);
		    		  var time = new Date().getTime();
		              console.log("time : " + time);
		              alert("imageTag : " + imageTag);
// 		    		  $("img [class="+imageTag+"]").html("<img src='/resources/temp/"+resp+"?time="+time+"'>");

					 $(imageTag).html("<img src='/resources/temp/"+resp+"?time="+time+"'>");
//  					$("img [class="+imageTag+"]").attr("src","'/resources/temp/"+resp);
// 		               $("#profile").html("<img src='/resources/temp/"+resp + "'>");
								
		    	  })
		      })
		      
		})
		
		$(".imgEditBtns").on("click",function(){
			var imageFile = $(this).prev();
			var imageOriPath = $(this).next().val();
	    	  var formData = new FormData();
	    	 formData.append("formData",$(imageFile)[0].files[0]);
	    	 formData.append("fileId",$(imageFile).attr("id"));
	    	 formData.append("oriFilePath",imageOriPath);
	    	 alert("oriFilePath : " + imageOriPath);
	    	 
			$.ajax({
	    		  url:"updateImgs",
	    		  type:"post",
	    		  processData:false,
	    		  contentType:false,
	    		  data: formData
	    	  }).done(function(resp){
	    		  console.log(resp);	
	    		  if(resp==1){
						alert("사진이 수정되었습니다.");    			  
	    		  }
	    	  })
		})
		
	
		 function OnloadImg(url){

			  var img=new Image();

			  img.src=url;

			  var img_width=img.width;

			  var win_width=img.width+25;

			  var height=img.height+30;

			  var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+height+', menubars=no, scrollbars=auto');

			  OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");

			 }
      
		
	})
	
	
</script>
	
	
</head>
<body>

<!-- header -->
	<jsp:include page="/WEB-INF/views/module/fixedHeader.jsp"/>
	<!-- 			carousel -->
	<div class="container-fluid my">
		<div class="row my">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my">
				<img src="">
			</div>
		</div>
	</div>
	
<img alt="" src="/resources/products/qnaHeader.jpg" id="qnaHeaderImg">

	<!--문의 수정 폼 -->
	<div id="wrapper">
		<div id="qnaHeaderTitle"><h3>문의 수정하기</h3></div>
		
		<form action="updateQnA" id="writeQnAForm" method="post" enctype="multipart/form-data">
		  <div class="form-group row inputTitleRow">
<!-- 		    <label for="inputTitle" class="col-sm-2 col-form-label">제목</label> -->
		    <div class="col-12">
		      <input type=hidden name="bq_no" value="${readQnA.bq_no }">
		      <input type="text" class="form-control" id="inputTitle" name="bq_title" value="${readQnA.bq_title }">
		    </div>
		  </div>
		  <div class="form-group form-check row secretBtnRow">
		  	<div class="col-12">
		  		 <label class="form-check-label" for="secretBtn">비밀글</label>
			    <input type="checkbox" class="form-check-input" id="secretBtn" name="checkedSecret">
		  	</div>
		 </div>
		 <div class="form-group row inputContentRow">
<!-- 		    <label for="inputContent" class="col-sm-2 col-form-label">내용</label> -->
		    <div class="col-12">
               <div contenteditable="true" id="inputContent">${readQnA.bq_content }</div>
               <input type=hidden name="bq_content" id="content">
		    </div>
		  </div>
			
		  <div class="form-group row inputImagesRow">
<!-- 		 	 <div class="col-lg-2 col-sm-12"> -->
<!-- 		  		 <label for="inputImage" class="col-form-label">사진 등록</label> -->
<!-- 		  	  </div> -->
			    <div class="col-lg-12 col-sm-12">
			    	<div class="imagesBox">
					      <p>
						      <span class=img1><img src="${readQnA.bq_imagepath1}" onerror="this.style.display='none'"></span>					
						      <input type="file" name=images accept="image/jpg, image/jpeg, image/gif, image/png" id="bq_imagepath1" value="${readQnA.bq_imagepath1}">
					      	  <input type="button" class="btn imgEditBtns" value="사진 수정">
					      	  <input type="hidden" value="${readQnA.bq_imagepath1}">
					      </p>
		 				  <p>
			 				  <span class=img2><img src="${readQnA.bq_imagepath2}" onerror="this.style.display='none'"></span>
			 				  <input type="file" name=images accept="image/jpg, image/jpeg, image/gif, image/png" id="bq_imagepath2" value="${readQnA.bq_imagepath2}">
			 			  	  <input type="button" class="btn imgEditBtns" value="사진 수정">
			 			  	  <input type="hidden" value="${readQnA.bq_imagepath2}">
			 			  </p>
		 				  <p> 
			 				  <span class=img3><img src="${readQnA.bq_imagepath3}" onerror="this.style.display='none'"></span>
			 				  <input type="file" name=images accept="image/jpg, image/jpeg, image/gif, image/png" id="bq_imagepath3" value="${readQnA.bq_imagepath3}">
		 				  	  <input type="button" class="btn imgEditBtns" value="사진 수정">
		 				  	  <input type="hidden" value="${readQnA.bq_imagepath3}">
		 				  </p>
					</div>
			      <p><small>※ 수정할 사진을 선택 후, '사진 수정' 버튼을 눌러주세요.</small></p>
			    </div>
		  </div>	
			
		  <div class="form-group row btnsRow">
		    <div class="col-12 btns">
		      <button type="button" class="btn goBackBtn" >돌아가기</button>
		      <button type="submit" class="btn writeBtn" >수정</button>
		    </div>
		  </div>		  
		</form>
		
	</div>

	
<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
</body>
</html>