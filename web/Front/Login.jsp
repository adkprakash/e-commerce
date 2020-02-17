<jsp:include page="includes/header.jsp" />

<!--================Categories Banner Area =================-->
<section class="solid_banner_area">
    <div class="container">
        <div class="solid_banner_inner">
            <h3>LOgin</h3>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="track.html">Login</a></li>
            </ul>
        </div>
    </div>
</section>
<!--================End Categories Banner Area =================-->

<!--================login Area =================-->
<section class="login_area p_100">
    <div class="container">
        <div class="login_inner">
            <div class="row">
                <div class="col-lg-4">
                    <div class="login_title">
                        <h2>log in your account</h2>
                        <p>Log in to your account to discovery all great features in this template.</p>
                    </div>
                    <div>
                        <%
                            Object success0 = session.getAttribute("LoginSuccessMsg");
                            Object error0 = session.getAttribute("LoginErrorMsg");
                            if (success0 != null) {%>
                        <div class="alert alert-success" role="alert"><%=success0%></div>
                        <% session.removeAttribute("LoginSuccessMsg"); %>
                        <% } else if (error0 != null) {%>
                        <div class="alert alert-danger" role="alert"><%=error0%></div>
                        <% session.removeAttribute("LoginErrorMsg");
                            }%>
                    </div>
                    <form class="login_form row" action="LoginSuccess.jsp" onsubmit="return validation()" name="login">
                        <div class="col-lg-12 form-group">
                            <input class="form-control" type="text" placeholder="User Name" name="username">
                            <div id="usernameErr1" style="color: red;"></div>
                        </div>
                        <div class="col-lg-12 form-group">
                            <input class="form-control" type="password" placeholder="Password" name = "password">
                            <div id="passwordErr1" style="color: red;"></div>
                        </div>
                        <div class="col-lg-12 form-group">
                            <h4>Forgot your password ?</h4>
                        </div>
                        <div class="col-lg-12 form-group">
                            <button type="submit" value="submit" class="btn subs_btn form-control">Login</button>
                        </div>
                    </form>
                </div>
                <div class="col-lg-8">
                    <div class="login_title">
                        <h2>create account</h2>
                        <p>Follow the steps below to create email account enjoy the great mail.com emailing experience. Vivamus tempus risus vel felis condimentum, non vehicula est iaculis.</p>
                    </div>
                    <div>
                        <%
                            Object success = session.getAttribute("SuccessMsg");
                            Object error = session.getAttribute("ErrorMsg");
                            if (success != null) {%>
                        <div class="alert alert-success" role="alert"><%=success%></div>
                        <% session.removeAttribute("SuccessMsg"); %>
                        <% } else if (error != null) {%>
                        <div class="alert alert-danger" role="alert"><%=error%></div>
                        <% session.removeAttribute("ErrorMsg");
                            }%>
                    </div>
                    <form class="login_form row" action="RegisterSuccess.jsp" onsubmit="return registerValidation()" name="register">
                        <div class="col-lg-6 form-group">
                            <input class="form-control" type="text" placeholder="Name" name="name">
                            <div id="nameErr" style="color: red;"></div>
                        </div>
                        <div class="col-lg-6 form-group">
                            <input class="form-control" type="email" placeholder="Email" name="email">
                            <div id="emailErr" style="color: red;"></div>
                        </div>
                        <div class="col-lg-6 form-group">
                            <input class="form-control" type="text" placeholder="User Name" name="username">
                            <div id="usernameErr" style="color: red;"></div>
                        </div>
                        <div class="col-lg-6 form-group">
                            <input class="form-control" type="text" placeholder="Phone" name="phone">
                            <div id="mobileErr" style="color: red;"></div>
                        </div>
                        <div class="col-lg-6 form-group">
                            <input class="form-control" type="text" placeholder="Address" name="address">
                            <div id="addressErr" style="color: red;"></div>
                        </div>
                        <div class="col-lg-6 form-group">
                            <input class="form-control" type="password" placeholder="Password" name="password">
                            <div id="passwordErr" style="color: red;"></div>
                        </div>
                        <div class="col-lg-6 form-group">
                            <button type="submit" value="submit" class="btn subs_btn form-control">register now</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================End login Area =================-->

