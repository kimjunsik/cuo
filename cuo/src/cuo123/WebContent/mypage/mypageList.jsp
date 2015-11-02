<%@page import="cuo.web.myPage.vo.OrderList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cuo.web.login.vo.Member"%>
<%@page import="java.util.List"%>
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
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="font-awesome/css/font-awesome.min.css" />
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
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

}
#margin {
	margin-top: 3%;
	margin-left: 10%;
	width: 70%;
	height: 100%;
	border: 1px double white;
}
</style>
</head>

<body>
	<%
	ArrayList<OrderList> myOrderList = (ArrayList<OrderList>)request.getAttribute("myOrderList");
	String grade = (String)request.getAttribute("grade");
%>
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
						<li><a href="logout.mem">로그아웃</a></li>
						<li><a href="mypage.mp">마이페이지</a></li>
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

	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="mypage.mp"> MyPage </a></li>
				<li>
                    <a href="memberInfo.mp">회원정보</a>
                </li>
                <li>
                    <a href="myOrderList.mp">주문내역</a>
                </li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-9">
						<div>&nbsp</div>
						<br>
						<section id="margin">
							<div class="container">

								<div class="row">
									<div class="col-md-4">
										<div class="panel panel-success">
											<div class="panel-body text-center">
												<p class="lead">
													<strong>최근주문내역</strong>
												</p>
											</div>
											<ul class="list-group list-group-flush text-center">

												<%
												if(myOrderList != null){
  												for(int i = 0;i < myOrderList.size();i++ ){
 												 %>
												<li class="list-group-item"><%=myOrderList.get(i).getMenuName()%>
													<span class="glyphicon glyphicon-ok pull-right"></span></li>

												<%
  												}
												}else{
  												%>
  												최근 주문 내역이 없습니다.<br>
  												<%} %>

											</ul>
											<div class="panel-footer">
												<a href="myOrderList.mp"
													class="btn btn-lg btn-block btn-success">더보기</a>
											</div>
										</div>
									</div>
								</div>
							</div>

						</section>
					</div>
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
