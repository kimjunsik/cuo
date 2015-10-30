package cuo.web.myPage.svc;

import static cuo.util.JdbcUtil.commit;
import static cuo.util.JdbcUtil.getConnection;
import static cuo.util.JdbcUtil.rollback;

import java.sql.Connection;

import cuo.web.myPage.dao.MypageDAO;

public class OrderAcceptService {

	public static boolean acceptOrder(String id, String name, String messageMenu, String messageQty,
			String messageCurrent) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		MypageDAO mypageDAO = MypageDAO.getInstance();
		mypageDAO.setConnection(con);
		String order1 = "주문접수";
		String order2 = "미응답";
		
		boolean modifySuccess = false;
	     int updatecount = mypageDAO.updateOrder(id, name, messageMenu, messageQty, messageCurrent,order1,order2);
	     if (updatecount>0) {
	    	 modifySuccess=true;
			commit(con);
		}
	     else{
	    	 rollback(con);
	     }
		return modifySuccess;
	}

}
