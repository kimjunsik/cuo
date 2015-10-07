package cuo.web.order.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.login.vo.Member;
import cuo.web.order.svc.OrderListService;
import cuo.web.order.vo.Order;

public class OrderListAction implements Action {

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		OrderListService orderListService = new OrderListService();
		
		ArrayList<Order> orderList = orderListService.getOrderList();
		
		ActionForward forward = new ActionForward();
		if(loginMember != null){
			request.setAttribute("orderList", orderList);
			forward.setUrl("order/menuChoice.jsp");
		}
		else{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비로그인시 접근하실 수 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
