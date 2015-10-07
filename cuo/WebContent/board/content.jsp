<%@page import="cuo.web.login.vo.Member"%>
<%@page import="cuo.web.board.vo.PageInfo"%>
<%@page import="cuo.web.board.vo.BoardVO"%>
<%@page import="cuo.web.board.dao.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>대가통</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/simple-sidebar.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
	.log_in{
		float:right;
	}
	#basicInfo{
	width : 800px;
		height : 40px;
		margin : auto;
		background : skyblue;
		text-align : center;
	}
	#commandList{
		width :800px;
		height : 40px;
		margin : auto;
		background : skyblue;
		text-align : center;
	}
	#contentInfo{
		width : 800px;
		height : 300px;
		margin : auto;
		border : 1px solid skyblue;
	}
	#pageArea{
		margin : auto;
		width : 500px;
		height:40px;
		text-align:center;
		 clear: both;
		 margin-top: 40px;
		 
	}
	h3,#td_command{
		text-align : center;
		border-bottom : 1px dotted white;
		
	}
	table{	
		width : 800px;
		margin : auto;
		
	}
	#meun{
		border-bottom: 1px solid #8ed4e3;
		border-width:2px;
		border-style:solid; 
		border-color:#07BFF7;   
		text-align:center;
		
	}

	h2{
    	margin-left : 120px;
    	margin-bottom : 10px;
       	color : #0070c0;
       	
  	}


	#logo{
		width:250px;
		height:100px;
		margin:auto;
		
	}
	#margin{
		position: absolute; 
		left : 330px;
		bottom: 350px;
	}
</style>
</head>

<body>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember != null){
	if(loginMember.getGrade().equals("주문자") || loginMember.getGrade().equals("음식점")){
%>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="maindex.jsp">
                    <img src="imgs/logo.jpg" style="height:30px;width:100px;" alt="">
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            	<div>
                <ul class="nav navbar-nav">
                    <li>
                        <a href="orderList.or">주문하기</a>
                    </li>
                    <li>
                        <a href="boardList.bo">게시판</a>
                    </li>
                    <li>
                        <a href="map.jsp">지도보기</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
               <div id="bs-example-navbar-collapse-1" class="log_in">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="logout.mem">로그아웃</a>
                    </li>
                    <li>
                        <a href="mypage.mp">마이페이지</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.container -->
    </nav>
<%
	}
	else if(loginMember.getGrade().equals("admin")){
%> 
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="maindex.jsp">
                    <img src="imgs/logo.jpg" style="height:30px;width:100px;" alt="">
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            	<div>
                <ul class="nav navbar-nav">
                    <li>
                        <a href="orderAdminList.ora">주문관리</a>
                    </li>
                    <li>
                        <a href="boardList.bo">게시판관리</a>
                    </li>
                    <li>
                        <a href="map.jsp">지도보기</a>
                    </li>
                    <li>
                        <a href="memberList.cuo">회원관리</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
               <div id="bs-example-navbar-collapse-1" class="log_in">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="logout.mem">로그아웃</a>
                    </li>
                    <li>
                        <a href="mypage.mp">마이페이지</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.container -->
    </nav>
<%
	}
	else{
%>   
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="maindex.jsp">
                    <img src="imgs/logo.jpg" style="height:30px;width:100px;" alt="">
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            	<div>
                <ul class="nav navbar-nav">
                    <li>
                        <a href="orderList.or">주문하기</a>
                    </li>
                    <li>
                        <a href="boardList.bo">게시판</a>
                    </li>
                    <li>
                        <a href="map.jsp">지도보기</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
               <div id="bs-example-navbar-collapse-1" class="log_in">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="memberLoginForm.mem">로그인</a>
                    </li>
                    <li>
                        <a href="memberRegistForm.mem">회원가입</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.container -->
    </nav>
<%
	}
%>

<%
	}
	else{
%>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="maindex.jsp">
                    <img src="imgs/logo.jpg" style="height:30px;width:100px;" alt="">
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            	<div>
                <ul class="nav navbar-nav">
                    <li>
                        <a href="orderList.or">주문하기</a>
                    </li>
                    <li>
                        <a href="boardList.bo">게시판</a>
                    </li>
                    <li>
                        <a href="map.jsp">지도보기</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
               <div id="bs-example-navbar-collapse-1" class="log_in">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="memberLoginForm.mem">로그인</a>
                    </li>
                    <li>
                        <a href="memberRegistForm.mem">회원가입</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.container -->
    </nav>
<%
	}
%>

    <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#">
                       MenuList
                    </a>
                </li>
                <li>
                    <a href="#">중식</a>
                </li>
                <li>
                    <a href="#">일식</a>
                </li>
                <li>
                    <a href="#">양식</a>
                </li>
                <li>
                    <a href="#">한식</a>
                </li>
                <li>
                    <a href="#">분식</a>
                </li>
                <li>
                    <a href="#">기타</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
<section id = "margin">
<section id = "basicInfo">
작성자 : ${article.postWriter } 글제목 : ${article.postTitle }
작성일 : ${article.postRegistTime } 조회수 : ${article.postReadcount }
</section>
<section id ="contentInfo">
	${article.postContent }
</section>
<section id = "commandList">

	<c:if test="${id eq article.id}"> 
	<a href = "boardUpdateForm.bo?postNum=${article.postNum }&pageNum=${pageNum}">글수정</a>
	<a href = "boardDeleteForm.bo?postNum=${article.postNum }&pageNum=${pageNum}">글삭제</a>
	</c:if>

	<%
   if(loginMember != null){
      if(loginMember.getGrade().equals("admin")){
%>
   <a href = "boardUpdateForm.bo?postNum=${article.postNum }&pageNum=${pageNum}">글수정</a>
	<a href = "boardDeleteForm.bo?postNum=${article.postNum }&pageNum=${pageNum}">글삭제</a>
   <%
      }
      else{
      }
   }
   %>
	<a href = "boardList.bo?pageNum=${pageNum}">글목록보기</a>
	<a href = "boardWriteForm.bo?postNum=${article.postNum}&ref=${ref}&re_step=${re_step}&re_level=${re_level}">답변글쓰기</a>

</section>
</section>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>

</html>
