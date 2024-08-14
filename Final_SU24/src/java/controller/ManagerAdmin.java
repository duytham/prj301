/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AdminDAO;
import dal.OrderDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;
import java.util.UUID;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.Admin;
import model.Roles;
import model.User;

/**
 *
 * @author thach
 */
public class ManagerAdmin extends HttpServlet {

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
            out.println("<title>Servlet ManagerAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerAdmin at " + request.getContextPath() + "</h1>");
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
    AdminDAO adao = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String uid = request.getParameter("uid") == null ? "" : request.getParameter("uid");
            String role = request.getParameter("role") == null ? "" : request.getParameter("role");
            String search = request.getParameter("search") == null ? "" : request.getParameter("search");

            OrderDAO odao = new OrderDAO();
            HttpSession session = request.getSession();

            Object object = session.getAttribute("account");

            Admin u = (Admin) object;
            ArrayList<Admin> ol = adao.Search(uid, search, role);

            ArrayList<Admin> userList = adao.getAllAdmin();
            int total = userList.size();
            if (u.getRoles().getId() == 2) {
                request.setAttribute("total", total);
                request.setAttribute("pl", userList);
                request.setAttribute("ol", ol);
                request.getRequestDispatcher("manageradmin.jsp").forward(request, response);
            } else {
                response.sendRedirect("404.html");
            }

        } catch (Exception e) {
            response.sendRedirect("login");
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

        try {
            HttpSession session = request.getSession();
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = "123456789";
            String address = request.getParameter("address");
            String gender = "1";
            String role = "2"; // Role Admin
            String pass = "123456";
            LocalDate date = java.time.LocalDate.now();
            String now = date.toString();
            String id = request.getParameter("id");

            Admin checkExist = adao.getAdminByEmail(email);
            if (checkExist == null) {
                adao.inserUser(name, email, phone, address, pass, Integer.valueOf(gender), Integer.valueOf(role), id, id);

                // Optional: You can add additional logic or messages here if needed
                request.setAttribute("messregis", "Success");
                response.sendRedirect("ManagerAdmin");
            } else {
                request.setAttribute("messregis", "Email exist");
                request.getRequestDispatcher("AddAdmin.jsp").forward(request, response);
            }

        } catch (Exception e) {
            request.setAttribute("messregis", "Invalid input. Please Try again!");
            request.getRequestDispatcher("manageradmin.jsp").forward(request, response);
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
