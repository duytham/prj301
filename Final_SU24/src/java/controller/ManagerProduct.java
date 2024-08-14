/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Admin;
import model.Category;
import model.Product;
import model.User;

/**
 *
 * @author Admin
 */
public class ManagerProduct extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=UTF-8");
            HttpSession session = request.getSession();
            Object object = session.getAttribute("account");
            Admin u = (Admin) object;
            if (u.getRoles().getId() == 2 || u.getRoles().getId() == 3) {
                ProductDAO pdao = new ProductDAO();
                ArrayList<Product> pl = pdao.getAllProduct("", "");
                ArrayList<Category> clist = pdao.getCategory();
                int total = pl.size();
                request.setAttribute("total", total);
                request.setAttribute("pl", pl);
                request.setAttribute("clist", clist);
                request.getRequestDispatcher("managerProduct.jsp").forward(request, response);
            } else {
                response.sendRedirect("404.html");
            }
        } catch (Exception e) {
            response.sendRedirect("login");

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
        response.setContentType("text/html;charset=UTF-8");
        try {
            String uid = request.getParameter("uid") == null ? "" : request.getParameter("uid");
            String role = request.getParameter("role") == null ? "" : request.getParameter("role");
            String search = request.getParameter("search") == null ? "" : request.getParameter("search");

            OrderDAO odao = new OrderDAO();
            ProductDAO pdao = new ProductDAO();
            HttpSession session = request.getSession();

            Object object = session.getAttribute("account");
            
            
            Admin u = (Admin) object;
            ArrayList<Product> pl = pdao.getAllProductt(uid, search,role);
            int total = pl.size();
            ArrayList<Category> clist = pdao.getCategory();
            request.setAttribute("total", total);
            request.setAttribute("clist", clist);
            request.setAttribute("pl", pl);
            request.getRequestDispatcher("managerProduct.jsp").forward(request, response);

        } catch (Exception e) {
            response.sendRedirect("login");
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
