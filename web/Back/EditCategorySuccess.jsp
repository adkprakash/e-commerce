<%-- 
    Document   : EditCategorySuccess
    Created on : Aug 7, 2019, 5:52:32 PM
    Author     : Dell
--%>

<%@page import="com.emobile.controller.CategoryDAO"%>
<%@page import="com.emobile.model.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String category = request.getParameter("category");

    Category ob = new Category();
    ob.setId(id);
    ob.setCategory(category);

    CategoryDAO cDAO = new CategoryDAO();
    int status = cDAO.updateCategory(ob);
    if(status > 0){
        session.setAttribute("SuccessMsg", "Category Edited Successfully");
        response.sendRedirect("ViewCategory.jsp");
    } else {
        session.setAttribute("ErrorMsg", "Category Cannot be Edited");
        response.sendRedirect("ViewCategory.jsp");
    }
%>
