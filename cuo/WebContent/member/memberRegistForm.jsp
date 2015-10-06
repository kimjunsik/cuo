<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type = "text/css">
	#registFormArea{
		margin : auto;
		width : 500px;
		height : 500px;
		border : 1px double orange;
	}
	h2,#td_command{
		text-align : center;
		border-bottom : 1px dotted red;
	}
	table{	
		width : 480px;
		margin : auto;
	}
	.td_left{
		width : 200px;
	}
	.td_right{
		width : 280px;
	}
	#id{
		width : 100px;
	}
</style>
<script>
	function winOpen(){
		//자바스크립트는 화면을 제어할 수 있는 수많은 내장 객체들을 제공하고 각 내장 객체들은 속성과 메소드가 제공된다.
		//alert(document.forms[0].id.value);
		window.open("idCheck?id=" + document.forms[0].id.value, "window1","width=300,height=300");
	}
</script>
</head>
<body>
<section id = "registFormArea">
	<form action="memberRegistPro.mem" method="post">
	<h2>회원가입</h2>
	<table>
		<tr>
			<td class = "td_left">
			<label id = "id">회원아이디</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="id" id = "id" required="required"/>
			<input type = "button" value = "아이디중복체크" onClick = "winOpen()"/><!-- 마우스로 클릭하면 중복체크.-->
			</td>
		</tr>
		
		<tr>
			<td class = "td_left">
			<label id = "name">회원이름</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="name" id = "name" required="required"/>
			</td>
		</tr>
		
		<tr>
			<td class = "td_left">
			<label id = "passwd">비밀번호</label>
			</td>
			
			<td class = "td_right">
			<input type = "password" name ="passwd" id = "passwd" required="required"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "addr">주소</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="addr" id = "addr" required="required"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "birthday">생년월일</label>
			</td>
			
			<td class = "td_right">
			<input type = "date" name ="birthday" id = "birthday" required="required"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "grade">등급</label>
			</td>
			
			<td class = "td_right">
		<select id = "grade" name = "grade">
			<option>주문자</option>
			<option>음식점</option>
		</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" id = "td_command">
				<input type = "submit" value = "회원가입" />
		</tr>
	</table>
	</form>
</section>
</body>
</html>