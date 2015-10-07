package cuo.web.memberAdmin.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.memberAdmin.svc.MemberListService;
import cuo.web.memberAdmin.vo.MemberAdmin;

public class MemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		MemberListService memberListService = new MemberListService();
		ArrayList<MemberAdmin> memberList = memberListService.getMemberList();
		request.setAttribute("memberList", memberList);
		
		ActionForward forward = new ActionForward();
		forward.setUrl("memberAdmin/memberManage.jsp");
		return forward;
	}

}
