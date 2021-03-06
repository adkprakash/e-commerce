<%@page import="java.util.ArrayList"%>
<%@page import="com.emobile.controller.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.emobile.model.Product"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.emobile.util.DBConnection"%>
<%@page import="java.sql.Connection"%>

<jsp:include page="includes/header.jsp" />
<!--================Slider Area =================-->
<section class="main_slider_area">
    <div class="container">
        <div id="main_slider" class="rev_slider" data-version="5.3.1.6">
            <ul> 
                <li data-index="rs-1587" data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="default" data-easeout="default" data-masterspeed="300"  data-thumb="img/home-slider/slider-1.jpg"  data-rotate="0"  data-saveperformance="off"  data-title="Creative" data-param1="01" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
                    <!-- MAIN IMAGE -->
                    <img src="img/home-slider/slider-1.jpg"  alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="5" class="rev-slidebg" data-no-retina>

                    <!-- LAYER NR. 1 -->
                    <div class="slider_text_box">
                        <div class="tp-caption tp-resizeme first_text" 
                             data-x="['right','right','right','center','center']" 
                             data-hoffset="['0','0','0','0']" 
                             data-y="['top','top','top','top']" 
                             data-voffset="['60','60','60','80','95']" 
                             data-fontsize="['54','54','54','40','40']"
                             data-lineheight="['64','64','64','50','35']"
                             data-width="['470','470','470','300','250']"
                             data-height="none"
                             data-whitespace="['nowrap','nowrap','nowrap','nowrap','nowrap']"
                             data-type="text" 
                             data-responsive_offset="on" 
                             data-frames="[{&quot;delay&quot;:10,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;&quot;,&quot;mask&quot;:&quot;x:0px;y:0px;s:inherit;e:inherit;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power2.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;y:[175%];&quot;,&quot;mask&quot;:&quot;x:inherit;y:inherit;s:inherit;e:inherit;&quot;,&quot;ease&quot;:&quot;Power2.easeInOut&quot;}]"
                             data-textAlign="['left','left','left','left','left','center']"
                             style="z-index: 8;font-family: Montserrat,sans-serif;font-weight:700;color:#29263a;"><img src="img/home-slider/2017-text.png" alt=""></div>

                        <div class="tp-caption tp-resizeme secand_text" 
                             data-x="['right','right','right','center','center',]" 
                             data-hoffset="['0','0','0','0']" 
                             data-y="['top','top','top','top']" data-voffset="['255','255','255','230','220']"  
                             data-fontsize="['48','48','48','48','36']"
                             data-lineheight="['52','52','52','46']"
                             data-width="['450','450','450','450','450']"
                             data-height="none"
                             data-whitespace="normal"
                             data-type="text" 
                             data-responsive_offset="on"
                             data-transform_idle="o:1;"
                             data-frames="[{&quot;delay&quot;:10,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;&quot;,&quot;mask&quot;:&quot;x:0px;y:[100%];s:inherit;e:inherit;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power2.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;y:[175%];&quot;,&quot;mask&quot;:&quot;x:inherit;y:inherit;s:inherit;e:inherit;&quot;,&quot;ease&quot;:&quot;Power2.easeInOut&quot;}]"
                             data-textAlign="['left','left','left','left','left','center']"
                             >Best Summer <br />Collection 
                        </div>

                        <div class="tp-caption tp-resizeme third_btn" 
                             data-x="['right','right','right','center','center','center']" 
                             data-hoffset="['0','0','0','0']" 
                             data-y="['top','top','top','top']" data-voffset="['385','385','385','385','350']" 
                             data-width="['450','450','450','auto','auto']"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-type="text" 
                             data-responsive_offset="on" 
                             data-frames="[{&quot;delay&quot;:10,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;&quot;,&quot;mask&quot;:&quot;x:0px;y:[100%];s:inherit;e:inherit;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power2.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;y:[175%];&quot;,&quot;mask&quot;:&quot;x:inherit;y:inherit;s:inherit;e:inherit;&quot;,&quot;ease&quot;:&quot;Power2.easeInOut&quot;}]"
                             data-textAlign="['left','left','left','left','left','center']">
                            <a class="checkout_btn" href="#">read more</a>
                        </div>
                    </div>
                </li>
                <li data-index="rs-1588" data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="default" data-easeout="default" data-masterspeed="300"  data-thumb="img/home-slider/slider-2.jpg"  data-rotate="0"  data-saveperformance="off"  data-title="Creative" data-param1="01" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
                    <!-- MAIN IMAGE -->
                    <img src="img/home-slider/slider-1.jpg"  alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="5" class="rev-slidebg" data-no-retina>
                    <!-- LAYERS -->
                    <!-- LAYERS -->

                    <!-- LAYER NR. 1 -->
                    <div class="slider_text_box">
                        <div class="tp-caption tp-resizeme first_text" 
                             data-x="['right','right','right','center','center']" 
                             data-hoffset="['0','0','0','0']" 
                             data-y="['top','top','top','top']" 
                             data-voffset="['60','60','60','80','95']" 
                             data-fontsize="['54','54','54','40','40']"
                             data-lineheight="['64','64','64','50','35']"
                             data-width="['470','470','470','300','250']"
                             data-height="none"
                             data-whitespace="['nowrap','nowrap','nowrap','nowrap','nowrap']"
                             data-type="text" 
                             data-responsive_offset="on" 
                             data-frames="[{&quot;delay&quot;:10,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;&quot;,&quot;mask&quot;:&quot;x:0px;y:0px;s:inherit;e:inherit;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power2.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;y:[175%];&quot;,&quot;mask&quot;:&quot;x:inherit;y:inherit;s:inherit;e:inherit;&quot;,&quot;ease&quot;:&quot;Power2.easeInOut&quot;}]"
                             data-textAlign="['left','left','left','left','left','center']"
                             style="z-index: 8;font-family: Montserrat,sans-serif;font-weight:700;color:#29263a;"><img src="img/home-slider/2017-text.png" alt=""></div>

                        <div class="tp-caption tp-resizeme secand_text" 
                             data-x="['right','right','right','center','center',]" 
                             data-hoffset="['0','0','0','0']" 
                             data-y="['top','top','top','top']" data-voffset="['255','255','255','230','220']"  
                             data-fontsize="['48','48','48','48','36']"
                             data-lineheight="['52','52','52','46']"
                             data-width="['450','450','450','450','450']"
                             data-height="none"
                             data-whitespace="normal"
                             data-type="text" 
                             data-responsive_offset="on"
                             data-transform_idle="o:1;"
                             data-frames="[{&quot;delay&quot;:10,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;&quot;,&quot;mask&quot;:&quot;x:0px;y:[100%];s:inherit;e:inherit;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power2.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;y:[175%];&quot;,&quot;mask&quot;:&quot;x:inherit;y:inherit;s:inherit;e:inherit;&quot;,&quot;ease&quot;:&quot;Power2.easeInOut&quot;}]"
                             data-textAlign="['left','left','left','left','left','center']"
                             >Best Summer <br />Collection 
                        </div>

                        <div class="tp-caption tp-resizeme third_btn" 
                             data-x="['right','right','right','center','center','center']" 
                             data-hoffset="['0','0','0','0']" 
                             data-y="['top','top','top','top']" data-voffset="['385','385','385','385','350']" 
                             data-width="['450','450','450','auto','auto']"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-type="text" 
                             data-responsive_offset="on" 
                             data-frames="[{&quot;delay&quot;:10,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;&quot;,&quot;mask&quot;:&quot;x:0px;y:[100%];s:inherit;e:inherit;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power2.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;y:[175%];&quot;,&quot;mask&quot;:&quot;x:inherit;y:inherit;s:inherit;e:inherit;&quot;,&quot;ease&quot;:&quot;Power2.easeInOut&quot;}]"
                             data-textAlign="['left','left','left','left','left','center']">
                            <a class="checkout_btn" href="#">read more</a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</section>
