<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - 후기수정</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<style>
	.row.my {
	    background-color: #dde3d8;
	}
	
	#wrapper{
		margin: 200px auto;
		width: 700px;
	}
	
	.boardTitle{
		color: #53782f;
		font-weight: bold;
		font-size: 20px;
	}
	
	
	.rvLabel{
		color: #53782f
	}
	
	.pTitle{
		margin-left : 10px;
		font-weight: bold;
		color: #53782f;
	}
	
	.productImage{
		max-width:150px;
		height:100px;
	}
	
	#inputContent{
		height: 150px;
		border: 1px solid lightgrey;
		border-radius: 5px;
		padding: 10px;
		overflow: auto;
	}
	
	.imageBox {
	    border-radius: 10px;
	    margin-left: 15px;
	    width: 79%;
	    border: 1px solid lightgray;
	    padding: 10px;
   		padding-bottom: 0px;
	}
	
	.previewImg img{
		margin-bottom: 10px;
	}
	
	#image{
		margin-bottom: 5px;
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
	.goBackBtn{
		background-color: #44b27d;
/* 		color: #44b27d; */
		color: white;
		font-weight: bold;
		border: 0px;
	}
	.goBackBtn:hover{
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

			$(".goBackBtn").on("click",function(){
				var pnumber = ${oneReview.br_p_no};
				location.href = "productsRead?&revPage=1&qnaPage=1&pnumber=" + pnumber;			
			})
			
					$("#image").on("change",function(){
			var formData = new FormData();
	    	formData.append("formData",$(this)[0].files[0]);
		
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

				 $(".previewImg").html("<img src='/resources/temp/"+resp+"?time="+time+"' width='200px'>");
							
	    	  })
		
		})
		
		
				
			$(".updateBtn").on("click",function(){
				var inputContent = $("#inputContent").text();
				var inputTitle = $("#inputTitle").val();
				alert("글이 수정되었습니다.");
				$("#content").val(inputContent);
				$("#updateReviewForm").submit();
			})
		
			$(".updateImgBtn").on("click",function(){
				var imageFile = $(this).parent().parent().prev().children("input");
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
			$(document).on('keyup', '#inputContent', function() { //내용 글자수 입력 제한
				var inputComment = $("#inputContent").text();
				var cntCmt = $("#cntCmt").val(inputComment);
				//alert("입력한거ㅡㅡ: " + cntCmt.val());
					if ($(cntCmt).val().length > 140) {
						$("#inputContent").text($(cntCmt).val().substring(0, 140)); 
						alert("내용은 140자 이내만 입력이 가능합니다.");
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

	<img alt="" src="/resources/products/reviewHeader.jpg" id="reviewHeaderImg">
	
	<!-- 리뷰 수정 폼 -->
	<div id="wrapper">
		<span class="boardTitle">후기수정</span>
		<hr>
		<div id="productInfo" >
			<img src="${productInfo.p_imagepath}" class="productImage">
			<span class="pTitle">${productInfo.p_title}</span>
		</div>
		<hr>
		
			<form action="reviewUpdate" method="post" enctype="multipart/form-data" id="updateReviewForm">
			<input type=hidden name="br_no" value="${oneReview.br_no }">
			  <div class="form-group row">
			       <label for="inputTitle" class="col-sm-2 col-form-label rvLabel">제목</label>
			    
			    <div class="col-sm-10">
			      <input type="text" class="form-control byteLimit" id="inputTitle" name="br_title" value="${oneReview.br_title }">
			    </div>
			  </div>
			 <div class="form-group row">
			    <label for="inputContent" class="col-sm-2 col-form-label rvLabel">내용</label>
			    <div class="col-sm-10">
			      <div contenteditable="true" id="inputContent">${oneReview.br_content }</div>
			      <input type="hidden" id="cntCmt">
			      <input type="hidden" class="form-control byteLimit" id="content" name="br_content" value="${oneReview.br_content }">
			    </div>
			  </div>
				
			  <div class="form-group row imageRow">
			  	 <label for="inputImage" class="col-sm-2 col-form-label"></label>
			  	 
			  	 <div class="imageBox">
				 <div class="col-sm-10 selImgBtnBox">
<!-- 				    <p class="rvLabel">사진수정</p> -->
				    	<span class="previewImg">
				    <img src="${oneReview.br_imagepath }" width=200px>
				    </span>
				      <input type="file" name=image accept="image/jpg, image/jpeg, image/gif, image/png" id=image>
				    </div>
				<div class="col-sm-10 updateImgBtnBox">
					<div>
						<input type="button" class="btn updateImgBtn" value="사진 수정">
						<input type="hidden" name="imagePath"
							value="${oneReview.br_imagepath }">
					</div>
				</div>
				<label for="inputImage" class="col-sm-2 col-form-label"></label>
				  <p><small class="rvLabel">※ 수정할 사진을 선택한 후 '사진 수정'버튼을 누르면 사진 수정이 가능합니다.</small></p>
				  		  	
			  </div>
			  </div>	
				
			  <div class="form-group row btnsRow">
			    <div class="col-12 btnsBox">
			      <button type="button" class="btn goBackBtn" >돌아가기</button>
			      <button type="submit" class="btn updateBtn" >수정하기</button>
			    </div>
			  </div>	
			  
			</form>
		
		
		
	</div>

	
<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
</body>
</html>