<%-- 
    Document   : LoginSuccess
    Created on : Oct 21, 2019, 9:55:52 AM
    Author     : Dell
--%>

<%@page import="com.emobile.controller.LoginDAO"%>
<%@page import="com.emobile.model.Login"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    Login ob = new Login();
    ob.setUsername(username);
    ob.setPassword(password);
    
    int count = LoginDAO.verifyUser(ob);
    if (count > 0) {
        session.setAttribute("username", username);
        int id = ob.getId();
        session.setAttribute("cid", id);
        response.sendRedirect("index.jsp");
    } else {
        session.setAttribute("LoginErrorMsg", "Customer Login Failed");
        response.sendRedirect("Login.jsp");
    }
%>