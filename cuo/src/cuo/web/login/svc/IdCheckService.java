package cuo.web.login.svc;
import static cuo.util.JdbcUtil.*;

import java.sql.Connection;

import cuo.web.login.dao.MemberDAO;
public class IdCheckService {

	public boolean existsId(String id) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		boolean idExists = false;
		int idCount = memberDAO.selectIdCount(id);
		if(idCount > 0){
			idExists = true;
		}
		close(con);
		return idExists;
	}

}
