package cuo.web.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.board.svc.BoardContentService;
import cuo.web.board.vo.BoardVO;



public class BoardContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("postNum"));
		String pageNum = request.getParameter("pageNum");
		String id = request.getParameter("id");
		String grade = request.getParameter("grade");
		
		BoardContentService boardContentService = new BoardContentService();
		BoardVO article = boardContentService.getArticle(num);
		
		request.setAttribute("article", article);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("id", id);
		request.setAttribute("grade", grade);
		ActionForward forward = new ActionForward();
		forward.setUrl("/board/content.jsp");
		return forward;
	}

}
