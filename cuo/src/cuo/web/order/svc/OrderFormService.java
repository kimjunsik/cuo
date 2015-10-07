package cuo.web.order.svc;

import static cuo.util.JdbcUtil.close;
import static cuo.util.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import cuo.web.order.dao.OrderDAO;
import cuo.web.order.vo.Order;

public class OrderFormService {

	public Order getMenu(String menuName) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);
		
		Order menu = orderDAO.selectMenu(menuName);
		close(con);
		return menu;
	}

}
