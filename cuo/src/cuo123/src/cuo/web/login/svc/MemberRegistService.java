package cuo.web.login.svc;

//import java.sql.Connection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import static cuo.util.JdbcUtil.*;
import cuo.web.login.dao.LoginDAO;
import cuo.web.login.vo.Member;
@Service
public class MemberRegistService {
	@Autowired
	private LoginDAO loginDAO;
	
	public boolean memberData(Member member) {
		// TODO Auto-generated method stub
		
		boolean registSuccess = false;
		int insertCount =
				loginDAO.insertMember(member);
		if(insertCount > 0){
			registSuccess = true;
		}
		else{
		}
		return registSuccess;
	}
/*	public boolean memberData(Member member) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		LoginDAO memberDAO = LoginDAO.getInstance();
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
*/
}
