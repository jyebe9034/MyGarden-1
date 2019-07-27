<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - 글쓰기</title>
</head>
<body>
<script>
if(${result}>0){
	alert("글이 작성되었습니다.");
	location.href="boardFreeList?page=1";
}else{
	alert("제목 또는 내용을 작성해주세요.");
	location.href="boardFreeWrite";
}
</script>
</body>
</html>