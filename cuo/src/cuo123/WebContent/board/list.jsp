<%@page import="cuo.web.login.vo.Member"%>
<%@page import="cuo.web.board.vo.PageInfo"%>
<%@page import="cuo.web.board.dao.BoardDAO"%>
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
#listArea{
margin-top:3%;
margin-left:10%;
		width : 90%;
		height : 100%;
		border : 1px double white;
	}
	#pageArea{
		width : 90%;
		height:40px;
		text-align:center;
		 clear: both;
		 margin-top: 40px;
		 
	}
	h3{
		text-align : center;
		border-bottom : 1px dotted white;
		
	}
	#tr_title{
		background : lightgray;
	}
	.td_postNum{
		width : 10%;
	}
	.td_postTitle{
		width : 30%;
	}
	.td_postWriter,.td_postRegistTime{
		width : 10%;
	}
	.td_postReadcount{
		width: 10%;
	}
	#search{
		height : 20px;
		width:90%;
		margin-top:40px;
		text-align:center;
		margin:auto;
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
    <%!
		
		//한페이지당 출력될 글의 개수 지정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	%>
	
	<section id = "listArea">
		<c:if test="${empty articleList }">
			<h3>등록된 글이 없습니다.</h3>
			<input type="button" value="글쓰기"
		onClick= "window.location.href='boardWriteForm.bo'"/>
		</c:if>			
		<c:if test="${not empty articleList }">
		<h3>게시글 목록</h3>
		
		<table class="table table-striped table-hover ">
		<tr id = "tr_title">
			<td class = "td_postNum">
				번호
			</td>
			<td class = "td_postTitle">
				제목
			</td>
			<td class = "td_postWriter">
				작성자
			</td>
			<td class = "td_postRegistTime">
				작성일
			</td>
			<td class = "td_postReadcount">
				조회수
			</td>
		</tr>
		
		<c:set var="number" value="${pageInfo.number }"></c:set>
		<c:forEach var="article" items="${articleList }">
			<tr>
			<td class = "td_postNum">
				${number }
			</td>
			<c:set var="number" value="${number-1 }"></c:set>
			<td class = "td_postTitle">
				<c:forEach begin="1" end="${article.re_level }">
					&nbsp;&nbsp;&nbsp;
				</c:forEach>
				
				<c:if test="${article.re_level > 0 }">
				re : 
				</c:if>
				<a href = "content.bo?postNum=${article.postNum }&pageNum=${pageInfo.currentPage}">${article.postTitle }</a>
			</td>
			<td class = "td_postWriter">${article.postWriter }</td>
			<fmt:formatDate value="${article.postRegistTime }" var="postRegistTime" pattern="yyyy.MM.dd"/>
			<td class = "td_postRegistTime">${postRegistTime }</td>
			<td class = "td_postReadcount">${article.postReadcount }</td>
		</tr>
		</c:forEach>
		</table>
		
		<tr>
		<td>
		<section id="search">
		<form action="search.bo">
		<select id="searchType" name="searchType">
		<option id="postTitle" >제목</option>
		<option id="postWriter" >작성자</option>
		</select>
		<input type="search" id= "searchName" name ="searchName">
		<input type="submit" value="검색">
		
		<input type="button" value="글쓰기"
		onClick= "window.location.href='boardWriteForm.bo'"/>
		</form>
		</section>
		</td>
		</tr>
		
	</c:if>
	<c:if test="${pageInfo.count>0 }">
	<section id = "pageArea">
	<c:if test="${pageInfo.startPage>10 }">
		<a href = "boardList.bo?pageNum=${pageInfo.startPage-10 }">[이전]</a>
		</c:if>
	<c:forEach var = "i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
		<a href = "boardList.bo?pageNum=${i }">${i }</a>
	</c:forEach>
	<c:if test="${pageInfo.endPage < pageInfo.pageCount }">
		<a href="boardList.bo?pageNum=${pageInfo.startPage + 10 }">[다음]</a>
	</c:if>
	</section>
	</c:if>
	</section>
	
                    </div>
        </div></div>
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
