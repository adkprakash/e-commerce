<%-- 
    Document   : AddToCart
    Created on : Oct 10, 2019, 6:16:17 PM
    Author     : Dell
--%>
<%@page import="com.emobile.model.Product"%>
<%@page import="com.emobile.controller.ProductDAO"%>
<%@page import="com.emobile.controller.CartDAO"%>
<%@page import="com.emobile.model.Cart"%>

<%
    String cid = "";
    int cust_id = 0;
    String sid = session.getId();
    if (session.getAttribute("cid") == null) {
        response.sendRedirect("Login.jsp");
    } else {
        cid = session.getAttribute("cid").toString();
        cust_id = Integer.parseInt(cid);
    }
    int pid = Integer.parseInt(request.getParameter("pid"));
    double price = Double.parseDouble(request.getParameter("price"));
    String color = request.getParameter("color");
    String ram = request.getParameter("ram");
    String rom = request.getParameter("rom");
    int quantity = Integer.parseInt(request.getParameter("quantity"));

    Cart c = new Cart();
    c.setCustomer_id(cust_id);
    c.setProduct_id(pid);
    c.setColor(color);
    c.setRam(ram);
    c.setRom(rom);

    int qty = CartDAO.getQty(c);
    Product p = ProductDAO.getQty(pid);
    int pQty = p.getQuantity();
    if (qty > 0) {
        int nQty = quantity + qty;
        if (nQty <= pQty) {
            Cart ob = new Cart();
            ob.setCustomer_id(cust_id);
            ob.setProduct_id(pid);
            ob.setColor(color);
            ob.setRam(ram);
            ob.setRom(rom);
            ob.setQuantity(quantity + qty);

            int count = CartDAO.updateCart(ob);
            if (count > 0) {
                session.setAttribute("SuccessCart", "Quantity updated into cart");
                response.sendRedirect("Shop.jsp");
            } else {
                session.setAttribute("ErrorCart", "Item cannot be added into cart");
                response.sendRedirect("Shop.jsp");
            }
        } else {
            session.setAttribute("ErrorCart", "Only " + pQty + " items are left");
            response.sendRedirect("Shop.jsp");
        }
    } else {
        int cQty = CartDAO.getQtyById(pid);
        int nQty = quantity + cQty;
        if (nQty <= pQty) {
            Cart ob = new Cart();
            ob.setCustomer_id(cust_id);
            ob.setProduct_id(pid);
            ob.setSession_id(sid);
            ob.setColor(color);
            ob.setRam(ram);
            ob.setRom(rom);
            ob.setPrice(price);
            ob.setQuantity(quantity);

            CartDAO cDAO = new CartDAO();
            int count = cDAO.addCart(ob);
            if (count > 0) {
                session.setAttribute("SuccessCart", quantity + " items added into cart");
                response.sendRedirect("Shop.jsp");
            } else {
                session.setAttribute("ErrorCart", "Item cannot be added into cart");
                response.sendRedirect("Shop.jsp");
            }
        } else {
            session.setAttribute("ErrorCart", "Only " + pQty + " items are left");
            response.sendRedirect("Shop.jsp");
        }
    }
%>