package Model;

import java.sql.Connection;
import java.sql.DriverManager;

public class Ketnoi {
    public Ketnoi() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Connection cn = null;

    public Connection getCn() {
        return cn;
    }

    public void setCn(Connection cn) {
        this.cn = cn;
    }

    public void ketnoi() throws Exception {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;"
                   + "databaseName=QlSach;"
                   + "user=sa;"
                   + "password=123;"
                   + "encrypt=true;"
                   + "trustServerCertificate=true;";

        cn = DriverManager.getConnection(url);
        System.out.println("✅ Đã kết nối SQL Server thành công!");
    }

    public static void main(String[] args) {
        try {
            Ketnoi kn = new Ketnoi();
            kn.ketnoi(); 
            if (kn.cn != null) {
                System.out.println("Kết nối OK, Database: " + kn.cn.getCatalog());
            } else {
                System.out.println("Kết nối thất bại!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
