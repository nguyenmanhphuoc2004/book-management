package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.GioHang;
import Model.GioHangBO;
import tam.CGioHang;

/**
 * Servlet implementation class giohangController
 */
@WebServlet("/giohangController")
public class giohangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public giohangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		

		HttpSession session = request.getSession();
		
//			lấy dữ liệu đặt hàng từ tcController
		String masach = (String)request.getParameter("masach");
		String tensach = request.getParameter("tensach");
		String giasach = (String)request.getParameter("gia");
		String anh = request.getParameter("anh");
		
		
		if(masach!=null && tensach!=null && giasach!=null && anh!= null){
			GioHangBO gh = new GioHangBO();
			if(session.getAttribute("gh") == null){
				session.setAttribute("gh", gh);
			}
			gh = (GioHangBO)session.getAttribute("gh");
			gh.Them(masach, tensach, 1, Long.parseLong(giasach), anh);
			session.setAttribute("gh", gh);
		}
		
		request.getRequestDispatcher("htgioController").forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
