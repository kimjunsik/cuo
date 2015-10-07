package cuo.web.memberAdmin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.memberAdmin.svc.MemberGradeModifyProService;
import cuo.web.memberAdmin.vo.MemberAdmin;

public class MemberGradeModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String grade = request.getParameter("grade");
		
		MemberGradeModifyProService memberGradeModifyProService = 
				new MemberGradeModifyProService();
		
		boolean updateSuccess = memberGradeModifyProService.modifyMember(id, grade);
		ActionForward forward = null;
		if (updateSuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setUrl("memberList.cuo");
		}
		else{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;

	}

}