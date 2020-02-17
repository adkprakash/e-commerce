<%@page import="com.emobile.controller.LoginDAO"%>
<%@page import="com.emobile.model.Login"%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if (session.getAttribute("uname") == null) {
        response.sendRedirect("LoginForm.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="au theme template">
        <meta name="author" content="Hau Nguyen">
        <meta name="keywords" content="au theme template">

        <!-- Title Page-->
        <title>Login</title>

        <!-- Fontfaces CSS-->
        <link href="css/font-face.css" rel="stylesheet" media="all">
        <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
        <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

        <!-- Bootstrap CSS-->
        <link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

        <!-- Vendor CSS-->
        <link href="vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
        <link href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
        <link href="vendor/wow/animate.css" rel="stylesheet" media="all">
        <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
        <link href="vendor/slick/slick.css" rel="stylesheet" media="all">
        <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
        <link href="vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="css/theme.css" rel="stylesheet" media="all">

    </head>

    <body class="animsition">
        <div class="page-wrapper">
            <div class="page-content--bge5">
                <div class="container">
                    <div class="login-wrap">
                        <div class="login-content">
                            <div class="login-logo">
                                <h4>CHANGE YOUR PASSWORD</h4>
                            </div>
                            <div class="login-form">
                                <form action="ChangePasswordSuccess.jsp" method="post" name="changepwd" onsubmit="return validation()">
                                    <div class="form-group">
                                        <%
                                            int uid = Integer.parseInt(session.getAttribute("id").toString());
                                            Login ob = LoginDAO.getOldPwd(uid);
                                            String oldPass = ob.getPassword();
                                        %>
                                        <label>Old Password</label>
                                        <input type="hidden" name="oldPass" value="<%=oldPass%>">
                                        <input class="au-input au-input--full" type="password" name="oldpwd" placeholder="">
                                        <div id="oldPasswordErr" style="color: red;"></div>
                                    </div>
                                    <div class="form-group">
                                        <label>New Password</label>
                                        <input class="au-input au-input--full" type="password" name="newpwd" placeholder="">
                                        <div id="newPasswordErr" style="color: red;"></div>
                                    </div>
                                    <div class="form-group">
                                        <label>Confirm Password</label>
                                        <input class="au-input au-input--full" type="password" name="conpwd" placeholder="">
                                        <div id="conPasswordErr" style="color: red;"></div>
                                    </div>
                                    <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function printError(elemId, msg) {
                document.getElementById(elemId).innerHTML = msg;
            }
            function validation() {
                var oldpwd = document.changepwd.oldpwd.value;
                var oldPass = document.changepwd.oldPass.value;
                var newpwd = document.changepwd.newpwd.value;
                var conpwd = document.changepwd.conpwd.value;
                var oldPasswordErr = newPasswordErr = conPasswordErr = true;

                if (oldpwd === '') {
                    printError("oldPasswordErr", "Please enter old password");
                } else if(oldpwd !== oldPass){
                    printError("oldPasswordErr", "Old password donot match");
                } else {
                    printError("oldPasswordErr", "");
                    oldPasswordErr = false;
                }
                if (newpwd === '') {
                    printError("newPasswordErr", "Please enter new password");
                } else if (newpwd.length < 4) {
                    printError("newPasswordErr", "Password must be greater than 4 character");
                } else {
                    printError("newPasswordErr", "");
                    newPasswordErr = false;
                }
                if (conpwd === '') {
                    printError("conPasswordErr", "Please enter confirm password");
                } else if (conpwd.length < 4) {
                    printError("conPasswordErr", "Password must be greater than 4 character");
                } else if (conpwd !== newpwd) {
                    printError("conPasswordErr", "Two passwords donot match");
                } else {
                    printError("conPasswordErr", "");
                    conPasswordErr = false;
                }
                if ((oldPasswordErr || newPasswordErr || conPasswordErr) === true) {
                    return false;
                }
            }
        </script>
        <!-- Jquery JS-->
        <script src="vendor/jquery-3.2.1.min.js"></script>
        <!-- Bootstrap JS-->
        <script src="vendor/bootstrap-4.1/popper.min.js"></script>
        <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
        <!-- Vendor JS       -->
        <script src="vendor/slick/slick.min.js">
        </script>
        <script src="vendor/wow/wow.min.js"></script>
        <script src="vendor/animsition/animsition.min.js"></script>
        <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
        </script>
        <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
        <script src="vendor/counter-up/jquery.counterup.min.js">
        </script>
        <script src="vendor/circle-progress/circle-progress.min.js"></script>
        <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script src="vendor/chartjs/Chart.bundle.min.js"></script>
        <script src="vendor/select2/select2.min.js">
        </script>

        <!-- Main JS-->
        <script src="js/main.js"></script>

    </body>

</html>
<!-- end document-->