<%@page import="cuo.web.login.vo.Member"%>
<%@page import="cuo.web.board.vo.PageInfo"%>
<%@page import="cuo.web.board.vo.BoardVO"%>
<%@page import="cuo.web.board.dao.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
.log_in {
	float: right;
}

#basicInfo {
	width: 100%;
	height: 40px;
	margin: auto;
	background: lightgray;
	text-align: center;
}

#commandList {
	width: 100%;
	height: 40px;
	margin: auto;
	background: lightgray;
	text-align: center;
}

#contentInfo {
	width: 100%;
	height: 300px;
	margin: auto;
	border: 1px solid lightgray;
}

#pageArea {
	margin: auto;
	width: 100%;
	height: 40px;
	text-align: center;
	clear: both;
	margin-top: 40px;
}

h3, #td_command {
	text-align: center;
	border-bottom: 1px dotted white;
}


h2 {
	margin-left: 120px;
	margin-bottom: 10px;
	color: #0070c0;
}

#margin {
margin-left:10%;
margin-top:3%;
	width : 90%;
	height : 100%;
}
.left_time{
	text-align: right;
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
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="maindex.jsp"> <img
					src="imgs/logo.jpg" style="height: 30px; width: 100px;" alt="">
				</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<div>
					<ul class="nav navbar-nav">
						<li><a href="orderAdminList.ora">주문관리</a></li>
						<li><a href="boardList.bo">게시판관리</a></li>
						<li><a href="map.jsp">지도보기</a></li>
						<li><a href="memberList.cuo">회원관리</a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
				<div id="bs-example-navbar-collapse-1" class="log_in">
					<ul class="nav navbar-nav">
						<li><a href="logout.mem">로그아웃</a></li>
						<li><a href="mypage.mp">마이페이지</a></li>
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
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="maindex.jsp"> <img
					src="imgs/logo.jpg" style="height: 30px; width: 100px;" alt="">
				</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<div>
					<ul class="nav navbar-nav">
						<li><a href="orderList.or">주문하기</a></li>
						<li><a href="boardList.bo">게시판</a></li>
						<li><a href="map.jsp">지도보기</a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
				<div id="bs-example-navbar-collapse-1" class="log_in">
					<ul class="nav navbar-nav">
						<li><a href="memberLoginForm.mem">로그인</a></li>
						<li><a href="memberRegistForm.mem">회원가입</a></li>
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
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="maindex.jsp"> <img
					src="imgs/logo.jpg" style="height: 30px; width: 100px;" alt="">
				</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<div>
					<ul class="nav navbar-nav">
						<li><a href="orderList.or">주문하기</a></li>
						<li><a href="boardList.bo">게시판</a></li>
						<li><a href="map.jsp">지도보기</a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
				<div id="bs-example-navbar-collapse-1" class="log_in">
					<ul class="nav navbar-nav">
						<li><a href="memberLoginForm.mem">로그인</a></li>
						<li><a href="memberRegistForm.mem">회원가입</a></li>
					</ul>
				</div>
			</div>
			<!-- /.container -->
	</nav>
	<%
	}
%>


		<!-- Sidebar -->
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-9">
                    <div>&nbsp</div>
		
		<section id="margin">
		<div class="well bs-component" >
		<form class="form-horizontal">
  <fieldset>
    <legend>${article.postTitle }</legend>
    <label class = "asdf">${article.postWriter }</label>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp<label class = "left_time">${article.postRegistTime }</label>
      <div class="col-lg-15">
        <textarea class="form-control" rows="17" id="textArea">${article.postContent }</textarea>
      </div>
   
    <div class="form-group">
      <div class="col-lg-20 col-lg-offset-7">
<%
   if(loginMember != null){
	   BoardVO article = (BoardVO)request.getAttribute("article");
      if(loginMember.getGrade().equals("admin")){
%>
	<button type="button" class="btn btn-default">
        <a href="boardUpdateForm.bo?postNum=${article.postNum }&pageNum=${pageNum}">글수정</a></button>
					<button type="button" class="btn btn-disabled">
        <a href="boardDeleteForm.bo?postNum=${article.postNum }&pageNum=${pageNum}">글삭제</a></button>			
<%
      }
      else if(loginMember.getId().equals(article.getId())){
%>
<button type="button" class="btn btn-default">
        <a href="boardUpdateForm.bo?postNum=${article.postNum }&pageNum=${pageNum}">글수정</a></button>
					<button type="button" class="btn btn-disabled">
        <a href="boardDeleteForm.bo?postNum=${article.postNum }&pageNum=${pageNum}">글삭제</a></button>
<%
      }
      else
%>        
     <button type="button" class="btn btn-disabled">	<a href="boardList.bo?pageNum=${pageNum}">글목록</a> </button> 
<%
   }
%>     
	
      </div>
    </div>
  </fieldset>
</form>
</div>
	</section>	
		        </div>
                </div>
</div>        </div>
		
		
		
		
		
		
		
		
		
		
	<%-- 	
		
		
		<section id="margin">
			<section id="basicInfo">작성자 : ${article.postWriter } 글제목 :
				${article.postTitle } 작성일 : ${article.postRegistTime } 조회수 :
				${article.postReadcount }</section>
			<section id="contentInfo">${article.postContent }</section>
			<section id="commandList">

				<c:if test="${id eq article.id}">
					<a
						href="boardUpdateForm.bo?postNum=${article.postNum }&pageNum=${pageNum}">글수정</a>
					<a
						href="boardDeleteForm.bo?postNum=${article.postNum }&pageNum=${pageNum}">글삭제</a>
				</c:if>

					<%
   if(loginMember != null){
      if(loginMember.getGrade().equals("admin")){
%>
				<c:if test="${grade eq 'admin'}">
					<a
						href="boardUpdateForm.bo?postNum=${article.postNum }&pageNum=${pageNum}">글수정</a>
					<a
						href="boardDeleteForm.bo?postNum=${article.postNum }&pageNum=${pageNum}">글삭제</a>
				</c:if>
				   <%
      }
      else{
      }
   }
   %>
				<a href="boardList.bo?pageNum=${pageNum}">글목록보기</a> 

			</section>
		</section>
		<!-- /#page-content-wrapper -->

	</div> --%>
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
