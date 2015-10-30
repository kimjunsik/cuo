<%@page import="cuo.web.login.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#main_view{
		width:250px;
		height:100px;
		margin:auto;
		}
	.order{
		margin:auto;
		}
	.map{
		margin:auto;
		}
	.write{
		padding:50px;
		}
	#up_bar {
		height:46px;
		width:891px;
		margin:auto;
		text-align:center;	
		background-image:url(imgs/me.png);
		}
	#log_in{
		text-align:right;
		margin-left:10px;
		font-size:15px;
		}
	.log_out{
		width:95px; 
		display:inline-block;
		margin:auto;
		text-align:right;
		font-size:18px;
		}
	#tr_one{
		width:300px;
		height:20px;
		margin:auto;
		}
	table img{
		margin:5px;
		border:3px dotted #80f5ff;
		}
	#top {
		margin:auto;
		text-align:center;
		}
	nav ul{
		margin:auto;
		text-align:center;
		font-size:30px;
		font-family: 'a구름자전거';
		}
	nav li {
		width:95px; 
		display:inline-block;
		margin:auto;
		text-align:center;
		font-size:18px;
		}
	#ta{
		width:400px;
		height:200px;
		margin-left:150px;
		margin-bottom:150px;
		font-size:20px;
		border: 5px outset skyblue ;
		background-color:#fff;
		}
	#g_tr{
		margin:auto;
	}
	#d_one{
		float:left;
		width:150px;
		height:150px;
		}	
	#d_two{
		float:left;
		right:0;
		margin-left:500px;
		}
		.clear {
			clear: both;
		}
  </style>
  <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body style="background-image:url(imgs/back.jpg);background-size:contain;">
<section id = "main_view">
  <a href = "index.jsp"><img src="imgs/logo.jpg" width="250" height="100" align="middle"/></a>
</section>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");

	if(loginMember != null){
	if(loginMember.getGrade().equals("주문자") || loginMember.getGrade().equals("음식점")){
%>
 <div id="log_in">
   <ul>
      <li class="log_out"><a href="logout.mem">로그아웃</a></li>
      <li class="log_out"><a href="mypage.mp">마이페이지</a></li>
    </ul>
  </div>

  <fieldset id = "up_bar">
  <div id="top">
   
    <nav>
    <ul>
      <li><a href="orderList.or">주문하기</a></li>
      <li><a href="http://daum.net">지도보기</a></li>
      <li><a href= boardList.bo>게시판</a></li>
    </ul>
      </nav>
  </div>
  </fieldset>
<%
	}
	else if(loginMember.getGrade().equals("admin")){
%>
 <div id="log_in">
   <ul>
      <li class="log_out"><a href="logout.mem">로그아웃</a></li>
      <li class="log_out"><a href="mypage.mp">마이페이지</a></li>
    </ul>
  </div>

  <fieldset id = "up_bar">
  <div id="top">
   
    <nav>
    <ul>
      <li><a href="orderAdminList.ora">주문관리</a></li>
      <li><a href="http://daum.net">지도관리</a></li>
      <li><a href="boardList.bo">게시판관리</a></li>
      <li><a href="memberList.cuo">회원관리</a></li>
    </ul>
      </nav>
  </div>
  </fieldset>
<%
	}
	else{
%>
 <div id="log_in">
   <ul>
      <li class="log_out"><a href="memberLoginForm.mem">로그인</a></li>
      <li class="log_out"><a href="memberRegistForm.mem">회원가입</a></li>
    </ul>
  </div>

  <fieldset id = "up_bar">
  <div id="top">
   
    <nav>
    <ul>
      <li><a href="orderList.or">주문하기</a></li>
      <li><a href="http://daum.net">지도보기</a></li>
      <li><a href="boardList.bo">게시판</a></li>
    </ul>
      </nav>
  </div>
  </fieldset>
<%
	}
%>

<%
	}
	else{
%>
<div id="log_in">
   <ul>
      <li class="log_out"><a href="memberLoginForm.mem">로그인</a></li>
      <li class="log_out"><a href="memberRegistForm.mem">회원가입</a></li>
    </ul>
  </div>

  <fieldset id = "up_bar">
  <div id="top">
   
    <nav>
    <ul>
      <li><a href="orderList.or">주문하기</a></li>
      <li><a href="http://daum.net">지도보기</a></li>
      <li><a href="boardList.bo">게시판</a></li>
    </ul>
      </nav>
  </div>
  </fieldset>
<%
	}
%>
    <table id="tr_one">
      <tr>
        <td><img src ="imgs/one.png" width="260" height="260"/></td>
        <td><img src ="imgs/two.png" width="260" height="260"/></td>
        <td><img src ="imgs/three.png" width="260" height="260"/></td>
      </tr>
      <tr>
        <td><img src ="imgs/four.png" width="260" height="260"/></td>
        <td><img src ="imgs/five.png" width="260" height="260"/></td>
        <td><img src ="imgs/six.png" width="260" height="260"/></td>
      </tr>
  </table>
<div class="clear">
	<div id="d_one">
	<img src="imgs/g.jpg" width="150" height="70" style="margin-left:100px;margin-bottom:-30px;"/>
	<table id="ta" >
    	<tr id="g_tr">
        	<td>1</td>
        	<td>2</td>
        	<td>3</td>
        	<td>4</td>
        	<td>5</td>
        </tr>
        <tr>
        	<td>번호</td>
            <td>제목</td>
            <td>작성자</td>
            <td>작성일</td>
            <td>조회수</td>
        </tr>
        
        <tr>
        	<td>번호</td>
            <td>제목</td>
            <td>작성자</td>
            <td>작성일</td>
            <td>조회수</td>
        </tr>
        
        <tr>
        	<td>번호</td>
            <td>제목</td>
            <td>작성자</td>
            <td>작성일</td>
            <td>조회수</td>
        </tr>
        
        <tr>
        	<td>번호</td>
            <td>제목</td>
            <td>작성자</td>
            <td>작성일</td>
            <td>조회수</td>
        </tr>
    </table>
	</div>
	<div id="d_two">
		<img src="http://3.bp.blogspot.com/-2xG6AHCAORU/VX1v_XRLxNI/AAAAAAAAdQ8/1LmwZTAL-V4/s0/%25ED%2582%25A4%25EC%258A%25A4%25EB%258D%25B0%25EC%259D%25B4%25EC%25AD%2588%25EB%25BF%258C%25EC%25AD%2588%25EB%25BF%258C%2B%25282%2529.gif"/>
		<img src ="http://cfile9.uf.tistory.com/image/2575A63453AAC64F299B58"/>
	</div>
</div>
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
</body>
</html>