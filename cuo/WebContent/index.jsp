<%@page import="cuo.web.login.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href = index.jsp>home</a>
<a href = memberList.cuo>회원관리(등급수정)</a>
<a href = memberRegistForm.mem>회원가입</a>
<a href = boardWriteForm.bo>게시판글쓰기</a>
<a href = boardList.bo>게시판글쓰기</a>
<a href = mypage.mp>마이페이지</a>
<a href = orderList.or>주문</a>

<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember != null){
		if(loginMember.getGrade().equals("admin")){
%>
	<a href = "memberList.cuo">회원관리(관리자)</a>
	<%
		}
		else{
	%>
	
	<%
		}
	%>

<a href = "logout.mem">로그아웃</a>
<%=loginMember.getId() %>님 환영합니다.
<%
	}
	else{
%>
<a href = memberLoginForm.mem>로그인</a>
<%
	}
%>

</body>
</html>