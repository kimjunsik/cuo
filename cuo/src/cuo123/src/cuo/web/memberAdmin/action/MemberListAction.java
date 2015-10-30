package cuo.web.memberAdmin.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cuo.web.memberAdmin.svc.MemberListService;
import cuo.web.memberAdmin.vo.MemberAdmin;

@Controller
public class MemberListAction  {
	@Autowired
	private MemberListService memberListService;
	
	@RequestMapping("/memberList.cuo")
	public ModelAndView execute() throws Exception {
		// TODO Auto-generated method stub
		
		List<MemberAdmin> memberList = memberListService.getMemberList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberList",memberList);
		mav.setViewName("memberAdmin/memberManage.jsp");
		
		return mav;
		
		
		/*MemberListService memberListService = new MemberListService();
		ArrayList<MemberAdmin> memberList = memberListService.getMemberList();
		request.setAttribute("memberList", memberList);
		
		ActionForward forward = new ActionForward();
		forward.setUrl("memberAdmin/memberManage.jsp");
		return forward;*/
	}

}
