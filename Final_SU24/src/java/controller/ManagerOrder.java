/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
import java.util.ArrayList;
import model.Admin;
import model.Order;
import model.User;

/**
 *
 * @author Admin
 */
public class ManagerOrder extends HttpServlet {

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
            out.println("<title>Servlet ManagerOrder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerOrder at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        try {
            // Lấy thông tin từ request

            String uid = request.getParameter("uid") == null ? "" : request.getParameter("uid");
            String search = request.getParameter("search") == null ? "" : request.getParameter("search");
            String fdate = request.getParameter("fdate") == null ? "1920-05-05" : request.getParameter("fdate");
            String tdate = request.getParameter("tdate") == null ? "3020-05-05" : request.getParameter("tdate");
            // Tạo đối tượng OrderDAO để thao tác với cơ sở dữ liệu
            OrderDAO odao = new OrderDAO();
            // Lấy session để kiểm tra đăng nhập và lấy thông tin người dùng
            HttpSession session = request.getSession();

            // Chuyển đổi định dạng ngày tháng từ yyyy-mm-dd sang dd/mm/yyyy
            String dob1 = "";
            String dob2 = "";
            String[] result1 = fdate.trim().split("-");
            String i1 = result1[0];
            String o1 = result1[1];
            String r1 = result1[2];
            dob1 = r1 + "/" + o1 + "/" + i1;

            String[] result2 = tdate.trim().split("-");
            String i2 = result2[0];
            String o2 = result2[1];
            String r2 = result2[2];
            dob2 = r2 + "/" + o2 + "/" + i2;

            Object object = session.getAttribute("account");

            Admin a = (Admin) object;

            // Lấy danh sách đơn hàng từ cơ sở dữ liệu
            ArrayList<Order> ol = odao.getAllOrder(uid, fdate, tdate, search);
            UserDAO udao = new UserDAO();

            ArrayList<User> userList = udao.getAllUser();
//            AdminDAO udao = new AdminDAO();
//            ArrayList<Admin> userList = udao.getAllUser();
//            request.setAttribute("fdate", dob1);
//            request.setAttribute("tdate", dob2);
            request.setAttribute("pl", userList);

            // Đặt các thông tin vào request để truyền sang trang JSP
            request.setAttribute("ol", ol);
//        response.getWriter().println(u.getId());
            // Chuyển hướng đến trang quản lý đơn hàng (managerorder.jsp)
            request.getRequestDispatcher("managerorder.jsp").forward(request, response);
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
