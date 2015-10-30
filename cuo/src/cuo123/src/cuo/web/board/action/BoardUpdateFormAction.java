package cuo.web.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.board.svc.BoardUpdateFormService;
import cuo.web.board.vo.BoardVO;


public class BoardUpdateFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("postNum"));
		String pageNum = request.getParameter("pageNum");
		
		BoardUpdateFormService boardUpdateFormService = new BoardUpdateFormService();
		
		BoardVO article = boardUpdateFormService.getArticle(num);
		request.setAttribute("article", article);
		request.setAttribute("pageNum", pageNum);
		ActionForward forward = new ActionForward();
		forward.setUrl("/board/updateForm.jsp");
		return forward;
	}

}
