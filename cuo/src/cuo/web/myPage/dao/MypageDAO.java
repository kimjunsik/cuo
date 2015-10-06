package cuo.web.myPage.dao;

import static cuo.util.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import cuo.web.myPage.vo.Member;




public class MypageDAO {
	private static MypageDAO instance;
	private Connection con;
	public MypageDAO() {
		// TODO Auto-generated constructor stub
	}
	public static MypageDAO getInstance(){
		if(instance == null){
			instance = new MypageDAO();
		}
		return instance;
	}
	public void setConnection(Connection con){
		this.con = con;
	}
	public Member selectPassword(String passwd) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM member WHERE passwd = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member loginMember = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, passwd);
			rs = pstmt.executeQuery();
			if(rs.next()){
				//로그인성공
				loginMember = new Member();
				loginMember.setId(rs.getString("id"));
				loginMember.setName(rs.getString("name"));
				loginMember.setPasswd(rs.getString("passwd"));
				loginMember.setAddr(rs.getString("addr"));
				loginMember.setBirthday(rs.getString("birthday"));
				loginMember.setGrade(rs.getString("grade"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally{
			close(rs);	
			close(pstmt);
		}		
		return loginMember;
	}
	public Member selectMember(String id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM member WHERE id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				member = new Member(rs.getString("id"),
						rs.getString("name"),
						rs.getString("passwd"),
						rs.getString("addr"),
						rs.getString("birthday"),
						rs.getString("grade"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}

		return member;
	}
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		String sql = "UPDATE member SET name = ?,"
				+ "passwd = ?,"
				+ "addr = ?,"
				+ "birthday = ?,"
				+ "grade = ? WHERE id = ?";
		PreparedStatement pstmt = null;
		int updateCount =0;
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getAddr());
			pstmt.setString(4, member.getBirthday());
			pstmt.setString(5, member.getGrade());
			pstmt.setString(6, member.getId());
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
	public int deleteMember(String id) {
		// TODO Auto-generated method stub
		String sql = "DELETE from member WHERE id = ?"; 
		
		
		PreparedStatement pstmt = null;
		int deleteCount = 0;
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			deleteCount = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception 
			e.printStackTrace();
		} 	
		finally{
			close(pstmt);
		}
		return deleteCount;
	}

}
