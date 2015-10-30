package cuo.web.memberAdmin.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cuo.web.memberAdmin.dao.MemberDAO;
import cuo.web.memberAdmin.vo.MemberAdmin;
@Service
public class MemberGradeModifyProService {
	@Autowired
	private MemberDAO memberDAO;
	
	public boolean modifyMember(MemberAdmin memberAdmin) {
		// TODO Auto-generated method stub
		/*Connection con = getConnection();
	    MemberDAO memberDAO = MemberDAO.getInstance();
	    memberDAO.setConnection(con);*/
	    boolean modifySuccess = false;
	      int updateCount = memberDAO.updateMember(memberAdmin);
	      if(updateCount > 0){
//	         commit(con);
	         modifySuccess = true;
	      }
	      else{
//	         rollback(con);
	      }
//	      close(con);
	      return modifySuccess;
	}

}