<!--================Footer Area =================-->
<footer class="footer_area">
    <div class="container">
        <div class="footer_widgets">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-6">
                    <aside class="f_widget f_about_widget">
                        <img src="img/logo.png" alt="">
                        <p>Persuit is a Premium PSD Template. Best choice for your online store. Let purchase it to enjoy now</p>
                        <h6>Social:</h6>
                        <ul>
                            <li><a href="#"><i class="social_facebook"></i></a></li>
                            <li><a href="#"><i class="social_twitter"></i></a></li>
                            <li><a href="#"><i class="social_pinterest"></i></a></li>
                            <li><a href="#"><i class="social_instagram"></i></a></li>
                            <li><a href="#"><i class="social_youtube"></i></a></li>
                        </ul>
                    </aside>
                </div>
                <div class="col-lg-2 col-md-4 col-6">
                    <aside class="f_widget link_widget f_info_widget">
                        <div class="f_w_title">
                            <h3>Information</h3>
                        </div>
                        <ul>
                            <li><a href="#">About us</a></li>
                            <li><a href="#">Delivery information</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                            <li><a href="#">Help Center</a></li>
                            <li><a href="#">Returns & Refunds</a></li>
                        </ul>
                    </aside>
                </div>
                <div class="col-lg-2 col-md-4 col-6">
                    <aside class="f_widget link_widget f_service_widget">
                        <div class="f_w_title">
                            <h3>Customer Service</h3>
                        </div>
                        <ul>
                            <li><a href="#">My account</a></li>
                            <li><a href="#">Ordr History</a></li>
                            <li><a href="#">Wish List</a></li>
                            <li><a href="#">Newsletter</a></li>
                            <li><a href="#">Contact Us</a></li>
                        </ul>
                    </aside>
                </div>
                <div class="col-lg-2 col-md-4 col-6">
                    <aside class="f_widget link_widget f_extra_widget">
                        <div class="f_w_title">
                            <h3>Extras</h3>
                        </div>
                        <ul>
                            <li><a href="#">Brands</a></li>
                            <li><a href="#">Gift Vouchers</a></li>
                            <li><a href="#">Affiliates</a></li>
                            <li><a href="#">Specials</a></li>
                        </ul>
                    </aside>
                </div>
                <div class="col-lg-2 col-md-4 col-6">
                    <aside class="f_widget link_widget f_account_widget">
                        <div class="f_w_title">
                            <h3>My Account</h3>
                        </div>
                        <ul>
                            <li><a href="#">My account</a></li>
                            <li><a href="#">Ordr History</a></li>
                            <li><a href="#">Wish List</a></li>
                            <li><a href="#">Newsletter</a></li>
                        </ul>
                    </aside>
                </div>
            </div>
        </div>
        <div class="footer_copyright">
            <h5>© <script>document.write(new Date().getFullYear());</script> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </h5>
        </div>
    </div>
