package cuo.web.memberAdmin.svc;

import static cuo.util.JdbcUtil.*;

import java.sql.Connection;

import cuo.web.memberAdmin.dao.MemberDAO;
import cuo.web.memberAdmin.vo.MemberAdmin;

public class MemberGradeModifyProService {

	public boolean modifyMember(String id, String grade) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
	    MemberDAO memberDAO = MemberDAO.getInstance();
	    memberDAO.setConnection(con);
	    boolean modifySuccess = false;
	      int updateCount = memberDAO.updateMember(id, grade);
	      if(updateCount > 0){
	         commit(con);
	         modifySuccess = true;
	      }
	      else{
	         rollback(con);
	      }
	      close(con);
	      return modifySuccess;
	}

}