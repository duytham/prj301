/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AdminDAO;
import dal.MD5;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Admin;
import model.Roles;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Changepassword", urlPatterns = {"/Changepassword"})
public class Changepassword extends HttpServlet {

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
        HttpSession session = request.getSession();
        request.getRequestDispatcher("Changepassword.jsp").forward(request, response);
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

        request.getRequestDispatcher("Changepassword.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String renewpass = request.getParameter("renewpass");
        MD5 md5 = new MD5();
        UserDAO udao = new UserDAO();
        AdminDAO adao = new AdminDAO();
        
        User checkExist = udao.getUserByEmail(email);
        if (checkExist == null) {
            Admin a = (Admin) session.getAttribute("account");
            if (!md5.getMd5(oldpass).equals(a.getPassword())) {
                request.setAttribute("mess", "Old pass not correct");
                request.getRequestDispatcher("Changepassword.jsp").forward(request, response);
            } else if (!newpass.equals(renewpass)) {
                request.setAttribute("mess", "Renew pass not match with pass");
                request.getRequestDispatcher("Changepassword.jsp").forward(request, response);
            } else {
                AdminDAO dao = new AdminDAO();
                dao.changePassword(String.valueOf(a.getId()), newpass);
                request.setAttribute("mess", "Change password successfully!");
                request.getRequestDispatcher("Changepassword.jsp").forward(request, response);
            }
        } else {
            User u = (User) session.getAttribute("account");
            if (!md5.getMd5(oldpass).equals(u.getPassword())) {
                request.setAttribute("mess", "Old password not correct");
                request.getRequestDispatcher("Changepassword.jsp").forward(request, response);
            } else if (!newpass.equals(renewpass)) {
                request.setAttribute("mess", "Renew pass not match with pass");
                request.getRequestDispatcher("Changepassword.jsp").forward(request, response);
            } else {
                UserDAO dao = new UserDAO();
                dao.changePassword(String.valueOf(u.getId()), newpass);
                request.setAttribute("mess", "Change password successfully!");
                request.getRequestDispatcher("Changepassword.jsp").forward(request, response);
            }
        }

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
