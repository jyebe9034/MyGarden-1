<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../module/bootstrap_cdn.jsp"></jsp:include>

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<title>나의 정원 - Product Add</title>
<style>
	#header{
		overflow : hidden;
		height : 600px;
		padding : 0;
		margin-bottom : 50px;
	}
	#wrapper{
		width : 100%;
	}
	#myform{
		width : 100%;
	}
	.addBtn{
		float : right;
		margin : 5px;
		background-color: #44b27d;
	    color: white;
	    border: 0px;
	}
	.addBtn:hover {
	    background-color: #b4d9b5;
	    border: 0px;
	}
	.note-editor, .note-toolbar{
		width : 100%;
	}
	.item>div, .item>label, .item>select{
		margin-bottom : 30px;
	}
	#category {
		width : 100%;
	}
	#itemSelect{
		height : 36px;
		width : 200px;
		border-radius : 5px;
		border : 1px solid #c8cbcf;
	}
</style>
</head>
<body>
	<jsp:include page="../module/fixedHeader.jsp"></jsp:include>
	<div id="header">
		<img id="titleImg" src="resources/img/test2.jpg">
	</div>
	<div class="container">
			<form id="myform" method="post" action="insertProducts" enctype="multipart/form-data" accept-charset="UTF-8">
				<div id="wrapper">
					<div class="row item">
						<label class="col-2">상품 이미지</label>
						<div id="image" class="col-10 items">
							<input name="image" id="inputimage" class="form-control" type="file">
						</div>
						<label class="col-2">상품명</label>
						<div id="title" class="col-10 items">
							<input name="p_title" id="inputTitle" class="form-control" type="text">
						</div>
						<label class="col-2">상품간단설명</label>
						<div id="simpleExplain" class="col-10 items">
							<input name="p_subtitle" id="inputSimpleExplain" class="form-control" type="text">
						</div>
						<label class="col-2">카테고리</label>
						<div id="category" class="col-10">
							<select name="p_category" id="itemSelect" class="items">
								<option value="fruit">fruit</option>
								<option value="vegetable">vegetable</option>
								<option value="egg">egg</option>
								<option value="grain">grain</option>
								<option value="source">source</option>
							</select>
						</div>
						<label class="col-2">재고</label>
						<div id="inventory" class="col-10 items">
							<input name="p_inventory" id="inputInventory" class="form-control" type="text">
						</div>
						<label class="col-2">단위</label>
						<div id="unit" class="col-10 items">
							<input name="p_unit" id="inputUnit" class="form-control" type="text">
						</div>
						<label class="col-2">판매자</label>
						<div id="seller" class="col-10 items">
							<input name="p_seller" id="inputSeller" class="form-control" type="text">
						</div>
						<label class="col-2">농장 주소</label>
						<div id="origin" class="col-10 items">
							<input name="p_origin" id="inputAddress" class="form-control" type="text">
						</div>
						<label class="col-2">가격</label>
						<div id="price" class="col-10 items">
							<input name="p_price" id="inputPrice" class="form-control" type="text">
						</div>
						<input id="myContent" type="hidden" name="p_content">
					</div>
				</div>
			</form> 
			<div id="content">
				<div id="summernote"></div>
			</div>
		<div class="row">
			<div id="btns" class="col-12">
				<input id="submit" class="btn btn-sm btn-primary addBtn" type="button" value="등록">
				<input id="cancel" class="btn btn-sm btn-primary addBtn" type="button" value="취소">
			</div>
		</div>
	</div>
	
	<jsp:include page="../module/fixedFooter.jsp"></jsp:include>
	
	<script>
		$("#submit").on("click", function(){
			$("#myContent").val($(".note-editable").html());
		    $("#myform").submit();
		})
	
		$('#summernote').summernote({
			placeholder: '내용을 입력해주세요.',
			tabsize: 2,
		    height: 500,
		      
		    callbacks: { 
		    	onImageUpload: function(files, editor, welEditable) { 
			    	for(var i = files.length - 1; i >= 0; i--){
			       		sendFile(files[i], this);
			       	}
			    },
		        		
				onMediaDelete : function(target) {
				    deleteFile(target[0].src);
				}
			}
		});
			
		function sendFile(file, editor) {
			var data = new FormData();
		   	data.append("file", file);
		   	console.log($("#inputTitle").val());
		   	data.append("title", $("#inputTitle").val());
		    $.ajax({
		      	url:"uploadImage",
		       	data: data,
		       	type:"POST",
		       	cache: false,
		       	contentType: false,
		       	enctype: "multipart/form-data",
		       	processData: false
		    }).done(function(resp){
		       	$(".note-editable").append("<img src='"+resp+"'>");
		    })
	    }
	    
	    function deleteFile(src) {
	    	$.ajax({
	        data: {src : src},
	        type: "POST",
	        url: "deleteImage", 
	        cache: false,
	        success: function(resp) {
	        	console.log(resp);
	          	if(resp == true){
	           		console.log("정상 삭제");
	           	}else{
	           		console.log("삭제 실패");	
	           	}
	        }
	    	});	
	    }
	     
	     $("#cancel").on("click", function(){ // 취소 버튼을 눌렀을 때 서버측의 사직 삭제
	     	if(confirm("작성된 글이 모두 삭제됩니다. 정말로 취소하시겠습니까?")){
	     		$("img").each(function(index, item){
	         		var src = $(this).attr("src");
	         		$.ajax({
	         			url: "deleteImage",
	         			data: {src : src},
	         			type: "POST",
	         			cache: false
	         		})	
	         	})
	         }
	         location.href="productsList";
	     })
	</script>
</body>
</html>