package Model;

import java.sql.*;
import java.sql.Date;
import java.util.*;

public class LichSuMuaSachDAO {

    // Lấy danh sách lịch sử mua sách (view VLS)
	public ArrayList<LichSuMuaSach> getLichSu(String username) throws Exception {
        ArrayList<LichSuMuaSach> lsms = new ArrayList<>();
        Ketnoi kn = new Ketnoi();
        kn.ketnoi();

        String sql = "SELECT * FROM VLS WHERE tendn = ?";
        try (PreparedStatement ps = kn.getCn().prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String makh = rs.getString(1);
                String tensach = rs.getString(2);
                long gia = rs.getLong(3);
                long soluongmua = rs.getLong(4);
                long thanhtien = rs.getLong(5);
				/* boolean damua = rs.getBoolean(6); */
                Date ngaymua = rs.getDate(6);

                LichSuMuaSach lst = new LichSuMuaSach(makh, tensach, gia, soluongmua, thanhtien,true, ngaymua);
                lsms.add(lst);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lsms;
    }
    // Lấy mã khách hàng từ tên đăng nhập + mật khẩu
    public int getMakh(String username, String password) throws Exception {
        Ketnoi kn = new Ketnoi();
        kn.ketnoi();
        String sql = "SELECT makh FROM KhachHang WHERE tendn = ? AND pass = ?";
        PreparedStatement ps = kn.getCn().prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        int maKh = -1;
        if (rs.next()) maKh = rs.getInt("makh");
        return maKh;
    }

    // Thêm hóa đơn mới và trả về MaHoaDon vừa tạo
    public int CapNhatHoaDon(String username, String password) throws Exception {
        Ketnoi kn = new Ketnoi();
        kn.ketnoi();
        int makh = getMakh(username, password);

        String sql = "INSERT INTO hoadon(makh, NgayMua, damua) VALUES (?, ?, ?)";
        PreparedStatement ps = kn.getCn().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        ps.setInt(1, makh);

        ps.setDate(2, java.sql.Date.valueOf(java.time.LocalDate.now()));
        ps.setBoolean(3, true);

        int rows = ps.executeUpdate();
        if (rows == 0) {
            throw new SQLException("Không thể tạo hóa đơn mới.");
        }

        int maHd = -1;
        ResultSet rs = ps.getGeneratedKeys();
        if (rs.next()) {
            maHd = rs.getInt(1);
        }
        return maHd;
    }

    // Thêm chi tiết hóa đơn
    public int CapNhatChiTietHoaDonTheoMaHd(int maHd ,String masach, long soluongmua)
            throws Exception {
        Ketnoi kn = new Ketnoi();
        kn.ketnoi();
        String sql = "INSERT INTO ChiTietHoaDon(MaSach, SoLuongMua, MaHoaDon, DaMua) VALUES (?, ?, ?, ?)";
        PreparedStatement ps = kn.getCn().prepareStatement(sql);
        ps.setString(1, masach);
        ps.setLong(2, soluongmua);
        ps.setInt(3, maHd);
        ps.setBoolean(4, true);

        return ps.executeUpdate();
    }

    // Test thử
//    public static void main(String[] args) throws ClassNotFoundException, SQLException {
//        LichSuMuaSachDAO dao = new LichSuMuaSachDAO();
//
//        int maHd = dao.CapNhatHoaDon("nkchung", "123");
//        System.out.println("Mã hóa đơn mới: " + maHd);
//
//        int kq = dao.CapNhatChiTietHoaDon("nkchung", "123", "b16", 3);
//        System.out.println("Kết quả thêm chi tiết: " + kq);
//    }
}
