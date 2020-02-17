<%@page import="com.emobile.controller.LoginDAO"%>
<%@page import="com.emobile.model.Admin"%>
<%
    String email = request.getParameter("email");
    String pwd = request.getParameter("newpwd");
    
    Admin ob = new Admin();
    ob.setEmail(email);
    ob.setPassword(pwd);
    
    int status = LoginDAO.forgotPwd(ob);
    if(status > 0){
        out.println("Password has been changed");
        response.sendRedirect("LoginForm.jsp");
    }
%>