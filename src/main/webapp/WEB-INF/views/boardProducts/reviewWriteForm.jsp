<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - 후기작성</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<style>

	
	#reviewHeaderImg {
		width: 100% !important;
	}

	#wrapper{
		margin: 50px auto;
		width: 700px;
	}
	
	.boardTitle{
		color: #53782f;
		font-weight: bold;
		font-size: 20px;
	}
	
	.rvLabel{
		color: #53782f;
	}
	
	.pTitle{
		margin-left : 10px;
		font-weight: bold;
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
		margin-bottom: 15px;
		overflow: auto;
	}
	

	.imageRow{
		width: 100%;
/* 		margin: 0 -15px; */
	}
	
	.imageCol{
		padding:0;
	}
	.imageBox{
		border: 1px solid lightgrey; 
	    border-radius: 10px; 
	    width:100%;
		padding: 15px;
		padding-bottom: 0;
		margin-left: 15px;
	}
	
	#image{
	    margin-bottom: 10px;
	}
	
	.previewImage img{
		width: 150px;
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

			$(document).bind('keydown', function(e) {
				if (e.keyCode == 123 /* F12 */) {
					e.preventDefault();
					e.returnValue = false;
				}
			});

			document.onmousedown = disableclick;
			status = "마우스 우클릭은 사용할 수 없습니다.";

			function disableclick(event) {
				if (event.button == 2) {
					alert(status);
					return false;
				}
			}

			
			$(".goBackBtn").on("click",function() {
				var pnumber = "${productInfo.p_no}"; 
				console.log(pnumber);
				location.href = "productsRead?&revPage=1&qnaPage=1&pnumber="+ pnumber;
			})

			$(".writeBtn").on("click", function() {
				var inputTitle = $("#inputTitle").val();
				var inputContent = $("#inputContent").text();

				var cntTitle = inputTitle.length; //제목 글자수 계산
				var cntContent = inputContent.length; //내용 글자수 계산
				console.log("제목 글자 수 : " + cntTitle);
				console.log("내용 글자 수 : " + cntContent);

				if (inputTitle == "") {
					alert("제목을 입력하세요.");
					event.preventDefault();
				} else if (inputContent == "") {
					alert("내용을 입력하세요.");
					event.preventDefault();
				} else {
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

			$(document).on('keyup', '#inputContent', function() { //내용 글자수 입력 제한
				var inputComment = $("#inputContent").text();
				var cntCmt = $("#content").val(inputComment);
				//alert("입력한거ㅡㅡ: " + cntCmt.val());
				if ($(cntCmt).val().length > 140) {
					$("#inputContent").text($(cntCmt).val().substring(0, 140));
					alert("내용은 140자 이내만 입력이 가능합니다.");
				}
			});

			$("#image").on(
					"change",
					function() {
						var formData = new FormData();
						formData.append("formData", $(this)[0].files[0]);

						$.ajax({
							url : "getImgs",
							type : "post",
							processData : false,
							contentType : false,
							data : formData
						}).done(
								function(resp) {
									console.log(resp);
									//console.log(image);
									var time = new Date().getTime();
									console.log("time : " + time);

									$(".previewImg").html(
											"<img src='/resources/temp/" + resp
													+ "?time=" + time
													+ "' width='150px'>");
									// $(".previewImg").attr("max-width","560px");

								})

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
	
	<img alt="" src="/resources/products/reviewHeader.jpg" id="reviewHeaderImg">
	
	<!-- 리뷰 작성 폼 -->
	<div id="wrapper">
		<span class="boardTitle">후기작성</span>
		<hr>
		<div id="productInfo" >
			<img src="${productInfo.p_imagepath}" class="productImage">
			<span class="rvLabel pTitle">${productInfo.p_title}</span>
		</div>
		<hr>
		<form action="writeReview" id="writeReviewForm" method="post" enctype="multipart/form-data">
		  <div class="form-group row">
		    <label for="inputTitle" class="col-sm-2 col-form-label rvLabel">제목</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="inputTitle" name="br_title" placeholder="제목을 입력해주세요">
		    </div>
		  </div>
		 <div class="form-group row">
		    <label for="inputContent" class="col-sm-2 col-form-label rvLabel">내용</label>
		   	  <div class="col-sm-10">
		      <div contenteditable="true" id="inputContent" data-text="내용을 입력해주세요."></div>
		      <input type="hidden" class="form-control" id="content" name="br_content">
             </div>
		  </div>
			
		  <div class="form-group row imageRow">
		  		<label for="inputImage" class="col-sm-2 col-form-label rvLabel">사진 등록</label>
		  		<div class="col-10 imageCol">
					<div class="imageBox">
				      <input type="file" name=image accept="image/jpg, image/jpeg, image/gif, image/png" id=image>
				    	<span class="previewImg"></span> 
				    	<p><small class="rvLabel">※ 사진은 대표 사진 1장만 선택해 주세요.</small></p>
				    </div>
 		  		</div>
		  </div>	
<!-- 		  <div class="row previewImgRow"> -->
<!-- 		    	<div class="col-12 previewImgBox"> -->
<!-- 		    		<p>사진 미리보기</p> -->
<!-- 		  			<span class="previewImg"></span> -->
<!-- 		  		</div> -->
<!-- 		  </div> -->
		  
			
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