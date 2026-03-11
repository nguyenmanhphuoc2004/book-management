package Model;

import java.util.ArrayList;

public class GioHangBO {

	private ArrayList<GioHang> ds = new ArrayList<GioHang>();

	public ArrayList<GioHang> getDs() {
	   return ds;
	}
	public void Them(String masach, String tensach, long soluong, long gia, String anh) {
	    for(GioHang h: ds) {
	        if(h.getMasach().trim().toLowerCase().equals(masach.trim().toLowerCase())) {
	            h.setSoluong(h.getSoluong()+ soluong);
	            return;
	        }
	    }
	    ds.add(new GioHang(masach, tensach, soluong, gia, anh));
	}
	public void Xoa(String masach) {
	    for(GioHang h: ds) {
	        if(h.getMasach().trim().toLowerCase().equals(masach.trim().toLowerCase())) {
	            ds.remove(h);
	            return;
	        }
	    }
	}
	public long Tong() {
	    long s=0;
	    for(GioHang h: ds) s=s+h.getThanhtien();
	    return s;
	}
	public void XoaTatCa() {
		ds.clear();
		
	}
}