</footer>
<!--================End Footer Area =================-->
<script type="text/javascript">
    function printError(elemId, msg) {
        document.getElementById(elemId).innerHTML = msg;
    }
    function validation() {
        var username = document.login.username.value;
        var password = document.login.password.value;
        var usernameErr1 = passwordErr1 = true;

        if (username.trim() === '') {
            printError("usernameErr1", "Please enter username");
        } else {
            var regex = /^[a-zA-Z0-9\s]+$/;
            if (regex.test(username) === false) {
                printError("usernameErr1", "Please enter a valid username");
            } else {
                printError("usernameErr1", "");
                usernameErr1 = false;
            }
        }
        if (password === '') {
            printError("passwordErr1", "Please enter password");
        } else {
            printError("passwordErr1", "");
            passwordErr1 = false;
        }
        if ((usernameErr1 || passwordErr1) === true) {
            return false;
        }
    }
    function registerValidation() {
        var name = document.register.name.value;
        var username = document.register.username.value;
        var email = document.register.email.value;
        var address = document.register.address.value;
        var mobile = document.register.phone.value;
        var password = document.register.password.value;
        var nameErr = usernameErr = passwordErr = addressErr = emailErr = mobileErr = true;

        if (name.trim() === '') {
            printError("nameErr", "Please enter name");
        } else {
            var regex = /^[a-zA-Z\s]+$/;
            if (regex.test(name) === false) {
                printError("nameErr", "Please enter a valid name");
            } else {
                printError("nameErr", "");
                nameErr = false;
            }
        }
        if (username.trim() === '') {
            printError("usernameErr", "Please enter username");
        } else {
            var regex = /^[a-zA-Z0-9\s]+$/;
            if (regex.test(username) === false) {
                printError("usernameErr", "Please enter a valid username");
            } else {
                printError("usernameErr", "");
                usernameErr = false;
            }
        }
        if (email.trim() === '') {
            printError("emailErr", "Please enter email");
        } else {
            var regex = /^\S+@\S+\.\S+$/;
            if (regex.test(email) === false) {
                printError("emailErr", "Please enter a valid email address");
            } else {
                printError("emailErr", "");
                emailErr = false;
            }
        }
        if (address.trim() === '') {
            printError("addressErr", "Please enter address");
        } else {
            var regex = /^[a-zA-Z0-9\s]+$/;
            if (regex.test(address) === false) {
                printError("addressErr", "Please enter a valid address");
            } else {
                printError("addressErr", "");
                addressErr = false;
            }
        }
        if (mobile.trim() === "") {
            printError("mobileErr", "Please enter your mobile number");
        } else {
            var regex = /^[0-9]\d{9}$/;
            if (regex.test(mobile) === false) {
                printError("mobileErr", "Please enter a valid 10 digit mobile number");
            } else {
                printError("mobileErr", "");
                mobileErr = false;
            }
        }
        if (password === '') {
            printError("passwordErr", "Please enter password");
        } else {
            if (password.length < 4) {
                printError("passwordErr", "Password must be greater than 4 character");
            } else {
                printError("passwordErr", "");
                passwordErr = false;
            }
        }
        if ((nameErr || usernameErr || passwordErr || emailErr || addressErr || mobileErr) === true) {
            return false;
        }
    }
</script>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-3.2.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- Rev slider js -->
<script src="vendors/revolution/js/jquery.themepunch.tools.min.js"></script>
<script src="vendors/revolution/js/jquery.themepunch.revolution.min.js"></script>
<script src="vendors/revolution/js/extensions/revolution.extension.actions.min.js"></script>
<script src="vendors/revolution/js/extensions/revolution.extension.video.min.js"></script>
<script src="vendors/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
<script src="vendors/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script src="vendors/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
<script src="vendors/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
<!-- Extra plugin css -->
<script src="vendors/counterup/jquery.waypoints.min.js"></script>
<script src="vendors/counterup/jquery.counterup.min.js"></script>
<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="vendors/bootstrap-selector/js/bootstrap-select.min.js"></script>
<script src="vendors/image-dropdown/jquery.dd.min.js"></script>
<script src="js/smoothscroll.js"></script>
<script src="vendors/isotope/imagesloaded.pkgd.min.js"></script>
<script src="vendors/isotope/isotope.pkgd.min.js"></script>
<script src="vendors/magnify-popup/jquery.magnific-popup.min.js"></script>
<script src="vendors/vertical-slider/js/jQuery.verticalCarousel.js"></script>
<script src="vendors/jquery-ui/jquery-ui.js"></script>

<script src="js/theme.js"></script>
</body>
</html>