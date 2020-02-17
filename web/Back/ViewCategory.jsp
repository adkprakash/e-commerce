<%-- 
   Document   : ViewCategory
   Created on : Aug 7, 2019, 5:17:50 PM
   Author     : Dell
--%>

<%@page import="java.util.List"%>
<%@page import="com.emobile.model.Category"%>
<%@page import="com.emobile.controller.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="include/header.jsp"/>
<jsp:include page="include/navbar.jsp"/>
<%
    if (session.getAttribute("uname") == null) {
        response.sendRedirect("LoginForm.jsp");
    }
    String category = request.getParameter("search");
    List<Category> cList;
    CategoryDAO cDAO = new CategoryDAO();
    if(category != null){
        cList = cDAO.retrieveCategoryBySearch(category);
    } else {
        cList = cDAO.retrieveCategory();
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
                        <input class="au-input au-input--xl" type="text" name="search" placeholder="Search Category..." />
                        <button class="au-btn--submit" type="submit">
                            <i class="zmdi zmdi-search"></i>
                        </button>
                    </form>
                    <div class="table-responsive m-b-40">
                        <table class="table table-borderless table-data3">
                            <thead>
                                <tr>
                                    <th>Category Name</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Category c : cList) {
                                %>
                                <tr>
                                    <td><a href="ProductByCategory.jsp?id=<%=c.getId()%>"><%=c.getCategory()%></a></td>
                                    <td>
                                        <div class="table-data-feature">
                                            <a href="EditCategory.jsp?id=<%=c.getId()%>" class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                                                <i class="zmdi zmdi-edit"></i>
                                            </a>
                                            <a href="DeleteCategory.jsp?id=<%=c.getId()%>" onclick="return confirm('Are you sure you want to delete this category?')" class="item" data-toggle="tooltip" data-placement="top" title="Delete">
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