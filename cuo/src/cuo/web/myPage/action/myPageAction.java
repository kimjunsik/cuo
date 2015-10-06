package cuo.web.myPage.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.login.vo.Member;

public class myPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		ActionForward forward = new ActionForward();
		if(loginMember != null){
			forward.setUrl("mypage/mypageList.jsp");
		}
		else{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 필요')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
