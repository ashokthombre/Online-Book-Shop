/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.learn.mycart.servlets;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Product;
import com.learn.mycart.helper.FactoryProvider;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.File.*;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

//       fetching category data
            String op = request.getParameter("operation");

            if (op.trim().equals("addcategory")) {
                String catTitle = request.getParameter("catTitle");
                String catDesc = request.getParameter("catDesc");
                
                 Category category=new Category();
                 category.setCategoryTitle(catTitle);
                 category.setCategoryDescription(catDesc);
                 
                 
                 CategoryDao cetegoryDao=new CategoryDao(FactoryProvider.getFactory());
                  int catId=cetegoryDao.saveCategory(category);
                 
                 //out.println("Category Saved");
                 
                 HttpSession session=request.getSession();
                  session.setAttribute("message", "Category Saves");
                 response.sendRedirect("admin.jsp");
                return;
                
                

            } else if (op.trim().equals("addproduct")) {
                
                out.println("Product");
                String pName=request.getParameter("pName");
                String pDesc=request.getParameter("pDesc");
                 int pPrice=Integer.parseInt(request.getParameter("pPrice"));
                 int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
                 int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
                 int catId=Integer.parseInt(request.getParameter("catId"));
                
                 
                 out.println(pName);
                 out.println(pDesc);
                 out.println(pPrice);
                 out.println(pDiscount);
                 out.println(pQuantity);
                 out.println(catId);
               
                Part part=request.getPart("pPic");
               
               Product p=new Product();
                p.setpName(pName);        
                p.setpDesc(pDesc);
                 p.setpPrice(pPrice);
              p.setpDiscount(pDiscount);
                 p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());
                
                 CategoryDao cDao=new CategoryDao(FactoryProvider.getFactory());
                
                  Category cat= cDao.getCategoryByID(catId);
                   p.setCategory(cat);
                   
                   
                  ProductDao pDao=new ProductDao(FactoryProvider.getFactory());
                   boolean f=pDao.saveProduct(p);
                   
                   //file upload
                   //find out the path to upload photo
                   
                   String path=request.getRealPath("img")+File.separator+"product"+File.separator+part.getSubmittedFileName();
                   System.out.println(path);
                   
//                   uploading code

                 try
                 {
                    FileOutputStream fos=new FileOutputStream(path);
                   
                   InputStream fis=part.getInputStream();
                    
//                   reading data


                     byte[]data=new byte[fis.available()];
                   
                     fis.read(data);
                     
                     fos.write(data);
                     fos.close();
                      
                 }
                 catch(Exception e)
                 {
                     e.printStackTrace();
                 }
                  
                     
                   
                HttpSession session=request.getSession();
                  session.setAttribute("message", "Product Saved.");
                 response.sendRedirect("admin.jsp");
                return;
                                
                   
                 
                 

            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
