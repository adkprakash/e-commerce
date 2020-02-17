<%-- 
    Document   : addquantity
    Created on : Jul 19, 2019, 3:28:02 PM
    Author     : Dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.emobile.util.DBConnection"%>
<%@page import="java.sql.Connection"%>
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
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <strong>Add Quantity Form</strong>
                    </div>
                    <div class="card-body card-block">
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
                        <form action="AddQuantitySuccess.jsp" method="post" class="" onsubmit="return validation()" name="qty">
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="select" class=" form-control-label">Select Product</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <select name="product_name" id="select" class="form-control">
                                        <option value="0">Select Product</option>
                                        <%
                                            Connection con = DBConnection.getConnection();
                                            String sql = "select * from product";
                                            Statement st = con.createStatement();
                                            ResultSet rs = st.executeQuery(sql);
                                            while (rs.next()) {
                                        %>
                                        <option value="<%=rs.getInt("id")%>"><%=rs.getString("name")%></option>
                                        <% }%>
                                    </select>
                                    <div id="productErr" style="color: red;"></div>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="text-input" class=" form-control-label">Quantity</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" id="text-input" name="quantity" placeholder="Enter quantity" class="form-control">
                                    <div id="quantityErr" style="color: red;"></div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm">
                                    <i class="fa fa-dot-circle-o"></i> Submit
                                </button>
                                <button type="reset" class="btn btn-danger btn-sm">
                                    <i class="fa fa-ban"></i> Reset
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function printError(elemId, msg) {
        document.getElementById(elemId).innerHTML = msg;
    }
    function validation() {
        var productErr = quantityErr = true;
        var product = document.qty.product_name.selectedIndex;
        var quantity = document.qty.quantity.value;

        if (product === 0) {
            printError("productErr", "Please select a product");
        } else {
            printError("productErr", "");
            productErr = false;
        }
        if (quantity.trim() === '') {
            printError("quantityErr", "Please enter quantity");
        } else {
            if (isNaN(quantity)) {
                printError("quantityErr", "Quantity must be a number");
            } else {
                if (quantity < 0) {
                    printError("quantityErr", "Quantity must be positive number");
                } else {
                    printError("quantityErr", "");
                    quantityErr = false;
                }
            }
        }
        if (productErr || quantityErr === true) {
            return false;
        }

    }
</script>
<jsp:include page="include/footer.jsp"/>