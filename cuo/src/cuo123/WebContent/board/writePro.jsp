<%@page import="cuo.web.board.dao.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
글작성 페이지에서 작성한 글 정보를 파라미터 값으로 받아서 파라미터로 넘어온 값들을 데이터베이스에 삽입하고, 
목록보기 화면으로 이동하는 작업 실행
--%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id = "article" class = "cuo.web.board.vo.BoardVO"/>
<jsp:setProperty name="article" property="*"/>
<%
	article.setPostRegistTime(new Timestamp(System.currentTimeMillis()));
	//System.currentTimeMillis() : 1970년 1월 1일 자정부터 현재까지의 시간을 밀리초 단위로 반환
	article.setIp(request.getRemoteAddr());//요청한 클라이언트 ip주소 
	//데이터베이스 작업을 위해서 DAO 클래스 객체 얻어오기
	BoardDAO boardDAO = BoardDAO.getInstance();
	boardDAO.insertArticle(article);
	
	//글등록을 한 후 목록보기 요청을 바로실행
	response.sendRedirect("list.jsp");
%>