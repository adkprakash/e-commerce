<%@page import="com.emobile.controller.LoginDAO"%>
<%@page import="com.emobile.model.Admin"%>
<%
    String uname = request.getParameter("username");
    String email = request.getParameter("email");
    String pwd = request.getParameter("password");

    Admin ob = new Admin();
    ob.setUsername(uname);
    ob.setEmail(email);
    ob.setPassword(pwd);

    int count = LoginDAO.insertAdmin(ob);
    if (count > 0) {
        response.sendRedirect("LoginForm.jsp");
    } else {
        response.sendRedirect("RegisterForm.jsp");
    }
%>