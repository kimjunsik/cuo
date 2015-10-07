<%@page import="cuo.web.login.vo.Member"%>
<%@page import="cuo.web.myPage.vo.OrderList"%>
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

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>Insert title here</title>
<style type="">
dropdown {
	margin: auto;
}
.log_in{
		float:right;
		}
</style>
</head>
<body role="document">
	<%
	ArrayList<OrderList> myOrderList = (ArrayList<OrderList>)request.getAttribute("myOrderList");
	String grade = (String)request.getAttribute("grade");
%>
	<!-- Fixed navbar -->
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


	<div class="container theme-showcase" role="main">

		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div class="jumbotron"></div>

		<!-- <table class="table table-striped table-hover ">  테이블
  <thead>
    <tr>
      <th>#</th>
      <th>이름</th>
      <th>주소</th>
    </tr>
  </thead>
  <tbody> -->
<form action="accept.mp">

		<%
  if(grade.equals("주문자")){
  for(int i = 0;i < myOrderList.size();i++ ){
  %>
		<ul class="nav nav-pills">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#" aria-expanded="false"> <%=myOrderList.get(i).getMenuName()%>
					<span class="caret"></span>
			</a>
				<ul class="dropdown-menu" style="width: 250px;">

					<li><label>주문메뉴 : <%=myOrderList.get(i).getMessageMenu()%></label></li>
					<li><label>주문개수 : <%=myOrderList.get(i).getMessageQty()%></label></li>
					<li><label>요청사항 : <%=myOrderList.get(i).getMessageContent()%></label></li>
					<li><label>주문처리현황 : <%=myOrderList.get(i).getMessageCurrent()%></label></li>
					<li class="divider"></li>
					<%--  <li><a href="orderForm.or?menuName=<%=myOrderList.get(i).getMenuName()%>">주문</a></li> --%>
				</ul></li>
		</ul>
		<%-- <tr> 테이블
      <td><%=i %></td>
      <td><%=menuList.get(i).getMenuName()%></td>
      <td><%=menuList.get(i).getMenuAddress()%></td>
    </tr> --%>

		<%
  }
  }
  %>
		<%
  if(grade.equals("음식점")){
	  %>
	  <input type ="submit" value="주문전체수락">
	  <%
  for(int i = 0;i < myOrderList.size();i++ ){
  %>
		<ul class="nav nav-pills">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#" aria-expanded="false"> <%=myOrderList.get(i).getMenuName()%>
					<span class="caret"></span>
			</a>
			<input type="hidden" name = "messageMenu" value = "<%=myOrderList.get(i).getMessageMenu()%>">
			<input type="hidden" name = "messageQty" value = "<%=myOrderList.get(i).getMessageQty()%>">
			<input type="hidden" name = "messageCurrent" value = "<%=myOrderList.get(i).getMessageCurrent()%>">
				<ul class="dropdown-menu" style="width: 250px;">
	
					<li><label>주문자ID : <%=myOrderList.get(i).getId()%></label></li>
					<li><label>주문메뉴 : <%=myOrderList.get(i).getMessageMenu()%></label></li>
					<li><label>주문개수 : <%=myOrderList.get(i).getMessageQty()%></label></li>
					<li><label>요청사항 : <%=myOrderList.get(i).getMessageContent()%></label></li>
					
					<li><label>주문처리현황 : <%=myOrderList.get(i).getMessageCurrent()%>  </label></li>
					<li class="divider"></li>
					<%--  <li><a href="orderForm.or?menuName=<%=myOrderList.get(i).getMenuName()%>">주문</a></li> --%>
				</ul></li>
		</ul>
		<%-- <tr> 테이블
      <td><%=i %></td>
      <td><%=menuList.get(i).getMenuName()%></td>
      <td><%=menuList.get(i).getMenuAddress()%></td>
    </tr> --%>

		<%
  }
  }
  %>
		</form>

		<!--  테이블
    
  </tbody>
</table>  -->

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
</body>
</html>