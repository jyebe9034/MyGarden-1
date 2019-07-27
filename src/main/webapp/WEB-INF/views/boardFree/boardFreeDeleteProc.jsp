<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - 글 삭제</title>
</head>
<body>
	<script>
	if(${result}>0){
		alert("글이 삭제되었습니다.");
		location.href="boardFreeList";
	}else{
		alert("글삭제에 실패하였습니다.");
	}
	</script>
</body>
</html>