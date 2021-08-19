<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<form method="post" action="<c:url value='/Login'/>">
email:<input type="text" name="loginEmail" />
password:<input type="password" name="password" />
<button type="submit" value="submit">submit</button>
</form>
</body>
</html>