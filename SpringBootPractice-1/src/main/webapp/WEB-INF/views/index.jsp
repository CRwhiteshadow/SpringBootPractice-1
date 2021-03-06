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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shopping Website</title>
<!--stylesheet-->
<link rel="stylesheet" type="text/css" href="css/style.css">
<!--light-slider-css-->
<%-- <link rel="stylesheet" type="text/css" href="css/lightslider.css"> --%>
<!-- <link rel="stylesheet" href="css/02.css"> -->
<!--jQuery-------->
<script src="js/jQuery.js"></script>
<!--light-slider-js-->
<%-- <script src="js/lightslider.js"></script> --%>
<!--fav-icon------------------->
<link rel="shortcut icon" href="images/fav-icon.ico" />
<!--using-FontAwesome-for-Icons-->
<script src="https://kit.fontawesome.com/c8e4d183c2.js" crossorigin="anonymous"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<!-- Bootstrap -->
<link rel="stylesheet" href="<c:url value='/webjars/bootstrap/css/bootstrap.min.css'/>">
<script src="<c:url value='/webjars/bootstrap/js/bootstrap.min.js'/>"></script>
<style>
.carousel-item a{display: inline-block;}
</style>
</head>
<body>
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
            <a href="#" class="logo">
                <img src="images/PetPetLogo.png" />
            </a>
            <!--menu-icon---------------------->
            <div class="toggle"></div>

            <!--menu----------->
            <ul class="menu">
                <li><a href="#">????????????</a></li>

                <li><a href="#">????????????</a>
                    <!--sale-label-->
                    <span class="sale-lable">Sale</span>
                </li>

                <li><a href="#">????????????</a></li>
                <li><a href="#">???????????????</a></li>
                <li><a href="#">????????????</a></li>
            </ul>
            <!--right-menu------->
            <div class="right-menu">
                <!--search-->
                <a href="javascript:void(0);" class="search">
                    <i class="fas fa-search"></i>
                </a>
                <!--user-->
                <a href="javascript:void(0);" class="user">
                    <i class="fas fa-user"></i>
                </a>
                <!--cart-icon-->
                <a href="#">
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

    <!--login-and-sign-up-form--------------------->
    <div class="form">
        <!--login-------------------->
        <div class="login-form">
            <!--cancel-btn--------->
            <a href="javascript:void(0);" class="form-cancel">
                <i class="fas fa-times"></i>
            </a>

            <!--heading---->
            <strong>????????????</strong>
            <!--inputs-->
            <form>
                <input type="email" placeholder="Example@gmail.com" name="email" required>
                <input type="password" placeholder="Password" name="password" required>
                <!--submit-btn-->
                <input type="submit" value="Log In">
            </form>
            <!--forget-and-sign-up-btn-->
            <div class="form-btns">
                <a href="#" class="forget">???????????????</a>
                <a href="javascript:void(0);" class="sign-up-btn">????????????</a>
            </div>

        </div>


        <!--Sign-up-------------------->
        <div class="sign-up-form">
            <!--cancel-btn--------->
            <a href="javascript:void(0);" class="form-cancel">
                <i class="fas fa-times"></i>
            </a>

            <!--heading---->
            <strong>????????????</strong>
            <!--inputs-->
            <form>
                <input type="text" placeholder="Full Name" name="fullname" required>
                <input type="email" placeholder="Example@gmail.com" name="email" required>
                <input type="password" placeholder="Password" name="password" required>
                <!--submit-btn-->
                <input type="submit" value="Sign Up">
            </form>
            <!--forget-and-sign-up-btn-->
            <div class="form-btns">
                <a href="javascript:void(0);" class="already-acount">??????????????????</a>
            </div>

        </div>

    </div>

    <!--Full-slider--------------------------------------------------------------->
