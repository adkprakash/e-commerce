<%-- 
    Document   : AddProductSuccess
    Created on : Sep 1, 2019, 10:32:59 AM
    Author     : Dell
--%>
<%@page import="com.emobile.controller.ProductDAO"%>
<%@page import="com.emobile.model.Product"%>
<%@page import="com.emobile.model.FileUpload"%>
<%@page import="java.util.Random"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.commons.fileupload.FileItemStream"%>
<%@page import="org.apache.commons.fileupload.FileItemIterator"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>

<%
    String cid = "", productName = "", quantity = "", price = "", color = "", ram = "", rom = "", description = "";
    String newFileName = "";
    String ext = "";
    //uploading image into folder
    boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
    if (isMultiPart) {
        ServletFileUpload upload = new ServletFileUpload();
        try {
            FileItemIterator itr = upload.getItemIterator(request);
            while (itr.hasNext()) {
                FileItemStream item = itr.next();
                if (item.isFormField()) {
                    String fieldName = item.getFieldName();
                    InputStream is = item.openStream();
                    byte[] b = new byte[is.available()];
                    is.read(b);
                    String value = new String(b);
                    if (fieldName.equals("category_name")) {
                        cid = value;
                    } else if (fieldName.equals("product_name")) {
                        productName = value;
                    } else if (fieldName.equals("quantity")) {
                        quantity = value;
                    } else if (fieldName.equals("price")) {
                        price = value;
                    } else if (fieldName.equals("color")) {
                        color = value;
                    } else if (fieldName.equals("ram")) {
                        ram = value;
                    } else if (fieldName.equals("rom")) {
                        rom = value;
                    } else if (fieldName.equals("description")) {
                        description = value;
                    }
                } else {
                    String fileName = item.getName().trim();
                    int pos = fileName.indexOf(".");
                    ext = fileName.substring(pos);
                    Random random = new Random();
                    newFileName = String.valueOf(random.nextDouble());
                    String path = getServletContext().getRealPath("/");
                    FileUpload.processFile(path, item, newFileName, ext);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    //inserting product into database
    Product ob = new Product();
    ob.setCid(Integer.parseInt(cid));
    ob.setName(productName);
    ob.setQuantity(Integer.parseInt(quantity));
    ob.setPrice(Double.parseDouble(price));
    ob.setColor(color);
    ob.setRam(ram);
    ob.setRom(rom);
    ob.setDescription(description);
    ob.setImage(newFileName + ext);

    ProductDAO pDAO = new ProductDAO();
    int count = pDAO.addProduct(ob);
    if (count > 0) {
        session.setAttribute("SuccessMsg", "Product Inserted Successfully");
        response.sendRedirect("AddProduct.jsp");
    } else {
        session.setAttribute("ErrorMsg", "Product Cannot Inserted");
        response.sendRedirect("AddProduct.jsp");
    }
%>
