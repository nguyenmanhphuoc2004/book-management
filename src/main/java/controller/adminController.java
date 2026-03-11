package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.AdminDangNhapDAO;
import Model.AdminXacNhanDAO;

@WebServlet("/adminController")
public class adminController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            
            HttpSession session = request.getSession();
            String un = request.getParameter("txtun");
            String pw = request.getParameter("txtpw");
            
            AdminDangNhapDAO dnDao = new AdminDangNhapDAO();
            AdminXacNhanDAO xnDao = new AdminXacNhanDAO(); 
            
            if (un != null && pw != null) {
                if (dnDao.checkAdmin(un, pw)) {
                    session.setAttribute("admin", un); 
                } else {
                    request.setAttribute("error", "Sai tài khoản hoặc mật khẩu Admin!");
                    request.getRequestDispatcher("Admin/adminLogin.jsp").forward(request, response);
                    return;
                }
            }
            
            if (session.getAttribute("admin") == null) {
                request.getRequestDispatcher("Admin/adminLogin.jsp").forward(request, response);
            } else {
                request.setAttribute("dsHoadon", xnDao.getHoaDonHomNay());
                request.getRequestDispatcher("Admin/adminIndex.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}