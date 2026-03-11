package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import Model.AdminXacNhanDAO;

@WebServlet("/chiTietController")
public class chiTietController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("admin") == null) {
                response.sendRedirect("Admin/adminLogin.jsp");
                return;
            }

            String mahd = request.getParameter("mahd");
            if (mahd == null) {
                response.sendRedirect("adminController");
                return;
            }

            AdminXacNhanDAO dao = new AdminXacNhanDAO();
            request.setAttribute("dsChiTiet", dao.getChiTietHoaDon(Integer.parseInt(mahd)));

            request.getRequestDispatcher("Admin/chitiethoadon.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
