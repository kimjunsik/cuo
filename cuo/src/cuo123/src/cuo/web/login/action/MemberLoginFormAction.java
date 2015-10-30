package cuo.web.login.action;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberLoginFormAction  {

	@RequestMapping("/memberLoginForm.mem")
	public ModelAndView execute() throws Exception {
		// TODO Auto-generated method stub
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/loginForm.jsp");
//		ActionForward forward = new ActionForward();
//		forward.setUrl("member/loginForm.jsp");
		return mav;
	}

}
