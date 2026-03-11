package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SachDAO {
	public ArrayList<Sach> getsach() throws Exception{
		ArrayList<Sach> dsSach = new ArrayList<Sach>();
		Ketnoi kn = new Ketnoi();
		kn.ketnoi();
		String sql = "select * from sach";
		try {		
			PreparedStatement ps = kn.getCn().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Sach s = new Sach();
				s.setMasach(rs.getString(1));
				s.setTensach(rs.getString(2));
				s.setSoluong(Long.parseLong(rs.getString(3)));
				s.setGia(Long.parseLong(rs.getString(4)));
				s.setMaloai(rs.getString(5));
				s.setAnh(rs.getString(7));
				s.setTacgia(rs.getString(9));
				dsSach.add(s);
			}
			rs.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return dsSach;
	}
	
	public int themSach(String masach, String tensach, long soluong, long gia, String maloai, String anh, String tacgia) throws Exception {
		Ketnoi kn = new Ketnoi(); kn.ketnoi();
		String sql = "insert into sach(masach, tensach, soluong, gia, maloai, anh, tacgia, NgayNhap) values (?,?,?,?,?,?,?,GETDATE())";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, masach);
		cmd.setString(2, tensach);
		cmd.setLong(3, soluong);
		cmd.setLong(4, gia);
		cmd.setString(5, maloai);
		cmd.setString(6, anh);
		cmd.setString(7, tacgia);
		int kq = cmd.executeUpdate();
		kn.cn.close();
		return kq;
	}
	
	public int xoaSach(String masach) throws Exception {
		Ketnoi kn = new Ketnoi(); kn.ketnoi();
		String sql = "delete from sach where masach=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, masach);
		int kq = cmd.executeUpdate();
		kn.cn.close();
		return kq;
	}
}
