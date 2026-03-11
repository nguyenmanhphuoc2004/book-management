package Model;

import java.sql.PreparedStatement;

public class ChiTietDAO {
	public int Them(String masach, long soluong, long maHD) throws Exception {
	    Ketnoi kn = new Ketnoi();
	    kn.ketnoi();
	    String sql = "INSERT INTO ChiTietHoaDon(MaSach, SoLuongMua, MaHoaDon, damua) VALUES (?, ?, ?, 0)";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setString(1, masach);
	    cmd.setLong(2, soluong);
	    cmd.setLong(3, maHD);
	    int kq = cmd.executeUpdate();
	    kn.cn.close();
	    return kq;
	}
}
