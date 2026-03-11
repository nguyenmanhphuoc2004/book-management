package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import Model.GioHangBO;
import Model.LoaiBO;

/**
 * Servlet implementation class htgioController
 */
@WebServlet("/suaxoaController")
public class suaxoaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public suaxoaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
			 	HttpSession session = request.getSession();
			 	GioHangBO gh = (GioHangBO)session.getAttribute("gh");
			    PrintWriter out = response.getWriter();
			 	
			    String ms = request.getParameter("butsua");
			    String slsua = request.getParameter(ms);
			    
			    if(ms != null){
			        gh.Them(ms, "",Long.parseLong(slsua) , 0,"");
			        session.setAttribute("gh", gh);
			    }
			 	
			 	// Xử lý xoá 1 mặt hàng
			 	String xoa = request.getParameter("xoa");
			 	if(xoa != null){
			 	    gh.Xoa(xoa);
			 	    session.setAttribute("gh", gh);
			 	}
				
			 	// Xử lý xoá tất cả
			 	String xoatatca = request.getParameter("xoatatca");
			 	if(xoatatca!=null){
			 	    gh.XoaTatCa();
			 	    session.setAttribute("gh", gh);
			 	}
				
			 	// Xử lý xoá theo checkbox
			 	String[] checks = request.getParameterValues("chonxoa");
			 	if(checks!=null){
			 	    for(String item: checks){
			 	        gh.Xoa(item);
			 	    }
			 	    session.setAttribute("gh", gh);
			 	}
			 	
			 	out.print(gh);
			 	response.sendRedirect("htgioController");
	      } 
		 catch (Exception e) {
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
