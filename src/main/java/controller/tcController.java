package controller;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.LoaiBO;
import Model.Sach;
import Model.SachBO;

/**
 * Servlet implementation class tcController
 */
@WebServlet("/tcController")
public class tcController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tcController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			LoaiBO lbo = new LoaiBO();
			request.setAttribute("dsloai", lbo.getloai());
			
			String maloai = request.getParameter("ml"); 
	    	String key = request.getParameter("txttk");
	    	SachBO sbo = new SachBO();
	    	ArrayList<Sach> ds = sbo.getsach();
	    	if (maloai != null) {
	    		ds = sbo.TimMa(maloai);
	    	}
	    	else if (key != null) {	
	    		ds = sbo.Tim(key);
	    	}
	    	request.setAttribute("dssach", ds);
	    	
	    	request.getRequestDispatcher("Session/tc.jsp").forward(request, response);
			
		} catch (Exception e) {
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
