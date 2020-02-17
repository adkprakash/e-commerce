<%@page import="com.emobile.controller.ProductDAO"%>
<%@page import="com.emobile.model.Product"%>
<%@page import="java.util.List"%>
<jsp:include page="include/header.jsp"/>
<jsp:include page="include/navbar.jsp"/>

<%
    if (session.getAttribute("uname") == null) {
        response.sendRedirect("LoginForm.jsp");
    }
    
    int cid = Integer.parseInt(request.getParameter("id"));
    String product = request.getParameter("search");
    ProductDAO pDAO = new ProductDAO();
    List<Product> pList;
    if (product != null) {
        pList = pDAO.viewProductByCategory(cid, product);
    } else {
        pList = ProductDAO.viewByCategory(cid);
    }
%>
<div class="main-content">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="row m-t-30">
                <div class="col-md-12">
                    <form class="form-header float-right" method="POST">
                        <input class="au-input au-input--xl" type="text" name="search" placeholder="Search Product..." />
                        <button class="au-btn--submit" type="submit">
                            <i class="zmdi zmdi-search"></i>
                        </button>
                    </form>
                    <div class="table-responsive m-b-40">
                        <table class="table table-borderless table-data3">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Color</th>
                                    <th>RAM</th>
                                    <th>ROM</th>
                                    <th>Image</th>
                                    <th>Description</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Product p : pList) {
                                %>
                                <tr>
                                    <td><%=p.getName()%></td>
                                    <td><%=p.getQuantity()%></td>
                                    <td><%=p.getPrice()%></td>
                                    <td><%=p.getColor()%></td>
                                    <td><%=p.getRam()%></td>
                                    <td><%=p.getRom()%></td>
                                    <td><img src="images/<%=p.getImage()%>" width="80" height="80" alt="Error">
                                        <a href="EditImage.jsp?id=<%=p.getId()%>">Change</a>
                                    </td>
                                    <td><%=p.getDescription()%></td>
                                    <td>
                                        <div class="table-data-feature">
                                            <a href="EditProduct.jsp?id=<%=p.getId()%>" class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                                                <i class="zmdi zmdi-edit"></i>
                                            </a>
                                            <a href="DeleteProduct.jsp?id=<%=p.getId()%>" class="item" data-toggle="tooltip" data-placement="top" title="Delete">
                                                <i class="zmdi zmdi-delete"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="include/footer.jsp"/>