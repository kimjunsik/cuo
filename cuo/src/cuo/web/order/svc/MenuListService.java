package cuo.web.order.svc;

import static cuo.util.JdbcUtil.close;
import static cuo.util.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import cuo.web.order.dao.OrderDAO;
import cuo.web.order.vo.Order;

public class MenuListService {

	public ArrayList<Order> getMenuList(String menuKey) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);
		
		ArrayList<Order> menuList = orderDAO.selectMenuList(menuKey);
		close(con);
		return menuList;
	}

}