<!--================End Slider Area =================-->

<!--================Feature Add Area =================-->
<section class="feature_add_area">
    <div class="container">
        <div class="row feature_inner">
            <div class="col-lg-5">
                <div class="f_add_item">
                    <div class="f_add_img"><img class="img-fluid" src="img/feature-add/f-add-1.jpg" alt=""></div>
                    <div class="f_add_hover">
                        <h4>Best Summer <br />Collection</h4>
                        <a class="add_btn" href="#">Shop Now <i class="arrow_right"></i></a>
                    </div>
                    <div class="sale">Sale</div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="f_add_item right_dir">
                    <div class="f_add_img"><img class="img-fluid" src="img/feature-add/f-add-2.jpg" alt=""></div>
                    <div class="f_add_hover">
                        <h4>Best Summer <br />Collection</h4>
                        <a class="add_btn" href="#">Shop Now <i class="arrow_right"></i></a>
                    </div>
                    <div class="off">10% off</div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="f_add_item">
                    <div class="f_add_img"><img class="img-fluid" src="img/feature-add/f-add-3.jpg" alt=""></div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================End Feature Add Area =================-->

<!--================Our Latest Product Area =================-->
<section class="our_latest_product">
    <div class="container">
        <div class="s_m_title">
            <h2>Our Latest Product</h2>
        </div>
        <div class="l_product_slider owl-carousel">
            <%
                String searchValue = request.getParameter("search");
                ProductDAO pDAO = new ProductDAO();
                List<Product> pList;
                if(searchValue != null){
                    pList = pDAO.viewProductBySearch(searchValue);
                    response.sendRedirect("Shop.jsp");
                } else {
                    pList = ProductDAO.viewLatestProduct();
                }
                for (Product p : pList) {%>
            <div class="item">
                <div class="l_product_item">
                    <div class="l_p_img">
                        <a href="ProductDetails.jsp?id=<%=p.getId()%>">
                            <img src="../images/<%=p.getImage()%>" alt="" height="280">
                        </a>
                    </div>
                    <div class="l_p_text">
                        <ul> 
                            <li><a class="add_cart_btn" href="ProductDetails.jsp?id=<%=p.getId()%>">Add To Cart</a></li>
                        </ul>
                        <h4><%=p.getName()%></h4>
                        <h5><del></del>Rs.  <%=p.getPrice()%></h5>
                    </div>
                </div>
            </div> <% }%>
        </div>
    </div>
