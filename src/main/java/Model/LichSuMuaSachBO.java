package Model;

import java.util.ArrayList;

public class LichSuMuaSachBO {
	LichSuMuaSachDAO lsmsDAO = new LichSuMuaSachDAO();
	ArrayList<LichSuMuaSach> ds;
	
	public int CapNhatHoaDon(String username, String password) throws Exception {
		int ketqua = lsmsDAO.CapNhatHoaDon(username, password);
		return ketqua;
		
	}
	
	public int CapNhatChiTietHoaDonTheoMaHd(int maHd ,String masach, long soluongmua) throws Exception {
		int ketqua = lsmsDAO.CapNhatChiTietHoaDonTheoMaHd(maHd,masach,soluongmua);
		return ketqua;
	}

	public ArrayList<LichSuMuaSach> getLichSu(String username) throws Exception {
		// TODO Auto-generated method stub
		ds = lsmsDAO.getLichSu(username);
		return ds;
	}

	
}
