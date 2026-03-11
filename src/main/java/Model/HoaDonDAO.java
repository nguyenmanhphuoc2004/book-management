package Model;

import java.sql.PreparedStatement;

public class HoaDonDAO {
//	public long Them(Long makh) throws Exception{
//		Ketnoi kn = new Ketnoi();
//		kn.ketnoi();
//		String sql = "insert into hoadon(makh,NgayMua,damua) values(?,getdate(),0)";
//		PreparedStatement cmd = kn.cn.prepareStatement(sql);
//		cmd.setLong(1, makh);
//		int kq = cmd.executeUpdate();
//		kn.cn.close();
//		return kq;
//	}
	public long Them(long makh) throws Exception {
	    Ketnoi kn = new Ketnoi();
	    kn.ketnoi();
	    // Thêm SET NOCOUNT ON để bỏ qua các thông báo phụ, chỉ trả về Result Set của SCOPE_IDENTITY
	    String sql = "SET NOCOUNT ON; INSERT INTO hoadon(makh, NgayMua, damua) VALUES (?, GETDATE(), 1); SELECT SCOPE_IDENTITY() AS LastID";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setLong(1, makh);
	    
	    java.sql.ResultSet rs = cmd.executeQuery();
	    long maHD = 0;
	    if (rs.next()) {
	        maHD = rs.getLong("LastID");
	    }
	    rs.close();
	    kn.cn.close();
	    return maHD; 
	}
}
