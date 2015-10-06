package cuo.web.login.svc;

import java.sql.Connection;
import static cuo.util.JdbcUtil.*;
import cuo.web.login.dao.MemberDAO;
import cuo.web.login.vo.Member;

public class MemberRegistService {

	public boolean memberData(Member member) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		boolean registSuccess = false;
		int insertCount =
				memberDAO.insertMember(member);
		if(insertCount > 0){
			registSuccess = true;
			commit(con);
		}
		else{
			rollback(con);
		}
		close(con);
		return registSuccess;
	}

}
