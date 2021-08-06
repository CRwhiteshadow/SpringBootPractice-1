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
  <a href="#" id="a_event">線下活動管理</a>
  <a href="#" id="a_forum">論壇管理</a>
  <a href="#" id="a_">認養管理</a>
</div>
<div class="content" align="left">
<div class="container-fluid">
	<div class="table-responsive">
		<div class="table-wrapper">
			<c:if test="${mevent != null }">
			<form method="post" action="<c:url value='/mevent/edit'/>" enctype="multipart/form-data" id="updateform">
			</c:if>
			<c:if test="${mevent == null }">
			<form method="post" action="<c:url value='/mevent/insert'/>" enctype="multipart/form-data">
			</c:if>
				<div class="modal-header">
					<c:if test="${mevent != null }"><h4 class="modal-title">修改活動設定</h4></c:if>
					<c:if test="${mevent == null }"><h4 class="modal-title">新增活動</h4></c:if>											
				</div>
				<c:if test="${mevent != null}">
					<input type="hidden" name="id" value="<c:out value='${mevent.meventid}' />" />
				</c:if>
				<c:if test="${mevent != null}">
					<input type="hidden" name="title" value="<c:out value='${mevent.meventtitle}' />" />
				</c:if>
				<div class="modal-body">					
					<div class="form-group">
						<label>活動名稱:</label>
						<input type="text" class="form-control" required name="name" id="name" value="<c:out value='${mevent.meventname}' />">
					</div>
					<div class="form-group">
						<label>活動類型:</label>
						<c:if test="${mevent != null }">
							<select name="typeid" class="form-control" required>
								<c:choose>
									<c:when test="${mevent.meventtypeid==1 }">
										<option value="1" selected>會員招募活動</option>
									</c:when>
									<c:otherwise>
										<option value="1">會員招募活動</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${mevent.meventtypeid==2 }">
										<option value="2" selected>商品促銷活動</option>
									</c:when>
									<c:otherwise>
										<option value="2">商品促銷活動</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${mevent.meventtypeid==3 }">
										<option value="3" selected>限時搶購活動</option>
									</c:when>
									<c:otherwise>
										<option value="3">限時搶購活動</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${mevent.meventtypeid==4 }">
										<option value="4" selected>滿額登記抽獎</option>
									</c:when>
									<c:otherwise>
										<option value="4">滿額登記抽獎</option>
									</c:otherwise>
								</c:choose>
							</select>
						</c:if>
						<c:if test="${mevent == null }">
							<select name="typeid" class="form-control col-sm-3" required>
                        		<option value="1">會員招募活動</option>
								<option value="2">商品促銷活動</option>
								<option value="3">限時搶購活動</option>
								<option value="4">滿額登記抽獎</option>
							</select>
						</c:if>
					</div>
					<div class="form-group">
						<label>活動開始時間:</label>
						<c:set var="ts" value="${mevent.meventstartdate }" />
						<input type="date" name="startdate" class="form-control col-sm-3" required value="${fn:substring(ts,0,10) }"><span id="spsd"></span><br>
						<input type="time" name="starttime" step="1" class="form-control col-sm-3" required value="${fn:substring(ts,11,-1) }"><span id="spst"></span>
					</div>
					<div class="form-group">
						<label>活動結束時間:</label>
						<c:set var="td" value="${mevent.meventenddate }" />
						<input type="date" name="enddate" class="form-control col-sm-3" required value="${fn:substring(td,0,10) }"><span id="sped"></span><br>
						<input type="time" name="endtime" step="1" class="form-control col-sm-3" required value="${fn:substring(td,11,-1) }"><span id="spet"></span>
					</div>
                    <div class="form-group">
						<label>活動辦法:</label>
						<textarea rows="5" cols="80" name="description"><c:out value='${mevent.meventdescription }'/></textarea>
					</div>
                    <div class="form-group">
						<label>活動是否上線:</label>
						<c:choose>
							<c:when test="${mevent != null }">
						<c:choose>
							<c:when test="${mevent.meventonline==true }">
								<input type="radio" name="online" value="true" checked>是
								<input type="radio" name="online" value="false">否
							</c:when>
							<c:otherwise>
								<input type="radio" name="online" value="true">是
								<input type="radio" name="online" value="false" checked>否
							</c:otherwise>
						</c:choose>
							</c:when>
							<c:otherwise>
								<input type="radio" name="online" value="true" checked>是
								<input type="radio" name="online" value="false">否
							</c:otherwise>
						</c:choose>
					</div>
                    <div class="form-group">
						<label>活動圖片:</label>
						<c:choose>
							<c:when test="${mevent.meventpicture!=null }">
								<img id="img0" src="data:image/jpg;base64,${ImgOut().ImgWrite(mevent.meventpicture) }">
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose> 
						<input type="file" name="pic" id="file1" multiple="multiple">
						<hr>
						預覽:<br>
						<img id="img1">
					</div>	
					<c:if test="${mevent != null}">
						<input type="hidden" name="ownerid" value="<c:out value='${mevent.meventownerid}' />" />
					</c:if>	
					<hr>
					<div class="form-group">
						<label>活動商品</label>
						<c:if test="${mlbean0!=null}">
							<input type="hidden" name="meventlistid" id="meventlistid" value="<c:out value='${mlbean0.meventlistid}'/>"/>						
							<c:set var="mplbean" value="${mlbean0.marketingEventProductListBean}"/>
							<c:forEach begin="0" end="1" step="1" var="i">
								<div class="row">
								<c:forEach begin="1" end="4" step="1" var="j">
									<div class="card col-sm-2">
										品號:<input type="text" name="product${i*4+j}" id="product${i*4+j}" value="<c:out value='${mplbean.get(i*4+j-1).productid}'/>" />
										<br>
										品名:<input type="text" readonly id="product${i*4+j}name" />
										<br>
										價格:<input type="text" readonly id="product${i*4+j}price" />
										<br>
										<c:choose>
										<c:when test="${mplbean.get(i*4+j-1).meventproductdiscountprice==0}">
											活動價:<input type="text" name="product${i*4+j}dcp" id="product${i*4+j}dcp" value="" />
										</c:when>
										<c:otherwise>
											活動價:<input type="text" name="product${i*4+j}dcp" id="product${i*4+j}dcp" value="<c:out value='${mplbean.get(i*4+j-1).meventproductdiscountprice}'/>" />
										</c:otherwise>
										</c:choose>
									</div>
								</c:forEach>
								</div>
								<br>
							</c:forEach>
						</c:if>
						<c:if test="${mlbean0==null}">
						<c:forEach begin="0" end="1" step="1" var="i">
							<div class="row">
							<c:forEach begin="1" end="4" step="1" var="j">
								<div class="card col-sm-2">
									品號:<input type="text" name="product${i*4+j}" id="product${i*4+j}" value="" />
									<br>
									品名:<input type="text" readonly id="product${i*4+j}name" />
									<br>
									價格:<input type="text" readonly id="product${i*4+j}price" />
									<br>
									活動價:<input type="text" name="product${i*4+j}dcp" id="product${i*4+j}dcp" value="" />
								</div>
							</c:forEach>
							</div>
							<br>
						</c:forEach>	
						</c:if>
					</div>			
				</div>
				<div class="modal-footer">
					<a href="<c:url value='/mevent'/>"><input type="button" class="btn btn-default" data-dismiss="modal" value="取消"></a>
					<c:if test="${mevent == null}">
						<input type="submit" class="btn btn-success" value="新增">
					</c:if>
					<c:if test="${mevent != null}">
						<input type="submit" class="btn btn-success" value="修改">
					</c:if>
				</div>
			</form>
		</div>
	</div>
</div>
<script src="<c:url value='/js/mevent/formcheck.js'/>"></script>
</div>
<footer>
&copy; 2021 EEIT131 第7組
</footer>
</body>
</html>


 

