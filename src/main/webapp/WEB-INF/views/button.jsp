<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><!-- jquery -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Insert title here</title>
</head>
<body>
	<button type="button" class="btn btn-outline-primary" id="btn">Primary</button>
	<p id="p"></p>
	<script>
		$('#btn').on('click', function(){
			$('#btn').append('<div class="spinner-border text-primary" role="status">'
							+'<span class="sr-only">Loading...</span>'
					  		+'</div>');
			$.ajax({
				url:"/test",
				type:"post"
			}).done(function(resp){
				if(resp){
					$('#p').text();
					$('#btn').html("Primary");
				}else{
					$('#p').text();
				}
			});
		});
	</script>
</body>
</html>