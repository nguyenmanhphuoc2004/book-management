package Model;
import java.util.Date;

public class ViewHoadon {
    private int maHoaDon;
    private String hoTen;
    private Date ngayMua;
    private boolean daMua;

    public ViewHoadon() { super(); }

    public ViewHoadon(int maHoaDon, String hoTen, Date ngayMua, boolean daMua) {
        this.maHoaDon = maHoaDon;
        this.hoTen = hoTen;
        this.ngayMua = ngayMua;
        this.daMua = daMua;
    }

    public int getMaHoaDon() { return maHoaDon; }
    public void setMaHoaDon(int maHoaDon) { this.maHoaDon = maHoaDon; }
    public String getHoTen() { return hoTen; }
    public void setHoTen(String hoTen) { this.hoTen = hoTen; }
    public Date getNgayMua() { return ngayMua; }
    public void setNgayMua(Date ngayMua) { this.ngayMua = ngayMua; }
    public boolean isDaMua() { return daMua; }
    public void setDaMua(boolean daMua) { this.daMua = daMua; }
}