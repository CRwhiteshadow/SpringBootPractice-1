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
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item active">
              <a class="nav-link" href="#"
                >Home <span class="sr-only">(current)</span></a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Features</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Pricing</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#">Disabled</a>
            </li>
          </ul>
			Hi,<c:out value='${sessionScope.membername}' /> 
&nbsp; &nbsp;
<a href="<c:url value='/cart'/>"><button value="cart">cart</button></a>
&nbsp; &nbsp;
<a href="<c:url value='/logout'/>"><button value="logout">logout</button></a>
          <form class="form-inline">
            <input
              class="form-control mr-sm-2"
              type="search"
              placeholder="Search"
              aria-label="Search"
            />
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
              Search
            </button>
          </form>
        </div>
      </nav>
      <c:choose>
      <c:when test='${cartItems.size()==0}'>
      目前購物車內沒有商品
      </c:when>
      <c:otherwise>
      
      <!-- 商品列 -->
      <div class="row m-1 ">
        <!-- 九格分給商品陳列 -->
        <div class="col-sm-9">
         <!-- 商品的那一列 迴圈-->
         <c:forEach items="${cartItems}" var="cartItem" varStatus="i">
          <div class="row border rounder p-1 align-items-center">
            <!-- 商品項次的1格 -->      
            <div class="col-sm-1">
              <c:out value='${i.count}'/>
              <div>
                  <a class="" href=""><i class="fa fa-trash fa-1x" aria-hidden="true"></i></a>
              </div>
<!--               <span>垃圾桶</span> -->
            </div>
            <!-- 圖片那一欄佔兩格 -->
            <div class="col-sm-3">
<!--               <span>圖片</span> -->
              <img class="product" src="data:image/jpg;base64,${ImgOut().ImgWrite(cartItem.product.productpic)}" alt="商品圖片" / >
            </div>
            <!-- 商品占六格 -->
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
              <div>商品小計
              <span id="subtotal_${i.count}">
              <c:choose>
              	<c:when test="${productdcps.containsKey(cartItem.product.productid)}">
             		 <c:out value="${productdcps.get(cartItem.product.productid) * cartItem.quantity}"/>
             	</c:when>
             	<c:otherwise>
             		 <c:out value="${cartItem.product.productprice * cartItem.quantity}"/>
              	</c:otherwise>
              </c:choose>
              </span></div>
              <div class="row m-1">
              &nbsp;
              </div>
              
            </div>
<!--             <div class="col-sm-1"></div> -->
            <div class="col-sm-2">
              <div class="input-group mb-3 ">
                  <div class="input-group-prepend">
                      <button class="btn btn-dark btn-sm" id="minus-btn_${i.count}"><i class="fa fa-minus"></i></button>
                  </div>
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
                  <span class="h3"> 結帳金額</span>
              </div> 
      <!--整個商品結束在這  -->
      </div>

      </div>
      </c:otherwise>
      </c:choose>
</body>
<script>
  $(document).ready(function(){
    $('.btn-dark').click(function(){
        var id = $(this).prop("id");
        var type = id.split("_")[0];
        var index = id.split("_")[1];
        var price = parseInt($("#price"+index).text());
        var qty = parseInt($("#qty_input_"+index).val());
        var subtotal;
		if(type==="plus-btn"){
			qty=qty+1;
			subtotal = price * qty;
    		$('#qty_input_'+index).val(qty);
    		$("#subtotal_"+index).empty().append(subtotal);    	
    	}else{
        	qty=qty-1;
        	if(qty==0){qty=1;}
        	subtotal = price * qty;
    		$('#qty_input_'+index).val(qty);
    		$("#subtotal_"+index).empty().append(subtotal);   
    	}});
 });
</script>
</html>