package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.KhachHang;
import Model.LichSuMuaSachBO;
import Model.LoaiBO;

/**
 * Servlet implementation class HtlichsuController
 */
@WebServlet("/HtlichsuController")
public class HtlichsuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HtlichsuController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession session = request.getSession();
			KhachHang kh = (KhachHang)session.getAttribute("username");
			if(kh == null) response.sendRedirect("dangnhapController");
			else {
				LoaiBO lbo = new LoaiBO();
				request.setAttribute("dsloai", lbo.getloai());
				LichSuMuaSachBO lsbo = new LichSuMuaSachBO();
				request.setAttribute("lsms", lsbo.getLichSu(kh.getTendn()));
				request.getRequestDispatcher("Session/LichSuMuaSach.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
