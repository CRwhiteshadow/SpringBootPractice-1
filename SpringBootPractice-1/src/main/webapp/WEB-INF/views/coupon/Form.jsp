<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.example.practice.customEL.ImgOut"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/backstage/backstage.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/backstage/backstagecoupon.css"/>
<!-- Bootstrap Table with Search Column Feature -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:url value='/webjars/jquery-ui/jquery-ui.css'/>">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="<c:url value='/webjars/jquery-ui/jquery-ui.js'/>"></script>
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
  <a href="#" id="a_event">線下活動管理</a>
  <a href="#" id="a_forum">論壇管理</a>
  <a href="#" id="a_">認養管理</a>
</div>
<div class="content" align="left">
<div class="container-fluid">
	<div class="table-responsive">
		<div class="table-wrapper">
			<c:if test="${coupon != null }">
			<form method="post" action="<c:url value='/bs/coupon/edit'/>" enctype="multipart/form-data" id="updateform">
			</c:if>
			<c:if test="${coupon == null }">
			<form method="post" action="<c:url value='/bs/coupon/insert'/>" enctype="multipart/form-data">
			</c:if>
				<div class="modal-header">
					<c:if test="${coupon != null }"><h4 class="modal-title">修改折價券設定</h4></c:if>
					<c:if test="${coupon == null }"><h4 class="modal-title">新增折價券</h4></c:if>											
				</div>
				<c:if test="${coupon != null}">
					<input type="hidden" name="id" value="<c:out value='${coupon.id}' />" />
				</c:if>
				<div class="modal-body">					
					<div class="form-group">
						<label>折價券名稱:</label>
						<input type="text" class="form-control" required name="name" id="name" value="<c:out value='${coupon.name}' />">
					</div>
					<div class="form-group">
						<label>折價券面額:</label>
						<input type="number" style="width:100px;" class="form-control" min="1" required name="amount" id="amount" value="<c:out value='${coupon.amount}' />">
					</div>
					<div class="form-group">
						<label>每人限領張數:</label>
						<input type="number" style="width:100px;" class="form-control" min="1" required name="per_limit" id="per_limit" value="<c:out value='${coupon.per_limit}' />">
					</div>
					<div class="form-group">
						<label>使用門檻:</label>
						<br>滿<input type="number" style="width:100px;" class="form-control" min="0" required name="min_point" id="min_point" value="<c:out value='${coupon.min_point}' />">元(輸入0表示不設限制)
					</div>
					<div class="form-group">
						<label>使用類型:</label>
						<c:if test="${coupon != null }">
							<select name="use_type" class="form-control" required style="width:100px;">
								<c:choose>
									<c:when test="${coupon.use_type==0 }">
										<option value="0" selected>通用</option>
									</c:when>
									<c:otherwise>
										<option value="0">通用</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${mevent.meventtypeid==1 }">
										<option value="1" selected>限商品分類</option>
									</c:when>
									<c:otherwise>
										<option value="1">限商品分類</option>
									</c:otherwise>
								</c:choose>
							</select>
						</c:if>
						<c:if test="${coupon == null }">
							<select name="use_type" class="form-control col-sm-3" required>
                        		<option value="0">通用</option>
								<option value="1">限商品分類</option>
							</select>
						</c:if>
					</div>
					<div class="form-group">
						<label>可領取結束時間:</label>
						<c:set var="te" value="${coupon.enable_time }" />
						<input type="date" name="enabledate" class="form-control col-sm-3" required value="${fn:substring(te,0,10) }"><span id="spad"></span><br>
						<input type="time" name="enabletime" step="1" class="form-control col-sm-3" required value="${fn:substring(te,11,-1) }"><span id="spat"></span>
					</div>
					<div class="form-group">
						<label>可使用開始時間:</label>
						<c:set var="ts" value="${coupon.start_time }" />
						<input type="date" name="startdate" class="form-control col-sm-3" required value="${fn:substring(ts,0,10) }"><span id="spsd"></span><br>
						<input type="time" name="starttime" step="1" class="form-control col-sm-3" required value="${fn:substring(ts,11,-1) }"><span id="spst"></span>
					</div>
					<div class="form-group">
						<label>可使用結束時間:</label>
						<c:set var="td" value="${coupon.end_time }" />
						<input type="date" name="enddate" class="form-control col-sm-3" required value="${fn:substring(td,0,10) }"><span id="sped"></span><br>
						<input type="time" name="endtime" step="1" class="form-control col-sm-3" required value="${fn:substring(td,11,-1) }"><span id="spet"></span>
					</div>
                 </div>   
                <div class="modal-footer">
					<a href="<c:url value='/bs/coupon'/>"><input type="button" class="btn btn-default" data-dismiss="modal" value="取消"></a>
					<c:if test="${coupon == null}">
						<input type="submit" class="btn btn-success" value="新增">
					</c:if>
					<c:if test="${coupon != null}">
						<input type="submit" class="btn btn-success" value="修改">
					</c:if>
				</div>
			</form>
		</div>
	</div>
</div>
<script src="<c:url value=''/>"></script>
</div>
<footer>
&copy; 2021 EEIT131 第7組
</footer>
</body>
</html>


 

