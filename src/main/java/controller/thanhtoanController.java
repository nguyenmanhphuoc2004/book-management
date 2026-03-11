package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.LoaiBO;
import Model.KhachHang;

@WebServlet("/thanhtoanController")
public class thanhtoanController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			// 1. Kiểm tra xem người dùng đã đăng nhập chưa
			KhachHang kh = (KhachHang) session.getAttribute("username");
			if (kh == null) {
				// Nếu chưa đăng nhập, bắt quay lại trang đăng nhập
				response.sendRedirect("dangnhapController");
				return;
			}

			// 2. Lấy danh sách loại sách để hiển thị Sidebar bên trái
			LoaiBO lbo = new LoaiBO();
			request.setAttribute("dsloai", lbo.getloai());

			// 3. Chuyển hướng đến trang thanhtoan.jsp (Trang bạn vừa sửa giao diện)
			request.getRequestDispatcher("Session/thanhtoan.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}