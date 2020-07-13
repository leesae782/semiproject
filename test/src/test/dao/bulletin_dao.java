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
