<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기수정</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<style>
	#wrapper{
		margin: 200px auto;
		width: 700px;
	}
	
	.productImage{
		max-width:150px;
		height:100px;
	}
	
	#inputContent{
		height: 300px;
		border: 1px solid lightgrey;
		border-radius: 5px;
		padding: 10px;
	}
	
	.updateImgBtnBox{
		margin:7px auto;
	}
	
	.updateImgBtn{
/* 		background-color: #b4d9b5; */
		background-color : #8e74a8;
		color: white;
		font-size: 13px;
		line-height: 50%;
		height: 30px;
		width: 80px;
		border-radius:unset;
	}
	.updateImgBtn:hover{
		background-color: #8e74a890;
		color: #7741a3;
		font-weight: bold;
		cursor: pointer;
	}
	
	.btnsRow{
		width: 100%;
		
	}
	.btnsBox{
		text-align: center;
	}
	.goMainBtn{
		background-color: #44b27d;
/* 		color: #44b27d; */
		color: white;
		font-weight: bold;
		border: 0px;
	}
	.goMainBtn:hover{
		background-color: #b4d9b5;
		color: white;
		font-weight: bold;
		border: 0px;
		cursor: pointer;
	}
		
	.updateBtn {
		background-color: #44b27d;
		color: white;
		font-weight: bold;
		border: 0px;
	}
	.updateBtn:hover {
		background-color: #b4d9b5;
 		color: #44b27d; 
/* 		color: white; */
		font-weight: bold;
		border: 0px;
		cursor: pointer;
	}

	
</style>

<!-- script -->
	<script>

	$(function(){

			$(".goMainBtn").on("click",function(){
				$(location).attr("href","/");
			})
			
			$(".updateBtn").on("click",function(){
				var inputContent = $("#inputContent").text();
				var inputTitle = $("#inputTitle").val();
				alert(inputTitle);
				$("#content").val(inputContent);
				$("#updateReviewForm").submit();
			})
		
			$(".updateImgBtn").on("click",function(){
				var imageFile = $(this).parent().prev().prev().children();
				var imageOriPath = $(this).next().val();
				var formData = new FormData();
		    	 formData.append("formData",$(imageFile)[0].files[0]);
		    	 formData.append("oriFilePath",imageOriPath);
		    	 
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
			
			$('#inputTitle').on('keyup', function() { //제목 글자수 입력 제한
				if ($(this).val().length > 30) {
					$(this).val($(this).val().substring(0, 30));

					alert("제목은 30자 이내로 입력이 가능합니다.");
				}
			});
			$('#inputContent').on('keyup', function() { //내용 글자수 입력 제한
				if ($(this).text().length > 69) {
					$(this).text($(this).text().substring(0, 69)); 
					alert("내용은 70자 이내로 입력이 가능합니다.");
				}
			});

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

	<!-- 리뷰 수정 폼 -->
	<div id="wrapper">
		<div id="productInfo" >
			<img src="${productInfo.p_imagepath}" class="productImage">
			<span>${productInfo.p_title}</span>
		</div>
		<hr>
		
			<form action="reviewUpdate" method="post" enctype="multipart/form-data" id="updateReviewForm">
			<input type=hidden name="br_no" value="${oneReview.br_no }">
			  <div class="form-group row">
			       <label for="inputTitle" class="col-sm-2 col-form-label">제목</label>
			    
			    <div class="col-sm-10">
			      <input type="text" class="form-control byteLimit" id="inputTitle" name="br_title" value="${oneReview.br_title }">
			    </div>
			  </div>
			 <div class="form-group row">
			    <label for="inputContent" class="col-sm-2 col-form-label">내용</label>
			    <div class="col-sm-10">
			      <div contenteditable="true" id="inputContent">${oneReview.br_content }</div>
			      <input type="hidden" class="form-control byteLimit" id="content" name="br_content" value="${oneReview.br_content }">
			    </div>
			  </div>
				
			  <div class="form-group row">
			  	 <label for="inputImage" class="col-sm-2 col-form-label"></label>
				    <div class="col-sm-10 selImgBtnBox">
				      <input type="file" name=image accept="image/jpg, image/jpeg, image/gif, image/png" id=image>
				    </div>
				  <label for="inputImage" class="col-sm-2 col-form-label"></label>
					<div class="col-sm-10 updateImgBtnBox">
				      <input type="button" class="btn updateImgBtn" value="사진 수정">
				      <input type="hidden" name="imagePath" value="${oneReview.br_imagepath }">
				    </div>
				    <label for="inputImage" class="col-sm-2 col-form-label"></label>
				  <p><small>※ 수정할 사진을 선택한 후 '사진 수정'버튼을 누르면 사진 수정이 가능합니다.</small></p>
			  </div>	
				
			  <div class="form-group row btnsRow">
			    <div class="col-12 btnsBox">
			      <button type="button" class="btn goMainBtn" >메인으로</button>
			      <button type="submit" class="btn updateBtn" >수정하기</button>
			    </div>
			  </div>	
			  
			</form>
		
		
		
	</div>

	
<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
</body>
</html>