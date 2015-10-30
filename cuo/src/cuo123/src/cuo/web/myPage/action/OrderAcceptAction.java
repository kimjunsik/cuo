package cuo.web.myPage.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.login.vo.Member;
import cuo.web.myPage.svc.MemberModifyService;
import cuo.web.myPage.svc.MyOrderListService;
import cuo.web.myPage.svc.OrderAcceptService;
import cuo.web.myPage.vo.OrderList;

public class OrderAcceptAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");

		String id = loginMember.getId();
		String name = loginMember.getName();
		System.out.println(name);


		MyOrderListService myOrderListService = new MyOrderListService();
		ArrayList<OrderList> myOrderList = myOrderListService.getMyOrderList2(name);
		ActionForward forward = new ActionForward();
		for(int i = 0;i < myOrderList.size();i++ ){		
			String messageMenu = myOrderList.get(i).getMessageMenu();
			String messageQty = myOrderList.get(i).getMessageQty();
			String messageCurrent = myOrderList.get(i).getMessageCurrent();
			System.out.println(messageMenu + messageQty + messageCurrent);
			boolean acceptSuccess= OrderAcceptService.acceptOrder(id, name, messageMenu, messageQty, messageCurrent );
			
			
			if(acceptSuccess){

				forward = new ActionForward();
				forward.setUrl("myOrderList.mp");
			}
			else{
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('수락실패')");
				out.println("histroy.back()");
				out.println("</script>");
				forward = new ActionForward();
				forward.setUrl("myOrderList.mp");
			}
			request.setAttribute("name", name);
			
		}


		return forward;






	}

}
