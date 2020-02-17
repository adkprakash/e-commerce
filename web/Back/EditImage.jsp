<%-- 
    Document   : EditImage.jsp
    Created on : Sep 2, 2019, 5:44:59 PM
    Author     : Dell
--%>

<%@page import="com.emobile.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="include/header.jsp"/>
<jsp:include page="include/navbar.jsp"/>

<%   
    int id = Integer.parseInt(request.getParameter("id"));
%>

<div class="main-content">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong>Edit Image Form</strong>
                        </div>
                        <div class="card-body card-block">
                            <form action="EditImageSuccess.jsp" method="post" enctype="multipart/form-data" class="form-horizontal" onsubmit="" name="product">
                                <input type="hidden" name="id" value="<%=id%>"/>
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

<jsp:include page="include/footer.jsp"/>