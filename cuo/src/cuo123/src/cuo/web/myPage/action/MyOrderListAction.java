package cuo.web.myPage.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.login.vo.Member;
import cuo.web.myPage.svc.MyOrderListService;
import cuo.web.myPage.vo.OrderList;

public class MyOrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MyOrderListService myOrderListService = new MyOrderListService();
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		String id = loginMember.getId();
		String name = loginMember.getName();
		String grade = loginMember.getGrade();
		request.setAttribute("grade", grade);
		
		if(grade.equals("주문자")){
		ArrayList<OrderList> myOrderList = myOrderListService.getMyOrderList(id);
		request.setAttribute("myOrderList", myOrderList);
		}
		else if(grade.equals("음식점")){
		ArrayList<OrderList> myOrderList = myOrderListService.getMyOrderList2(name);
		request.setAttribute("myOrderList", myOrderList);
		request.setAttribute("name", name);
		}
		ActionForward forward = new ActionForward();
		forward.setUrl("mypage/myOrderList.jsp");
		return forward;
		
	}

}
