package Model;

import java.util.ArrayList;

public class SachBO {
	SachDAO sdao = new SachDAO();
	ArrayList<Sach> ds;
	public ArrayList<Sach> getsach() throws Exception{
		ds = sdao.getsach();
		return ds;
	}
	public ArrayList<Sach> TimMa(String maloai) throws Exception{
		ArrayList<Sach> tam = new ArrayList<Sach>();
		for(Sach s : ds)
			if(s.getMaloai().trim().toLowerCase().equals(maloai.trim().toLowerCase()))
				tam.add(s);
		return tam;
	}
	public ArrayList<Sach> Tim(String key) throws Exception{
		ArrayList<Sach> tam = new ArrayList<Sach>();
		for(Sach s : ds)
			if(s.getMaloai().trim().toLowerCase().equals(key.trim().toLowerCase()) || s.getTacgia().trim().toLowerCase().equals(key.trim().toLowerCase()))
				tam.add(s);
		return tam;
	}
	
	public int them(String masach, String tensach, long soluong, long gia, 
            String maloai, String anh, String tacgia) throws Exception {
			return sdao.themSach(masach, tensach, soluong, gia, maloai, anh, tacgia);
			}
	public int xoa(String masach) throws Exception {
			return sdao.xoaSach(masach);
			}
}
