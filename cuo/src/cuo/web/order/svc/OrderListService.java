package cuo.web.order.svc;

import static cuo.util.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import cuo.web.order.vo.Order;
import cuo.web.order.dao.OrderDAO;

public class OrderListService {

	public ArrayList<Order> getOrderList() {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);
		
		ArrayList<Order> orderList = orderDAO.selectOrderList();
		
		close(con);
		return orderList;
	}

}
