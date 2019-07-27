<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - Update Check</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<script>
		if(${result > 0}){
			alert("성공적으로 수정되었습니다.");
			location.href = "productsRead?revPage=1&qnaPage=1&pnumber=" + ${pno};
		}else{
			alert("수정에 실패했습니다.");
			location.href = "productsRead?revPage=1&qnaPage=1&pnumber=" + ${pno};
		}
	</script>
</body>
</html>