</section>
<!--================End Our Latest Product Area =================-->

<!--================Feature Big Add Area =================-->
<section class="feature_big_add_area">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="f_add_item white_add">
                    <div class="f_add_img"><img class="img-fluid" src="img/feature-add/f-add-4.jpg" alt=""></div>
                    <div class="f_add_hover">
                        <h4>Best Summer <br />Collection</h4>
                        <a class="add_btn" href="#">Shop Now <i class="arrow_right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="f_add_item white_add">
                    <div class="f_add_img"><img class="img-fluid" src="img/feature-add/f-add-5.jpg" alt=""></div>
                    <div class="f_add_hover">
                        <h4>Best Summer <br />Collection</h4>
                        <a class="add_btn" href="#">Shop Now <i class="arrow_right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--============= ===End Feature Big Add Area =================-->

<!--================Product_listing Area =================-->
<section class="product_listing_area">
    <div class="container">
        <div class="row p_listing_inner">
            <div class="col-lg-4">
                <div class="row">
                    <div class="col-lg-6 col-sm-8">
                        <div class="p_list_text">
                            <h3>Men</h3>
                            <ul>
                                <li><a href="#">Down Jackets</a></li>
                                <li><a href="#">Hoodies</a></li>
                                <li><a href="#">Suits</a></li>
                                <li><a href="#">Jeans</a></li>
                                <li><a href="#">Casual Pants</a></li>
                                <li><a href="#">Sunglass</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-4">
                        <div class="p_list_img">
                            <img src="img/product/p-categories-list/product-l-1.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="row">
                    <div class="col-lg-6 col-sm-8">
                        <div class="p_list_text">
                            <h3>Women</h3>
                            <ul>
                                <li><a href="#">Down Jackets</a></li>
                                <li><a href="#">Hoodies</a></li>
                                <li><a href="#">Suits</a></li>
                                <li><a href="#">Jeans</a></li>
                                <li><a href="#">Casual Pants</a></li>
                                <li><a href="#">Sunglass</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-4">
                        <div class="p_list_img">
                            <img src="img/product/p-categories-list/product-l-2.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="row">
                    <div class="col-lg-6 col-sm-8">
                        <div class="p_list_text">
                            <h3>Accessories</h3>
                            <ul>
                                <li><a href="#">Down Jackets</a></li>
                                <li><a href="#">Hoodies</a></li>
                                <li><a href="#">Suits</a></li>
                                <li><a href="#">Jeans</a></li>
                                <li><a href="#">Casual Pants</a></li>
                                <li><a href="#">Sunglass</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-4">
                        <div class="p_list_img">
                            <img src="img/product/p-categories-list/product-l-3.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================End Product_listing Area =================-->

