<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#deleteForm{
		width : 300px;
		height : 200px;
		margin : auto;
		border : 1px solid blue;
	}
	fieldset{
		text-align : center;
	}
</style>
</head>
<body>

<section id = "deleteForm">
<form action = "deletePro.jsp" method = "post">
	<input type = "hidden" name = "postNum" value = "${postNum }"/>
	<input type = "hidden" name = "pageNum" value = "${pageNum }"/>
	<fieldset>
	<input type = "submit" value = "삭제"/>
	
	</fieldset>
</form>
</section>
</body>
</html>