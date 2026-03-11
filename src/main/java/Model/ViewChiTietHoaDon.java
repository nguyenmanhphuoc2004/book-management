package Model;

public class ViewChiTietHoaDon {
    private int maHoaDon;
    private String maSach;
    private String tenSach;
    private int soLuong;
    private long gia;
    private long thanhtien;

    public ViewChiTietHoaDon(int maHoaDon, String maSach, String tenSach, int soLuong, long gia,long thanhtien) {
        this.maHoaDon = maHoaDon;
        this.maSach = maSach;
        this.tenSach = tenSach;
        this.soLuong = soLuong;
        this.gia = gia;
        this.thanhtien = thanhtien;
    }

    public int getMaHoaDon() {
        return maHoaDon;
    }

    public String getMaSach() {
        return maSach;
    }

    public String getTenSach() {
        return tenSach;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public long getGia() {
        return gia;
    }
    public long getThanhTien() {
    	return thanhtien;
    }
}
