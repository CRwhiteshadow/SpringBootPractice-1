<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>會員中心</title>
	<!--stylesheet-->
    <link rel='stylesheet' href="<c:url value='/Member/css/style.css' />" type="text/css" />	
    <!--jQuery-------->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
			integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
			crossorigin="anonymous"></script>
    <!--fav-icon------------------->
    <link rel="shortcut icon" href="${basePath}/EEIT3101/images/Member/fav-icon.ico" />
    <!--using-FontAwesome-for-Icons-->
    <script src="https://kit.fontawesome.com/c8e4d183c2.js" crossorigin="anonymous"></script>
    <style>
        .block {
            width: 1300px;
            height: 400px;
            margin: auto;
            margin-top: 50px;
            display: flex;
            flex-wrap: wrap;
            border-radius: 10px;
            padding-top: 50px;
            padding-left: 50px;
            border: solid 1px rgba(0, 0, 0, 0.3);
        }
        .block:hover {
            box-shadow: 1px 1px 9px rgba(0, 0, 0, 0.3);
        }
        .photoBlock {
            width: 200px;
            height: 250px;
            border: gray 2px solid;
            margin-top: 25px;
        }
        .textBlock {
            width: 900px;
            height: 300px;
            margin-left: 50px;
        }
        .welcome {
            width: 400px;
            height: 60px;
            font-size: 40px;
        }
        .btnBlock {
            border-collapse: collapse;
            margin-left: 100px;
            height: 250px;
            width: 800px;
        }
        td {
            border: solid 1px rgba(0, 0, 0, 0.3);
            margin-top: 300px;
            width: 500px;
            font-size: x-large;
            text-align: center;
            font-weight: bold;
            transition: 1s;
        }
        td a {
            color: #467e14;
        }
        td:hover {
            background-color: #73b43a;
        }
        .picview{
     		height:246px; 
    		width:196px;
		}
    </style>
    <script>
        function dataToWhite() {
            var data = document.getElementById("data");
            data.style.color = "white";
        }
        function dataBackColor() {
            var data = document.getElementById("data");
            data.style.color = "#467e14";
        }

        function pwdToWhite() {
            var pwd = document.getElementById("pwd");
            pwd.style.color = "white";
        }
        function pwdBackColor() {
            var pwd = document.getElementById("pwd");
            pwd.style.color = "#467e14";
        }


        function orderToWhite() {
            var order = document.getElementById("order");
            order.style.color = "white";
        }
        function orderBackColor() {
            var order = document.getElementById("order");
            order.style.color = "#467e14";
        }

        function wishToWhite() {
            var wish = document.getElementById("wish");
            wish.style.color = "white";
        }
        function wishBackColor() {
            var wish = document.getElementById("wish");
            wish.style.color = "#467e14";
        }

        function historyToWhite() {
            var history = document.getElementById("history");
            history.style.color = "white";
        }
        function historyBackColor() {
            var history = document.getElementById("history");
            history.style.color = "#467e14";
        }

        function sendToWhite() {
            var send = document.getElementById("send");
            send.style.color = "white";
        }
        function sendBackColor() {
            var send = document.getElementById("send");
            send.style.color = "#467e14";
        }
    </script>
</head>
<body background="<c:url value='/Member/images/petBackground.jpg' />" style="background-repeat:no-repeat;">
<%@include file="../common/nav.jsp" %>

    <!--------------------Center-List------------------------>

    <div class="block">

        <div class="photoBlock">
            <img class="picview" src="${pageContext.request.contextPath}/showPhoto/display/${member.memberid}" onerror="nofind()" />
        </div>
        <div class="textBlock">
            <div class="welcome">
                <span>歡迎回來　${member.fullname}</span>
            </div>
            <table class="btnBlock" frame=void>
                <tr>
                    <td onmousemove="dataToWhite()" onmouseout="dataBackColor()"><a id="data" href="<c:url value='/lock/MemberEdit'/>">修改會員資料</a></td>
                    <td onmousemove="pwdToWhite()" onmouseout="pwdBackColor()"><a id="pwd" href="<c:url value='/lock/MemberPwdEdit'/>">變更密碼</a></td>
                    <td onmousemove="orderToWhite()" onmouseout="orderBackColor()"><a id="order" href="<c:url value='/lock/MemberOrder'/>">訂單查詢</a></td>
                </tr>
                <tr>
                    <td onmousemove="wishToWhite()" onmouseout="wishBackColor()"><a id="wish" href="<c:url value='/lock/MemberWish'/>">我的收藏</a></td>
                    <td onmousemove="historyToWhite()" onmouseout="historyBackColor()" onclick="toChar()"><a id="history" href="">談天說地</a></td>
                    <td onmousemove="sendToWhite()" onmouseout="sendBackColor()"><a id="send" href="<c:url value='/lock/MemberAdress'/>">常用配送</a></td>
                </tr>
            </table>
        </div>
    </div>
    
    <!--script-------->
    <script type="text/javascript">

    	function nofind(){
    	  	var img=event.srcElement;
    	  	img.src="<c:url value='/Member/images/NoPhoto.jpg' />"; //替換的圖片
    	  	img.onerror=null; //控制不要一直觸發錯誤
    	}

		function toChar(){
			window.open("<c:url value='/Chat'/>", '_blank', 'toolbar=0,location=0,menubar=0');
		}
        

    </script>
</body>
</html>