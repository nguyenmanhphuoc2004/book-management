package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class KhachHangDAO {
	public KhachHang ktDangNhap(String tendn,String pass) throws Exception{
		Ketnoi kn = new Ketnoi();
		kn.ketnoi();
		String sql = "select * from khachhang where tendn=? and pass=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tendn);
		cmd.setString(2,pass);
		ResultSet rs = cmd.executeQuery();
		KhachHang kh = null;
		if(rs.next()) {
			long makh = rs.getLong("makh");
			String hoten = rs.getString("hoten");
			String diachi = rs.getString("diachi");
			String sodt = rs.getString("sodt");
			String email = rs.getString("email");
			kh = new KhachHang(makh,hoten,diachi,sodt,email,tendn,pass);
		}
		rs.close();
		kn.cn.close();
		return kh;
	}
	
	 public boolean ktTrungTenDangNhap(String tendn) throws Exception {
		 Ketnoi kn = new Ketnoi();
		 kn.ketnoi();
	        String sql = "select * from KhachHang where tendn = ?";
	        PreparedStatement ps = kn.cn.prepareStatement(sql);
	        ps.setString(1, tendn);

	        ResultSet rs = ps.executeQuery();
	        return rs.next(); 
	    }

	    public void themKhachHang(String hoten, String diachi, String sodt,
	                              String email, String tendn, String matkhau) throws Exception {
	    	Ketnoi kn = new Ketnoi();
	    	kn.ketnoi();
	        String sql = """
	            insert into KhachHang(hoten, diachi, sodt, email, tendn, matkhau)
	            values (?, ?, ?, ?, ?, ?)
	        """;

	        PreparedStatement ps = kn.cn.prepareStatement(sql);
	        ps.setString(1, hoten);
	        ps.setString(2, diachi);
	        ps.setString(3, sodt);
	        ps.setString(4, email);
	        ps.setString(5, tendn);
	        ps.setString(6, matkhau);

	        ps.executeUpdate();
	    }
}
