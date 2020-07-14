package test.memberdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.memberdto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	private static MemberDao dao;
	private MemberDao() {}
	public static MemberDao getInstance() {
		
		if(dao==null) {
			dao = new MemberDao();
		}
		return dao;
	}
	
	public boolean update(MemberDto dto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "UPDATE MEMBER SET"
					+" nick=?,email=? where id =?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getNick());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getId());
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
	
	public MemberDto getData(String id) {
		MemberDto dto = null;
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "SELECT pwd,nick,email,profile,regdate FROM member WHERE id= ?";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setString(1, id);
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			while (rs.next()) {
				dto = new MemberDto();
				dto.setId(id);
				dto.setPwd(rs.getString("pwd"));
				dto.setNick(rs.getString("nick"));
				dto.setEmail(rs.getString("email"));
				dto.setRegdate(rs.getString("regdate"));
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
		
		return dto;
	}
	public boolean isValid(MemberDto dto) {
		boolean isValid=false;
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "SELECT id,pwd from member where id=?and pwd=?";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				isValid =true;
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
		return isValid;
	}
	
	public boolean insert(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "INSERT INTO MEMBER(id,pwd,nick,email,regdate)"
					+" VALUES(?,?,?,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getNick());
			pstmt.setString(4, dto.getEmail());
			
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