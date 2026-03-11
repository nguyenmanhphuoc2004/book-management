package Model;

public class ChiTietBO {
	ChiTietDAO ctdao = new ChiTietDAO();
	public int Them(String masach, Long soluong,long maHD) throws Exception{
		return ctdao.Them(masach, soluong,maHD);
	}

}
