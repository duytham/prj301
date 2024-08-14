/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.MD5;
import dal.OrderDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Admin;
import model.User;

/**
 *
 * @author Admin
 */
public class ManagerUser extends HttpServlet {

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
        UserDAO udao = new UserDAO();
        ArrayList<User> userList = udao.getAllUser();

        request.setAttribute("pl", userList);
        request.getRequestDispatcher("manageruser.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        try {
            String uid = request.getParameter("uid") == null ? "" : request.getParameter("uid");
            String search = request.getParameter("search") == null ? "" : request.getParameter("search");

            OrderDAO odao = new OrderDAO();
            HttpSession session = request.getSession();

            Object object = session.getAttribute("account");
            UserDAO udao = new UserDAO();
            Admin u = (Admin) object;
            int numberOfUsers = udao.getNumberUser();
            int numberPage = (int) Math.ceil((double) numberOfUsers / 5);
            request.setAttribute("numberPage", numberPage);
            request.setAttribute("numberOfUsers", numberOfUsers);
            int index;
            String currentPage = request.getParameter("index");
            if (currentPage == null) {
                index = 1;
            } else {
                index = Integer.parseInt(currentPage);
            }
            if (u.getRoles().getId() == 2) {
                ArrayList<User> ol = udao.searchAndPaginate(uid, search, index);
                request.setAttribute("ol", ol);
                request.getRequestDispatcher("manageruser.jsp").forward(request, response);
            }

        } catch (Exception e) {
            response.getWriter().print(e);
        }
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
