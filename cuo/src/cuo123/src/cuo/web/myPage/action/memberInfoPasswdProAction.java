package cuo.web.myPage.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.login.vo.Member;
import cuo.web.myPage.svc.MemberInfoService;

public class memberInfoPasswdProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();//세션 얻어옴*/			
		Member loginMember = (Member)session.getAttribute("loginMember");
		String passwd = loginMember.getPasswd();
		
		String password1 = request.getParameter("passwd");
		
		MemberInfoService memberInfoService = new MemberInfoService();
		cuo.web.myPage.vo.Member password = memberInfoService.getMemberInfopasswd(passwd);
		ActionForward forward = new ActionForward();
		if(password != null && passwd.equals(password1)){
			session.setAttribute("loginMember", loginMember);
			forward.setUrl("mypage/memberInfo.jsp");
		}
		else{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('잘못된 정보를 입력하셨습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
