<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Contact with Map Template | PrepBootstrap</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<script>
	function winOpen(){
		//자바스크립트는 화면을 제어할 수 있는 수많은 내장 객체들을 제공하고 각 내장 객체들은 속성과 메소드가 제공된다.
		//alert(document.forms[0].id.value);
		window.open("idCheck?id=" + document.forms[0].id.value, "window1","width=300,height=300");
	}
</script>
<style>
.col-md-6{
margin-left:270px;
}
</style>
<body>

<div class="container">

<div class="page-header">

</div>

<!-- Contact with Map - START -->
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="well well-sm">
                <form class="form-horizontal" action="memberRegistPro.mem" method="post">
                    <fieldset>
                        <legend class="text-center header">회원가입</legend>
                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                <input id="id" name="id" type="text" placeholder="id" class="form-control">
								<input type = "button" value = "아이디중복체크" onClick = "winOpen()"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                <input id="name" name="name" type="text" placeholder="name" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                <input id="passwd" name="passwd" type="password" placeholder="password" class="form-control">

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                <input id="addr" name="addr" type="text" placeholder="address" class="form-control">
                            </div>
                        </div>

 			<div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                <input id="birthday" name="birthday" type="date" placeholder="birthday" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                
			등급 : <select id = "grade" name = "grade">
			<option>주문자</option>
			<option>음식점</option>
			</select>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12 text-center">
                                <button type="submit" class="btn btn-primary btn-lg">회원가입</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>

<style>
    .header {
        background-color: #F5F5F5;
        color: #36A0FF;
        height: 70px;
        font-size: 27px;
        padding: 10px;
    }
</style>

<!-- Contact with Map - END -->

</div>

</body>
</html>