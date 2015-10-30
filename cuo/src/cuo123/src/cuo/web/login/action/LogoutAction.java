package cuo.web.login.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cuo.action.Action;
import cuo.vo.ActionForward;
@Controller
public class LogoutAction /*implements Action*/ {

	@RequestMapping("/logout.mem")
	public ModelAndView execute(HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.invalidate();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("maindex.jsp");
		return mav;
/*		
		@Override
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			// TODO Auto-generated method stub
			HttpSession session = request.getSession();
			session.invalidate();
			
			ActionForward forward = new ActionForward();
			forward.setUrl("maindex.jsp");
			return forward;
*/	
		}

}
