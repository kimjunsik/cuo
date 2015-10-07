package cuo.web.orderAdmin.svc;
import static cuo.util.JdbcUtil.*;

import java.sql.Connection;

import cuo.web.orderAdmin.dao.OrderAdminDAO;
public class OrderAdminMenuRemoveService {

	public boolean menuDelete(String id) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		OrderAdminDAO orderAdminDAO = OrderAdminDAO.getInstance();
		orderAdminDAO.setConnection(con);
		
		boolean removeSuccess = false;
	     int deletecount = orderAdminDAO.selectDeleteMenu(id);
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
