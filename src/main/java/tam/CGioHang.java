package tam;
import java.util.ArrayList;
import java.util.List;

public class CGioHang {
    public List<Hang> ds = new ArrayList<Hang>();

    public void Them(String th, int gia, int sl){
        int n=ds.size();
        for(int i=0;i<n;i++){
            if(ds.get(i).getTenhang().toLowerCase().trim().equals(th.toLowerCase().trim())){
                int slt=sl;
                ds.get(i).setSoluong(slt);
                int g= ds.get(i).getGia();
                int tt= slt*g;
                ds.get(i).setThanhtien(tt);
                return;
            }
        }
        Hang h= new Hang(th, gia, sl);
        ds.add(h);
    }
    
    public void SuaSoLuong(String ten, int slMoi){
        for(int i=0; i<ds.size(); i++){
            if(ds.get(i).getTenhang().equalsIgnoreCase(ten)){
                ds.get(i).setSoluong(slMoi);
                int g = ds.get(i).getGia();
                ds.get(i).setThanhtien(slMoi * g);
                break;
            }
        }
    }

    public long Tongtien(){
        int n=ds.size();
        long s=0;
        for(int i=0;i<n;i++){
            s=s+ds.get(i).getThanhtien();
        }
        return s;
    }

    // Xoá 1 sản phẩm theo tên
    public void Xoa(String ten){
        for(int i=0;i<ds.size();i++){
            if(ds.get(i).getTenhang().equalsIgnoreCase(ten)){
                ds.remove(i);
                break;
            }
        }
    }

    // Xoá tất cả sản phẩm
    public void XoaTatCa(){
        ds.clear();
    }
}
