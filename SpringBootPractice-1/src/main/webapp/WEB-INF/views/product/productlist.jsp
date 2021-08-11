<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.example.practice.customEL.ImgOut"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:url value='/webjars/jquery-ui/jquery-ui.css'/>">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="<c:url value='/webjars/jquery-ui/jquery-ui.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>Product List</title>
</head>
<body>
Hi,<c:out value='${sessionScope.membername}' /> 
&nbsp; &nbsp;
<a href="<c:url value='/cart'/>"><button value="cart">cart</button></a>
&nbsp; &nbsp;
<a href="<c:url value='/logout'/>"><button value="logout">logout</button></a>
<hr>
<div class="row">
	<c:forEach items="${products}" var="product">
	<c:set var="id" value='${product.productid}' />
	<div class="card col" >
	品號:<c:out value='${product.productid}' />
	<br>
	品名:<c:out value='${product.productname }' />
	<br>
	<img src="data:image/jpg;base64,${ImgOut().ImgWrite(product.productpic) }">
	<br>
	<c:choose>
	<c:when test="${productdcps.containsKey(id)}">
	價格:<s><c:out value='${product.productprice}'/></s><b><c:out value='${productdcps.get(id)}'/></b>
	</c:when>
	<c:otherwise>
	價格:<c:out value='${product.productprice}'/>
	</c:otherwise>
	</c:choose>
	<br>
	<c:import url="../cart/quantity_control.jsp"/>
	<br>
	<button value="add to cart">add to cart</button>
	</div>
	</c:forEach>
</div>
</body>
</html>