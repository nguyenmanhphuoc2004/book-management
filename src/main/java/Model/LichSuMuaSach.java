package Model;

import java.util.Date;

public class LichSuMuaSach {
	private String makh;
	private String tensach;
	private long gia;
	private long soluongmua;
	private long thanhtien;
	private boolean damua;
	private Date ngaymua;
	
	public LichSuMuaSach() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public LichSuMuaSach(String makh, String tensach, long gia, long soluongmua, long thanhtien, boolean damua,
			Date ngaymua) {
		super();
		this.makh = makh;
		this.tensach = tensach;
		this.gia = gia;
		this.soluongmua = soluongmua;
		this.thanhtien = thanhtien;
		this.damua = damua;
		this.ngaymua = ngaymua;
	}
	public String getMakh() {
		return makh;
	}
	public void setMakh(String makh) {
		this.makh = makh;
	}
	public String getTensach() {
		return tensach;
	}
	public void setTensach(String tensach) {
		this.tensach = tensach;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public long getSoluongmua() {
		return soluongmua;
	}
	public void setSoluongmua(long soluongmua) {
		this.soluongmua = soluongmua;
	}
	public long getThanhtien() {
		return thanhtien;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	public Date getNgaymua() {
		return ngaymua;
	}
	public void setNgaymua(Date ngaymua) {
		this.ngaymua = ngaymua;
	}
	
	
	
}
