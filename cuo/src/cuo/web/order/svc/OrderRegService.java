package cuo.web.order.svc;

import static cuo.util.JdbcUtil.close;
import static cuo.util.JdbcUtil.getConnection;
import static cuo.util.JdbcUtil.*;

import java.sql.Connection;

import cuo.web.order.dao.OrderDAO;

public class OrderRegService {

	public boolean setOrderReg(String id ,String menuKey, String menuName,String select1, String select2,String textArea, String menuCurrent) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);
		boolean regSuccess = false;
		int orderCount = orderDAO.insertOrderReg(id,menuKey,menuName,select1,select2,textArea,menuCurrent);
		
		if(orderCount > 0 ){
			commit(con);
			regSuccess = true;
		}
		else{
			rollback(con);
		}
		close(con);
		return regSuccess;
	}

}
