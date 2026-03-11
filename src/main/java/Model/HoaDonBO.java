package Model;

public class HoaDonBO {
	HoaDonDAO hddao = new HoaDonDAO();
	public long Them(Long makh) throws Exception{
		return hddao.Them(makh);
	}
}
