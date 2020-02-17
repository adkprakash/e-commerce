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
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong>Add Product Form</strong>
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
                            <form action="AddProductSuccess.jsp" method="post" enctype="multipart/form-data" class="form-horizontal" onsubmit="return validation()" name="product">
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="select" class=" form-control-label">Select Category</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <select name="category_name" id="select" class="form-control">
                                            <option value="0">Select Category</option>
                                            <%
                                                Connection con = DBConnection.getConnection();
                                                String sql = "select * from category";
                                                Statement st = con.createStatement();
                                                ResultSet rs = st.executeQuery(sql);
                                                while (rs.next()) {
                                            %>
                                            <option value="<%=rs.getInt("id")%>"><%=rs.getString("category_name")%></option>
                                            <% }%>
                                        </select>
                                        <div id="categoryErr" style="color: red;"></div>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="text-input" class=" form-control-label">Product Name</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="text-input" name="product_name" placeholder="" class="form-control">
                                        <div id="productErr" style="color: red;"></div>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="text-input" class=" form-control-label">Quantity</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="text-input" name="quantity" placeholder="" class="form-control">
                                        <div id="quantityErr" style="color: red;"></div>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="text-input" class=" form-control-label">Price</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="text-input" name="price" placeholder="" class="form-control">
                                        <div id="priceErr" style="color: red;"></div>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="text-input" class=" form-control-label">Color</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <small>[Enter comma separated value for multiple color]</small>
                                        <input type="text" id="text-input" name="color" placeholder="" class="form-control">
                                        <div id="colorErr" style="color: red;"></div>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="text-input" class=" form-control-label">RAM</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <small>[Enter comma separated value for multiple RAM]</small>
                                        <input type="text" id="text-input" name="ram" placeholder="" class="form-control">
                                        <div id="ramErr" style="color: red;"></div>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="text-input" class=" form-control-label">ROM</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <small>[Enter comma separated value for multiple ROM]</small>
                                        <input type="text" id="text-input" name="rom" placeholder="" class="form-control">
                                        <div id="romErr" style="color: red;"></div>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="textarea-input" class=" form-control-label">Description</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <textarea name="description" id="textarea-input" rows="3" placeholder="" class="form-control"></textarea>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="file-input" class=" form-control-label">Image</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="file" id="file-input" name="image1" accept="image/*" class="form-control-file" required>
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
</div>
<script type="text/javascript">
    function printError(elemId, msg) {
        document.getElementById(elemId).innerHTML = msg;
    }
    function validation() {
        var category = document.product.category_name.selectedIndex;
        var product = document.product.product_name.value;
        var quantity = document.product.quantity.value;
        var price = document.product.price.value;
        var color = document.product.color.value;
        var ram = document.product.ram.value;
        var rom = document.product.rom.value;
        var categoryErr = productErr = quantityErr = priceErr = colorErr = ramErr = romErr = imageErr = true;

        if (category === 0) {
            printError("categoryErr", "Please select a category");
        } else {
            printError("categoryErr", "");
            categoryErr = false;
        }
        if (product.trim() === '') {
            printError("productErr", "Please enter product name");
        } else {
            if (isNaN(product) === false) {
                printError("productErr", "Product name must not be a number");
            } else {
                printError("productErr", "");
                productErr = false;
            }
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
        if (price.trim() === '') {
            printError("priceErr", "Please enter price");
        } else {
            if (isNaN(price)) {
                printError("priceErr", "Price must be a number");
            } else {
                if (price < 0) {
                    printError("priceErr", "Price must be positive number");
                } else {
                    printError("priceErr", "");
                    priceErr = false;
                }
            }
        }
        if (color.trim() === '') {
            printError("colorErr", "Please enter color name");
        } else {
            if (isNaN(color) === false) {
                printError("colorErr", "Color name must not be a number");
            } else {
                printError("colorErr", "");
                colorErr = false;
            }
        }
        if (ram.trim() === '') {
            printError("ramErr", "Please enter RAM");
        } else {
            printError("ramErr", "");
            ramErr = false;
        }
        if (rom.trim() === '') {
            printError("romErr", "Please enter ROM");
        } else {
            printError("romErr", "");
            romErr = false;
        }
        if (categoryErr || productErr || quantityErr || colorErr || ramErr || romErr === true) {
            return false;
        }
    }
</script>
<jsp:include page="include/footer.jsp"/>