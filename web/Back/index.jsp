<jsp:include page="include/header.jsp"/>
<jsp:include page="include/navbar.jsp"/>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if (session.getAttribute("uname") == null) {
        response.sendRedirect("LoginForm.jsp");
    }
%>
<div class="main-content">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <i class="fa fa-user"></i>
                            <strong class="card-title pl-2">Profile Card</strong>
                        </div>
                        <div class="card-body">
                            <div class="mx-auto d-block">
                                <img class="rounded-circle mx-auto d-block" src="images/icon/avatar-01.jpg" alt="Card image cap">
                                <h5 class="text-sm-center mt-2 mb-1"><%=session.getAttribute("uname")%></h5>
                                <div class="location text-sm-center">
                                    <i class="fa fa-map-marker"></i> California, United States</div>
                            </div>
                            <hr>
                            <div class="card-text text-sm-center">
                                <a href="#">
                                    <i class="fa-facebook"></i>
                                </a>
                                <a href="#">
                                    <i class="fa fa-twitter pr-1"></i>
                                </a>
                                <a href="#">
                                    <i class="fa fa-linkedin pr-1"></i>
                                </a>
                                <a href="#">
                                    <i class="fa fa-pinterest pr-1"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="include/footer.jsp"/>