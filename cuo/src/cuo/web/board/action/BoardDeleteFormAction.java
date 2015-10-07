package cuo.web.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.action.Action;
import cuo.vo.ActionForward;


public class BoardDeleteFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int postNum = Integer.parseInt(request.getParameter("postNum"));
		String pageNum = request.getParameter("pageNum");
		String id = request.getParameter("id");
		request.setAttribute("postNum", postNum);
		request.setAttribute("pageNum", pageNum);
		ActionForward forward = new ActionForward();
		forward.setUrl("boardDeletePro.bo");
		return forward;
	}

}
