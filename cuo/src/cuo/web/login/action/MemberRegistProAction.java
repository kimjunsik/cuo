package cuo.web.login.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.login.svc.MemberRegistService;
import cuo.web.login.vo.Member;

public class MemberRegistProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String passwd = request.getParameter("passwd");
		String addr = request.getParameter("addr");
		String birthday = request.getParameter("birthday");
		String grade = request.getParameter("grade");
		
		Member member = new Member(id, name, passwd, addr, birthday, grade);
		MemberRegistService memberRegistService = new MemberRegistService(); 
		boolean registSuccess = memberRegistService.memberData(member);
		ActionForward forward = null;
		
		if(registSuccess){
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setUrl("index.jsp");
		}
		else{
			System.out.println("½ÇÆÐ");
		}
		/*request.setAttribute("member", member);*/
		return forward;
	}

}
