/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.User_Dao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author hp
 */
@MultipartConfig
public class Edit extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Edit</title>");            
            out.println("</head>");
            out.println("<body>");
            
            //fetch data
            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String about = request.getParameter("user_about");
            Part part = request.getPart("image");
            String imageName = part.getSubmittedFileName();
            System.out.println(imageName);
            //get user from session
            
            HttpSession s = request.getSession();
            User user = (User)s.getAttribute("currentUser");
            
            //get the details of user
            
            user.setName(name);
            user.setEmail(email);
            user.setPassword(password);
            user.setAbout(about);
            // old image delete
            String oldFile = user.getProfile();
            if (!imageName.equals("")) {
                user.setProfile(imageName);
            }
            
            //update  into database
            
            User_Dao dao = new User_Dao(ConnectionProvider.getConnection());
            
            boolean ans = dao.updateUser(user);
            if (ans) {
//                out.println("updated user");
                String pathOld = request.getRealPath("/" + "pics" + File.separator + oldFile);
//                if (!oldFile.equals("default.jpg"))
//                    Helper.deleteFile(pathOld);
                String path = request.getRealPath("/" + "pics" + File.separator + user.getProfile());
                
                boolean f = Helper.saveFile(part.getInputStream(), path);
                if (f) {
                    Message msg = new Message("Profile Details Updated!!", "success", "alert-success");
                    s.setAttribute("msg", msg);
                    response.setHeader("refresh", "2");
                }
                else {
                    //
                    Message msg = new Message("Profile Details Not Updated Successfully!!", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                }
            }
            else {
                out.println("Profile not Updated");
                Message msg = new Message("Profile Not Updated!! Something went wrong", "error", "alert-danger");
                s.setAttribute("msg", msg);
            }
            response.sendRedirect("profile.jsp");
            out.println("</body>");
            out.println("</html>");
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
