package com.Admin.Shop;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.Database.Shop.DBConfig;
@WebServlet("/addpro")
public class AddProduct extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    Connection con;
    PreparedStatement ps;
    String proname, prodesc, proprice, proquant, catid, imgname;
    try {
        // Apache Commons-Fileupload library classes
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload sfu = new ServletFileUpload(factory);

        if (!ServletFileUpload.isMultipartContent(request)) {
            out.println("Sorry. No file uploaded");
            return;
        }

        // parse request
        List items = sfu.parseRequest(request);
        out.println(items.size());
        FileItem name = (FileItem) items.get(0);
        proname = name.getString();

        FileItem desc = (FileItem) items.get(1);
        prodesc = desc.getString();

        FileItem price = (FileItem) items.get(2);
        proprice = price.getString();

        FileItem quant = (FileItem) items.get(3);
        proquant = quant.getString();

        FileItem cid = (FileItem) items.get(4);
        catid = cid.getString();

//        // get uploaded file
        FileItem upfile = (FileItem) items.get(5);
//
        imgname=upfile.getName();
        out.println(imgname+"=>"+imgname.length());  
//        

        byte[] fileBytes = upfile.get();
        File folder = new File("C:\\Users\\TEST\\eclipse-workspace\\LetsShop\\WebContent\\images");
        if (!folder.exists()) {
            folder.mkdirs();
        }

        File file = new File(folder, imgname);
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        fileOutputStream.write(fileBytes);
        fileOutputStream.flush();
        
        DBConfig dbcon=new DBConfig();
        con =dbcon.getConnection();
        ps = con.prepareStatement("insert into product(product_name,product_details,product_price,quantity,category_id,image) "
                + "values(?,?,?,?,?,?)");
        ps.setString(1, proname);
        ps.setString(2, prodesc);
        ps.setFloat(3, Float.parseFloat(proprice));
        ps.setInt(4, Integer.parseInt(proquant));
        ps.setInt(5, Integer.parseInt(catid));
        ps.setString(6,imgname);
        ps.executeUpdate();
        ps.close();
        con.close();
        fileOutputStream.close();
        response.sendRedirect("product.jsp?pro=1");
    } catch (Exception ex) {
    	out.println(ex.getMessage());
    	ex.printStackTrace();
    }
}
}