<!--================Featured Product Area =================-->
<section class="feature_product_area">
    <div class="container">
        <div class="f_p_inner">
            <div class="row">
                <div class="col-lg-3">
                    <div class="f_product_left">
                        <div class="s_m_title">
                            <h2>Featured Products</h2>
                        </div>
                        <div class="f_product_inner">
                            <div class="media">
                                <div class="d-flex">
                                    <img src="img/product/featured-product/f-p-1.jpg" alt="">
                                </div>
                                <div class="media-body">
                                    <h4>Oxford Shirt</h4>
                                    <h5>$45.05</h5>
                                </div>
                            </div>
                            <div class="media">
                                <div class="d-flex">
                                    <img src="img/product/featured-product/f-p-2.jpg" alt="">
                                </div>
                                <div class="media-body">
                                    <h4>Puffer Jacket</h4>
                                    <h5>$45.05</h5>
                                </div>
                            </div>
                            <div class="media">
                                <div class="d-flex">
                                    <img src="img/product/featured-product/f-p-3.jpg" alt="">
                                </div>
                                <div class="media-body">
                                    <h4>Leather Bag</h4>
                                    <h5>$45.05</h5>
                                </div>
                            </div>
                            <div class="media">
                                <div class="d-flex">
                                    <img src="img/product/featured-product/f-p-4.jpg" alt="">
                                </div>
                                <div class="media-body">
                                    <h4>Casual Shoes</h4>
                                    <h5>$45.05</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="fillter_slider_inner">
                        <ul class="portfolio_filter">
                            <li class="active" data-filter="*"><a href="#">men's</a></li>
                            <li data-filter=".woman"><a href="#">Woman</a></li>
                            <li data-filter=".shoes"><a href="#">Shoes</a></li>
                            <li data-filter=".bags"><a href="#">Bags</a></li>
                        </ul>
                        <div class="fillter_slider owl-carousel">
                            <div class="item shoes">
                                <div class="fillter_product_item bags">
                                    <div class="f_p_img">
                                        <img src="img/product/fillter-product/f-product-1.jpg" alt="">
                                        <h5 class="sale">Sale</h5>
                                    </div>
                                    <div class="f_p_text">
                                        <h5>Nike Max Air Vapor Power</h5>
                                        <h4>$45.05</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="item woman shoes bags">
                                <div class="fillter_product_item">
                                    <div class="f_p_img">
                                        <img src="img/product/fillter-product/f-product-2.jpg" alt="">
                                        <h5 class="new">New</h5>
                                    </div>
                                    <div class="f_p_text">
                                        <h5>Fossil Watch</h5>
                                        <h4><del>$250</del> $110</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="item woman shoes">
                                <div class="fillter_product_item">
                                    <div class="f_p_img">
                                        <img src="img/product/fillter-product/f-product-3.jpg" alt="">
                                        <h5 class="discount">-10%</h5>
                                    </div>
                                    <div class="f_p_text">
                                        <h5>High Heel</h5>
                                        <h4>$45.05</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="item shoes">
                                <div class="fillter_product_item bags">
                                    <div class="f_p_img">
                                        <img src="img/product/fillter-product/f-product-1.jpg" alt="">
                                        <h5 class="sale">Sale</h5>
                                    </div>
                                    <div class="f_p_text">
                                        <h5>Nike Max Air Vapor Power</h5>
                                        <h4>$45.05</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="item woman shoes bags">
                                <div class="fillter_product_item">
                                    <div class="f_p_img">
                                        <img src="img/product/fillter-product/f-product-2.jpg" alt="">
                                        <h5 class="new">New</h5>
                                    </div>
                                    <div class="f_p_text">
                                        <h5>Fossil Watch</h5>
                                        <h4><del>$250</del> $110</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="item woman shoes">
                                <div class="fillter_product_item">
                                    <div class="f_p_img">
                                        <img src="img/product/fillter-product/f-product-3.jpg" alt="">
                                        <h5 class="discount">-10%</h5>
                                    </div>
                                    <div class="f_p_text">
                                        <h5>High Heel</h5>
                                        <h4>$45.05</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="item shoes">
                                <div class="fillter_product_item bags">
                                    <div class="f_p_img">
                                        <img src="img/product/fillter-product/f-product-1.jpg" alt="">
                                        <h5 class="sale">Sale</h5>
                                    </div>
                                    <div class="f_p_text">
                                        <h5>Nike Max Air Vapor Power</h5>
                                        <h4>$45.05</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="item woman shoes bags">
                                <div class="fillter_product_item">
                                    <div class="f_p_img">
                                        <img src="img/product/fillter-product/f-product-2.jpg" alt="">
                                        <h5 class="new">New</h5>
                                    </div>
                                    <div class="f_p_text">
                                        <h5>Fossil Watch</h5>
                                        <h4><del>$250</del> $110</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="item woman shoes">
                                <div class="fillter_product_item">
                                    <div class="f_p_img">
                                        <img src="img/product/fillter-product/f-product-3.jpg" alt="">
                                        <h5 class="discount">-10%</h5>
                                    </div>
                                    <div class="f_p_text">
                                        <h5>High Heel</h5>
                                        <h4>$45.05</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================End Featured Product Area =================-->

