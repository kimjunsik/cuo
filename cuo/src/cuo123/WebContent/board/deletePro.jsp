<%@page import="cuo.web.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNum = request.getParameter("pageNum");
	int postNum = Integer.parseInt(request.getParameter("postNum"));
	
	BoardDAO boardDAO = BoardDAO.getInstance();
	int updateCount = boardDAO.deleteArticle(postNum);
	
	if(updateCount>0){
		response.sendRedirect("list.jsp?pageNum="+pageNum);
	}
	else{
		
%>
<script>
alert("삭제실패");
history.back();
</script>
<%
	}
%>