<%@page import="cuo.web.login.vo.Member"%>
<%@page import="java.util.List"%>
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
	#writeFormArea{
		margin : auto;
		width : 800px;
		height : 500px;
		border : 1px double skyblue;
		
	}
	h3,#td_command{
		text-align : center;
		border-bottom : 1px dotted white;
		
	}
	table{	
		width : 600px;
		margin : auto;
		
	}
	}
	.td_left{
		width : 200px;
	}
	.td_right{
		width : 280px;
	}
  	}


	#logo{
		width:250px;
		height:100px;
		margin:auto;
		
	}
	#margin{
		position: absolute;
		left : 300px;
		bottom: 200px;
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
	<section id = "registFormArea">
	<form action="orderAdminMenuRegistPro.ora" method="post">
	<h2>메뉴 등록</h2>
	<table>
		<tr>
			<td class = "td_left">
			<label id = "menuNum">음식점번호</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="menuNum" id = "menuNum" required="required"/>
			</td>
		</tr>
		
		<tr>
			<td class = "td_left">
			<label id = "menuName">음식점명</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="menuName" id = "menuName" required="required"/>
			</td>
		</tr>
		
		<tr>
			<td class = "td_left">
			<label id = "menuAddress">음식점주소</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="menuAddress" id = "menuAddress" required="required"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "menuBhours">영업시간</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="menuBhours" id = "menuBhours" required="required"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "menuEhours">기타시간</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="menuEhours" id = "menuEhours" required="required"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "menuDel">배달여부</label>
			</td>
			
			<td class = "td_right">
		<select id = "menuDel" name = "menuDel">
			<option>o</option>
			<option>x</option>
		</select>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "menuPack">포장여부</label>
			</td>
			
			<td class = "td_right">
		<select id = "menuPack" name = "menuPack">
			<option>o</option>
			<option>x</option>
		</select>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "menuImage">메뉴이미지</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="menuImage" id = "menuImage" required="required"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "menuMap">메뉴지도</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="menuMap" id = "menuMap" required="required"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "menuKey">종류</label>
			</td>
			
			<td class = "td_right">
		<select id = "menuKey" name = "menuKey">
			<option>중식</option>
			<option>일식</option>
		</select>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "menu1">메뉴1</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="menu1" id = "menu1" required="required"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "menu2">메뉴2</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="menu2" id = "menu2" required="required"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "menu3">메뉴3</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="menu3" id = "menu3" required="required"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "menu4">메뉴4</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="menu4" id = "menu4" required="required"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "menu5">메뉴5</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="menu5" id = "menu5" required="required"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "menu6">메뉴6</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="menu6" id = "menu6" required="required"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "menu7">메뉴7</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="menu7" id = "menu7" required="required"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "menu8">메뉴8</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="menu8" id = "menu8" required="required"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "menu9">메뉴9</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="menu9" id = "menu9" required="required"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "menu10">메뉴10</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="menu10" id = "menu10" required="required"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "menu11">메뉴11</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="menu11" id = "menu11" required="required"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "menu12">메뉴12</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="menu12" id = "menu12" required="required"/>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
			<label id = "id">해당 음식점 아이디</label>
			</td>
			
			<td class = "td_right">
			<input type = "text" name ="id" id = "id" required="required"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" id = "td_command">
				<input type = "submit" value = "등록" />
				<input type = "reset" value = "취소"/>
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
