<%-- 
    Document   : DeleteCategory
    Created on : Aug 7, 2019, 6:00:51 PM
    Author     : Dell
--%>

<%@page import="com.emobile.controller.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    int count = CategoryDAO.deleteCategory(id);
    if (count > 0) {
        session.setAttribute("SuccessMsg", "Category Deleted Successfully");
        response.sendRedirect("ViewCategory.jsp");
    } else {
        session.setAttribute("ErrorMsg", "Category Cannot be Deleted");
        response.sendRedirect("ViewCategory.jsp");
    }
%>
