package cuo.web.myPage.svc;

import static cuo.util.JdbcUtil.close;
import static cuo.util.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import cuo.web.myPage.dao.MypageDAO;
import cuo.web.myPage.vo.OrderList;

public class MyOrderListService {

	public ArrayList<OrderList> getMyOrderList(String id) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		MypageDAO mypageDAO = MypageDAO.getInstance();
		mypageDAO.setConnection(con);
		
		ArrayList<OrderList> orderList = mypageDAO.selectMyOrderList(id);
		
		close(con);
		return orderList;
	}

	public ArrayList<OrderList> getMyOrderList2(String name) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		MypageDAO mypageDAO = MypageDAO.getInstance();
		mypageDAO.setConnection(con);
		
		ArrayList<OrderList> orderList = mypageDAO.selectMyOrderList2(name);
		
		close(con);
		return orderList;
	}

}
