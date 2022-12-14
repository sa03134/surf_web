package manager;

import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//싱글톤(Singleton) 적용

public class JdbcConnectionUtil {

	private static JdbcConnectionUtil instance;
//	
//	private String url = "jdbc:oracle:thin:@localhost:1521:orcl";
//	private String id = "jspuser";
//	private String password = "1234";
//	
	
	private DataSource ds;
	
	private JdbcConnectionUtil () {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:/comp/env/jdbc/TestDB"); //JNDI 경로
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static JdbcConnectionUtil getInstance() {
		
		synchronized(JdbcConnectionUtil.class) {

			
			try {
				Class.forName("oracle.jdbc.OracleDriver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			if(instance == null) {
				instance = new JdbcConnectionUtil();
			}
		}
		return instance;
		
	}
	
	public Connection getConnection() throws SQLException {
//		return DriverManager.getConnection(url,id,password);
		return ds.getConnection();
		
	}
	
	
}
