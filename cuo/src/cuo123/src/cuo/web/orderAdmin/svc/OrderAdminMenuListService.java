package cuo.web.orderAdmin.svc;

import java.sql.Connection;
import java.util.ArrayList;
import static cuo.util.JdbcUtil.*;

import cuo.web.orderAdmin.dao.OrderAdminDAO;
import cuo.web.orderAdmin.vo.OrderAdmin;

public class OrderAdminMenuListService {

	public ArrayList<OrderAdmin> getOrderList() {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		OrderAdminDAO orderAdminDAO = OrderAdminDAO.getInstance();
		orderAdminDAO.setConnection(con);
		
		ArrayList<OrderAdmin> orderList = orderAdminDAO.selectOrderList();
		close(con);
		return orderList;
	}

}