<c:choose>
	<c:when test="${mevents.size()!=0 }">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="height: 500px;margin: auto;width: 1000px;" align="center">
            <ol class="carousel-indicators">
            	<c:forEach  begin="0" end="${mevents.size()-1}" step="1" var="j" >
            		<c:choose>
            			<c:when test="${j==0}">
            				<li data-target="#carouselExampleIndicators" data-slide-to="${j}" class="active"></li>
            			</c:when>
            			<c:otherwise>
	                    	<li data-target="#carouselExampleIndicators" data-slide-to="${j}"></li>
	                    </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ol>
            <div class="carousel-inner">
                <c:forEach  items="${mevents}" var="mevent" varStatus="i">
                	<c:choose>
                		<c:when test="${i.index==0}">
                			<div class="carousel-item active">
                		</c:when>
                		<c:otherwise>
                   			<div class="carousel-item">
                   		</c:otherwise>
                   	</c:choose>
                    <a href="<c:url value='/mevent/edm/${mevent.meventtitle}'/>"><img class="d-block w-100 img-fluid" src="data:image/jpg;base64,${ImgOut().ImgWrite(mevent.meventpicture) }" style="object-fit: cover;height:500px;"/></a>
                   </div>
                </c:forEach>
			</div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    			<span class="sr-only">Previous</span>
  			</a>
  			<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    			<span class="carousel-control-next-icon" aria-hidden="true"></span>
    			<span class="sr-only">Next</span>
  			</a>
        </div>
	</c:when>
	<c:otherwise>
		<div class="container" align="center">
			<img src="<c:url value='/images/addefault.jpg'/>">
		</div>
	</c:otherwise>
</c:choose>
        <script src="js/02.js"></script>
    <!--Feature-Categories-------------------------------->
    <div class="feature-heading">
        <h2>????????????</h2>
    </div>

    <ul id="autoWidth" class="cs-hidden">
        <!----1------------------------------------>
        <li class="item">
            <!--feature-box-->
        <div class="feature-box">
        <a href="#">
            <img src="images/feature_1.jpg">
        </a>
        </div>
        <!--text---------------------------->
        <span>T-shirt</span>
        </li>

        <!----2------------------------------------>
        <li class="item">
            <!--feature-box-->
        <div class="feature-box">
        <a href="#">
            <img src="images/feature_2.jpg">
        </a>
        </div>
        <!--text---------------------------->
        <span>T-shirt</span>
        </li>

        <!----3------------------------------------>
        <li class="item">
            <!--feature-box-->
        <div class="feature-box">
        <a href="#">
            <img src="images/feature_3.jpg">
        </a>
        </div>
        <!--text---------------------------->
        <span>T-shirt</span>
        </li>

        <!----4------------------------------------>
        <li class="item">
            <!--feature-box-->
        <div class="feature-box">
        <a href="#">
            <img src="images/feature_4.jpg">
        </a>
        </div>
        <!--text---------------------------->
        <span>T-shirt</span>
        </li>

        <!----5------------------------------------>
        <li class="item">
            <!--feature-box-->
        <div class="feature-box">
        <a href="#">
            <img src="images/feature_5.jpg">
        </a>
        </div>
        <!--text---------------------------->
        <span>T-shirt</span>
        </li>

        <!----6------------------------------------>
        <li class="item">
            <!--feature-box-->
        <div class="feature-box">
        <a href="#">
            <img src="images/feature_6.jpg">
        </a>
        </div>
        <!--text---------------------------->
        <span>T-shirt</span>
        </li>

    </ul>

    <!--new-arrival------------------->
    <section class="new-arrival">
        <!--heading------->
        <div class="arrival-heading">
            <strong>????????????</strong>
            <p>???????????????????????? ????????? ???????????? ???????????????</p>
        </div>
        <!--product-container----------------->
        <div class="product-container">
            <!--product-box-1-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="images/p-1.jpg"/>
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>

            </div>

            <!--product-box-2-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="images/p-2.jpg"/>
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>

            <!--product-box-3-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="images/p-3.jpg"/>
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>

            <!--product-box-4-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="images/p-4.jpg"/>
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>

            <!--product-box-5-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="images/p-5.jpg"/>
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>

            <!--product-box-6-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="images/p-6.jpg"/>
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>

            <!--product-box-7-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="images/p-7.jpg"/>
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>

            <!--product-box-8-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="images/p-8.jpg"/>
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>

        </div>

    </section>

    <!---sale------------------------------------>
    <section class="sale">
        <!--sale-box-1-------------------->
        <div class="sale-box sale-1">
            <img src="images/sale-1.jpg">
            
            <a href="#">
            <div class="sale-text">
              <strong>Bag with rose pattern</strong>
              <span>Sale off 25%</span>
            </div></a>
        
          </div>
           <!--sale-box-2-------------------->
        <div class="sale-box sale-1">
          <img src="images/sale-2.jpg">
          
          <a href="#"><div class="sale-text">
            <strong>Hello Summer</strong>
            <span>Sale off 20%</span>
          </div></a>
      
        </div>
         <!--sale-box-3-------------------->
         <div class="sale-box sale-1">
          <img src="images/sale-3.jpg">
          
          <a href="#">
          <div class="sale-text">
            <strong>Let's Party Hard Pillow</strong>
            <span>Sale off 25%</span>
          </div></a>
      
        </div>
     
    </section>

    <!--new-arrival------------------->
    <section class="new-arrival">
        <!--heading------->
        <div class="arrival-heading">
            <strong>????????????</strong>
            <p>?????????????????? ??????????????????????????????????????????</p>
        </div>
        <!--product-container----------------->
        <div class="product-container">
            <!--product-box-1-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="images/p-1.jpg"/>
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>

            </div>

            <!--product-box-2-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="images/p-2.jpg"/>
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>

            <!--product-box-3-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="images/p-3.jpg"/>
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>

            <!--product-box-4-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="images/p-4.jpg"/>
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>
</div>
</section>

    <!--banner-------------------------------------->

    <!--box---------------->
    <div class="banner-box f-slide-1">
        <!--slider-text-container----------->
        <div class="banner-text-container">

            <div class="banner-text">
                <span>Limited offer</span>
                <strong>30% off<br /> with <Font>promo code</Font></strong>
                <a href="#" class="banner-btn">Shop Now</a>
            </div>

        </div>
    </div>

