package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import Model.LoaiBO;
import Model.SachBO;

/**
 * Servlet implementation class sachAdminController
 */

@WebServlet("/sachAdminController")
//public class sachAdminController extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    /**
//     * @see HttpServlet#HttpServlet()@WebServlet("/sachAdminController")
public class sachAdminController extends HttpServlet {
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
            
            SachBO sbo = new SachBO();
            LoaiBO lbo = new LoaiBO();
            
            String tab = request.getParameter("tab");
            String ms = request.getParameter("txtmasach");
            String tensach = request.getParameter("txttensach");
            String soluong = request.getParameter("txtsoluong");
            String gia = request.getParameter("txtgia");
            String maloai = request.getParameter("txtmaloai");
            String anh = request.getParameter("txtanh");
            String tacgia = request.getParameter("txttacgia");
            
            if(tab != null) {
                if(tab.equals("add")) {
                    sbo.them(ms, tensach, Long.parseLong(soluong), Long.parseLong(gia), maloai, "image_sach/"+anh, tacgia);
                } else if(tab.equals("delete")) {
                    sbo.xoa(ms);
                }
            }
            
            request.setAttribute("dsloai", lbo.getloai());
            request.setAttribute("dssach", sbo.getsach());
            request.getRequestDispatcher("Admin/quanlysach.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
//     */
//    public sachAdminController() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		if(request.getContentLength() <= 0) {
//				request.getRequestDispatcher("Session/SachAdmin.jsp").forward(request, response);
//			}
//			else {
//				 DiskFileItemFactory factory = new DiskFileItemFactory();
//				 DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
//				 ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
//				 String dirUrl1 = request.getServletContext().getRealPath("") +  File.separator + "files";
//				 response.getWriter().println(dirUrl1);
//				 
//				try {
//
//					List<FileItem> fileItems = upload.parseRequest(request);//Lấy về các đối tượng gửi lên
//					//duyệt qua các đối tượng gửi lên từ client gồm file và các control
//		for (FileItem fileItem : fileItems) {
//		 			 if (!fileItem.isFormField()) {//Nếu ko phải các control=>upfile lên
//						// xử lý file
//						String nameimg = fileItem.getName();
//						if (!nameimg.equals("")) {
//					           //Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
//							String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "files";
//							File dir = new File(dirUrl);
//							if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
//								dir.mkdir();
//							}
//						           String fileImg = dirUrl + File.separator + nameimg;
//						           File file = new File(fileImg);//tạo file
//						            try {
//						               fileItem.write(file);//lưu file
//						              System.out.println("UPLOAD THÀNH CÔNG...!");
//						              System.out.println("Đường dẫn lưu file là: "+dirUrl);
//						 } catch (Exception e) {
//						    e.printStackTrace();
//						}
//					}
//				 }
//					else//Neu la control
//					{
//						String tentk=fileItem.getFieldName();
//						if(tentk.equals("txtmasach"))
//							response.getWriter().println(fileItem.getString("UTF-8"));
//						if(tentk.equals("txttensach"))
//							response.getWriter().println(fileItem.getString("UTF-8"));
//						if(tentk.equals("txtsoluong"))
//							response.getWriter().println(fileItem.getString());
//						if(tentk.equals("btnxoa")) {
//							String dirUrl = request.getServletContext().getRealPath("") + File.separator + "files";
//							File f1 = new File(dirUrl + "//thuyettrinh.docx");
//							f1.delete();
//							System.out.println("Da xoa");
//						}
//						
//					}
//					}
//				
//				} catch (FileUploadException e) {
//					e.printStackTrace();
//				}
//
//
//			}
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//
//}
