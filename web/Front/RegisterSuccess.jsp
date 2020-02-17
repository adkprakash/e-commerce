<%-- 
    Document   : RegisterSuccess
    Created on : Oct 17, 2019, 8:24:56 PM
    Author     : Dell
--%>

<%@page import="com.emobile.controller.LoginDAO"%>
<%@page import="com.emobile.model.Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String password = request.getParameter("password");

    Login ob = new Login();
    ob.setName(name);
    ob.setUsername(username);
    ob.setEmail(email);
    ob.setPhone(phone);
    ob.setAddress(address);
    ob.setPassword(password);

    int count = LoginDAO.insertUser(ob);
    if (count > 0) {
        session.setAttribute("SuccessMsg", "Customer Register Success, Please login to continue");
        response.sendRedirect("Login.jsp");
    } else {
        session.setAttribute("ErrorMsg", "Customer Register Failed");
        response.sendRedirect("Login.jsp");
    }
%>
