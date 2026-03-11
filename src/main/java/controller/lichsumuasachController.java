package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.ChiTietBO;
import Model.GioHang;
import Model.GioHangBO;
import Model.HoaDonBO;
import Model.KhachHang;
import Model.LichSuMuaSach;
import Model.LichSuMuaSachBO;
import Model.LoaiBO;

@WebServlet("/lichsumuasachController")
public class lichsumuasachController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public lichsumuasachController() {
        super();
    }

    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
        
//        HttpSession session = request.getSession();
//        String username = (String) session.getAttribute("username");
//        String password = (String) session.getAttribute("password");
//        LichSuMuaSachBO lsmsBO = new LichSuMuaSachBO();
//
//        GioHangBO gh = (GioHangBO) session.getAttribute("gh");
//        String damua = request.getParameter("damua");
//
//        if (gh != null && "1".equals(damua)) {
//            try {
//                // B1: Tạo hóa đơn mới
//                int maHd = lsmsBO.CapNhatHoaDon(username, password);
//
//                // B2: Thêm từng sách trong giỏ vào chi tiết hóa đơn
//                int count = 0;
//                for (GioHang ghItem : gh.getDs()) {
//                    int kq = lsmsBO.CapNhatChiTietHoaDonTheoMaHd(maHd, ghItem.getMasach(), ghItem.getSoluong());
//                    if (kq > 0) count++;
//                }
//
//                if (count == gh.getDs().size()) {
//                    request.setAttribute("ketqua", "Thêm vào CSDL thành công");
//                    // Xóa giỏ hàng sau khi mua xong
//                    session.removeAttribute("gh");
//                } else {
//                    request.setAttribute("ketqua", "Có lỗi khi thêm chi tiết hóa đơn");
//                }
//
//            } catch (Exception e) {
//                e.printStackTrace();
//                request.setAttribute("ketqua", "Lỗi hệ thống: " + e.getMessage());
//            }
//        }
//
//        // Hiển thị lại lịch sử mua sách
//        try {
//            ArrayList<LichSuMuaSach> lst = lsmsBO.getLichSuMuaSach(username, password);
//            request.setAttribute("lsms", lst);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

        // Danh sách loại sách
//        try {
//            LoaiBO lbo = new LoaiBO();
//            request.setAttribute("dsloai", lbo.getloai());
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        request.getRequestDispatcher("Session/LichSuMuaSach.jsp").forward(request, response);
//    	try {
//			HttpSession session = request.getSession();
//			HoaDonBO hd = new HoaDonBO();
//			ChiTietBO ct = new ChiTietBO();
//			GioHangBO gh = (GioHangBO)session.getAttribute("gh");
//			KhachHang kh = (KhachHang)session.getAttribute("username");
//			if(kh == null) response.sendRedirect("dangnhapController");
//			else {
//				hd.Them(kh.getMakh());
//				for(GioHang g : gh.getDs()) {
//					ct.Them(g.getMasach(), g.getSoluong());
//				}
//				session.removeAttribute("gh");
//				response.sendRedirect("HtlichsuController");
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			// TODO: handle exception
//		}
//    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String action = request.getParameter("action");
            KhachHang kh = (KhachHang)session.getAttribute("username"); 

            if(kh == null) {
                response.sendRedirect("dangnhapController");
                return;
            }

            if ("confirm".equals(action)) {
                GioHangBO gh = (GioHangBO) session.getAttribute("gh");

                if (gh != null && kh != null) {
                    HoaDonBO hdBO = new HoaDonBO();
                    ChiTietBO ctBO = new ChiTietBO();

                    // Bước 1: Lấy mã hóa đơn vừa tạo
                    long maVuaTao = hdBO.Them(kh.getMakh());

                    // Bước 2: Chỉ lưu chi tiết nếu lấy được mã hóa đơn > 0
                    if (maVuaTao > 0) {
                        for (GioHang g : gh.getDs()) {
                            ctBO.Them(g.getMasach(), g.getSoluong(), maVuaTao);
                        }
                        session.removeAttribute("gh"); // Xóa giỏ sau khi mua xong
                        response.sendRedirect("HtlichsuController"); // Điều hướng đến trang hiển thị lịch sử
                        return;
                    }
                }
            }
            
            // Mặc định hiển thị trang lịch sử
            request.getRequestDispatcher("Session/LichSuMuaSach.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Lỗi SQL/Logic: " + e.getMessage());
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
