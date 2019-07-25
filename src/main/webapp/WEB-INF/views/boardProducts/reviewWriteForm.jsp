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
		border: 1px solid lightgrey;
		border-radius: 5px;
		padding: 10px;
		margin-bottom: 15px;
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
		cursor: pointer;
	}
	.goBackBtn:hover{
		background-color: #b4d9b5;
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

	[contentEditable=true]:empty:not(:focus):before { content:attr(data-text) }
	
</style>

<!-- script -->
	<script>
		$(function(){
			var pnumber = "${productInfo.p_no}"; //돌아가기 버튼 고치기!!!!!!
			console.log(pnumber);
			$(".goBackBtn").on("click",function(){
					var pnumber = ${pnumber};
					location.href = "productsRead?&revPage=1&qnaPage=1&pnumber=" + pnumber;			
				})
			
				
				
			$(".writeBtn").on("click",function(){
				var inputTitle = $("#inputTitle").val();
				var inputContent = $("#inputContent").text();
				
				var cntTitle = inputTitle.length; //제목 글자수 계산
				var cntContent = inputContent.length; //내용 글자수 계산
				console.log("제목 글자 수 : " + cntTitle);
				console.log("내용 글자 수 : " + cntContent);
			
				
				if(inputTitle==""){
					alert("제목을 입력하세요.");
					event.preventDefault();
				}else if(inputContent==""){
					alert("내용을 입력하세요.");
					event.preventDefault();
				}
				else{
					$("#content").val(inputContent);
					alert("글이 등록되었습니다.");
					//event.preventDefault();
					$("#writeReviewForm").submit();
				}
			})
			

		$('#inputTitle').on('keyup', function() { //제목 글자수 입력 제한
				if ($(this).val().length > 30) {
					$(this).val($(this).val().substring(0, 30));
					alert("제목은 30자 이내만 입력이 가능합니다.");
				}
			});
		$('#inputContent').on('keyup', function() { //내용 글자수 입력 제한
				if ($(this).text().length > 69) {
					$(this).text($(this).text().substring(0, 69)); 
					alert("내용은 70자 이내만 입력이 가능합니다.");
				}
			});

		})
	</script>
</head>
<body>

<!-- header -->
	<jsp:include page="/WEB-INF/views/module/fixedHeader.jsp"/>
	<jsp:include page="/WEB-INF/views/module/font.jsp"></jsp:include>
	
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
		<form action="writeReview" id="writeReviewForm" method="post" enctype="multipart/form-data">
		  <div class="form-group row">
		    <label for="inputTitle" class="col-sm-2 col-form-label">제목</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="inputTitle" name="br_title" placeholder="제목을 입력해주세요">
		    </div>
		  </div>
		 <div class="form-group row">
		    <label for="inputContent" class="col-sm-2 col-form-label">내용</label>
		   	  <div class="col-sm-10">
		      <div contenteditable="true" id="inputContent" data-text="내용을 입력해주세요."></div>
		      <input type="hidden" class="form-control" id="content" name="br_content">
             </div>
		  </div>
			
		  <div class="form-group row">
		  		<label for="inputImage" class="col-sm-2 col-form-label">사진 등록</label>
		  		<div class="col-lg-10">
			      <input type="file" name=image accept="image/jpg, image/jpeg, image/gif, image/png" id=image>
			      <p><small>※ 사진은 대표 사진 1장만 선택해 주세요.</small></p>
			    </div>
		  </div>	
			
		  <div class="form-group row btnsRow">
		    <div class="col-sm-12 btnsBox">
		      <button type="button" class="btn goBackBtn">돌아가기</button>
		      <button type="submit" class="btn writeBtn">등록</button>
		    </div>
		  </div>		  
		</form>
		
	</div>


<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
</body>
</html>