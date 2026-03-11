package Model;

public class KhachHangBO {
	KhachHangDAO khdao = new KhachHangDAO();
	public KhachHang ktDangNhap(String tendn,String pass) throws Exception{
		return khdao.ktDangNhap(tendn,pass);
	}
	 public boolean ktTrungTenDangNhap(String tendn) throws Exception {
	        return khdao.ktTrungTenDangNhap(tendn);
	    }

	    public void themKhachHang(String hoten, String diachi, String sodt,
	                              String email, String tendn, String matkhau) throws Exception {
	        khdao.themKhachHang(hoten, diachi, sodt, email, tendn, matkhau);
	    }
}
