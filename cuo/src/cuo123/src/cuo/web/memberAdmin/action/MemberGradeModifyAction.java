package cuo.web.memberAdmin.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cuo.web.memberAdmin.svc.MemberListService;
import cuo.web.memberAdmin.vo.MemberAdmin;
@Controller
public class MemberGradeModifyAction{
	@Autowired
	private MemberListService memberListService;
	
	@RequestMapping("/memberGradeModify.cuo")
	public ModelAndView execute() throws Exception {
		// TODO Auto-generated method stub
//		MemberListService memberListService = new MemberListService();
		List<MemberAdmin> memberList = memberListService.getMemberList();
//		request.setAttribute("memberList", memberList);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberList", memberList);
		mav.setViewName("memberAdmin/memberGradeModifyForm.jsp");
//		ActionForward forward = new ActionForward();
//		forward.setUrl("memberAdmin/memberGradeModifyForm.jsp");
		return mav;
	}

}
