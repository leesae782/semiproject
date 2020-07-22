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
	//인자로 전달된 아이디가member 테이블에 존재하는지 여부를 리턴하는 메소드
			public boolean isEmailExist(String inputEmail) {
				
				boolean isExist=false;
				//필요한 객체의 참조값을 담을 지역변수 만들기 
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				try {
					//Connection 객체의 참조값 얻어오기 
					conn = new DbcpBean().getConn();
					//실행할 sql 문 준비하기
					String sql = "SELECT email"
							+ " FROM Member"
							+ " WHERE email=?";
					pstmt = conn.prepareStatement(sql);
					//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
					pstmt.setString(1, inputEmail);
					//select 문 수행하고 결과 받아오기 
					rs = pstmt.executeQuery();
					//select 된 row 가 있는지 확인한다. 
					if (rs.next()) {
						isExist=true;//해당 아이디가 이미 존재 하는 경우 
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
				return isExist; //아이디 존재 여부를 리턴한다. 
			}
	//인자로 전달된 아이디가member 테이블에 존재하는지 여부를 리턴하는 메소드
		public boolean isExist(String inputId) {
			
			boolean isExist=false;
			//필요한 객체의 참조값을 담을 지역변수 만들기 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				//Connection 객체의 참조값 얻어오기 
				conn = new DbcpBean().getConn();
				//실행할 sql 문 준비하기
				String sql = "SELECT id"
						+ " FROM Member"
						+ " WHERE id=?";
				pstmt = conn.prepareStatement(sql);
				//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
				pstmt.setString(1, inputId);
				//select 문 수행하고 결과 받아오기 
				rs = pstmt.executeQuery();
				//select 된 row 가 있는지 확인한다. 
				if (rs.next()) {
					isExist=true;//해당 아이디가 이미 존재 하는 경우 
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
			return isExist; //아이디 존재 여부를 리턴한다. 
		}
		
			public boolean isnickExist(String inputnick) {
			
			boolean isExist=false;
			//필요한 객체의 참조값을 담을 지역변수 만들기 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				//Connection 객체의 참조값 얻어오기 
				conn = new DbcpBean().getConn();
				//실행할 sql 문 준비하기
				String sql = "SELECT nick"
						+ " FROM Member"
						+ " WHERE nick=?";
				pstmt = conn.prepareStatement(sql);
				//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
				pstmt.setString(1, inputnick);
				//select 문 수행하고 결과 받아오기 
				rs = pstmt.executeQuery();
				//select 된 row 가 있는지 확인한다. 
				if (rs.next()) {
					isExist=true;//해당 아이디가 이미 존재 하는 경우 
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
			return isExist; //아이디 존재 여부를 리턴한다. 
		}
	public boolean updatePwd (MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "update member set pwd = ? where id=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getNewPwd());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPwd());
			// sql문 수행하고 update or insert or delete 된 row 의 개수 리턴받기
			flag = pstmt.executeUpdate();  //수정된 row의개수가리턴
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
	public boolean delete(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "DELETE FROM MEMBER"
					+" WHERE ID = ?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, id);
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
	
	public boolean update(MemberDto dto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "UPDATE MEMBER SET"
					+" nick=?,email=?, profile=?where id =?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getNick());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getProfile());
			pstmt.setString(4, dto.getId());
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
				dto.setProfile(rs.getString("profile"));
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
			String sql = "INSERT INTO MEMBER(id,pwd,nick,email,profile,regdate)"
					+" VALUES(?,?,?,?,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getNick());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getProfile());
			
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
