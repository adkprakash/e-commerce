<%-- 
    Document   : DeleteProduct
    Created on : Aug 30, 2019, 12:41:54 PM
    Author     : Dell
--%>

<%@page import="com.emobile.controller.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    int count = ProductDAO.deleteProduct(id);
    if (count > 0) {
        session.setAttribute("SuccessMsg", "Product Deleted Successfully");
        response.sendRedirect("ViewProduct.jsp");
    } else {
        session.setAttribute("ErrorMsg", "Product Cannot be Deleted");
        response.sendRedirect("ViewProduct.jsp");
    }
%>
