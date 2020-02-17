<%-- 
    Document   : navbar
    Created on : Aug 2, 2019, 7:18:01 AM
    Author     : Dell
--%>

<body class="animsition">
    <div class="page-wrapper">

        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="#"><h5>Online Mobile Store</h5></a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li>
                            <a href="index.jsp"><i class="fas fa-home"></i>Home</a>
                        </li>
                        <li>
                            <a href="AddCategory.jsp"><i class="fas fa-plus"></i>Add Category</a>
                        </li>
                        <li>
                            <a href="AddProduct.jsp"><i class="fas fa-plus"></i>Add Product</a>
                        </li>
                        <li>
                            <a href="AddQuantity.jsp"><i class="fas fa-star"></i>Add Quantity</a>
                        </li>
                        <li>
                            <a href="ViewCategory.jsp"><i class="fas fa-list"></i>View Category</a>
                        </li>
                        <li>
                            <a href="ViewProduct.jsp"><i class="fas fa-list"></i>View Product</a>
                        </li>
                        <li>
                            <a href="ViewOrder.jsp"><i class="fas fa-list"></i>View Order</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">
                            <span>Manage Product</span>
                            <%
                                if (session.getAttribute("uname") != null) {
                            %>
                            <div class="header-button">
                                <div class="account-wrap">
                                    <div class="account-item clearfix js-item-menu">
                                        <div class="content">
                                            <a class="js-acc-btn" href="#"><%=session.getAttribute("uname")%></a>
                                        </div>
                                        <div class="account-dropdown js-dropdown">
                                            <div class="account-dropdown__body">
                                                <div class="account-dropdown__item">
                                                    <a href="ChangePassword.jsp">
                                                        <i class="fas fa-lock"></i>Change Password</a>
                                                </div>
                                                <div class="account-dropdown__item">
                                                    <a href="Logout.jsp">
                                                        <i class="zmdi zmdi-power"></i>Logout</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% } else { %>
                            <div class="header-button">
                                <div class="account-wrap">
                                    <div class="account-item ">
                                        <div class="content">
                                            <a class="js-acc-btn" href="LoginForm.jsp">Login</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% }%>
                        </div>
                    </div>
                </div>
            </header>
            <!-- HEADER DESKTOP-->