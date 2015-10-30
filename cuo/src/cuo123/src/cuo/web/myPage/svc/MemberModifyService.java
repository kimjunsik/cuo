package cuo.web.myPage.svc;


import cuo.web.myPage.dao.MypageDAO;
import cuo.web.myPage.vo.Member;
import static cuo.util.JdbcUtil.*;

import java.sql.Connection;
public class MemberModifyService {

	public boolean modifyMember(Member member) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		MypageDAO mypageDAO = MypageDAO.getInstance();
		mypageDAO.setConnection(con);
		
		boolean modifySuccess = false;
	     int updatecount = mypageDAO.updateMember(member);
	     if (updatecount>0) {
	    	 modifySuccess=true;
			commit(con);
		}
	     else{
	    	 rollback(con);
	     }
		return modifySuccess;
	}

}
