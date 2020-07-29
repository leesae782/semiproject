package test.commentdao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import test.commentdto.CommentDto;
import test.util.DbcpBean;

public class CommentDao {
	private static CommentDao dao;
	private CommentDao() {}
	public static CommentDao getInstance() {

		if(dao==null) {
			dao= new CommentDao();
		}
		return dao;
	}
	
	public boolean insert(CommentDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "insert into board_comment values()";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.

			// sql문 수행하고 update or insert or delete 된 row 의 개수 리턴받기
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					pstmt.close();
			} catch (Exception e) {
			}

		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
		
	}
}
