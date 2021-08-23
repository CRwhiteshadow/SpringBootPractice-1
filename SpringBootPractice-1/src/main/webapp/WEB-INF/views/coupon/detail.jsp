<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.example.practice.customEL.ImgOut"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/backstage/backstage.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/backstage/backstagemevent.css"/>
<!-- Bootstrap Table with Search Column Feature -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>BackStage</title>
</head>
<body>
<div class="sidenav">
  <a href="#" id="a_emp">員工管理</a>
  <a href="#" id="a_member">會員管理</a>
  <a href="#" id="a_product">商品管理</a>
  <a href="<c:url value='/mevent'/>" id="a_mevent">線上行銷活動管理</a>
  <a href="<c:url value='//bs/coupon'/>" id="a_coupon">折價券管理</a>
  <a href="#" id="a_event">線下活動管理</a>
  <a href="#" id="a_forum">論壇管理</a>
  <a href="#" id="a_">認養管理</a>
</div>
<div class="content" align="center">
  <div class="container-fluid">
        <div class="table-responsive">
            <div class="table-wrapper">			
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><b>折價券詳細</b></h2>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
						    <th>折價券ID</th>
                            <th>折價券名稱</th>
					    	<th>折價券面額</th>
					    	<th>可領取結束時間</th>
					    	<th>可使用開始時間</th>
					    	<th>可使用結束時間</th>
						    <th>使用類型</th>
						    <th>每人限領張數</th>
						    <th>使用門檻</th>
						    <th>發行數量</th>
						    <th>領取數量</th>
						    <th>使用數量</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
						    <td><c:out value="${coupon.id}" /></td>
                            <td><c:out value="${coupon.name}" /></td>
						    <td><c:out value="${coupon.amount}" /></td>
						    <td><fmt:formatDate value="${coupon.enable_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						    <td><fmt:formatDate value="${coupon.start_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						    <td><fmt:formatDate value="${coupon.end_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					    	<td>
					    		<c:if test="${coupon.use_type==0}">
					    			通用
					    		</c:if>
					    		<c:if test="${coupon.use_type==1}">
					    			限商品分類
					    		</c:if>
					    	</td>
					    	<td><c:out value="${coupon.per_limit}" /></td>
					    	<td>
					    		<c:choose>
					    			<c:when test="${coupon.min_point==0}">
					    				不限制
					    			</c:when>
					    			<c:otherwise>
					    				滿<c:out value="${coupon.min_point}" />元
					    			</c:otherwise>
					    		</c:choose>
					    	</td>
					    	<td><c:out value="${coupon.publish_count}" /></td>
					    	<td><c:out value="${coupon.receive_count}" /></td>
					    	<td><c:out value="${coupon.use_count}" /></td>
                        </tr>  
                    </tbody>
                </table>
                <hr>
                 <table class="table table-striped table-hover">
                    <thead>
                        <tr>
						    <th>No.</th>
						    <th>序號</th>
                            <th>建立時間</th>
					    	<th>歸戶使用者id</th>
					    	<th>獲取類型</th>
					    	<th>使用狀態</th>
					    	<th>使用時間</th>
						    <th>訂單編號</th>
						    <th>訂單金額(未含運)</th>
						    <th>訂單商品成本</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach  items="${couponDetails}" var="couponDetail" varStatus="i">
                    		<tr>
                    			<td>${i.count}</td>
                    			<td><c:out value="${couponDetail.code}"/></td>
                    			<td><fmt:formatDate value="${couponDetail.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    			<td><c:out value="${couponDetail.member.memberid}"/></td>
                    			<td>
                    				<c:choose>
                    					<c:when test="${couponDetail.get_type==0}">
                    						後台發放
                    					</c:when>
                    					<c:otherwise>
                    						主動獲取
                    					</c:otherwise>
                    				</c:choose>                   			
                    			</td>
                    			<td>
                    				<c:if test="${couponDetail.use_status==0}">
                    					未使用
                    				</c:if>
                    				<c:if test="${couponDetail.use_status==1}">
                    					已使用
                    				</c:if>
                    				<c:if test="${couponDetail.use_status==2}">
                    					已過期
                    				</c:if>
                    			</td>
                    			<td>
                    				<c:choose>
                    					<c:when test="${couponDetail.use_time==null}">
                    					</c:when>
                    					<c:otherwise>
                    						<fmt:formatDate value="${couponDetail.use_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    					</c:otherwise>
                    				</c:choose>
                    			</td>
                    			<td>
                    				<c:choose>
                    					<c:when test="${couponDetail.order==null}">
                    					</c:when>
                    					<c:otherwise>
                    						<c:out value="${couponDetail.order.id}"/>
                    					</c:otherwise>
                    				</c:choose>
                    			</td>
                    			<td>
                   					<c:choose>
                    					<c:when test="${couponDetail.order==null}">
                    					</c:when>
                    					<c:otherwise>                    			
                    						<c:out value="${couponDetail.order.subtotal}"/>
                     					</c:otherwise>
                    				</c:choose>                   			
                    			</td>
                    			<td>
                   					<c:choose>
                    					<c:when test="${couponDetail.order==null}">
                    					</c:when>
                    					<c:otherwise>                                  			
                    						<c:out value="${couponDetail.order.productCost}"/>
                     					</c:otherwise>
                    				</c:choose>                              			
                    			</td>
                    		</tr>
                    	</c:forEach>
                    </tbody>
                  </table>
                <div class="clearfix">
<!--                            <ul class="pagination">
					        <li class="page-item disabled"><a href="#">Previous</a></li>
					        <li class="page-item active"><a href="#" class="page-link">1</a></li>
					        <li class="page-item"><a href="#" class="page-link">2</a></li>
				    	    <li class="page-item"><a href="#" class="page-link">3</a></li>
					        <li class="page-item"><a href="#" class="page-link">4</a></li>
					        <li class="page-item"><a href="#" class="page-link">5</a></li>
				    	    <li class="page-item"><a href="#" class="page-link">Next</a></li>
				            </ul>
-->				            
<a class="btn btn-success" style="color:white;" href="<c:url value='/bs/coupon'/>">返回</a>
			    </div>
            </div>
        </div>        
    </div>     
</div>

<footer>
&copy; 2021 EEIT131 第7組
</footer>

</body>
</html>


 

