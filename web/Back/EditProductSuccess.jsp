<%-- 
    Document   : AddProductSuccess
    Created on : Sep 1, 2019, 10:32:59 AM
    Author     : Dell
--%>
<%@page import="com.emobile.controller.ProductDAO"%>
<%@page import="com.emobile.model.Product"%>

<%
    int pid = Integer.parseInt(request.getParameter("id"));
    String productName = request.getParameter("product_name");
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    double price = Double.parseDouble(request.getParameter("price"));
    String color = request.getParameter("color");
    String ram = request.getParameter("ram");
    String rom = request.getParameter("rom");
    String description = request.getParameter("description");
    
    Product ob = new Product();
    ob.setId(pid);
    ob.setName(productName);
    ob.setQuantity(quantity);
    ob.setPrice(price);
    ob.setColor(color);
    ob.setRam(ram);
    ob.setRom(rom);
    ob.setDescription(description);

    ProductDAO pDAO = new ProductDAO();
    int count = pDAO.updateProduct(ob);
    if (count > 0) {
        session.setAttribute("SuccessMsg", "Product Edited Successfully");
        response.sendRedirect("ViewProduct.jsp");
    } else {
        session.setAttribute("ErrorMsg", "Product Cannot be Edited");
        response.sendRedirect("EditProduct.jsp");
    }
%>

