<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--navigation-------------------------------->
    <nav>
        <!--social-link-and-phont-number-->
        <div class="social-call">
            <!--social-links-->
            <div class="social">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
            <!--phone-number-->
            <div class="phone">
                <span>Call +123456789</span>
            </div>
        </div>

        <!--menu-bar-------------------------------------->
        <div class="navigation">
            <!--logo---------->
            <a href="<c:url value='/index' />" class="logo">
                <img src="<c:url value='/Member/images/PetPetLogo.png' />" />
            </a>
            <!--menu-icon---------------------->
            <div class="toggle"></div>

            <!--menu----------->
            <ul class="menu">
                <li><a href="#">最新消息</a></li>

                <li><a href="<c:url value='/clientproduct'/>">商品總覽</a>
                    <!--sale-label-->
                    <span class="sale-lable">Sale</span>
                </li>

                <li><a href="#">寵愛認養</a></li>
                <li><a href="#">毛寵大小事</a></li>
                <li><a href="<c:url value='/lock/MemberCenter'/>">會員中心</a></li>
            </ul>
            <!--right-menu------->
            <div class="right-menu">
                <!--search-->
                <a href="javascript:void(0);" class="search">
                    <i class="fas fa-search"></i>
                </a>
                <!--user-->
                <c:choose>
                <c:when test="${sessionScope.memberid != null}">
                <a href="<c:url value='/Logout'/>" class="user">
                    <i class="fas fa-sign-out-alt"></i>
                </a>
                </c:when>
                <c:otherwise>
                <a href="javascript:void(0);" class="user">
                    <i class="fas fa-user"></i>
                </a>
                </c:otherwise>
                </c:choose>
                <!--cart-icon-->
                <a href="<c:url value='/cart'/>">
                    <i class="fas fa-shopping-cart">
                        <!--number-of-product-in-cart-->
                        <span class="num-cart-product">0</span>
                    </i>
                </a>
            </div>
        </div>
    </nav>
    <!--search-bar------------------------------->
    <div class="search-bar">
        <!--search-input-------->
        <div class="search-input">
            <!--input----->
            <input type="text" placeholder="Search For Product" />
            <!--cancel-btn-->
            <a href="javascript:void(0);" class="search-cancel">
                <i class="fas fa-times"></i>
            </a>
        </div>
    </div>
<script>
$(document).ready(function(){
	countCartitems();
});

function countCartitems(){
	var context =window.location.pathname.split("/")[1];
	var uri="/"+context+"/cart/getcount";
	$.ajax({
		type:"get",
		url:uri,
		}).done(function(response){
			$(".num-cart-product").empty().append(response);
			console.log("success");
			}).fail(function(){
				console.log("fail");});
}
</script>