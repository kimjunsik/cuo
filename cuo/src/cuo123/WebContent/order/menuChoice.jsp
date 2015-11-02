<%@page import="cuo.web.login.vo.Member"%>
<%@page import="cuo.web.order.vo.Order"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">


<link rel="icon" href="sang.jpg">
<!-- 홈페이지이름 아이콘 -->



<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="css/bootstrap-theme.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="theme.css" rel="stylesheet">
<link href="css/simple-sidebar.css" rel="stylesheet">
<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>주문하기</title>
<style>
.log_in {
	float: right;
}

</style>
</head>
<body role="document">
	<%
		ArrayList<Order> orderList = (ArrayList<Order>) request.getAttribute("orderList");
	%>
	<%
		Member loginMember = (Member) session.getAttribute("loginMember");
		if (loginMember != null) {
			if (loginMember.getGrade().equals("주문자") || loginMember.getGrade().equals("음식점")) {
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
		} else if (loginMember.getGrade().equals("admin")) {
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
		} else {
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
		} else {
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
				<li class="sidebar-brand"><a href="#"> MenuList </a></li>
				<li><a href="#">중식</a></li>
				<li><a href="#">일식</a></li>
				<li><a href="#">양식</a></li>
				<li><a href="#">한식</a></li>
				<li><a href="#">분식</a></li>
				<li><a href="#">기타</a></li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->


		<div class="container theme-showcase" role="main">

			<!-- Main jumbotron for a primary marketing message or call to action -->
			<div>&nbsp</div><br>
			<p>
			<div class="col-md-4">
				<a href="menuName.or?menuKey=<%=orderList.get(0).getMenuKey()%>">
					<img src="imgs/pizza.JPG" alt="" class="img-responsive img-rounded">
				</a>
			</div>

			<div class="col-md-4">
				<a href="menuName.or?menuKey=<%=orderList.get(1).getMenuKey()%>">
					<img src="imgs/meat.JPG" alt="" class="img-responsive img-rounded">
				</a>
			</div>
			<div class="col-md-4">
				<a href="menuName.or?menuKey=<%=orderList.get(2).getMenuKey()%>">
					<img src="imgs/chiken.JPG" alt="" class="img-responsive img-rounded">
				</a>
			</div>
			<div class="col-md-4">
				<a href="menuName.or?menuKey=<%=orderList.get(3).getMenuKey()%>">
					<img src="imgs/china.JPG" alt="" class="img-responsive img-rounded">
				</a>
			</div>
			<div class="col-md-4">
				<a href="menuName.or?menuKey=<%=orderList.get(4).getMenuKey()%>">
					<img src="imgs/japan.JPG" alt="" class="img-responsive img-rounded">
				</a>
			</div>
			<div class="col-md-4">
				<a href="menuName.or?menuKey=<%=orderList.get(5).getMenuKey()%>">
					<img src="imgs/bunsik.JPG" alt="" class="img-responsive img-rounded">
				</a>
			</div>

			<!-- <button type="button" class="btn btn-lg btn-link">Link</button> -->
			</p>

		</div>
		<!-- /container -->
		<!-- Bootstrap core JavaScript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/docs.min.js"></script>
		<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
		<script src="js/ie10-viewport-bug-workaround.js"></script>
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
</body>
</html>