<%-- 
    Document   : AddCategorySuccess
    Created on : Sep 1, 2019, 10:43:56 AM
    Author     : Dell
--%>

<%@page import="com.emobile.controller.CategoryDAO"%>
<%@page import="com.emobile.model.Category"%>
<%
    String category = request.getParameter("category");
    Category ob = new Category();
    ob.setCategory(category);
    CategoryDAO pDAO = new CategoryDAO();
    int count = pDAO.addCategory(ob);
    if (count > 0) {
        session.setAttribute("SuccessMsg", "Category Inserted Successfully");
        response.sendRedirect("AddCategory.jsp");
    } else {
        session.setAttribute("ErrorMsg", "Category Cannot Inserted");
        response.sendRedirect("AddCategory.jsp");
    }
%>