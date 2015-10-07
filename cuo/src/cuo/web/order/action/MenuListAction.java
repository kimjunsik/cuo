package cuo.web.order.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.order.svc.MenuListService;
import cuo.web.order.vo.Order;

public class MenuListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MenuListService menuListService = new MenuListService();
		String menuKey = request.getParameter("menuKey");
		ArrayList<Order> menuList = menuListService.getMenuList(menuKey);
		request.setAttribute("menuList", menuList);
		ActionForward forward = new ActionForward();
		forward.setUrl("order/menuList.jsp");
		return forward;
	}

}
