<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#loginFormArea{
	width : 600px;
	height : 500px;
	margin:auto;
	border:1px solid orange;
}
h2,fieldset{
	text-align:center;
}
#logo{
		width:250px;
		height:100px;
		margin:auto;
	}
</style>
</head>
<body>
<section id = "logo">
     <a href = "main.jsp"><img src="imgs/logo2.png" width="250" height="100" align="middle"/></a>
</section>
<section id ="loginFormArea">
<h2>로그인</h2>
<form action="loginPro.mem" method = "POST">
	<fieldset>
	<label for = "id">아이디:</label>
	<input type = "text" name = "id" id = "id"/><br>
	<label for = "passwd">비밀번호:</label>
	<input type = "password" name = "passwd" id = "passwd"/><br>
	<input type = "submit" value = "로그인"/>
	<a href = "memberRegistForm.mem"><input type = "button" value = "회원가입"></a>
	</fieldset>
</form>
</section>
</body>
</html>