package cuo.web.myPage.svc;

import java.sql.Connection;
import static cuo.util.JdbcUtil.*;

import cuo.web.myPage.dao.MypageDAO;

public class MemberRemoveService {

	public boolean memberDelete(String id) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		MypageDAO mypageDAO = MypageDAO.getInstance();
		mypageDAO.setConnection(con);
		
		boolean removeSuccess = false;
	     int deletecount = mypageDAO.deleteMember(id);
	     if (deletecount>0) {
	    	 removeSuccess=true;
			commit(con);
		}
	     else{
	    	 rollback(con);
	     }
		return removeSuccess;
	}

}
