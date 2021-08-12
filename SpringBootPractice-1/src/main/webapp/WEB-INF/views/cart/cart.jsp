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
<!-- Bootstrap jQuery font-awesome-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<style>
    .product{
      max-width: 200px;
    }
    
.container.custom-container-width {
    max-width: 1500px;      
}

  </style>
<title>Your Cart</title>
</head>
<body>
<div class="container custom-container-width">
<%@include file="../common/nav.jsp" %>
<c:choose>
  <c:when test='${cartItems.size()==0}'>
    <div style="margin: auto" align="center">
      <span class="h4">
                  目前購物車內沒有商品
      </span>
    </div>
  </c:when>
  <c:otherwise>     
    <!-- 商品列 -->
    <div class="row m-1 ">
      <!-- 九格分給商品陳列 -->
      <div class="col-sm-9">
        <!-- 商品的那一列 迴圈-->
        <c:forEach items="${cartItems}" var="cartItem" varStatus="i">
          <div class="row border rounder p-1 align-items-center" id="row${i.count}">
            <!-- 商品項次的1格 -->      
            <div class="col-sm-1">
              <span class="itemnum"><c:out value='${i.count}'/></span>
              <div>
                <!-- <span>垃圾桶</span> -->
                <a class="linkRemove" href="<c:url value='/cart/delete/${cartItem.product.productid}'/>" rownum="${i.count}"><i class="fa fa-trash fa-1x" aria-hidden="true"></i></a>
              </div>
            </div>
            <!-- 圖片那一欄佔3格 -->
            <div class="col-sm-3">
              <!-- <span>圖片</span> -->
              <img class="product" src="data:image/jpg;base64,${ImgOut().ImgWrite(cartItem.product.productpic)}" alt="商品圖片" />
            </div>
            <!-- 商品占6格 -->
            <div class="col-sm-6">
              <div>
                <a href="#"><b><c:out value='${cartItem.product.productname}'/></b></a>
              </div>
              <div class="row m-1">
                &nbsp;
              </div>
              <div class="row m-1">
                &nbsp;
              </div>
              <div class="row m-1">
                &nbsp;
              </div>
            <div>
              <c:choose>
				       <c:when test="${productdcps.containsKey(cartItem.product.productid)}">
             	    <span style="color:#EB7097">特價</span><span style="color:#EB7097" id="price${i.count}"><c:out value='${productdcps.get(cartItem.product.productid)}'/></span>
              	</c:when>
               	<c:otherwise>
            	    價格<span id="price${i.count}"><c:out value='${cartItem.product.productprice}'/></span>
              	</c:otherwise>
              </c:choose>
            </div>
            <div>
              商品小計
              <span id="subtotal_${i.count}" class="subtotal">
              <c:choose>
              	<c:when test="${productdcps.containsKey(cartItem.product.productid)}">
             		  <c:out value="${productdcps.get(cartItem.product.productid) * cartItem.quantity}"/>
             	  </c:when>
              	<c:otherwise>
             		  <c:out value="${cartItem.product.productprice * cartItem.quantity}"/>
              	</c:otherwise>
              </c:choose>
              </span>
            </div>
            <div class="row m-1">
              &nbsp;
            </div>
          </div>
          <div class="col-sm-2">
            <div class="input-group mb-3 ">
              <div class="input-group-prepend">
                <button class="btn btn-dark btn-sm" id="minus-btn_${i.count}"><i class="fa fa-minus"></i></button>
              </div>
                <input type="hidden" id="productid_${i.count}" value="<c:out value='${cartItem.product.productid}'/>"/>
                <input type="text" id="qty_input_${i.count}" onkeydown="return false;" class="form-control form-control-sm" value="<c:out value='${cartItem.quantity}'/>" min="1">
              <div class="input-group-prepend">
                <button class="btn btn-dark btn-sm" id="plus-btn_${i.count}"><i class="fa fa-plus"></i></button>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
        <!-- 迴圈商品結束 -->
        </div>   
        <div class="col-sm-3  border rounder justify-content-right">
          <div style="margin: auto" align="center">
            <span class="h3"> 結帳金額</span>
          </div>
          <div class="mt-2" style="margin: auto" align="center">
            <span class="h2">NT$</span><span class="h2" id="eTotal"></span>
          </div>
          <div class="mt-2 p-3" style="margin: auto" align="center">
          	<form action="<c:url value='/checkout'/>" method="get">
            	<button type="submit" class="btn btn-danger">結帳</button>
            </form>
          </div>
        </div> 
        <!--整個商品結束在這  -->
      </div>
    </div>
  </c:otherwise>
</c:choose>
</body>
<script>
  $(document).ready(function(){
	eTotal();
    $('.btn-dark').click(function(){
        var id = $(this).prop("id");
        var type = id.split("_")[0];
        var index = id.split("_")[1];
        var productid = $("#productid_"+index).val();
        var price = parseInt($("#price"+index).text());
        var qty = parseInt($("#qty_input_"+index).val());
        var subtotal;
		if(type==="plus-btn"){
			qty=qty+1;
			subtotal = price * qty;
    		$('#qty_input_'+index).val(qty);
    		$("#subtotal_"+index).empty().append(subtotal);
    		eTotal();
    		updateQuantity(productid,qty);   	
    	}else{
        	qty=qty-1;
        	if(qty==0){qty=1;}
        	subtotal = price * qty;
    		$('#qty_input_'+index).val(qty);
    		$("#subtotal_"+index).empty().append(subtotal); 
    		eTotal(); 
    		updateQuantity(productid,qty);  
    	}});
	$(".linkRemove").on("click",function(e){
		e.preventDefault();
		var rownum=$(this).attr("rownum");
		var url=$(this).attr("href");
		deleteProduct(url);
		$("#row"+rownum).remove();
		if($(".itemnum").length==0){
			var str='<div style="margin: auto" align="center"><span class="h4">目前購物車內沒有商品</span></div>';
			$(".justify-content-right").remove();
			$("nav").after(str);
			}else{
			$(".itemnum").each(function(i){
				$(this).text(i+1);
				});
			eTotal();
		}});
 });
function eTotal(){
	var etotal=0;
	$(".subtotal").each(function(i){
		var val=parseInt($(this).text());
		etotal=etotal+val;
		});
	$("#eTotal").empty().append(etotal);
}
function updateQuantity(productid,quantity){
	var context =window.location.pathname.split("/")[1];
	var uri="/"+context+"/cart/update/"+productid+"/"+quantity;
	$.ajax({
		type:"post",
		url:uri,
		}).done(function(){
			console.log("success");
			}).fail(function(){
				console.log("fail");});
}
function deleteProduct(url){
	var uri = url;
	$.ajax({
		type:"delete",
		url:uri,
		}).done(function(){
			console.log("success");
			}).fail(function(){
				console.log("fail");});
}
</script>
</html>