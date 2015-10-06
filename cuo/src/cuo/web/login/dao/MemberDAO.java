package cuo.web.login.dao;
import static cuo.util.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import cuo.web.login.vo.Member;

public class MemberDAO {
	private static MemberDAO instance;
	private Connection con;
	public MemberDAO() {
		// TODO Auto-generated constructor stub
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
	public int insertMember(Member member) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO member VALUES (?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		int insertCount =0;
		try {

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPasswd());
			pstmt.setString(4, member.getAddr());
			pstmt.setString(5, member.getBirthday());
			pstmt.setString(6, member.getGrade());
			insertCount = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return insertCount;
	}
	public int selectIdCount(String id) {
		// TODO Auto-generated method stub
		String sql = "SELECT COUNT(*) FROM member WHERE id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int idCount = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				idCount = rs.getInt(1);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally{
			close(rs);
			close(pstmt);
		}
		return idCount;
	}
	public Member selectLoginMember(String id, String passwd) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM member WHERE id = ? AND passwd = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member loginMember = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			
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
}
