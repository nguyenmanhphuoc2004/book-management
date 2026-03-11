package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDangNhapDAO {
    public boolean checkAdmin(String un, String pass) throws Exception {
        Ketnoi kn = new Ketnoi();
        kn.ketnoi();
        String sql = "select * from DangNhap where TenDangNhap=? and MatKhau=? and Quyen=1";
        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        cmd.setString(1, un);
        cmd.setString(2, pass);
        ResultSet rs = cmd.executeQuery();
        
        boolean kq = rs.next(); 
        rs.close(); kn.cn.close();
        return kq;
    }
}