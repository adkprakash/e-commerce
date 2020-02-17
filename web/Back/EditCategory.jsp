<%-- 
    Document   : EditCategory
    Created on : Aug 3, 2019, 2:14:08 PM
    Author     : Dell
--%>

<%@page import="com.emobile.model.Category"%>
<%@page import="com.emobile.controller.CategoryDAO"%>
<jsp:include page="include/header.jsp"/>
<jsp:include page="include/navbar.jsp"/>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Category ob = CategoryDAO.viewById(id);
%>
<div class="main-content">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <strong>Edit Category Form</strong>
                    </div>
                    <div class="card-body card-block">
                        <%
                            Object success = session.getAttribute("SuccessMsg");
                            Object error = session.getAttribute("ErrorMsg");
                            if (success != null) {%>
                        <div class="alert alert-success" role="alert"><%=success%></div>
                        <% session.removeAttribute("SuccessMsg"); %>
                        <% } else if (error != null) { %>
                        <div class="alert alert-danger" role="alert"><%=error%></div>
                        <% session.removeAttribute("ErrorMsg");
                            }%>
                        <form action="EditCategorySuccess.jsp" method="post" onsubmit="return validation()" name="category">
                            <div class="row form-group">
                                <input type="hidden" name="id" value="<%=ob.getId()%>"/>
                                    <div class="col col-md-3">
                                        <label for="text-input" class=" form-control-label">Category Name</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="text-input" name="category" value="<%=ob.getCategory()%>" placeholder="Enter category name" class="form-control">
                                        <div id="categoryErr" style="color: red;"></div>
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
                <div class="row">
                    <div class="col-md-12">
                        <div class="copyright">
                            <p>Copyright &copy 2019. All rights reserved.</p>
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
        var category = document.category.category.value;
        var categoryErr = true;

        if (category.trim() === '') {
            printError("categoryErr", "Please enter category name");
        } else {
            if (isNaN(category) === false) {
                printError("categoryErr", "Category name must not be a number");
            } else {
                printError("categoryErr", "");
                categoryErr = false;
            }
        }
        if (categoryErr === true) {
            return false;
        }
    }
</script>
 
<jsp:include page="include/footer.jsp"/>
