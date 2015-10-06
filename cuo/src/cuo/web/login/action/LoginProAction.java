package cuo.web.login.action;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.login.svc.LoginService;
import cuo.web.login.vo.Member;

public class LoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		LoginService loginService = new LoginService();// 모델

		Member loginMember = loginService.getLoginUser(id, passwd);
		
		ActionForward forward = new ActionForward();
		if(loginMember !=null){
			HttpSession session = request.getSession();//세션 얻어옴*/			
			session.setAttribute("loginMember", loginMember);
			forward.setUrl("main.jsp");
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
