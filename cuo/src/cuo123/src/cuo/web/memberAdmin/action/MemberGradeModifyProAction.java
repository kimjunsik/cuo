package cuo.web.memberAdmin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import cuo.web.memberAdmin.svc.MemberGradeModifyProService;
import cuo.web.memberAdmin.vo.MemberAdmin;
@Controller
public class MemberGradeModifyProAction {
	@Autowired
	private MemberGradeModifyProService memberGradeModifyProService;
	
	@RequestMapping("/memberGradeModifyPro.cuo")
	public String execute(MemberAdmin memberAdmin,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		/*String id = request.getParameter("id");
		String grade = request.getParameter("grade");
		
		MemberGradeModifyProService memberGradeModifyProService = 
				new MemberGradeModifyProService();*/
		boolean updateSuccess = memberGradeModifyProService.modifyMember(memberAdmin);
		String viewName = null;
//		ActionForward forward = null;
		if (updateSuccess) {
//			forward = new ActionForward();
//			forward.setRedirect(true);
//			forward.setUrl("memberList.cuo");
			viewName = "redirect:/memberList.cuo";
		}
		else{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return viewName;

	}

}