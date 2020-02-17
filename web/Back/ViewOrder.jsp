<%@page import="java.util.List"%>
<%@page import="com.emobile.model.Order"%>
<%@page import="com.emobile.controller.OrderDAO"%>
<jsp:include page="include/header.jsp"/>
<jsp:include page="include/navbar.jsp"/>
<!-- MAIN CONTENT-->
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
                        List<Order> oList = OrderDAO.viewOrder();
                        int i = 1;
                        for (Order o : oList) {
                    %>
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title" v-if="headerText">Order #<%=i%></strong>
                        </div>
                        <div class="card-body p-0">
                            <table class="table table-hover table-striped table-align-middle mb-0"> 
                                <tbody>
                                    <tr>
                                        <td>Customer Name</td>
                                        <td><%=o.getName()%></td>
                                    </tr>
                                    <tr>
                                        <td>Delivery Address</td>
                                        <td><%=o.getAddress()%></td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td><%=o.getEmail()%></td>
                                    </tr>
                                    <tr>
                                        <td>Phone</td>
                                        <td><%=o.getPhone()%></td>
                                    </tr>
                                    <tr>
                                        <td>Order Date</td>
                                        <td><%=o.getDate()%></td>
                                    </tr>
                                </tbody>
                            </table>
                            <center>
                                <h5><a href="ViewOrderDetail.jsp?id=<%=o.getId()%>"><u>View Order Details</u></a></h5>
                            </center>
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
