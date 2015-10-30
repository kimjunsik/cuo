package cuo.web.login.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.login.svc.MemberRegistService;
import cuo.web.login.vo.Member;
@Controller
public class MemberRegistProAction/* implements Action */{

/*	@Override
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
		MemberRegistService memberRegistService = new MemberRegistService(); 
		boolean registSuccess = memberRegistService.memberData(member);
		ActionForward forward = null;
		
		if(registSuccess){
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setUrl("maindex.jsp");
		}
		else{
			System.out.println("실패");
		}
		request.setAttribute("member", member);
		return forward;
	}*/
	@Autowired
	private MemberRegistService memberRegistService;
	
	@RequestMapping("/memberRegistPro.mem")
	public String execute(Member member,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		boolean registSuccess = memberRegistService.memberData(member);
		String viewUrl = null;
		
		if(registSuccess){
			viewUrl = "redirect:/maindex.jsp";
		}
		else{
			System.out.println("실패");
		}
		request.setAttribute("member", member);
		
		return viewUrl;
	}

}
