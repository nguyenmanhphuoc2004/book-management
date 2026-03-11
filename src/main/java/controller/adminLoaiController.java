package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.LoaiBO;

@WebServlet("/adminLoaiController")
public class adminLoaiController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            if (session.getAttribute("admin") == null) {
                response.sendRedirect("Admin/adminLogin.jsp");
                return;
            }
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            LoaiBO lbo = new LoaiBO();
            
            String ml = request.getParameter("txtmaloai");
            String tl = request.getParameter("txttenloai");
            String tab = request.getParameter("tab"); 

            if (tab != null) {
                if (tab.equals("add")) lbo.them(ml, tl);
                else if (tab.equals("edit")) lbo.sua(ml, tl);
                else if (tab.equals("delete")) lbo.xoa(ml);
            }

            request.setAttribute("dsloai", lbo.getloai());
            request.getRequestDispatcher("Admin/quanlyloai.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}