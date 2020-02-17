<%-- 
    Document   : ViewProduct
    Created on : Aug 9, 2019, 4:53:08 PM
    Author     : Dell
--%>

<%@page import="java.util.List"%>
<%@page import="com.emobile.model.Product"%>
<%@page import="com.emobile.controller.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="include/header.jsp"/>
<jsp:include page="include/navbar.jsp"/>
<%
    if (session.getAttribute("uname") == null) {
        response.sendRedirect("LoginForm.jsp");
    }
    String product = request.getParameter("search");
    List<Product> pList;
    ProductDAO pDAO = new ProductDAO();
    if (product != null) {
        pList = pDAO.viewProductBySearch(product);
    } else {
        pList = pDAO.viewProduct();
    }
%>
<div class="main-content">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="row m-t-30">
                <div class="col-md-12">
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
                                    <td><img src="../images/<%=p.getImage()%>" width="80" height="80" alt="Error">
                                        <a href="EditImage.jsp?id=<%=p.getId()%>">Change</a>
                                    </td>
                                    <td><%=p.getDescription()%></td>
                                    <td>
                                        <div class="table-data-feature">
                                            <a href="EditProduct.jsp?id=<%=p.getId()%>" class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                                                <i class="zmdi zmdi-edit"></i>
                                            </a>
                                            <a href="DeleteProduct.jsp?id=<%=p.getId()%>" onclick="return confirm('Are you sure you want to delete this item?')" class="item" data-toggle="tooltip" data-placement="top" title="Delete">
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
