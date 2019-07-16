<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의글</title>
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
/* 		margin-left: 175px; */
	}
	
	#inputContent{
		height: 300px;
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
	
	#inputComment{
		border: 1px solid lightgrey;
		border-radius: 5px;
		height: 300px;
	}
	
	.commentBtn{
		background-color: #44b27d;
		color: white;
		font-weight: bold;
		border: 0px;
		margin-right: 20px;
	}
	.commentBtn:hover{
		background-color: #b4d9b5;
		color: #44b27d;
		font-weight: bold;
		border: 0px;
		cursor: pointer;
	}
	
</style>

<!-- script -->
<script>
	$(function(){
		$(".goBackBtn").on("click",function(){
			//$(location).attr("href","/");
			var pnumber = ${readQnA.bq_p_no};
			location.href = "productsRead?&revPage=1&qnaPage=1&pnumber=" + pnumber;
			
		})
		
// 		$(".writeBtn").on("click",function(){
// 			var checkedSecret = $("#secretBtn").prop("checked"); //true,false
// 			alert(checkedSecret);
// 			$("#secretBtn").val(checkedSecret);
// 			var inputContent = $("#inputContent").html();
// 			$("#content").val(inputContent);
// 			$("#writeQnAForm").submit();
// 		})
		
		$(".updateBtn").on("click",function(){
			var bq_no = ${readQnA.bq_no};
			
			$(location).attr("href","updateQnAForm?bq_no="+bq_no);
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
		<form action="updateQnA" id="updateQnAForm" method="post" enctype="multipart/form-data">
		  <div class="form-group row">
		    <label for="inputTitle" class="col-sm-2 col-form-label">제목</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="inputTitle" name="bq_title" value="${readQnA.bq_title }" readOnly>
		    </div>
		  </div>
<!-- 		  <div class="form-group form-check row secretBtnRow"> -->
<!-- 			    <input type="checkbox" class="form-check-input" id="secretBtn" name="checkedSecret"> -->
<!-- 			    <label class="form-check-label" for="secretBtn">비밀글</label> -->
<!-- 		 </div> -->
		 <div class="form-group row">
		    <label for="inputContent" class="col-sm-2 col-form-label">내용</label>
		    <div class="col-sm-10">
               <div contenteditable="false" id="inputContent">${readQnA.bq_content }</div>
               <input type=hidden name="bq_content" id="content">
		    </div>
		  </div>
			
<!-- 		  <div class="form-group row"> -->
<!-- 		  	 <label for="inputImage" class="col-sm-2 col-form-label">사진 등록</label> -->
<!-- 			    <div class="col-sm-10"> -->
<!-- 			      <input type="file" name=image accept="image/jpg, image/jpeg, image/gif, image/png" id=image> -->
<!-- 			      <p><small>※ 사진은 최대 3개까지 업로드가 지원됩니다.</small></p> -->
<!-- 			    </div> -->
<!-- 		  </div>	 -->
			
		  <div class="form-group row">
		    <div class="col-sm-12 d-flex justify-content-end btns">
		      <button type="button" class="btn goBackBtn" >돌아가기</button>
		      <c:choose>
				<c:when test="${mine eq 'y'}">
					<button type="button" class="btn updateBtn" >수정</button>	
				</c:when>
			 </c:choose>
		      
		    </div>
		  </div>		  
		</form>
		
		<c:if test="${checkAdmin eq 'admin' }">
		<!-- ========================답변(관리자만 가능)============================= -->
	
			<div id="AnswerWrapper">
				<div class="form-group row">
					<label for="cq_comment" class="col-sm-2 col-form-label">답변</label>
					<div class="col-sm-10">
	
						<div contenteditable="true" id="inputComment"></div>
						<input type="hidden" class="form-control" id="cq_comment"
							name="cq_comment">
					</div>
				</div>
	
				<div class="row d-flex justify-content-end">
					<button class="btn commentBtn">답변등록</button>
				</div>
			</div>
		</c:if>
		





	</div>
	
<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
</body>
</html>