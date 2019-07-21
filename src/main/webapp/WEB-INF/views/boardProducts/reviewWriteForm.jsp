<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기작성</title>
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
	}
	
	
	.goMainBtn{
		background-color: #b4d9b5;
/* 		color: #44b27d; */
		color: white;
		font-weight: bold;
		border: 0px;
		cursor: pointer;
	}
	.goMainBtn:hover{
		background-color: #44b27d;
		color: white;
		font-weight: bold;
		border: 0px;
	}
	.writeBtn {
		background-color: #44b27d;
		color: white;
		font-weight: bold;
		border: 0px;
	}
	.writeBtn:hover {
		background-color: #b4d9b5;
 		color: #44b27d; 
/* 		color: white; */
		font-weight: bold;
		border: 0px;
		cursor: pointer;
	}

	
</style>
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
	
	<!-- 리뷰 작성 폼 -->
	<div id="wrapper">
		<span>후기작성</span>
		<hr>
		<div id="productInfo" >
			<img src="${productInfo.p_imagepath}" class="productImage">
			<span>${productInfo.p_title}</span>
		</div>
		<hr>
		<form action="writeReview" method="post" enctype="multipart/form-data">
		  <div class="form-group row">
		    <label for="inputTitle" class="col-sm-2 col-form-label">제목</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="inputTitle" name="br_title" placeholder="제목을 입력해주세요">
		    </div>
		  </div>
		 <div class="form-group row">
		    <label for="inputContent" class="col-sm-2 col-form-label">내용</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="inputContent" name="br_content" placeholder="내용을 입력해주세요">
		    </div>
		  </div>
			
		  <div class="form-group row">
		  	 <label for="inputImage" class="col-sm-2 col-form-label">사진 등록</label>
			    <div class="col-sm-10">
			      <input type="file" name=image accept="image/jpg, image/jpeg, image/gif, image/png" id=image>
			      <p><small>※ 사진은 대표 사진 1장만 선택해 주세요.</small></p>
			    </div>
		  </div>	
			
		  <div class="form-group row">
		    <div class="col-sm-10 d-flex justify-content-center">
		      <button type="button" class="btn goMainBtn" >메인으로</button>
		      <button type="submit" class="btn writeBtn" >등록</button>
		    </div>
		  </div>		  
		</form>
		
	</div>

<!-- script -->
	<script>
		$(".goMainBtn").on("click",function(){
			$(location).attr("href","/");
		})
	</script>
	
<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
</body>
</html>