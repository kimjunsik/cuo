package cuo.web.myPage.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.login.vo.Member;
import cuo.web.myPage.svc.MemberRemoveService;

public class memberRemoveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();//세션 얻어옴*/			
		Member loginMember = (Member)session.getAttribute("loginMember");
		String id = loginMember.getId();
		
		MemberRemoveService memberRemoveService = new MemberRemoveService();
		
		boolean removeSuccess = memberRemoveService.memberDelete(id);
		ActionForward forward = new ActionForward();
		if(removeSuccess){
			forward.setRedirect(true);
			forward.setUrl("logout.mem");
		}
		else{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제실패')");
			out.println("histroy.back()");
			out.println("</script>");
		}
		return forward;
	}

}
