package test.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DbcpBean {
	//필드
		private Connection conn;
		//생성자
		public DbcpBean() {
			//Connection 객체의 참조값을 얻어와서 필드에 저장하는 작업을 한다.
			try {
				Context initContext = new InitialContext();
				Context envContext  = (Context)initContext.lookup("java:/comp/env");
				// jdbc/myoracle 이라는 이름의 DataSource(Connection Pool) 에서 
				DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
				// Connection 객체를 하나 가지고 온다.  
				conn = ds.getConnection();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		//Connection 객체를 리턴해주는 메소드
		public Connection getConn() {
			return conn;
		}
}
