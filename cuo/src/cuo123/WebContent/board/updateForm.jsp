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
		margin-top:3%;
		margin-left: 10%;
		width : 90%;
		height : 200%;
		border : 1px double lightgray;
	}
	h3,#td_command{
		text-align : center;
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


        <!-- Page Content -->
         <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-9">
                    <div>&nbsp</div>
        <section id = "margin">
<section id = "writeFormArea">
		<h3>게시판 글수정</h3>
		<form action="boardUpdatePro.bo" method = "post">
		<form class="form-horizontal">
  <fieldset>
    <legend></legend>
    <div class="form-group">
      <label for="inputEmail" class="col-lg-2 control-label">작성자</label>
      <div class="col-lg-10">
        <input type="text" class="form-control" name="postWriter" id="postWriter" placeholder="작성자">
      </div>
    </div>
    <div class="form-group">
      <label for="inputPassword" class="col-lg-2 control-label">제목</label>
      <div class="col-lg-10">
 
        <input type="text" class="form-control" name="postTitle" id="postTitle" placeholder="제목">
      </div>
    </div>
    <div class="form-group">
      <label for="textArea" class="col-lg-2 control-label">내용</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="17" name="postContent" id="postContent"></textarea>
      </div>
    </div>
   
    <input type = "hidden" name = "postNum" value = "${article.postNum }">
			<input type = "hidden" name = "pageNum" value = "${pageNum }">
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
      <tr>
					<td colspan="3" id = "td_command">
						<input type = "submit" value = "글수정" class="btn btn-default"/>
						<input type = "reset" value = "취소" class="btn btn-disabled"/>
						<input type = "button" value = "목록보기" class="btn btn-primary"
						onClick= "window.location.href='boardList.bo'"/>
					</td>
				</tr>
      </div>
    </div>
  </fieldset>
</form>
			
			
		</form>
		
			
			<%-- <table>
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
			</table> --%>
	</section>
</section>

        </div>
                </div>
        </div>
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
