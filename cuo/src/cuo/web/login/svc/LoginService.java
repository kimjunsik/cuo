package cuo.web.login.svc;

import static cuo.util.JdbcUtil.*;

import java.sql.Connection;

import cuo.web.login.dao.MemberDAO;
import cuo.web.login.vo.Member;

public class LoginService {

	public Member getLoginUser(String id, String passwd) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance(); 
		memberDAO.setConnection(con);
		
		Member loginMember = null;
		loginMember = memberDAO.selectLoginMember(id,passwd);
		close(con);
		return loginMember;
	}

}
