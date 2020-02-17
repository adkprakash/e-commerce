<%@page import="com.emobile.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.emobile.controller.CartDAO"%>
<jsp:include page="includes/header.jsp" />

<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("Login.jsp");
    }
%>
<!--================Categories Banner Area =================-->
<section class="solid_banner_area">
    <div class="container">
        <div class="solid_banner_inner">
            <h3>checkout register</h3>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="checkout.html">Checkout Register</a></li>
            </ul>
        </div>
    </div>
</section>
<!--================End Categories Banner Area =================-->

<!--================Register Area =================-->
<section class="register_area p_100">
    <div class="container">
        <div class="register_inner">
            <div class="row">
                <div class="col-lg-7">
                    <div class="billing_details">
                        <h2 class="reg_title">Billing Detail</h2>
                        <form class="billing_inner row" action="Checkout.jsp" method="post" onsubmit="return validation()" name="checkout">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="name">Full Name <span>*</span></label>
                                    <input type="text" class="form-control" id="name" aria-describedby="name" name="name">
                                    <div id="nameErr" style="color: red;"></div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="address">Address <span>*</span></label>
                                    <input type="text" class="form-control" id="address" aria-describedby="address" name="address">
                                    <div id="addressErr" style="color: red;"></div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="email">Email <span>*</span></label>
                                    <input type="email" class="form-control" id="email" aria-describedby="email" name="email">
                                    <div id="emailErr" style="color: red;"></div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="phone">Phone <span>*</span></label>
                                    <input type="text" class="form-control" id="phone" aria-describedby="phone" name="phone">
                                    <div id="mobileErr" style="color: red;"></div>
                                </div>
                            </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="order_box_price">
                        <h2 class="reg_title">Your Order</h2>
                        <div class="payment_list">
                            <div class="price_single_cost">
                                <%
                                    String cid = "";
                                    int cust_id = 0;
                                    if (session.getAttribute("cid") != null) {
                                        cid = session.getAttribute("cid").toString();
                                        cust_id = Integer.parseInt(cid);
                                    }
                                    List<Cart> cList = CartDAO.cartByCustomer(cust_id);
                                    double total = 0;
                                    int i = 1;
                                    for (Cart c : cList) {
                                %>
                                <input type="hidden" name="productName<%=i%>" value="<%=c.getProduct_name()%>">
                                <input type="hidden" name="pid<%=i%>" value="<%=c.getProduct_id()%>">
                                <input type="hidden" name="quantity<%=i%>" value="<%=c.getQuantity()%>">
                                <input type="hidden" name="price<%=i%>" value="<%=c.getPrice()%>">
                                <input type="hidden" name="color<%=i%>" value="<%=c.getColor()%>">
                                <input type="hidden" name="ram<%=i%>" value="<%=c.getRam()%>">
                                <input type="hidden" name="rom<%=i%>" value="<%=c.getRom()%>">
                                <h5> <%=c.getProduct_name()%> * <%=c.getQuantity()%> <span>Rs. <%=(c.getPrice() * c.getQuantity())%></span></h5>
                                <% total += c.getQuantity() * c.getPrice();
                                        i++;
                                    }%>
                                <h4>Cart Subtotal <span>Rs. <%=total%></span></h4>
                                <h3><span class="normal_text">Order Totals</span> <span>Rs. <%=total%></span></h3>
                            </div>
                        </div>
                        <input type="hidden" name="totalItem" value="<%=i - 1%>">
                        <button type="submit" value="submit" class="btn subs_btn form-control">place order</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================End Register Area =================-->

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
        var name = document.checkout.name.value;
        var address = document.checkout.address.value;
        var email = document.checkout.email.value;
        var mobile = document.checkout.phone.value;
        var nameErr = addressErr = emailErr = mobileErr = true;

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
        if (address.trim() === '') {
            printError("addressErr", "Please enter address");
        } else {
            var regex = /^[a-zA-Z0-9\s]+$/;
            if (regex.test(address) === false) {
                printError("addressErr", "Please enter a valid valid address");
            } else {
                printError("addressErr", "");
                addressErr = false;
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
        if (mobile.trim() === "") {
            printError("mobileErr", "Please enter your mobile number");
        } else {
            var regex = /^[1-9]\d{9}$/;
            if (regex.test(mobile) === false) {
                printError("mobileErr", "Please enter a valid 10 digit mobile number");
            } else {
                printError("mobileErr", "");
                mobileErr = false;
            }
        }
        if ((nameErr || addressErr || emailErr || mobileErr) === true) {
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