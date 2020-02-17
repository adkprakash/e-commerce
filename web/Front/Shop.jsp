<%@page import="java.util.List"%>
<%@page import="com.emobile.model.Product"%>
<%@page import="com.emobile.controller.ProductDAO"%>

<jsp:include page="includes/header.jsp" />

<!--================Categories Product Area =================-->
<section class="no_sidebar_2column_area">
    <div class="container">
        <div class="two_column_product">
            <%
                Object successCart = session.getAttribute("SuccessCart");
                Object errorCart = session.getAttribute("ErrorCart");
                if (successCart != null) {%>
            <div class="alert alert-success" role="alert"><%=successCart%></div>
            <% session.removeAttribute("SuccessCart"); %>
            <% } else if (errorCart != null) {%>
            <div class="alert alert-danger" role="alert"><%=errorCart%></div>
            <% session.removeAttribute("ErrorCart");
                }

                Object success = session.getAttribute("SuccessMsg");
                Object error = session.getAttribute("ErrorMsg");
                if (success != null) {%>
            <div class="alert alert-success" role="alert"><%=success%></div>
            <% session.removeAttribute("SuccessMsg"); %>
            <% } else if (error != null) {%>
            <div class="alert alert-danger" role="alert"><%=error%></div>
            <% session.removeAttribute("ErrorMsg");
                }%>
            <div class="row">
                <%
                    String searchValue = request.getParameter("search");
                    ProductDAO pDAO = new ProductDAO();
                    List<Product> pList;
                    if (searchValue != null) {
                        pList = pDAO.viewProductBySearch(searchValue);
                    } else {
                        pList = pDAO.viewProduct();
                    }
                    for (Product p : pList) {
                %>
                <div class="col-lg-3 col-sm-6">
                    <div class="l_product_item">
                        <div class="l_p_img">
                            <a href="ProductDetails.jsp?id=<%=p.getId()%>"><img src="../images/<%=p.getImage()%>" alt="" height="280"></a>
                        </div>
                        <div class="l_p_text">
                            <ul> 
                                <li><a class="add_cart_btn" href="#">Add To Cart</a></li>
                            </ul>
                            <h4><%=p.getName()%></h4>
                            <h5><del></del>Rs.  <%=p.getPrice()%></h5>
                        </div>
                    </div>
                </div>
                <% }%> 
            </div>
            <nav aria-label="Page navigation example" class="pagination_area">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">6</a></li>
                    <li class="page-item next"><a class="page-link" href="#"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                </ul>
            </nav>
        </div>
    </div>
</section>
<!--================End Categories Product Area =================-->

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
