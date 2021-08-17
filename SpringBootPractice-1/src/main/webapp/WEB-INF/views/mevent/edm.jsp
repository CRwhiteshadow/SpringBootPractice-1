<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.example.practice.customEL.ImgOut" %>
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
<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>">
<title><c:out value='${mevent.meventname}'/></title>
</head>
<body>
<%@include file="../common/nav.jsp" %>

<div style="margin: auto;" align="center">
	<div id="mainpic">
		<img src="data:image/jpg;base64,${ImgOut().ImgWrite(mevent.meventpicture) }" style="object-fit: cover;width:1600px;"/>
	</div>
	<div class="row m-1">
		&nbsp;
	</div>
	<div>
		<c:set var="psize" value="${mevent.marketingEventListBean.get(0).marketingEventProductListBean.size()}"/>
		<c:set value="${mevent.marketingEventListBean.get(0).marketingEventProductListBean }" var="meplbean"/>
		<c:forEach begin="1" end="${psize/4}" step="1" var="i">
			<div class="row  align-items-start border border-success rounded"  style="max-width: 1600px;">
				<c:forEach begin="1" end="4" step="1" var="j">
					<div class="card col">
						<img class="card-img-top" src="data:image/jpg;base64,${ImgOut().ImgWrite(meplbean.get((i-1)*4+(j-1)).product.productpic)}" />					
						<div class="card-body">
							<div class="productname">
								<a href="#"><h6 class="card-title"><c:out value="${meplbean.get((i-1)*4+(j-1)).product.productname}"/></h5></a>							
							</div>
							<div class="p-1" align="left">
								<c:choose>
									<c:when test="${productdcps.containsKey(meplbean.get((i-1)*4+(j-1)).product.productid)}">
										<h4><s>價格:&nbsp;<c:out value='${meplbean.get((i-1)*4+(j-1)).product.productprice}'/></s>&nbsp;<span style="color:#EB7097;">特價:&nbsp;</span><b style="color:#EB7097;font-size:36px;"><c:out value='${productdcps.get(meplbean.get((i-1)*4+(j-1)).product.productid)}'/></b></h4>
									</c:when>
								<c:otherwise>
										<h4>價格:&nbsp;<c:out value='${meplbean.get((i-1)*4+(j-1)).product.productprice}'/></h4>
								</c:otherwise>
								</c:choose>
							</div>
							<div>
								<input type="hidden" id="productid_${(i-1)*4+(j-1)}" value="${meplbean.get((i-1)*4+(j-1)).product.productid}"/>
								<button class="btn btn-primary" value="add to cart" id="tocart_${(i-1)*4+(j-1)}">加入購物車</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="row m-1">
				&nbsp;
			</div>
		</c:forEach>
		


	</div>

</div>

<%@include file="../common/footer.jsp" %>
</body>
<script>
/* 品名切齊高度 */
$(document).ready(function(){
	var h = 0;
	$(".productname").each(function(){
		if($(this).height()>h){
			h = $(this).height();
			}
		});
	$(".productname").css("height", h + "px");
});


/* 加入購物車 */
$(".btn-primary").on("click",function(){
	var qty = 1;
	var pid = $(this).prev("input").val();
	var context =window.location.pathname.split("/")[1];
	var uri = uri="/"+context+"/cart/add/"+pid+"/"+qty;
	$.ajax({
		type:"post",
		url:uri,
		}).done(function(response){
			alert(response);
			});
})
</script>
</html>