<%-- 
    Document   : AddQuantitySuccess
    Created on : Sep 1, 2019, 11:00:33 AM
    Author     : Dell
--%>

<%@page import="com.emobile.controller.ProductDAO"%>
<%@page import="com.emobile.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int pid = Integer.parseInt(request.getParameter("product_name"));
    int quantity = Integer.parseInt(request.getParameter("quantity"));

    Product ob = ProductDAO.getQty(pid);
    int qty = ob.getQuantity();

    ob.setId(pid);
    ob.setQuantity(qty + quantity);
    int count = ProductDAO.addQuantity(ob);
    if (count > 0) {
        session.setAttribute("SuccessMsg", "Quantity Inserted Successfully");
        response.sendRedirect("AddQuantity.jsp");
    } else {
        session.setAttribute("ErrorMsg", "Quantity Cannot Inserted");
        response.sendRedirect("AddQuantity.jsp");
    }
%>