<%@page import="com.emobile.controller.LoginDAO"%>
<%
    String oldpwd = request.getParameter("oldpwd");
    String newpwd = request.getParameter("newpwd");
    String id = session.getAttribute("id").toString();
    int uid = Integer.parseInt(id);
    int count = LoginDAO.verifyPwd(uid, oldpwd);
    if (count > 0) {
        LoginDAO.changePwd(uid, newpwd);
        session.setAttribute("SuccessMsg", "Password Changed Successfully, Please login to continue");
        session.removeAttribute("uname");
        response.sendRedirect("LoginForm.jsp");
    }

%>
