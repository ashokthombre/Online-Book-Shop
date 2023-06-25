/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.learn.mycart.servlets;

import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        
            
            try
            {
                
                String name=request.getParameter("name");
                String email=request.getParameter("email");
                String password=request.getParameter("password");
                String phone=request.getParameter("phone");
                String address=request.getParameter("address");
                
                 if(name.isEmpty())
                 {
                     out.println("Name is blank");
                     return;
                 }
                 
                 //creating user object to store data
                 
                User u= new User(name, email, password, phone, "default.jpg", address,"normal");
                  Session s=FactoryProvider.getFactory().openSession();
                       Transaction tx=s.beginTransaction();
                       
                     int userId=(int)s.save(u);
                       tx.commit();
                       
                       s.close();
                       out.println("Successfully saved");
                       out.println("<br> User Id is "+userId);
                       
                       HttpSession httpSession=request.getSession();
                       
                       httpSession.setAttribute("message", "Register Successfully.." +userId);
                       response.sendRedirect("register.jsp");
                      
                  
            }
            catch(Exception e)
            {
                e.printStackTrace();
                 
                       HttpSession httpSession=request.getSession();
                       
                       httpSession.setAttribute("warning", "Something went Wrong..");
                       response.sendRedirect("register.jsp");
                      
                
                
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
