<%-- 
    Document   : LoginSuccess
    Created on : Oct 21, 2019, 9:55:52 AM
    Author     : Dell
--%>

<%@page import="com.emobile.model.Admin"%>
<%@page import="com.emobile.controller.LoginDAO"%>
<%@page import="com.emobile.model.Login"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    Admin ob = new Admin();
    ob.setUsername(username);
    ob.setPassword(password);
    
    int count = LoginDAO.verifyAdmin(ob);
    if (count > 0) {
        session.setAttribute("uname", username);
        int id = ob.getId();
        session.setAttribute("id", id);
        response.sendRedirect("index.jsp");
    } else {
        session.setAttribute("ErrorMsg", "Customer Login Failed");
        response.sendRedirect("LoginForm.jsp");
    }
%>