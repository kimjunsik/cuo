package cuo.web.login.svc;

//import static cuo.util.JdbcUtil.*;
//import java.sql.Connection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cuo.web.login.dao.LoginDAO;
import cuo.web.login.vo.Member;

@Service
public class LoginService {
	@Autowired
	private LoginDAO loginDAO;
	
	public Member getLoginUser(String id, String passwd) {
		// TODO Auto-generated method stub
//		Connection con = getConnection();
//		MemberDAO memberDAO = MemberDAO.getInstance(); 
//		memberDAO.setConnection(con);
		
		Member loginMember = null;
		loginMember = loginDAO.selectLoginMember(id,passwd);
//		close(con);
		return loginMember;
	}

}
