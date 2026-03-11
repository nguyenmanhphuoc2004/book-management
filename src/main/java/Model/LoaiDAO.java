package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class LoaiDAO {
	public ArrayList<Loai> getloai() throws Exception{
	    ArrayList<Loai> ds= new ArrayList<Loai>();
	    //b1: Kết nối vao csdl
	      Ketnoi kn= new Ketnoi();
	      kn.ketnoi();
	    //b2: Thiet lap cau lenh sql
	      String sql= "select * from loai";
	      PreparedStatement cmd= kn.cn.prepareStatement(sql);
	    //b3: Truyen tham so vao cau lẹnh sql (neu co)
	      //b4: Cho thuc hien cau lenh sql
	      ResultSet rs= cmd.executeQuery();
	    //b5: Duyet rs va luu vao mang dong
	      while(rs.next()) {
	    	  String maloai =rs.getString("maloai");
	    	  String tenloai=rs.getString("tenloai");
	    	  ds.add(new Loai(maloai, tenloai));
	      }
	    //b6: Dong  cac doi tuong dang mo: rs, ket noi
	      rs.close();kn.cn.close();
	    return ds;
	}
	
	public int addLoai(String maloai, String tenloai) throws Exception {
	    Ketnoi kn = new Ketnoi(); kn.ketnoi();
	    String sql = "insert into loai(maloai, tenloai) values (?,?)";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setString(1, maloai);
	    cmd.setString(2, tenloai);
	    int kq = cmd.executeUpdate();
	    kn.cn.close();
	    return kq;
	}

	public int deleteLoai(String maloai) throws Exception {
	    Ketnoi kn = new Ketnoi(); kn.ketnoi();
	    String sql = "delete from loai where maloai=?";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setString(1, maloai);
	    int kq = cmd.executeUpdate();
	    kn.cn.close();
	    return kq;
	}

	public int editLoai(String maloai, String tenloaimoi) throws Exception {
	    Ketnoi kn = new Ketnoi(); kn.ketnoi();
	    String sql = "update loai set tenloai=? where maloai=?";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setString(1, tenloaimoi);
	    cmd.setString(2, maloai);
	    int kq = cmd.executeUpdate();
	    kn.cn.close();
	    return kq;
	}
}
