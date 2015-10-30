package cuo.web.memberAdmin.dao;

import static cuo.util.JdbcUtil.close;

import java.sql.PreparedStatement;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cuo.web.memberAdmin.vo.MemberAdmin;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/*private static MemberDAO instance;
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
	}*/
	public List<MemberAdmin> selectMemberList() {
		// TODO Auto-generated method stub
		List<MemberAdmin> memberList = 
				sqlSessionTemplate.selectList("memberAdmin.selectMember");
		return memberList;
	}
	
	public int updateMember(MemberAdmin memberAdmin) {
			// TODO Auto-generated method stub
			/*PreparedStatement pstmt = null;
	        
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
	        }*/
		int updateCount = 0;
		updateCount = sqlSessionTemplate.update("memberAdmin.updateMemberGrade",memberAdmin);
	      return updateCount;
	        
		}	
		
}
