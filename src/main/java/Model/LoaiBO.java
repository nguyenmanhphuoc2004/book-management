package Model;
import java.util.ArrayList;

public class LoaiBO {
    LoaiDAO ldao = new LoaiDAO();
    
    public ArrayList<Loai> getloai() throws Exception {
        return ldao.getloai();
    }
    
    public int them(String maloai, String tenloai) throws Exception {
        return ldao.addLoai(maloai, tenloai);
    }
    
    public int xoa(String maloai) throws Exception {
        return ldao.deleteLoai(maloai);
    }
    
    public int sua(String maloai, String tenloaimoi) throws Exception {
        return ldao.editLoai(maloai, tenloaimoi);
    }
}