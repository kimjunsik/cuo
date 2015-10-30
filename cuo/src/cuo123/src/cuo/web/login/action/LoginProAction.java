package cuo.web.login.action;

import java.io.PrintWriter;

//import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

//import cuo.action.Action;
//import cuo.vo.ActionForward;
import cuo.web.login.svc.LoginService;
import cuo.web.login.vo.Member;
@Controller
public class LoginProAction {
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/loginPro.mem")
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response,
			@RequestParam String id, @RequestParam String passwd) throws Exception {
		// TODO Auto-generated method stub
//		String id = request.getParameter("id");
//		String passwd = request.getParameter("passwd");
//		LoginService loginService = new LoginService();// 모델

		Member loginMember = loginService.getLoginUser(id, passwd);
		ModelAndView mav = new ModelAndView();
//		ActionForward forward = new ActionForward();
		if(loginMember !=null){
			HttpSession session = request.getSession();//세션 얻어옴*/			
			session.setAttribute("loginMember", loginMember);
//			forward.setUrl("maindex.jsp");
			mav.setViewName("maindex.jsp");
		}
		else{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('잘못된 정보를 입력하셨습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
	
		return mav;
	}

}
