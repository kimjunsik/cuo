package cuo.web.memberAdmin.dao;

import static cuo.util.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import cuo.web.memberAdmin.vo.MemberAdmin;


public class MemberDAO {
	private static MemberDAO instance;
	private Connection con;
	public MemberDAO(){
		
	}
	public static MemberDAO getInstance(){
		if(instance == null){
			instance = new MemberDAO();
		}
		return instance;
	}
	public void setConnection(Connection con){
		this.con = con;
	}
	public ArrayList<MemberAdmin> selectMemberList() {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MemberAdmin> memberList = null;
		MemberAdmin member = null;
		try {
			pstmt = con.prepareStatement("SELECT * FROM member");
			rs = pstmt.executeQuery();

			if(rs.next()){
				//글이 하나라도 있으면...
				memberList = new ArrayList<MemberAdmin>();
				do {
					member = new MemberAdmin();
					member.setBirthday(rs.getString("birthday"));
					member.setId(rs.getString("id"));
					member.setName(rs.getString("name"));
					member.setPasswd(rs.getString("passwd"));
					member.setGrade(rs.getString("grade"));
					memberList.add(member);
				} while (rs.next());
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}      
		finally {
			close(rs);
			close(pstmt);
		}
		return memberList;
	}
	
	public int updateMember(String id, String grade) {
			// TODO Auto-generated method stub
			PreparedStatement pstmt = null;
	        int updateCount = 0;
	        String sql = "UPDATE member SET grade = ? WHERE id = ?";
	        try {
	        	
	        	pstmt = con.prepareStatement(sql);
	        	pstmt.setString(1, grade);
	        	pstmt.setString(2, id);
	        	updateCount = pstmt.executeUpdate();
	        	
	        	
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
	        finally {
	            close(pstmt);
	        }
	      return updateCount;
	        
		}	
		
}
