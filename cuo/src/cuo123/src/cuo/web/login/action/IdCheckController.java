package cuo.web.login.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cuo.web.login.svc.IdCheckService;

@Controller
public class IdCheckController {
	@Autowired
	private IdCheckService idCheckService;
	
	@RequestMapping("/idCheck")
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response,
			@RequestParam String id) throws Exception {
		// TODO Auto-generated method stub
		boolean idExists = idCheckService.existsId(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("id",id);
		mav.addObject("idExists",idExists);
		mav.setViewName("/member/idCheck.jsp");
		return mav;
	}

}
