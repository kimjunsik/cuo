package cuo.web.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.board.svc.BoardDeleteProService;

public class BoardDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int postNum = Integer.parseInt(request.getParameter("postNum"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDeleteProService boardDeleteProService = new BoardDeleteProService();
		
		boolean deleteSuccess = boardDeleteProService.removeArticle(postNum);
		ActionForward forward = null;
		
		if(deleteSuccess){
			forward = new ActionForward();
			
			forward.setUrl("boardList.bo");
		}
		else{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
