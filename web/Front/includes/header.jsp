<%@page import="com.emobile.controller.CartDAO"%>
<%@page import="com.emobile.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="icon" href="img/fav-icon.png" type="image/x-icon" />
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Persuit</title>

        <!-- Icon css link -->
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="vendors/line-icon/css/simple-line-icons.css" rel="stylesheet">
        <link href="vendors/elegant-icon/style.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Rev slider css -->
        <link href="vendors/revolution/css/settings.css" rel="stylesheet">
        <link href="vendors/revolution/css/layers.css" rel="stylesheet">
        <link href="vendors/revolution/css/navigation.css" rel="stylesheet">

        <!-- Extra plugin css -->
        <link href="vendors/owl-carousel/owl.carousel.min.css" rel="stylesheet">
        <link href="vendors/bootstrap-selector/css/bootstrap-select.min.css" rel="stylesheet">

        <link href="css/style.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

        <!--================Top Header Area =================-->
        <div class="header_top_area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="top_header_left">
                            <div class="selector">
                                <select class="language_drop" name="countries" id="countries" style="width:300px;">
                                    <option value='yt' data-image="img/icon/flag-1.png" data-imagecss="flag yt" data-title="English">English</option>
                                    <option value='yu' data-image="img/icon/flag-1.png" data-imagecss="flag yu" data-title="Bangladesh">Bangla</option>
                                    <option value='yt' data-image="img/icon/flag-1.png" data-imagecss="flag yt" data-title="English">English</option>
                                    <option value='yu' data-image="img/icon/flag-1.png" data-imagecss="flag yu" data-title="Bangladesh">Bangla</option>
                                </select>
                            </div>
                            <select class="selectpicker usd_select">
                                <option>USD</option>
                                <option>$</option>
                                <option>$</option>
                            </select>
                            <div class="input-group">
                                <form action="Shop.jsp">
                                    <input type="text" class="form-control" placeholder="Search" name="search">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="top_header_middle">
                            <a href="#"><i class="fa fa-phone"></i> Call Us: <span>+84 987 654 321</span></a>
                            <a href="#"><i class="fa fa-envelope"></i> Email: <span>support@yourdomain.com</span></a>
                            <img src="img/logo.png" alt="">
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="top_right_header">
                            <ul class="header_social">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                <li><a href="#"><i class="fa fa-youtube-play"></i></a></li>
                            </ul>
                            <ul class="top_right">
                                <li class="user">
                                    <%
                                        if (session.getAttribute("username") == null) { %>
                                    <a href="Login.jsp">Login</a>
                                    <%  } else { %>
                                    <a href=""><%out.println(session.getAttribute("username"));%></a> 
                                    <% } %>
                                </li>
                                <%
                                    if (session.getAttribute("username") != null) { %>
                                <li><a href="Logout.jsp">Logout</a></li>
                                    <%}%>

                                <li>
                                    <%
                                        String cid = "";
                                        int cust_id = 0, count = 0;
                                        if (session.getAttribute("username") != null) {
                                            cid = session.getAttribute("cid").toString();
                                            cust_id = Integer.parseInt(cid);
                                            count = CartDAO.countCustomerCart(cust_id);
                                            if (count > 0) {%>
                                    <a href="../Front/ShoppingCart.jsp">
                                        <i class="icon-handbag icons">
                                            <span style="color: red"><%=count%></span>
                                        </i>
                                    </a>
                                    <%} else {%>
                                    <a href="../Front/EmptyCart.jsp">

                                        <i class="icon-handbag icons">
                                            <span style="color: red"><%=count%></span>
                                        </i>
                                    </a>
                                    <% } %>
                                </li>
                                <% } else if (session.getAttribute("username") == null || count < 0) { %>
                                <a href="../Front/EmptyCart.jsp"><i class="icon-handbag icons"></i></a></li>
                                        <% } %>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--================End Top Header Area =================-->

        <!--================Menu Area =================-->
        <header class="shop_header_area">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a class="navbar-brand" href="#"><img src="img/logo.png" alt=""></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav categories">
                            <li class="nav-item">
                                <select class="selectpicker">
                                    <option>Categories</option>
                                    <%
                                        Connection con = DBConnection.getConnection();
                                        String sql = "select * from category";
                                        Statement st = con.createStatement();
                                        ResultSet rs = st.executeQuery(sql);
                                        while (rs.next()) {
                                    %>
                                    <option><a href="ProductByCategory.jsp?id=<%=rs.getInt("id")%>"><%=rs.getString("category_name")%></a></option>
                                    <% }%>
                                </select>
                                <!--<button>Search</button>-->
                            </li>
                        </ul>
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown submenu active">
                                <a class="nav-link dropdown-toggle" href="index.jsp">Home</a>                               
                            </li>
                            <li class="nav-item dropdown submenu">
                                <a class="nav-link dropdown-toggle" href="Shop.jsp">Shop</a>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="#">Blog</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">lookbook</a></li>
                            <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </header>
        <!--================End Menu Area =================-->