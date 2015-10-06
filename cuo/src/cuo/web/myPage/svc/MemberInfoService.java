package cuo.web.myPage.svc;
import static cuo.util.JdbcUtil.*;

import java.sql.Connection;

import cuo.web.myPage.dao.MypageDAO;
import cuo.web.myPage.vo.Member;

public class MemberInfoService {


	public Member getMemberInfopasswd(String passwd) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		MypageDAO mypageDAO = MypageDAO.getInstance();
		mypageDAO.setConnection(con);
		
		Member password = null;
		password = mypageDAO.selectPassword(passwd);
		close(con);
		return password;
	}

	

}
