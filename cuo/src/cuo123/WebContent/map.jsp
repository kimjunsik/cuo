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

	}
	#margin{
	margin-left: 10%;
		width : 100%;
		height : 100%;
		border : 1px double white;
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


        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->

 <section id = "margin">
      <script type="text/javascript"
   src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=AIzaSyCUjjqNA0i5i2r_Us1U2_xgzu9GGZ0xcL8"></script>
      
   <div id="testMap"
      style="border: 1px solid #000; width: 50%; height: 50%; margin: 10%;"></div>

   <script type="text/javascript">
      var oPoint = new nhn.api.map.LatLng(35.9111792, 128.80772100000002);
      var oPoint2 = new nhn.api.map.LatLng(35.908338, 128.811645);
      var oPoint3 = new nhn.api.map.LatLng(35.910549, 128.816728);
      var oPoint4 = new nhn.api.map.LatLng(35.909567, 128.813258);
               
      nhn.api.map.setDefaultPoint('LatLng');
      oMap = new nhn.api.map.Map('testMap', {
         center : oPoint,
         level : 11, // - 초기 줌 레벨은 10이다.
         enableWheelZoom : true,
         enableDragPan : true,
         mapMode : 0,
         minMaxLevel : [ 1, 14 ],
         size : new nhn.api.map.Size(800,500)
      });
      var mapZoom = new nhn.api.map.ZoomControl(); // - 줌 컨트롤 선언
      mapZoom.setPosition({
         left : 20,
         bottom : 20
      }); // - 줌 컨트롤 위치 지정.
      oMap.addControl(mapZoom); // - 줌 컨트롤 추가.

      var oSize = new nhn.api.map.Size(28, 37);
      var oOffset = new nhn.api.map.Size(14, 37);
      var oIcon = new nhn.api.map.Icon(
            'http://static.naver.com/maps2/icons/pin_spot2.png', oSize,
            oOffset);
      var oIcon2 = new nhn.api.map.Icon(
            'http://static.naver.com/maps2/icons/pin_spot2.png', oSize,
            oOffset);
      var oIcon3 = new nhn.api.map.Icon(
            'http://static.naver.com/maps2/icons/pin_spot2.png', oSize,
            oOffset);
      var oIcon4 = new nhn.api.map.Icon(
            'http://static.naver.com/maps2/icons/pin_spot2.png', oSize,
            oOffset);
      // - Draggable Marker 의 경우 Icon 인자는 Sprite Icon이 된다.
      // - 따라서 Sprite Icon 을 사용하기 위해 기본적으로 사용되는 값을 지정한다.
      // - Sprite Icon 을 사용하기 위해서 상세한 내용은 레퍼런스 페이지의 nhn.api.map.SpriteIcon 객체를 참조하면 된다.

      var oMarker1 = new nhn.api.map.Marker(oIcon, {
         title : '대구 가톨릭 대학교'
      }); //마커 생성 
      oMarker1.setPoint(oPoint); //마커 표시할 좌표 선택
      oMap.addOverlay(oMarker1); //마커를 지도위에 표현 
      var oLabel1 = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언. 
      oMap.addOverlay(oLabel1); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨. 
      oLabel1.setVisible(true, oMarker1); // 마커 라벨 보이기 
      
      
      var oMarker2 = new nhn.api.map.Marker(oIcon2, {
         title : '음식점1'
      }); //마커 생성 
      oMarker2.setPoint(oPoint2); //마커 표시할 좌표 선택
      oMap.addOverlay(oMarker2); //마커를 지도위에 표현 
      var oLabel2 = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언. 
      oMap.addOverlay(oLabel2); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨. 
      oLabel2.setVisible(true, oMarker2); // 마커 라벨 보이기 
      
      var oMarker3 = new nhn.api.map.Marker(oIcon3, {
         title : '음식점2'
      }); //마커 생성 
      oMarker3.setPoint(oPoint3); //마커 표시할 좌표 선택
      oMap.addOverlay(oMarker3); //마커를 지도위에 표현 
      var oLabel3 = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언. 
      oMap.addOverlay(oLabel3); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨. 
      oLabel3.setVisible(true, oMarker3); // 마커 라벨 보이기 
      
      var oMarker4 = new nhn.api.map.Marker(oIcon4, {
         title : '음식점3'
      }); //마커 생성 
      oMarker4.setPoint(oPoint4); //마커 표시할 좌표 선택
      oMap.addOverlay(oMarker4); //마커를 지도위에 표현 
      var oLabel4 = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언. 
      oMap.addOverlay(oLabel4); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨. 
      oLabel4.setVisible(true, oMarker4); // 마커 라벨 보이기 
   </script>
   </section>
        <!-- /#page-content-wrapper -->

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
