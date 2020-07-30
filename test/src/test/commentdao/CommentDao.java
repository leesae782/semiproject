package test.commentdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.commentdto.CommentDto;
import test.dto.BulletinDto;
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
	
	
	
	public boolean delete(CommentDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "DELETE FROM board_comment where num=? and name =?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getName());
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

	
	public int getCount(int boardnum) {
		//전체 row  의 갯수를 담을 지역 변수 
		int count=0;
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//ROWNUM 중에서 가장 큰 숫자를 얻어오면 전체 row  의 갯수가 된다. 
			//혹시 row 가 하나도 없으면 null 이 얻어와 지기때문에  null 인 경우 0 으로 
			//바꿔 줘야 한다.
			String sql = "SELECT NVL(MAX(ROWNUM), 0) AS num"
					+ " FROM board_comment where boardnum=?";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setInt(1, boardnum);
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//결과 값 추출하기 
			if (rs.next()) {
				count=rs.getInt("num");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return count;
	}
	public List<CommentDto> getList(CommentDto dto){
		List<CommentDto> list =new ArrayList<>();
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "SELECT *"
					+ " FROM"
					+ "     (SELECT result1.*, ROWNUM AS rnum"
					+ "      FROM (SELECT *"
					+ "            FROM board_comment WHERE boardnum=?"
					+ "            ORDER BY num DESC) result1)"
					+ "   where rnum BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setInt(1, dto.getBoardnum());
			pstmt.setInt(2, dto.getStartRowNum());
			pstmt.setInt(3, dto.getEndRowNum());
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			while (rs.next()) {
				CommentDto tmp = new CommentDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setName(rs.getString("name"));
				tmp.setContent(rs.getNString("content"));
				tmp.setRegdate(rs.getString("regdate"));
				tmp.setBoardnum(rs.getInt("boardnum"));
				
				list.add(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}
	public boolean insert(CommentDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "insert into board_comment"
					+" values(board_comment_seq.nextval,?,?,sysdate,?)";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getBoardnum());
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
