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
                <a href="<c:url value='/Logout'/>" class="">
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

    <!--login-and-sign-up-form--------------------->
    <div class="form">
        <!--login-------------------->
        <div class="login-form">
            <!--cancel-btn--------->
            <a href="javascript:void(0);" class="form-cancel">
                <i class="fas fa-times"></i>
            </a>

            <!--heading---->
            <strong>會員登入</strong>
            <!--inputs-->
            <form>
                <input id="loginInput" type="email" style="font-size:16px" placeholder="請輸入電子信箱" name="loginEmail" required>
                <input id="loginInputPwd" type="password" style="font-size:16px" placeholder="請輸入密碼" name="loginPassword" required>
                <!--submit-btn-->
                <input type="button" value="登入"  id="loginOutput" onclick="sendLoginData()">
                <span id="verifyBox" class="tip"></span>
            </form>
            <!--forget-and-sign-up-btn-->
            <div class="form-btns">
                <a href="<c:url value='/ForgotPassWord'/>" class="forget">忘記密碼？</a>
                <a href="javascript:void(0);" class="sign-up-btn">建立帳戶</a>
            </div>

        </div>


        <!--Sign-up-------------------->
        <div class="sign-up-form">
            <!--cancel-btn--------->
            <a href="javascript:void(0);" class="form-cancel">
                <i class="fas fa-times"></i>
            </a>

            <!--heading---->
            <strong>建立帳戶</strong>
            <!--inputs-->
            <form method="post" action="<c:url value='/Registermember'/>" onsubmit="return(get_action())">
                <input type="email" style="font-size:16px" id="signInput" placeholder="請輸入電子信箱" name="email">
                <span id="signInputShowBox" class="tip"></span>
                <input type="password" style="font-size:16px" id="signInputPwd" placeholder="請輸入8~20字元的英數字" name="password"
                	 onKeyUp=pwStrength(this.value) onBlur=pwStrength(this.value)>
        		<table width="300" border="1" cellspacing="0" cellpadding="1" bordercolor="#eeeeee" height="22" style='display:inline'>  
        		<tr align="center" bgcolor="#f5f5f5">
        		<td width="100px" id="strength_L"></td>  
        		<td width="100px" id="strength_M"></td>  
        		<td width="100px" id="strength_H"></td>  
        		</tr>  
        		</table><br>  
                
                <span id="signInputPwdShowBox" class="tip"></span>
                <input type="password"  style="font-size:16px"id="signCheckPwd" placeholder="請輸入再次輸入相同的密碼" name="cpassword">
                <span id="signCheckShowBox" class="tip"></span>
                <div class="mb-3 ">
                	<div class="g-recaptcha" data-sitekey="6Lcfn_obAAAAAPBcYnPAGL9sU2ANZQh9ed9vyLfO"></div>
                	<span id="captcha" class="tip"></span>
                </div>
                <!--submit-btn-->
                <input type="submit" id="signOutput" value="註冊" disabled="true">
                <span id="result0c" class="tip"></span>
            </form>
            <!--forget-and-sign-up-btn-->
            <div class="form-btns">
                <a href="javascript:void(0);" class="already-acount">已經是會員？</a>
            </div>
        </div>
    </div>
    
    <script>

    /*-----------------------------------------------------會員登入用請勿修改,感謝---------------------------------------------------------------*/
    /*--------------------------------Google ReAptcha----------------------------------------*/    
        function get_action()
        {
            var v = grecaptcha.getResponse();
            if(v.length == 0)
            {
                document.getElementById('captcha').innerHTML="請進行我不是機器人驗證";
                return false;
            }
            else
            {
                document.getElementById('captcha').innerHTML="";
                return true;
            }
        }
    /*---------------------------Spring RESTful Login check---------------------------------*/
    	var loginAccount = false;
    	
    	const input4 = document.getElementById('loginInput');
    	var verifyBox = document.getElementById('verifyBox'),
    		loginInputAccount = document.getElementById('loginInput'),
    		outputLogin = document.getElementById('loginOutput')
    	
    	
    		function sendLoginData() {

    		var loginEmail = loginInputAccount.value,
    		loginPassword = loginInputPwd.value;
            
    		var xhr = new XMLHttpRequest();
    		xhr.open("POST", "<c:url value='/Login' />", true);
    		xhr.setRequestHeader("Content-Type",
    				"application/x-www-form-urlencoded");
    		xhr.send("loginEmail=" + loginEmail + "&" + "loginPassword=" + loginPassword);
    		var loginMessage = "";
    		xhr.onreadystatechange = function() {
    			// 伺服器請求完成
    			if (xhr.readyState == 4 && xhr.status == 200) {
    				var emailResult = JSON.parse(xhr.responseText);

    				if (emailResult.loginEmail.length == 0) {
    					loginAccount = true;
    					loginMessage = "";
    					window.location.assign("<c:url value='/index'/>");
    				}else {
        				if(emailResult.loginEmail.length == 3){
        					loginAccount = false;
        					loginMessage = "您輸入的是舊的密碼" + "　且上次更新日期為 " + emailResult.date;
        				}else if(emailResult.loginEmail.length == 7){
        					loginAccount = false;
        					loginMessage = "請立刻到信箱進行驗證";
            			}else{
            				loginAccount = false;
        					loginMessage = "帳號或密碼錯誤";
                    	}
    				}
    				verifyBox.innerHTML = "<font color='red' size='-2'>" + loginMessage + "</font>";
    			}
    		}
    	}
        
    /*-------------------------------------Registermember Account check----------------------------------------------*/

    	var signAccount = false, signPassword = false, signCheckPassword = false, emailCheck = false;
        
        const input1 = document.getElementById('signInput');
        const input2 = document.getElementById('signInputPwd');
        const input3 = document.getElementById('signCheckPwd');
    	var div = document.getElementById('result0c');

        var signInputAccount = document.getElementById("signInput"),
            signInputAccountShowBox = document.getElementById("signInputShowBox");
    	
        input1.addEventListener('input', CheckAccount);

        function CheckAccount() {
            if (signInputAccount.value == "") {
                signInputAccountShowBox.innerHTML = "請輸入Email";
                signAccount = false;
                Lock();
            }
            if (signInputAccount.value == "") {
                signInputAccountShowBox.innerHTML = "不可空白";
                signAccount = false;
                Lock();
            } else {
                var emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
                if (signInputAccount.value.search(emailRule) != -1) {
                    signInputAccountShowBox.innerHTML = "";
                    signAccount = true;

                    var email = signInputAccount.value;
                    
            		var xhr = new XMLHttpRequest();
            		xhr.open("POST", "<c:url value='/CheckEmailRepeat' />", true);
            		xhr.setRequestHeader("Content-Type",
            				"application/x-www-form-urlencoded");
            		xhr.send("email=" + email);
            		var message = "";
            		xhr.onreadystatechange = function() {
            			// 伺服器請求完成
            			if (xhr.readyState == 4 && xhr.status == 200) {
            				var result = JSON.parse(xhr.responseText);

            				if (result.email.length == 0) {
            					emailCheck = true;
            					message = "";
            					Lock();
            				}else {
            					emailCheck = false;
            					message = "帳號重複，請重新輸入帳號";
            					Lock();
            				}
            				div.innerHTML = "<font color='red' size='-2'>" + message + "</font>";
            				console.log("emailCheck = " + emailCheck);
            			}
            		}
                    
                } else {
                    signInputAccountShowBox.innerHTML = "Email格式錯誤";
                    signAccount = false;
                    Lock();
                }
            }
        }

        var signInputPwd = document.getElementById("signInputPwd"),
            signInputPwdShowBox = document.getElementById("signInputPwdShowBox"),
            signInputDoubleCheck = false;

        input2.addEventListener('input', CheckPassword);

        function CheckPassword() {
            if (signInputPwd.value == "") {
                signInputPwdShowBox.innerHTML = "請輸入密碼";
                signPassword = false;
                signInputDoubleCheck = false;
            }
            if (signInputPwd.value == "") {
                signInputPwdShowBox.innerHTML = "不可空白";
                signPassword = false;
                signInputDoubleCheck = false;
            } else {
                if (signInputPwd.value.length < 8) {
                    signInputPwdShowBox.innerHTML = "至少要8字元";
                    signPassword = false;
                    signInputDoubleCheck = false;
                } else {
                    var a = /[0-9]/;
                    var b = a.test(signInputPwd.value);
                    if (b == true) {
                        var c = /[a-z]/i;
                        var b = c.test(signInputPwd.value);
                        if (b == true) {
                            signInputPwdShowBox.innerHTML = "";
                            signPassword = true;
                            signInputDoubleCheck = true;
                        } else {
                            signInputPwdShowBox.innerHTML = "必須含有英數字";
                            signPassword = false;
                            signInputDoubleCheck = false;
                        }
                    } else {
                        signInputPwdShowBox.innerHTML = "必須含有英數字";
                        signPassword = false;
                        signInputDoubleCheck = false;
                    }
                }
            }
        }

        var signCheckPwd = document.getElementById("signCheckPwd"),
            signCheckShowBox = document.getElementById("signCheckShowBox");

        input3.addEventListener('input', CheckDoublePassword);

        function CheckDoublePassword() {
            if (signCheckPwd.value == "") {
                signCheckShowBox.innerHTML = "請再次輸入密碼";
            }
            if (signCheckPwd.value == "") {
                signCheckShowBox.innerHTML = "不可空白";
            } else {
                if (signCheckPwd.value.length < 8) {
                    signCheckShowBox.innerHTML = "至少要8字元";
                } else {
                    var a = /[0-9]/;
                    var b = a.test(signCheckPwd.value);
                    if (b == true) {
                        var c = /[a-z]/i;
                        var b = c.test(signCheckPwd.value);
                        if (b == true) {
                            if (signCheckPwd.value == signInputPwd.value && signInputDoubleCheck == true) {
                                signCheckShowBox.innerHTML = "";
                            } else {
                                signCheckShowBox.innerHTML = "請輸入相同密碼";
                            }
                        } else {
                            signCheckShowBox.innerHTML = "必須含有英數字";
                        }
                    } else {
                        signCheckShowBox.innerHTML = "必須含有英數字";
                    }
                }
            }
            Lock();
        }
        
        var doubleLock = false;
    	
        function CheckAgain() {
            if (signInputPwd.value == signCheckPwd.value) {
                doubleLock = true;
                signCheckShowBox.innerHTML = "";
            } else {
                doubleLock = false;
                signCheckShowBox.innerHTML = "請輸入相同密碼";
            }
            Lock();
        }
        input2.addEventListener('input', CheckAgain);
        input3.addEventListener('input', CheckAgain);
            
        function Lock() {
            if (signAccount == true && signPassword == true && doubleLock == true && emailCheck == true) {
                document.getElementById("signOutput").disabled = false;
            } else {
                document.getElementById("signOutput").disabled = true;
            }
            console.log("doubleLock  " + doubleLock);
            console.log("signAccount  " + signAccount);
            console.log("signPassword  " + signPassword);
            console.log("emailCheck  " + emailCheck);
        }

    ////////////////////////////////////////////////計算密碼強度//////////////////////////////////////////////////////
    	
    	//判斷輸入密碼的類型 
            function CharMode(iN){  
            if (iN>=48 && iN <=57) //數字  
            return 1;  
            if (iN>=65 && iN <=90) //大寫  
            return 2;  
            if (iN>=97 && iN <=122) //小寫  
            return 4;  
            else  
            return 8;   
            }  
            //bitTotal函数  
            //計算密碼模式
            function bitTotal(num){  
            modes=0;  
            for (i=0;i<4;i++){  
            if (num & 1) modes++;  
            num>>>=1;  
            }  
            return modes;  
            }  
            //確認密碼安全等級  
            function checkStrong(sPW){  
                if (sPW.length<=4)  
                return 0; //密碼太短  
                Modes=0;  
                for (i=0;i<sPW.length;i++){  
                //密碼模式  
                Modes|=CharMode(sPW.charCodeAt(i));  
                }  
                return bitTotal(Modes);  
            }  
              
            //顯示顏色  
            function pwStrength(pwd){  
            O_color="#eeeeee";  
            L_color="#FF0000";  
            M_color="#FF9900";  
            H_color="#33CC00";  
            if (pwd==null||pwd==''){  
            Lcolor=Mcolor=Hcolor=O_color;  
            }  
            else{  
            S_level=checkStrong(pwd);  
            switch(S_level) {  
            case 0:  
            Lcolor=Mcolor=Hcolor=O_color;  
            case 1:  
            Lcolor=L_color;  
            Mcolor=Hcolor=O_color;  
            break;  
            case 2:  
            Lcolor=Mcolor=M_color;  
            Hcolor=O_color;  
            break;  
            default:  
            Lcolor=Mcolor=Hcolor=H_color;  
            }  
            }  
            document.getElementById("strength_L").style.background=Lcolor;  
            document.getElementById("strength_M").style.background=Mcolor;  
            document.getElementById("strength_H").style.background=Hcolor;  
            return;  
            }  
        	
    /////////////////////////////////////////////////////計算密碼強度///////////////////////////////////////////////////////////

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

    /*-------------------------------------------------會員登入用請勿修改結尾,感謝----------------------------------------------------*/
	
/* 購物車數量 */
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