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
	public int getCount() {
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
					+ " FROM bulletin_board";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 

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
	
	//글 하나의 정보를 삭제하는 메소드
	public boolean bulletin_delete(int num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기 
			String sql = "DELETE FROM bulletin_board"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setInt(1, num);
			//sql  문 수행하고 update or insert or delete 된 row 의 갯수 리턴받기 
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	//글 하나의 정보를 수정하는 메소드
	public boolean bulletin_update(bulletin_dto dto) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try {
				conn = new DbcpBean().getConn();
				//실행할 sql 문 준비하기 
				String sql = "UPDATE bulletin_board"
						+ " SET name=?, title=?, content=?"
						+ " WHERE num=?";
				pstmt = conn.prepareStatement(sql);
				//? 에 바인딩 할 값이 있으면 바인딩한다.
				pstmt.setString(1, dto.getName());
				pstmt.setString(2, dto.getBulletin_title());
				pstmt.setString(3, dto.getBulletin_content());
				pstmt.setInt(4, dto.getNum());
				//sql  문 수행하고 update or insert or delete 된 row 의 갯수 리턴받기 
				flag = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			if (flag > 0) {
				return true;
			} else {
				return false;
			}
		}
	//글 하나의 정보를 리턴하는 메소드
	public bulletin_dto bulletin_getData(int num) {
			//글하나의 정보를 담을 BoardDto 
			bulletin_dto dto=null;
			//필요한 객체의 참조값을 담을 지역변수 만들기 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				//Connection 객체의 참조값 얻어오기 
				conn = new DbcpBean().getConn();
				//실행할 sql 문 준비하기
				String sql = "SELECT name,title,content,regdate"
						+ " FROM bulletin_board"
						+ " WHERE num=?";
				pstmt = conn.prepareStatement(sql);
				//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
				pstmt.setInt(1, num);
				//select 문 수행하고 결과 받아오기 
				rs = pstmt.executeQuery();
				//결과 값 추출하기 
				if (rs.next()) {
					dto=new bulletin_dto();
					dto.setNum(num);
					dto.setName(rs.getString("name"));
					dto.setBulletin_title(rs.getString("title"));
					dto.setBulletin_content(rs.getString("content"));
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
	
	//게시판 리스트 불러오기
	public List<bulletin_dto> getList(bulletin_dto dto){
		List<bulletin_dto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=new DbcpBean().getConn();
			String sql ="SELECT *"
					+ " FROM"
					+ " (SELECT result1.*, ROWNUM AS rnum"
					+ " FROM (SELECT num, name, title, content, regdate, recom, lookup"
					+ " FROM bulletin_board"
					+ " ORDER BY num DESC) result1)"
					+ " WHERE rnum BETWEEN ? AND ?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				bulletin_dto tmp = new bulletin_dto();
				tmp.setNum(rs.getInt("num"));
				tmp.setName(rs.getString("name"));
				tmp.setBulletin_title(rs.getString("title"));
				tmp.setRegdate(rs.getString("regdate"));
				tmp.setRecom(rs.getInt("recom"));
				tmp.setLookup(rs.getInt("lookup"));
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
	
	public boolean bulletin_insert(bulletin_dto dto) {
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "INSERT INTO bulletin_board"
					+ " (num, name, title, content, regdate)"
					+ " VALUES(bb_seq.NEXTVAL,'이름', ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩 한다.
			pstmt.setString(1, dto.getBulletin_title());
			pstmt.setString(2, dto.getBulletin_content());
			//sql 문 수행하고 update or insert or delete 된 row 의 갯수 리턴 받기
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
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