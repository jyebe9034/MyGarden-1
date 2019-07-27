<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<title>나의 정원</title>
</head>
<body>
<script>
	if(${result>0}){
		alert("구독이 취소되었습니다.");
		location.href = "subsList";
	}else{
		alert("구독 취소에 실패했습니다.");
		location.href = "subsList";
	}

</script>
</body>
</html>