package cuo.web.myPage.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.myPage.svc.MemberModifyService;
import cuo.web.myPage.vo.Member;

public class memberUpdateAction implements Action {

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
		
		MemberModifyService memberModifyService = new MemberModifyService(); 
		
		boolean modifySuccess= memberModifyService.modifyMember(member);
		ActionForward forward = new ActionForward();
		if(modifySuccess){
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setUrl("maindex.jsp");
		}
		else{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정실패')");
			out.println("histroy.back()");
			out.println("</script>");
		}
	
		
		return forward;
	}

}
