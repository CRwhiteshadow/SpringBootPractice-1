<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>Checkout</title>
</head>
<body>
<div class="container custom-container-width">
<%@include file="../common/nav.jsp" %>
      <div class="row m-1 ">
      	<div class="col-sm-7">
      		<div class="card">
      			<div class="card-header"><h5>收件資訊</h5></div>
      			<div class="card-body">
      				<p>
      					<b>收件人:&nbsp;<c:out value='${postName}'/></b>
      				</p>
      				<p>
      					<b>連絡電話:&nbsp;<c:out value='${postMobile}'/></b>
      				</p>
      				<p>
      					<b>收件地址:&nbsp;<c:out value='${postAddress}'/></b>
      				</p>
      				<a href="<c:url value='/member/MemberAdress?redirect=checkout'/>">更改收件地址</a>
      			</div>
      		</div>
      		<div class="card">
      			<div class="card-header"><h5>配送資訊</h5></div>
      			<div class="card-body">
      				<p>
      					<b>配送日程:&nbsp;預計<c:out value='${checkoutInfo.deliverDays}'/>天</b>
      				</p>
      				<p>
      					<c:set var="date" value='${checkoutInfo.deliverDate}'/>
      					<b>送達日:&nbsp;預計為<fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/></b>
      				</p>
      			</div>
      		</div>
      		<form method="post" action="<c:url value='/place_order'/>">
      		<c:if test="${couponDetails.size()!=0 }">
      		<div class="card">
      			<div class="card-header"><h5>折價券選擇</h5></div>
      			<div class="card-body">
      				<c:forEach items="${couponDetails }" var="couponDetail" varStatus="i">
					<c:if test="${checkoutInfo.productTotal > couponDetail.coupon.min_point}">
      				<div class="row border">
      					<div class="col-sm-1">
      						<input type="radio" name="coupon" value="${couponDetail.id }" id="row_${i.count }">
      					</div>
      					<div class="col-sm-11">
      						<p>
      							<b>券號:&nbsp;<c:out value='${couponDetail.code}'/></b>
      							<b>面額:&nbsp;<span id="coupon_amount_${i.count }"><c:out value='${couponDetail.coupon.amount}'/></span>元</b>
      							<b>
      								<c:if test="${couponDetail.coupon.min_point==0}">
      									使用條件:&nbsp;無特別限制
      								</c:if>
      								<c:if test="${couponDetail.coupon.min_point!=0}">
      									使用條件:&nbsp;滿<c:out value='${couponDetail.coupon.min_point}'/>元
      								</c:if>
      							</b>
      						</p>
      					</div>
      				</div>
      				</c:if>
      				</c:forEach>
      				<div class="row border">
      					<div class="col-sm-1">
      						<input type="radio" name="coupon" value="0">
      					</div>
      					<div class="col-sm-11">
      						<p>
      							<b>不使用折價券</b>
      						</p>
      					</div>
      				</div>
      			</div>
      		</div>
      		</c:if>
      		<div class="card mt-3 mb-3">
      			<div class="card-header"><h5>付款方式</h5></div>
      			<div class="card-body">
      				<p>
      				
      					<input type="radio" name="paymentway" value="COD">貨到付款
      					&nbsp;
      					<input type="radio" name="paymentway" value="Card">信用卡
      					&nbsp;
      					<input type="radio" name="paymentway" value="Paypal">Paypal
      					&nbsp;&nbsp;
      					<button type="submit" class="button btn btn-success d-none" id="confirmBtn">確認訂購</button>
      				</form>
      				</p>
      			</div>
      		</div>
      	</div>
      	<div class="col-sm-5">
      		<div class="card">
      			<div class="card-header"><h5>訂單摘要</h5></div>
      			<div class="card-body">
      				<table>
      					<c:forEach items='${cartItems}' var="item" varStatus="i">
      						<tr>
      							<td><c:out value="${item.quantity}"/>&nbsp;x&nbsp;&nbsp;</td>
      							<td width="70%">
      								<a href=""><c:out value='${item.product.productname}'/></a>
      							</td>
      							<td>
      								<div>
      									NT$
      										<span>	
      											<c:choose>
      												<c:when test="${productdcps.containsKey(item.product.productid)}">
      													<c:out value="${productdcps.get(item.product.productid) * item.quantity}"/>
       									        	</c:when>
              										<c:otherwise>
             		  									<c:out value="${item.product.productprice * item.quantity}"/>
              										</c:otherwise>							
      											</c:choose>
      										</span>
      								</div>
      							</td>
      						</tr>
      					</c:forEach>
      					<tr>      						
      						<td colspan="3"><hr></td>
      					</tr>
      				</table>
      			</div>
      			<div class="row mt-2">
      				<div class="col" align="right">商品合計:</div>
      				<div class="col">NT$<c:out value='${checkoutInfo.productTotal}'/></div>
      			</div>
      			<div class="row mt-2">
      				<div class="col" align="right">運費:</div>
      				<div class="col">NT$<c:out value='${checkoutInfo.shippingCostTotal}'/></div>
      			</div>
      			<div class="row mt-2 d-none" id="coupon_use_div">
      				<div class="col" align="right">折價券:</div>
      				<div class="col" style="color: red;">-NT$<span id="coupon_use"></span></div>
      			</div>
      			<div class="row mt-2">
      				<div class="col" align="right">付款總計:</div>
      				<div class="col"><b>NT$<span id="paymentTotal"><c:out value='${checkoutInfo.paymentTotal}'/></span></b></div>
      			</div>
      		</div>
      	</div>
      </div>
<script>
$(document).ready(function(){
	$("input[type='radio'][name='paymentway']").on("click",function(){
		$("#confirmBtn").removeClass("d-none");
		});

	$("input[type='radio'][name='coupon']").on("click",function(){
		var couponid=$(this).val();
		var paymentTotal=parseInt($("#paymentTotal").text());
		var coupon_use=parseInt($("#coupon_use").text());
		if(couponid==0){
			if(!coupon_use){
				}else{
					paymentTotal=paymentTotal+coupon_use;
					$("#coupon_use").empty();
				}			
			$("#coupon_use_div").addClass("d-none");
			$("#paymentTotal").empty().text(paymentTotal);
			}else {
				var rowno=$(this).attr("id").split("_")[1];
				var couponamount=parseInt($("#coupon_amount_"+rowno).text());
				if(!coupon_use){
					paymentTotal=paymentTotal-couponamount;
				}else{
					paymentTotal=paymentTotal+coupon_use-couponamount;
				}				
				$("#coupon_use_div").removeClass("d-none");
				$("#coupon_use").empty().text(couponamount);
				$("#paymentTotal").empty().text(paymentTotal);
			}
				
		});
});
</script>     
</body>
</html>