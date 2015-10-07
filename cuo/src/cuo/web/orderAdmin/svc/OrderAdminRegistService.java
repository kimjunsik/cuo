package cuo.web.orderAdmin.svc;
import static cuo.util.JdbcUtil.*;

import java.sql.Connection;

import cuo.web.orderAdmin.dao.OrderAdminDAO;
import cuo.web.orderAdmin.vo.OrderAdmin;

public class OrderAdminRegistService {

	public boolean getMenuData(OrderAdmin orderAdmin) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		OrderAdminDAO orderAdminDAO = OrderAdminDAO.getInstance();
		orderAdminDAO.setConnection(con);
		
		boolean registSuccess = false;
		int insertCount =
				orderAdminDAO.selectInsertMenu(orderAdmin);
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
