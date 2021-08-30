<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--fav-icon------------------->
<link rel="shortcut icon" href="images/fav-icon.ico" />
<!--using-FontAwesome-for-Icons-->
<script src="https://kit.fontawesome.com/c8e4d183c2.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- jQuery -->
<script src="<c:url value='/webjars/jquery/jquery.min.js'/>"></script>
<!-- Bootstrap -->
<link rel="stylesheet" href="<c:url value='/webjars/bootstrap/css/bootstrap.min.css'/>">
<script src="<c:url value='/webjars/bootstrap/js/bootstrap.min.js'/>"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!--stylesheet-->
<link rel='stylesheet' href="<c:url value='/Member/css/style.css' />" type="text/css" />
<title>Sorry, something wrong</title>
</head>
<body onload="reciprocal()">
<%@include file="../common/nav.jsp" %>
<div style="margin: auto" align="center">
      <span class="h4">
      <c:choose>
      <c:when test="${errormsg!=null}">
      <c:out value="${errormsg}"/>
      </c:when>
      <c:otherwise>
                  抱歉沒有這個頁面
      </c:otherwise>
      </c:choose>
       </span></br>
    <span id="showtime"></span> 秒後刷新頁面…
    </div>
    <div class="clickBolck">如未自動跳轉，請點選<a href="<c:url value='/index'/>">此處</a></div>
    <div style="text-align:center;">
        <img src="<c:url value='/Member/images/Loading.GIF' />">
    </div>
    </div>

<%@include file="../common/footer.jsp" %>
<script>
        var s = 3;

        function reciprocal() {
            if(s == 0){
			location.href="<c:url value='/index'/>";
		    }
            document.getElementById("showtime").innerHTML = s;
            setTimeout(reciprocal, 1000);
            s -= 1;
        }
</script>
</body>
</html>