<%@page import="com.emobile.controller.CartDAO"%>
<%
    int pid = Integer.parseInt(request.getParameter("pid"));
    int cid = Integer.parseInt(request.getParameter("cid"));
    String color = request.getParameter("color");
    String ram = request.getParameter("ram");
    String rom = request.getParameter("rom");

    int countCart = CartDAO.countCustomerCart(cid);
    if (countCart > 1) {
        int count = CartDAO.removeCart(pid, cid, color, ram, rom);
        if (count > 0) {
            response.sendRedirect("ShoppingCart.jsp");
        }
    } else if (countCart == 1) {
        int count = CartDAO.removeCart(pid, cid, color, ram, rom);
        if (count > 0) {
            response.sendRedirect("EmptyCart.jsp");
        }
    }
%>