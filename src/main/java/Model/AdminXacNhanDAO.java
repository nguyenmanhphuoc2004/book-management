package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
public class AdminXacNhanDAO {
    public ArrayList<ViewHoadon> getHoaDonHomNay() throws Exception {
        ArrayList<ViewHoadon> ds = new ArrayList<ViewHoadon>();
        Ketnoi kn = new Ketnoi();
        kn.ketnoi();
        String sql = "SELECT * FROM View_HoaDonKH WHERE CAST(NgayMua AS DATE) = CAST(GETDATE() AS DATE)";
        
        PreparedStatement ps = kn.cn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();	
        while(rs.next()) {
            ds.add(new ViewHoadon(rs.getInt("MaHoaDon"), rs.getString("hoten"), 
                   rs.getDate("NgayMua"), rs.getBoolean("damua")));
        }
        kn.cn.close();
        return ds;
    }
    public int XacNhan(int maHoaDon) throws Exception {
        Ketnoi kn = new Ketnoi();
        kn.ketnoi();
        String sql = "UPDATE HoaDon SET damua = 1 WHERE MaHoaDon = ?";
        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        cmd.setInt(1, maHoaDon);
        int kq = cmd.executeUpdate();
        kn.cn.close();
        return kq;
    }

    public ArrayList<ViewHoadon> getHoaDonChuaXacNhan() throws Exception {
        ArrayList<ViewHoadon> ds = new ArrayList<ViewHoadon>();
        Ketnoi kn = new Ketnoi();
        kn.ketnoi();
        String sql = "SELECT * FROM View_HoaDonKH WHERE damua = 0";
        PreparedStatement ps = kn.cn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            ds.add(new ViewHoadon(
            		rs.getInt("MaHoaDon"),
            		rs.getString("hoten"), 
                    rs.getDate("NgayMua"),
                    rs.getBoolean("damua")
                    )
            	);
        }
        kn.cn.close();
        return ds;
    }
    public ArrayList<ViewHoadon> getHoaDonDaThanhToan() throws Exception {
        ArrayList<ViewHoadon> ds = new ArrayList<ViewHoadon>();
        Ketnoi kn = new Ketnoi();
        kn.ketnoi();

        String sql = "SELECT * FROM View_HoaDonKH WHERE damua = 1 ORDER BY NgayMua DESC";
        PreparedStatement ps = kn.cn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            ds.add(new ViewHoadon(rs.getInt("MaHoaDon"), rs.getString("hoten"), 
                                  rs.getDate("NgayMua"), rs.getBoolean("damua")));
        }
        kn.cn.close();
        return ds;
    }
    
    public ArrayList<ViewChiTietHoaDon> getChiTietHoaDon(int maHoaDon) throws Exception {
        ArrayList<ViewChiTietHoaDon> ds = new ArrayList<>();
        Ketnoi kn = new Ketnoi();
        kn.ketnoi();
        String sql =
        	    "SELECT c.MaHoaDon, s.MaSach, s.TenSach, c.SoLuongMua, s.Gia, " +
        	    "(c.SoLuongMua * s.Gia) AS ThanhTien " +
        	    "FROM ChiTietHoaDon c " +
        	    "JOIN Sach s ON c.MaSach = s.MaSach " +
        	    "WHERE c.MaHoaDon = ?";
        PreparedStatement ps = kn.cn.prepareStatement(sql);
        ps.setInt(1, maHoaDon);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            ds.add(new ViewChiTietHoaDon(
                rs.getInt("MaHoaDon"),
                rs.getString("MaSach"),
                rs.getString("TenSach"),
                rs.getInt("SoLuongMua"),
                rs.getLong("Gia"),
                rs.getLong("ThanhTien")
            ));
        }

        kn.cn.close();
        return ds;
    }



}