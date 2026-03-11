package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.KhachHang;
import Model.KhachHangBO;
import nl.captcha.Captcha;

/**
 * Servlet implementation class dangnhapController
 */
@WebServlet("/dangnhapController")
public class dangnhapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangnhapController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
				HttpSession session = request.getSession();
				Integer tmp = (Integer) session.getAttribute("Solansai");
				if(tmp == null) {
					tmp = 0;
					session.setAttribute("Solansai", tmp);
				}
				
				
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				RequestDispatcher rds = request.getRequestDispatcher("Session/dangnhap.jsp");
				RequestDispatcher rdd = request.getRequestDispatcher("tcController");
				
				if(tmp >= 3) {
					Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
					request.setCharacterEncoding("UTF-8");
					String answer = request.getParameter("answer");
					if(answer==null)
						response.sendRedirect("Session/dangnhap.jsp");
					else
					if (!captcha.isCorrect(answer)) {
					   request.setAttribute("error", "Dang nhap sai");
						rds.forward(request, response);
						return;
					}

				}
				if (username != null && password != null) {
					KhachHangBO khbo = new KhachHangBO();
					KhachHang kh = khbo.ktDangNhap(username, password);
					if(kh!=null) {
						session.setAttribute("username", kh);
						rdd.forward(request, response);
					}	
					else {
						request.setAttribute("tb", "Dang nhap sai");
						rds.forward(request, response);
					}
				}
			else {
//				RequestDispatcher rd = request.getRequestDispatcher("Session/dangnhap.jsp");
//				rd.forward(request, response);
				rds.forward(request, response);
				}
			}
			 catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
