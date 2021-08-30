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
                            <h2><b>折價券列表</b></h2>
                        </div>
                        <div class="col-sm-3">
						    <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>新增折價券</span></a>
						    <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>刪除</span></a>						
				    	</div>
                        <div class="col-sm-3">
                            <div class="search-box">
                                <div class="input-group">								
                                    <input type="text" id="search" class="form-control" placeholder="搜尋折價券名稱">
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
						    <th scope="col"><a href="${pageContext.request.contextPath}/bs/coupon/page/${currentPage}?sortField=id&sortDir=${reverseSortDir}" >折價券ID</a></th>
                            <th scope="col"style="width:200px;"><a href="${pageContext.request.contextPath}/bs/coupon/page/${currentPage}?sortField=name&sortDir=${reverseSortDir}" >折價券名稱</a></th>
					    	<th scope="col"><a href="${pageContext.request.contextPath}/bs/coupon/page/${currentPage}?sortField=amount&sortDir=${reverseSortDir}" >折價券面額</a></th>
					    	<th scope="col">可領取結束時間</th>
					    	<th scope="col">可使用開始時間</th>
					    	<th scope="col">可使用結束時間</th>
						    <th scope="col">使用類型</th>
						    <th scope="col">每人限領張數</th>
						    <th scope="col">使用門檻</th>
						    <th scope="col">發行數量</th>
						    <th scope="col">領取數量</th>
						    <th scope="col">使用數量</th>
						    <th scope="col">詳細資訊</th>
                            <th scope="col">修改刪除</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach  items="${coupons}" var="coupon" varStatus="i">
                        <tr>
                            <td>
							    <span class="custom-checkbox">
								    <input type="checkbox" id="checkbox<c:out value='${i.index+1}'/>" name="options[]" value="<c:out value='${i.index+1}'/>">
								    <label for="checkbox1"></label>
						    	</span>
						    </td>
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
					    	<td>
					    		<input type="hidden" name="id" value="<c:out value='${coupon.id}' />" />
					    		<a href="<c:url value='/bs/coupon/get/${coupon.id}'/>" class="detail"><i class="material-icons" data-toggle="tooltip" title="詳細資訊">&#xef42;</i></a>
					    	</td>
                            <td>
                                <input type="hidden" name="id" value="<c:out value='${coupon.id}' />" />
							    <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="修改">&#xE254;</i></a>
							    <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="刪除">&#xE872;</i></a>
						    </td>
                        </tr>  
                        <c:set var="count" value="${i.count }" />
                    </c:forEach>
                    </tbody>
                </table>
                <div class="clearfix">
				    <div class="hint-text">共<b>${count}</b>筆資料</div>
 
                            <ul class="pagination">
					        <c:if test="${currentPage > 1}">
                            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/bs/coupon/page/${currentPage - 1}?sortField=${sortField}&sortDir=${sortDir}">前一頁</a></li>
                            </c:if>
                            
                            <c:if test="${currentPage > 1}">
                            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/bs/coupon/page/1?sortField=${sortField}&sortDir=${sortDir}">1</a></li>
                            </c:if>
                            <c:if test="${currentPage == 1}">
                            <li class="page-item"><a class="page-link" >1</a></li>
                            </c:if>
                
                            <c:forEach var="i" begin="2" end="${totalPages}">
                
                            <c:if test="${currentPage != i}">
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/bs/coupon/page/${i}?sortField=${sortField}&sortDir=${sortDir}">${i}</a></li>
                            </c:if>
                            <c:if test="${currentPage == i}">
                                <li class="page-item"><a class="page-link" >${i}</a></li>
                            </c:if>
                            </c:forEach>
                            
                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/bs/coupon/page/${currentPage + 1}?sortField=${sortField}&sortDir=${sortDir}">下一頁</a></li>
                            </c:if>
                            <c:if test="${currentPage == i}">
                                <li class="page-item"><a class="page-link">下一頁</a></li>
                            </c:if>
                    
                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/bs/coupon/page/${totalPages}?sortField=${sortField}&sortDir=${sortDir}">最後一頁</a></li>
                            </c:if>
                            <c:if test="${currentPage == totalPages}">
                                <li class="page-item"><a class="page-link">最後一頁</a></li>
                            </c:if>
				            </ul>

			    </div>
            </div>
        </div>        
    </div>     
