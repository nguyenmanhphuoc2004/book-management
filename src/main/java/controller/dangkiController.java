package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.KhachHang;
import Model.KhachHangBO;

@WebServlet("/dangkiController")
public class dangkiController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public dangkiController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher("Session/dangki.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String hoten = request.getParameter("hoten");
		String diachi = request.getParameter("diachi");
		String sodt = request.getParameter("sodt");
		String email = request.getParameter("email");
		String tendn = request.getParameter("tendn");
		String matkhau = request.getParameter("matkhau");

		try {
			KhachHangBO khbo = new KhachHangBO();

			if (khbo.ktTrungTenDangNhap(tendn)) {
				request.setAttribute("tb", "Tên đăng nhập đã tồn tại!");
				RequestDispatcher rd = request.getRequestDispatcher("Session/dangki.jsp");
				rd.forward(request, response);
				return;
			}

			khbo.themKhachHang(hoten, diachi, sodt, email, tendn, matkhau);

			request.setAttribute("tb", "Đăng ký thành công! Vui lòng đăng nhập.");
			RequestDispatcher rd = request.getRequestDispatcher("Session/dangnhap.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
