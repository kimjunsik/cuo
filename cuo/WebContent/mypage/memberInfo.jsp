<%@page import="cuo.web.login.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member member = (Member)session.getAttribute("loginMember");
%>
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
</head>
<body>
	<section id = "registFormArea">
	<form action="memberUpdate.mp" method="post">
	<h2>내 회원정보</h2>
	<table>
		 <%-- <tr>
			<td class = "td_left">
			<label id = "id">회원아이디</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="id" id = "id" required="required"
			value = "<%=member.getId()%>"/>
			</td>
		</tr>  --%>
		
		<tr>
			<td class = "td_left">
			<label id = "name">회원이름</label>
			</td>
			
			<td class = "td_right">
			<input type = "hidden" name = "id" value = "<%=member.getId() %>"/>
			<input type = "text" name ="name" id = "name" required="required"
			value = "<%=member.getName()%>"/>
			</td>
		</tr>
		
		<tr>
			<td class = "td_left">
			<label id = "passwd">비밀번호</label>
			</td>
			
			<td class = "td_right">
			<input type = "password" name ="passwd" id = "passwd" required="required"
			value = "<%=member.getPasswd()%>"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "addr">주소</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="addr" id = "addr" required="required"
			value = "<%=member.getAddr()%>"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "birthday">생년월일</label>
			</td>
			
			<td class = "td_right">
			<input type = "date" name ="birthday" id = "birthday" required="required"
			value = "<%=member.getBirthday().substring(0,10)%>"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "grade">등급</label>
			</td>
			
			<td class = "td_right">
		<select id = "grade" name = "grade">
			<option <%if(member.getGrade().equals("주문자")){ %>selected<%} %>>주문자</option>
			<option <%if(member.getGrade().equals("음식점")){ %>selected<%} %>>음식점</option>
		</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" id = "td_command">
				<input type = "submit" value = "수정완료"/>
				<a href= "memberRemove.mp"><input type = "button" value = "회원탈퇴"/></a>
		</tr>
	</table>
	</form>
</section>
</body>
</html>