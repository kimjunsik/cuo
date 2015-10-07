package cuo.web.order.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.login.vo.Member;
import cuo.web.order.svc.OrderRegService;

public class OrderRegAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		OrderRegService orderRegService = new OrderRegService();
		
		String id = loginMember.getId();
		String menuKey = request.getParameter("menuKey");
		String menuName = request.getParameter("menuName");
		String select1 = request.getParameter("select1");
		String select2 = request.getParameter("select2");
		String textArea = request.getParameter("textArea");
		String menuCurrent = request.getParameter("menuCurrent");
		
		System.out.println(id+menuKey+menuName+textArea+select1+select2);
		boolean orderReg = orderRegService.setOrderReg(id,menuKey,menuName,select1,select2,textArea,menuCurrent);
		request.setAttribute("orderReg", orderReg);
		ActionForward forward = new ActionForward();
		forward.setUrl("orderList.or");
		return forward;
	}

}
