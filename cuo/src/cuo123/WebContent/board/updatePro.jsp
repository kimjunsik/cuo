<%@page import="cuo.web.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id = "article" class = "cuo.web.board.vo.BoardVO"></jsp:useBean>
<jsp:setProperty property="*" name="article"/>
<%
	String pageNum = request.getParameter("pageNum");
	BoardDAO boardDAO = BoardDAO.getInstance();
	int updateCount = boardDAO.updateArticle(article);
	
	if(updateCount>0){
		response.sendRedirect("boardList.bo?pageNum="+pageNum);
	}
	else{
		
%>
<script>
	alert("수정실패");
	history.back();
</script>
<%
	}
%>