<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<style>
	div{
/* 		border: 1px solid black; */
	}
	#wrapper{
		width: 1000px;
		margin: 300px auto;
	}
	
	.secretBtnRow{
		margin-left: 175px;
	}
	
	#inputContent{
		height: 500px;
		border: 1px solid lightgrey;
		border-radius: 5px;
	}
	
	.btns button{
		margin: 0 10px;
	}
	.writeBtn{
		background-color: #44b27d;
		color: white;
		font-weight: bold;
		border: 0px;
	}
	.goMainBtn{
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
	.goMainBtn:hover {
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
		$(".goMainBtn").on("click",function(){
			$(location).attr("href","/");
		})
		
		$(".writeBtn").on("click",function(){
			var checkedSecret = $("#secretBtn").prop("checked"); //true,false
			alert(checkedSecret);
			$("#secretBtn").val(checkedSecret);
			var inputContent = $("#inputContent").html();
			$("#content").val(inputContent);
			$("#writeQnAForm").submit();
		})
		
		
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

	<!-- 리뷰 작성 폼 -->
	<div id="wrapper">
		<span>문의하기</span>
		<hr>
		<form action="writeQnA" id="writeQnAForm" method="post" enctype="multipart/form-data">
		  <div class="form-group row">
		    <label for="inputTitle" class="col-sm-2 col-form-label">제목</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="inputTitle" name="bq_title" placeholder="제목을 입력해주세요">
		    </div>
		  </div>
		  <div class="form-group form-check row secretBtnRow">
			    <input type="checkbox" class="form-check-input" id="secretBtn" name="checkedSecret">
			    <label class="form-check-label" for="secretBtn">비밀글</label>
		 </div>
		 <div class="form-group row">
		    <label for="inputContent" class="col-sm-2 col-form-label">내용</label>
		    <div class="col-sm-10">
               <div contenteditable="true" id="inputContent" placeholder="문의하실 내용을 입력해주세요"></div>
               <input type=hidden name="bq_content" id="content">
		    </div>
		  </div>
			
		  <div class="form-group row">
		  	 <label for="inputImage" class="col-sm-2 col-form-label">사진 등록</label>
			    <div class="col-sm-10">
			      <input type="file" name=image accept="image/jpg, image/jpeg, image/gif, image/png" id=image>
			      <p><small>※ 사진은 최대 3개까지 업로드가 지원됩니다.</small></p>
			    </div>
		  </div>	
			
		  <div class="form-group row">
		    <div class="col-sm-10 d-flex justify-content-center btns">
		      <button type="button" class="btn goMainBtn" >메인으로</button>
		      <button type="submit" class="btn writeBtn" >등록</button>
		    </div>
		  </div>		  
		</form>
		
	</div>

	
<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
</body>
</html>