</div>
<!-- Add Modal HTML -->
<div id="addEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post" action="<c:url value='/bs/coupon/insert'/>" enctype="multipart/form-data">
				<div class="modal-header">						
					<h4 class="modal-title">新增折價券</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<div class="form-group">
						<label>折價券名稱:</label>
						<input type="text" class="form-control" required name="name" id="name">
					</div>
					<div class="form-group">
						<label>折價券面額:</label>
						<input type="number" style="width:100px;" class="form-control" min="1" required name="amount" id="amount">
					</div>
					<div class="form-group">
						<label>每人限領張數:</label>
						<input type="number" style="width:100px;" class="form-control" min="1" required name="per_limit" id="per_limit">
					</div>
					<div class="form-group">
						<label>使用門檻:</label>
						滿<input type="number" style="width:100px;" class="form-control" min="0" required name="min_point" id="min_point">元(輸入0表示不設限制)
					</div>
					<div class="form-group">
						<label>使用類型:</label>
							<select name="use_type" class="form-control col-sm-3" required>
                        		<option value="0">通用</option>
								<option value="1">限商品分類</option>
							</select>
					</div>
					<div class="form-group">
						<label>可領取結束時間:</label>
						<input type="date" name="enabledate" class="form-control col-sm-4" required><span id="spad"></span><br>
						<input type="time" name="enabletime" step="1" class="form-control col-sm-4" required ><span id="spat"></span>
					</div>
					<div class="form-group">
						<label>可使用開始時間:</label>
						<input type="date" name="startdate" class="form-control col-sm-4" required ><span id="spsd"></span><br>
						<input type="time" name="starttime" step="1" class="form-control col-sm-4" required><span id="spst"></span>
					</div>
					<div class="form-group">
						<label>可使用結束時間:</label>
						<input type="date" name="enddate" class="form-control col-sm-4" required><span id="sped"></span><br>
						<input type="time" name="endtime" step="1" class="form-control col-sm-4" required><span id="spet"></span>
					</div>
                 </div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="取消">
					<input type="submit" class="btn btn-success" value="新增">
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Edit Modal HTML -->
<div id="editEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post" action="<c:url value='/bs/coupon/edit'/>" enctype="multipart/form-data">
				<div class="modal-header">						
					<h4 class="modal-title">修改折價券設定</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
                    <input type="hidden" name="id" id="ide"/>	
                    <div class="form-group">
						<label>折價券名稱:</label>
						<input type="text" class="form-control" required name="name" id="namee">
					</div>
					<div class="form-group">
						<label>折價券面額:</label>
						<input type="number" style="width:100px;" class="form-control" min="1" required name="amount" id="amounte">
					</div>
					<div class="form-group">
						<label>每人限領張數:</label>
						<input type="number" style="width:100px;" class="form-control" min="1" required name="per_limit" id="per_limite">
					</div>
					<div class="form-group">
						<label>使用門檻:</label>
						<br>滿<input type="number" style="width:100px;" class="form-control" min="0" required name="min_point" id="min_pointe">元(輸入0表示不設限制)
					</div>
					<div class="form-group">
						<label>使用類型:</label>
							<select id="use_type" name="use_type" class="form-control" required style="width:100px;">
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
					</div>
					<div class="form-group">
						<label>可領取結束時間:</label>
						<input type="date" id="enabledatee" name="enabledate" class="form-control col-sm-4" required><span id="spad"></span><br>
						<input type="time" id="enabletimee" name="enabletime" step="1" class="form-control col-sm-4" required><span id="spat"></span>
					</div>
					<div class="form-group">
						<label>可使用開始時間:</label>
						<input type="date" id="startdatee" name="startdate" class="form-control col-sm-4" required><span id="spsd"></span><br>
						<input type="time" id="starttimee" name="starttime" step="1" class="form-control col-sm-4" required><span id="spst"></span>
					</div>
					<div class="form-group">
						<label>可使用結束時間:</label>
						<input type="date" id="enddatee" name="enddate" class="form-control col-sm-4" required ><span id="sped"></span><br>
						<input type="time" id="endtimee" name="endtime" step="1" class="form-control col-sm-4" required><span id="spet"></span>
					</div>
                 </div>   
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="取消">
					<input type="submit" class="btn btn-info" value="儲存">
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Delete Modal HTML -->
<div id="deleteEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post" action="<c:url value='/bs/coupon/delete'/>" enctype="application/x-www-form-urlencoded">
				<div class="modal-header">						
					<h4 class="modal-title">刪除折價券</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<p>是否要刪除所選折價券?</p>
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
<script type="text/javascript">
$(document).ready(function(){
	// Activate tooltips
	$('[data-toggle="tooltip"]').tooltip();
    
	// Filter table rows based on searched term
    $("#search").on("keyup", function() {
        var term = $(this).val().toLowerCase();
        $("table tbody tr").each(function(){
            $row = $(this);
            var name = $row.find("td:nth-child(2)").text().toLowerCase();
            console.log(name);
            if(name.search(term) < 0){                
                $row.hide();
            } else{
                $row.show();
            }
        });
    });
});

