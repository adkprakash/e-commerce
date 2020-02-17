<%@page import="com.emobile.model.OrderDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.emobile.controller.OrderDAO"%>
<jsp:include page="include/header.jsp"/>
<jsp:include page="include/navbar.jsp"/>
<%
if (session.getAttribute("uname") == null) {
    response.sendRedirect("LoginForm.jsp");
}
%>
<div class="main-content">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <%
                        int oid = Integer.parseInt(request.getParameter("id"));
                        List<OrderDetail> oList = OrderDAO.viewOrderDetail(oid);
                        int i = 1;
                        for (OrderDetail o : oList) {
                    %>
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title" v-if="headerText">Product Details #<%=i%></strong>
                        </div>
                        <div class="card-body p-0">
                            <table class="table table-hover table-striped table-align-middle mb-0"> 
                                <tbody>
                                    <tr>
                                        <td>Product Name</td>
                                        <td><%=o.getProduct_name()%></td>
                                    </tr>
                                    <tr>
                                        <td>Quantity</td>
                                        <td><%=o.getQuantity()%></td>
                                    </tr>
                                    <tr>
                                        <td>Unit Price</td>
                                        <td>Rs. <%=o.getPrice()%></td>
                                    </tr>
                                    <tr>
                                        <td>Color</td>
                                        <td><%=o.getColor()%></td>
                                    </tr>
                                    <tr>
                                        <td>Ram</td>
                                        <td><%=o.getRam()%> GB</td>
                                    </tr>
                                    <tr>
                                        <td>Rom</td>
                                        <td><%=o.getRom()%> GB</td>
                                    </tr>
                                    <tr>
                                        <td>Total Price</td>
                                        <td>Rs. <%=(o.getQuantity() * o.getPrice())%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div> 
                    </div>
                    <% i++;
                        }%>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="include/footer.jsp"/>