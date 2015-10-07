package cuo.web.orderAdmin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.orderAdmin.svc.OrderAdminMenuRemoveService;

public class OrderAdminMenuRemoveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		
		OrderAdminMenuRemoveService orderAdminMenuRemoveService =
				new OrderAdminMenuRemoveService();
		
		boolean removeSuccess = orderAdminMenuRemoveService.menuDelete(id);
		ActionForward forward = new ActionForward();
		if(removeSuccess){
			forward.setRedirect(true);
			forward.setUrl("maindex.jsp");
		}
		else{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제실패')");
			out.println("histroy.back()");
			out.println("</script>");
		}
		return forward;
		
	}

}
