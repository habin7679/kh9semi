package semi2.beans;


import java.sql.Connection;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JdbcUtils {
//	public static Connection getConnection() throws Exception {
//		Class.forName("oracle.jdbc.OracleDriver");
//		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "kh14", "kh14");
//		
//		return con;
//	}	
		/*
		 * DBCP 방식 적용
		 * DataBase Connection Pool 방식으로 연결을 미리 다수 생성해두고 대여하여 사용하는 방식을 의미
		 * = 이미 등록한 자원context.xml 파일에 있는 resource를 찾아야 한다.
		 * = 찾아낸 resource에서 연결을 얻어와서 반환하는 형태로 코드가 바뀌어야 한다.
		 * 
		 */
		
		private static DataSource src;
		static {//static 초기화 구문
			try {
				//1. 자원 탐색 도구를 생성
				Context ctx = new InitialContext();
				
				//2. 자원 탐색 도구를 이용하여 등록된 자원 중 name="jdbc/oracle"인 Resource를 찾도록 지시 찾아서 위 src에 넣음
				src = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
				
			} catch (NamingException e) {
				e.printStackTrace();
			}
			
		}
		//연결해둔 src를 이용하여 연결을 얻어와서 반환하는 형태로 연결 (연결을 더이상 생성하지 않음)
		public static Connection getConnection() throws Exception{
			return src.getConnection();
		}
	
}