<!--================Form Blog Area =================-->
<section class="from_blog_area">
    <div class="container">
        <div class="from_blog_inner">
            <div class="c_main_title">
                <h2>From The Blog</h2>
            </div>
            <div class="row">
                <div class="col-lg-4 col-sm-6">
                    <div class="from_blog_item">
                        <img class="img-fluid" src="img/blog/from-blog/f-blog-1.jpg" alt="">
                        <div class="f_blog_text">
                            <h5>fashion</h5>
                            <p>Neque porro quisquam est qui dolorem ipsum</p>
                            <h6>21.09.2017</h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="from_blog_item">
                        <img class="img-fluid" src="img/blog/from-blog/f-blog-2.jpg" alt="">
                        <div class="f_blog_text">
                            <h5>fashion</h5>
                            <p>Neque porro quisquam est qui dolorem ipsum</p>
                            <h6>21.09.2017</h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="from_blog_item">
                        <img class="img-fluid" src="img/blog/from-blog/f-blog-3.jpg" alt="">
                        <div class="f_blog_text">
                            <h5>fashion</h5>
                            <p>Neque porro quisquam est qui dolorem ipsum</p>
                            <h6>21.09.2017</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================End Form Blog Area =================-->

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
            <h5>� <script>document.write(new Date().getFullYear());</script> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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