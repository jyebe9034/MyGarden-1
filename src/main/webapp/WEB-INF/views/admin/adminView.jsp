<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"></jsp:include>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<title>관리자 페이지</title>
</head>
<style>
#titleImg {
	overflow: hidden;
	height: 400px;
	padding: 0px;
	margin-bottom: 50px;
	background-color: #f1fad9;
}



.container {
	width: 100%;
}


</style>
<body>
	<jsp:include page="/WEB-INF/views/module/fixedHeader.jsp"></jsp:include>
	<div class=col-12 id=titleImg>
		<div id=#titleImg></div>
	</div>
	<div class=container>
		<div class=row>
			<div id=title class=col-12>
				${page.bf_title }
				<hr>
			</div>

	</div>
	</div>
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"></jsp:include>
	<script>
		
	</script>
</html>