$(document).ready(function(){
	// Activate tooltip
	$('[data-toggle="tooltip"]').tooltip();
	
	// Select/Deselect checkboxes
	var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function(){
		if(this.checked){
			checkbox.each(function(){
				this.checked = true;                        
			});
		} else{
			checkbox.each(function(){
				this.checked = false;                        
			});
		} 
	});
	checkbox.click(function(){
		if(!this.checked){
			$("#selectAll").prop("checked", false);
		}
	});
});

$(document).ready(function(){
	// Activate tooltips
	$('[data-toggle="tooltip"]').tooltip();
    
	// delete one
   $(".delete").click(function(){
        var delid=$(this).prevAll("input").val();
        console.log(delid);
        $("#deleteEmployeeModal #id").val(delid);      
    });

    // delete all
    $("a[class='btn btn-danger']").click(function(){
        var ckdlist = [];
        $('table tbody input[type="checkbox"]').each(function(){
            if($(this).prop("checked")){
                let id=$(this).closest("td").siblings("td").last().find("input").val();
                ckdlist.push(id);
            }
        });
        $("#deleteEmployeeModal #id").val(ckdlist.toString());
    })

  //edit one
    $(".edit").click(function(){
        var editid=$(this).prevAll("input").val();
        var uri=window.location.pathname;
        $.ajax({
            type:"Get",
            url:uri+"/rest/find/"+editid,
            success:function(coupon){
                $("#editEmployeeModal #ide").val(coupon.id);
                $("#editEmployeeModal #amounte").val(coupon.amount);
                $("#editEmployeeModal #namee").val(coupon.name);
                $("#editEmployeeModal #per_limite").val(coupon.per_limit);
                $("#editEmployeeModal #min_pointe").val(coupon.min_point);
                $("#editEmployeeModal #use_type").val(coupon.use_type);
                $("#editEmployeeModal #enabledatee").val(coupon.enable_time.substring(0,10));
                $("#editEmployeeModal #enabletimee").val(coupon.enable_time.substring(11,19));               
                $("#editEmployeeModal #startdatee").val(coupon.start_time.substring(0,10));
                $("#editEmployeeModal #starttimee").val(coupon.start_time.substring(11,19));
                $("#editEmployeeModal #enddatee").val(coupon.end_time.substring(0,10));
                $("#editEmployeeModal #endtimee").val(coupon.end_time.substring(11,19));
                
            }
        })
    });
});

</script>
</body>
</html>


 

