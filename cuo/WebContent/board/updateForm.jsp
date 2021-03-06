<%@page import="cuo.web.login.vo.Member"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cuo.web.board.vo.BoardVO"%>
<%@page import="cuo.web.board.dao.BoardDAO"%>
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
	#writeFormArea{
		margin : auto;
		width : 800px;
		height : 500px;
		border : 1px double skyblue;
	}
	h3,#td_command{
		text-align : center;
		border-bottom : 1px dotted skyblue;
	}
	table{	
		width : 600px;
		margin : auto;
	}
	.td_left{
		width : 200px;
	}
	.td_right{
		width : 280px;
	}
	#logo{
		width:250px;
		height:100px;
		margin:auto;
	}
	#margin{
		position: absolute;
		bottom: 350px;
		right: 150px;
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
<section id = "writeFormArea">
		<h3>게시판 글수정</h3>
		<form action="boardUpdatePro.bo" method = "post">
			<input type = "hidden" name = "postNum" value = "${article.postNum }">
			<input type = "hidden" name = "pageNum" value = "${pageNum }">
			<table>
				<tr>
					<td class = "td_left">
						<label for = "postWriter">작성자</label>
					</td>
					<td class = "td_right">
						<input type = "text" name ="postWriter" id ="postWriter" value = "${article.postWriter }"/>
					</td>
				</tr>
				
				<tr>
					<td class = "td_left">
						<label for = "postTitle">제목</label>
					</td>
					<td class = "td_right">
						<input type = "text" name ="postTitle" id ="postTitle" value = "${article.postTitle }"/>
					</td>
				</tr>
				
				<tr>
					<td class = "td_left">
						<label for = "postContent">내용</label>
					</td>
					<td class = "td_right">
						<textarea name ="postContent" id ="postContent" rows="10" cols="15">${article.postContent }</textarea>
					</td>
				</tr>
				
				<!-- <tr>
					<td class = "td_left">
						<label for = "id">id</label>
					</td>
					<td class = "td_right">
						<input type = "text" name ="id" id ="id"/>
					</td>
				</tr> -->
				
				<tr>
					<td colspan="2" id = "td_command">
						<input type = "submit" value = "글수정"/>
						<input type = "reset" value = "취소"/>
						<input type = "button" value = "목록보기" 
						onClick= "window.location.href='boardList.bo'"/>
					</td>
				</tr>
			</table>
		</form>
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
