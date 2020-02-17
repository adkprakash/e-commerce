<%@page import="com.emobile.model.Product"%>
<%@page import="com.emobile.controller.ProductDAO"%>
<%@page import="com.emobile.controller.CartDAO"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.emobile.util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.emobile.model.OrderDetail"%>
<%@page import="com.emobile.controller.OrderDAO"%>
<%@page import="com.emobile.model.Order"%>
<%@page import="java.util.Date"%>
<%
    String cust_id = session.getAttribute("cid").toString();
    int cid = Integer.parseInt(cust_id);
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    Date date = new Date();

    Order ob = new Order();
    ob.setCustomer_id(cid);
    ob.setName(name);
    ob.setAddress(address);
    ob.setEmail(email);
    ob.setPhone(phone);
    ob.setDate(date);

    int count = OrderDAO.saveOrder(ob);
    if (count > 0) {
        int id = 0;
        Connection con = DBConnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from tbl_order");
        if (rs.last()) {
            id = rs.getInt("id");
        }
        int totalItem = Integer.parseInt(request.getParameter("totalItem")) + 1;

        for (int i = 1; i < totalItem; i++) {
            int pid = Integer.parseInt(request.getParameter("pid" + i));
            int qty = Integer.parseInt(request.getParameter("quantity" + i));
            double price = Double.parseDouble(request.getParameter("price" + i));
            String color = request.getParameter("color" + i);
            String ram = request.getParameter("ram" + i);
            String rom = request.getParameter("rom" + i);

            OrderDetail od = new OrderDetail();
            od.setOrder_id(id);
            od.setProduct_id(pid);
            od.setQuantity(qty);
            od.setPrice(price);
            od.setColor(color);
            od.setRam(ram);
            od.setRom(rom);

            OrderDAO.saveOrderDetail(od);
            Product obb = ProductDAO.getQty(pid);
            int totalQty = obb.getQuantity();
            ProductDAO.updateQuantity(pid, (totalQty - qty));
            CartDAO.removeCartDetail(cid);
        }
        session.setAttribute("SuccessMsg", "YOUR ORDER HAS BEEN PLACED, PLEASE CONTINUE SHOPPING");
        response.sendRedirect("Shop.jsp");
    }
%>
