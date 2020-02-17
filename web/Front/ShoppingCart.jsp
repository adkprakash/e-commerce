<%@page import="com.emobile.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.emobile.controller.CartDAO"%>
<jsp:include page="includes/header.jsp" />
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("Login.jsp");
    }
%>
<section class="solid_banner_area">
    <div class="container">
        <div class="solid_banner_inner">
            <h3>shopping cart</h3>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="shopping-cart.html">Shopping cart</a></li>
            </ul>
        </div>
    </div>
</section>
<!--================End Categories Banner Area =================-->

<!--================Shopping Cart Area =================-->
<section class="shopping_cart_area p_100">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="cart_product_list">
                    <form action="CheckoutRegister.jsp" method="post">
                        <div class="table-responsive-md">
                            <%
                                String cid = "";
                                int cust_id = 0;
                                if (session.getAttribute("cid") != null) {
                                    cid = session.getAttribute("cid").toString();
                                    cust_id = Integer.parseInt(cid);
                                }
                                List<Cart> cList = CartDAO.cartByCustomer(cust_id);
                            %>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">action</th>
                                        <th scope="col">product</th>
                                        <th scope="col">price</th>
                                        <th scope="col">quantity</th>
                                        <th scope="col">color</th>
                                        <th scope="col">ram</th>
                                        <th scope="col">rom</th>
                                        <th scope="col">total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        double totalPrice = 0;
                                        int i = 1;
                                        for (Cart c : cList) {%>
                                <input type="hidden" name="productName<%=i%>" value="">
                                <input type="hidden" name="pid<%=i%>" value="">
                                <input type="hidden" name="quantity<%=i%>" value="">
                                <input type="hidden" name="color<%=i%>" value="">
                                <input type="hidden" name="ram<%=i%>" value="">
                                <input type="hidden" name="rom<%=i%>" value="">
                                    <tr>
                                        <th scope="row">
                                            <a href="RemoveCart.jsp?pid=<%=c.getProduct_id()%>&cid=<%=cust_id%>&color=<%=c.getColor()%>&ram=<%=c.getRam()%>&rom=<%=c.getRom()%>"><img src="img/icon/close-icon.png" alt=""></a>
                                        </th>
                                        <td>
                                            <div class="media"> 
                                                <div class="media-body">
                                                    <h4><%=c.getProduct_name()%></h4>
                                                </div>
                                            </div>
                                        </td>
                                        <td><p>Rs. <%=c.getPrice()%></p></td>
                                        <td><p><%=c.getQuantity()%></p></td>
                                        <td><p><%=c.getColor()%></p></td>
                                        <td><p><%=c.getRam()%> GB</p></td>
                                        <td><p><%=c.getRom()%> GB</p></td>
                                        <td><p>Rs. <%=(c.getPrice() * c.getQuantity())%></p></td>
                                        <%totalPrice += (c.getPrice() * c.getQuantity());%>
                                    </tr>
                                    <% i++; } %>
                                </tbody>
                                <tbody>     
                                    <tr>
                                        <td><p></p></td>
                                        <td><p></p></td>
                                        <td><p></p></td>
                                        <td><p></p></td>
                                        <td><p></p></td>
                                        <td><p></p></td>
                                        <td><p>Sub Total</p></td>
                                        <td><p>Rs. <%=totalPrice%></p></td>
                                    </tr> 
                                </tbody>
                            </table>
                                    <input type="hidden" name="totalIten" value="<%=i-1%>">
                            <button type="submit" class="btn btn-primary checkout_btn float-right">proceed to checkout</button>
                        </div>
                    </form>
                    <section class="emty_cart_area p_100">
                        <div class="container">
                            <div class="emty_cart_inner">
                                <h4><a href="Shop.jsp">continue shopping</a></h4>
                            </div>
                        </div>
                    </section>  
                </div>
            </div>
        </div>
    </div>
</section>
<!--================End Shopping Cart Area =================-->

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