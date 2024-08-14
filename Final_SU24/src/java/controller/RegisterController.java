/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Category;
import model.Question1;
import model.Question2;
import model.Roles;
import model.User;

/**
 *
 * @author Admin
 */
public class RegisterController extends HttpServlet {

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
    UserDAO udao = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");

            String q1 = request.getParameter("Q1Id");
            String q1_ans = request.getParameter("q1");

            String q2 = request.getParameter("Q2Id");
            String q2_ans = request.getParameter("q2");

            String pass = request.getParameter("pass");

            User checkExist = udao.getUserByEmail(email);
            if (checkExist == null) {
                udao.inserUser(name, email, phone, address, pass, Integer.valueOf(gender), q1, q1_ans, q2, q2_ans);
                request.setAttribute("messregis", "Success");
                response.sendRedirect("./HomePage");
            } else {

                ArrayList<Question1> q1list = udao.getQuestion1();
                ArrayList<Question2> q2list = udao.getQuestion2();
                request.setAttribute("q1list", q1list);
                request.setAttribute("q2list", q2list);
                request.setAttribute("messregis", "Email exist");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            ArrayList<Question1> q1list = udao.getQuestion1();
            ArrayList<Question2> q2list = udao.getQuestion2();
            request.setAttribute("q1list", q1list);
            request.setAttribute("q2list", q2list);
            request.setAttribute("messregis", "Invalid input.Please Try again!");
            request.getRequestDispatcher("login.jsp").forward(request, response);

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
