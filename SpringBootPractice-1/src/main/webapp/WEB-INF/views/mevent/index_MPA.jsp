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
<script src="<c:url value='/js/mevent/indexMPA.js'/>"></script>
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
<div class="content" align="center">
  <div class="container-fluid">
        <div class="table-responsive">
            <div class="table-wrapper">			
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><b>線上行銷活動列表</b></h2>
                        </div>
                        <div class="col-sm-3">
						    <a href="<c:url value='/mevent/MEventForm_MPA'/>" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>新增活動</span></a>
						    <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>刪除</span></a>						
				    	</div>
                        <div class="col-sm-3">
                            <div class="search-box">
                                <div class="input-group">								
                                    <input type="text" id="search" class="form-control" placeholder="搜尋活動名稱">
                                    <span class="input-group-addon"><i class="material-icons">&#xE8B6;</i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
							    <span class="custom-checkbox">
								    <input type="checkbox" id="selectAll">
								    <label for="selectAll"></label>
							    </span>
						    </th>
                            <th>活動名稱</th>
					    	<th>類型ID</th>
					    	<th>活動開始時間</th>
					    	<th>活動結束時間</th>
						    <th>活動辦法</th>
					    	<th>是否上線</th>
						    <th>圖片</th>
					    	<th>負責人ID</th>
                            <th>修改刪除</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach  items="${mevents}" var="mevent" varStatus="i">
                        <tr>
                            <td>
							    <span class="custom-checkbox">
								    <input type="checkbox" id="checkbox<c:out value='${i.index+1}'/>" name="options[]" value="<c:out value='${i.index+1}'/>">
								    <label for="checkbox1"></label>
						    	</span>
						    </td>
                            <td><c:out value="${mevent.meventname}" /></td>
						    <td><c:out value="${mevent.meventtypeid}" /></td>
						    <td><c:out value="${mevent.meventstartdate}" /></td>
						    <td><c:out value="${mevent.meventenddate}" /></td>
					    	<td><c:out value="${mevent.meventdescription}" /></td>
					    	<td><c:out value="${mevent.meventonline}" /></td>
					    	<td><c:choose>
								<c:when test="${mevent.meventpicture!=null }">
									<img
										src="data:image/jpg;base64,${ImgOut().ImgWrite(mevent.meventpicture) }"
										width="250px">
								</c:when>
								<c:otherwise>沒有圖片喔</c:otherwise>
							    </c:choose></td>
					    	<td><c:out value="${mevent.meventownerid}" /></td>
                            <td>
                                <input type="hidden" name="id" value="<c:out value='${mevent.meventid}' />" />
							    <a href="<c:url value='/mevent/edit/${mevent.meventid}'/>" class="edit"><i class="material-icons" data-toggle="tooltip" title="修改">&#xE254;</i></a>
							    <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="刪除">&#xE872;</i></a>
						    </td>
                        </tr>  
                        <c:set var="count" value="${i.count }" />
                    </c:forEach>
                    </tbody>
                </table>
                <div class="clearfix">
				    <div class="hint-text">共<b>${count}</b>筆資料</div>
				    <!--  
                            <ul class="pagination">
					        <li class="page-item disabled"><a href="#">Previous</a></li>
					        <li class="page-item"><a href="#" class="page-link">1</a></li>
					        <li class="page-item"><a href="#" class="page-link">2</a></li>
				    	    <li class="page-item active"><a href="#" class="page-link">3</a></li>
					        <li class="page-item"><a href="#" class="page-link">4</a></li>
					        <li class="page-item"><a href="#" class="page-link">5</a></li>
				    	    <li class="page-item"><a href="#" class="page-link">Next</a></li>
				            </ul>
                   --> 
			    </div>
            </div>
        </div>        
    </div>     
</div>
<!-- Delete Modal HTML -->
<div id="deleteEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post" action="<c:url value='/mevent/delete'/>" enctype="application/x-www-form-urlencoded">
				<div class="modal-header">						
					<h4 class="modal-title">刪除活動</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<p>是否要刪除所選活動?</p>
					<p class="text-warning"><small>刪除無法復原</small></p>
				</div>
				<div class="modal-footer">
                    <input type="hidden" name="id" id="id" />
					<input type="button" class="btn btn-default" data-dismiss="modal" value="取消">
					<input type="submit" class="btn btn-danger" value="刪除">                
				</div>
			</form>
		</div>
	</div>
</div>
<footer>
&copy; 2021 EEIT131 第7組
</footer>
</body>
</html>


 

