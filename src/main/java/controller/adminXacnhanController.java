package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.AdminXacNhanDAO;

/**
 * Servlet implementation class adminXacnhanController
 */
@WebServlet("/adminXacnhanController")
public class adminXacnhanController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            if (session.getAttribute("admin") == null) {
                response.sendRedirect("Admin/adminLogin.jsp");
                return;
            }

            AdminXacNhanDAO xnDao = new AdminXacNhanDAO();
            String mhd = request.getParameter("mhd"); 

            if (mhd != null) {
                xnDao.XacNhan(Integer.parseInt(mhd));
            }

            request.setAttribute("dsChuaXN", xnDao.getHoaDonChuaXacNhan());
            request.getRequestDispatcher("Admin/adminXacNhan.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}