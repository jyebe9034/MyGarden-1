<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - 글쓰기</title>
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
/* 		background-color: #e8ede1; */
/* 		border: 1px solid #e8ede1; */
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
		 width: 95%;
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
		overflow: auto;
	}
	
	.inputImagesRow{
		width:98%;
		margin: 20px auto;
	}
	
	.btns button{
		margin: 0 10px;
		margin-bottom: 30px;
	}
	.writeBtn{
		background-color: #44b27d;
		color: white;
		font-weight: bold;
		border: 0px;
	}
	.goBackBtn{
		background-color: #44b27d;
		color: white;
		font-weight: bold;
		border: 0px;
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
	
	[contentEditable=true]:empty:not(:focus):before { content:attr(data-text) }
</style>

<!-- script -->
<script>
	$(function(){
		
		$(".goBackBtn").on("click",function(){
		
			var pnumber = "${pnumber}";
			console.log("pnumber : " + pnumber);
			location.href = "productsRead?&revPage=1&qnaPage=1&pnumber=" + pnumber;			
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
			var checkedSecret = $("#secretBtn").prop("checked"); //true,false
			//alert("비밀글? : " + checkedSecret);
			
			$(this).val(checkedSecret);
			
			var inputContent = $("#inputContent").html();
			var inputTitle =$("#inputTitle").val();
			if(inputTitle==""){
				alert("제목을 입력해주세요.");
				event.preventDefault();
			}else if(inputContent==""){
				alert("내용을 입력해주세요");
				event.preventDefault();
			}else{
				$("#content").val(inputContent);
				$("#writeQnAForm").submit();	
			}
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

<img alt="" src="/resources/products/qnaHeader.jpg" id="qnaHeaderImg">

	<!-- 문의 작성 폼 -->
	<div id="wrapper">
	<div id="qnaHeaderTitle"><h3>문의 글 작성</h3></div>
<!-- 		<hr> -->
		<form action="writeQnA" id="writeQnAForm" method="post" enctype="multipart/form-data">
		  <div class="form-group row inputTitleRow">
<!-- 		    <label for="inputTitle" class="col-12 col-form-label">제목</label> -->
		    <div class="col-12">
		      <input type="text" class="form-control" id="inputTitle" name="bq_title" placeholder="제목을 입력해주세요.">
		    </div>
		  </div>
		  <div class="form-group form-check row secretBtnRow">
		  	<div class="col-12">
		  		<span>비밀글</span>
<!-- 		  	</div> -->
<!-- 		  	<div class="col-2"> -->
			    
			     <input type="checkbox" class="form-check-input" id="secretBtn" name="checkedSecret">
			</div>
		 </div>
		 <div class="form-group row inputContentRow">
<!-- 		    <label for="inputContent" class="col-sm-12 col-form-label">내용</label> -->
		    <div class="col-12">
               <div contenteditable="true" id="inputContent" data-text="문의하실 내용을 입력해주세요." maxlength="1000" ></div>
               <input type=hidden name="bq_content" id="content">
		    </div>
		  </div>
			
		  <div class="form-group row inputImagesRow">
		 	 <div class="col-lg-2 col-sm-12">
		  		 <label for="inputImage" class="col-form-label">사진 등록</label>
		  	  </div>
			    <div class="col-lg-10 col-sm-12">
			    	<div class="imagesBox">
			    	<input type="hidden" name="cntImages" class="cntImages">
			      <p><input type="file" name=images accept="image/jpg, image/jpeg, image/gif, image/png" id="image1"></p>
<!-- 			      <input type=button class="btn addImgBtn" value="╉"></p> -->
 				  <p><input type="file" name=images accept="image/jpg, image/jpeg, image/gif, image/png" id="image2"></p>
 				  <p><input type="file" name=images accept="image/jpg, image/jpeg, image/gif, image/png" id="image3"></p>
				</div>
			      <p><small>※ 사진은 최대 3개까지 업로드가 지원됩니다.</small></p>
			    </div>
		  </div>	
			
		  <div class="form-group row btnsRow">
		    <div class="col-lg-6 col-sm-12 d-flex justify-content-end btns">
		      <button type="button" class="btn goBackBtn" >돌아가기</button>
		    </div>
		     <div class="col-lg-6 col-sm-12 btns">
		      <button type="submit" class="btn writeBtn" >등록</button>
		    </div>
		  </div>		  
		</form>
		
	</div>

	
<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
</body>
</html>