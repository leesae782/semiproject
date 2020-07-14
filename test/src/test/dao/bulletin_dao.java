package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.dto.bulletin_dto;
import test.util.DbcpBean;

public class bulletin_dao {
	private static bulletin_dao dao;
	private bulletin_dao() {}
	public static bulletin_dao getInstance() {
		if(dao==null) {
			dao = new bulletin_dao();
		}
		return dao;
	}
	//글 하나의 정보를 저장하는 메소드 
		public boolean bulletin_insert(bulletin_dto dto) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try {
				//Connection Pool 에서 Connection 객체를 하나 가지고 온다. 
				conn = new DbcpBean().getConn();
				//실행할 sql 문 준비하기 
				String sql = "INSERT INTO bulletin_board"
						+ " (num,title,regdate)"
						+ " VALUES(bulletin_board_seq.NEXTVAL,?,?,SYSDATE)";
				pstmt = conn.prepareStatement(sql);
				//? 에 바인딩 할 값이 있으면 바인딩한다.
				pstmt.setString(1, dto.getBulletin_title());
				pstmt.setString(2, dto.getBulletin_content());
				//sql  문 수행하고 update or insert or delete 된 row 의 갯수 리턴받기 
				flag = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close(); // Connection 반납하기 
				} catch (Exception e) {
				}
			}
			if (flag > 0) {
				return true;
			} else {
				return false;
			}
		}
	
	//게시판 리스트 불러오기
	public List<bulletin_dto> getList(){
		List<bulletin_dto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=new DbcpBean().getConn();
			String sql ="SELECT num,name,title,regdate,recom,lookup"
					+ " FROM bulletin_board"
					+ " ORDER BY num DESC";
			
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				bulletin_dto dto = new bulletin_dto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setBulletin_title(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setRecom(rs.getInt("recom"));
				dto.setLookup(rs.getInt("lookup"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
}
