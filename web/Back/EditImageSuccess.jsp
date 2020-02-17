<%-- 
    Document   : EditImageSuccess
    Created on : Sep 2, 2019, 5:55:18 PM
    Author     : Dell
--%>
<%@page import="com.emobile.model.FileUpload"%>
<%@page import="java.util.Random"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.commons.fileupload.FileItemStream"%>
<%@page import="org.apache.commons.fileupload.FileItemIterator"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="com.emobile.controller.ProductDAO"%>
<%@page import="com.emobile.model.Product"%>
<%
    String pid = "";
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
                    if (fieldName.equals("id")) {
                        pid = value;
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
    ob.setId(Integer.parseInt(pid));
    ob.setImage(newFileName + ext);

    ProductDAO pDAO = new ProductDAO();
    int count = pDAO.updateImage(ob);
    if (count > 0) {
        response.sendRedirect("ViewProduct.jsp");
    } else {
        response.sendRedirect("EditImage.jsp");
    }
%>
