package cuo.web.orderAdmin.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.orderAdmin.svc.OrderAdminMenuListService;
import cuo.web.orderAdmin.vo.OrderAdmin;

public class OrderAdminListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		OrderAdminMenuListService orderAdminMenuListService = 
				new OrderAdminMenuListService();
		ArrayList<OrderAdmin> orderList = orderAdminMenuListService.getOrderList();
		request.setAttribute("orderList",orderList);
		
		ActionForward forward = new ActionForward();
		forward.setUrl("orderAdmin/orderAdminList.jsp");
		return forward;
	}

}