<!--services--------------------------------------------->
    <section class="services">
        <!--service-box-1-------------------->
        <div class="services-box">
            <i class="fas fa-shipping-fast"></i>
            <span>?????????</span>
            <p>?????????????????????</p>
        </div>

        <!--service-box-2-------------------->
        <div class="services-box">
            <i class="fas fa-headphones-alt"></i>
            <span>24????????????</span>
            <p>????????????????????????</p>
        </div>

        <!--service-box-3-------------------->
        <div class="services-box">
            <i class="fas fa-sync"></i>
            <span>???????????? 100%??????</span>
            <p>?????????????????????????????????????????????</p>
        </div>
    </section>

<!--footer--------------------------------------->
    <footer>
        <!--copyright----------------->
        <span class="copyright">
            Copyright 2021 - EEIT31????????????????????????7???
        </span>
        <!--subscribe--->
        <div class="subscribe">
            <form>
                <input type="email" placeholder="Example@gmail.com" required/>
                <input type="submit" value="Subscribe">
            </form>
        </div>
    </footer>















    <!--script-------->
    <script type="text/javascript">

        /*----For Search bar---------------------*/
        $(document).on('click', '.search', function () {
            $('.search-bar').addClass('search-bar-active')
        });

        $(document).on('click', '.search-cancel', function () {
            $('.search-bar').removeClass('search-bar-active')
        });

        /*--login-sign-up-form-----------------*/
        $(document).on('click', '.user,.already-acount', function () {
            $('.form').addClass('login-active').removeClass('sign-up-active')
        });

        $(document).on('click', '.sign-up-btn', function () {
            $('.form').addClass('sign-up-active').removeClass('login-active')
        });

        $(document).on('click', '.form-cancel', function () {
            $('.form').removeClass('login-active').removeClass('sign-up-active')
        });

        /*---full-slider-script--------------*/
        // $(document).ready(function () {
        //     $('#adaptive').lightSlider({
        //         adaptiveHeight: true,
        //         auto: true,
        //         item: 1,
        //         slideMargin: 0,
        //         loop: true
        //     });
        // });
        /*--Feature-slider--------------------*/
//         $(document).ready(function() {
//         $('#autoWidth').lightSlider({
//         autoWidth:true,
//         loop:true,
//         onSliderLoad: function() {
//             $('#autoWidth').removeClass('cS-hidden');
//         } 
//     });  
//   });

  /*----for-fix-menu-when-scroll----------------------*/
  $(window).scroll(function(){
      if($(document).scrollTop() > 50){
          $('.navigation').addClass('fix-nav');
      }
      else{
        $('.navigation').removeClass('fix-nav');
      }
  })
  /*--for-responsive-menu-----------------*/
  $(document).ready(function(){
      $('.toggle').click(function(){
          $('.toggle').toggleClass('active')
          $('.navigation').toggleClass('active')
      })
  })

    </script>
</body>
</html>