package cuo.web.order.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.order.svc.OrderFormService;
import cuo.web.order.vo.Order;

public class OrderFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		OrderFormService orderFormService = new OrderFormService();
		String menuName = request.getParameter("menuName");
		Order menu = orderFormService.getMenu(menuName);
		request.setAttribute("menu", menu);
		ActionForward forward = new ActionForward();
		forward.setUrl("order/orderForm.jsp");
		return forward;
	}

}
