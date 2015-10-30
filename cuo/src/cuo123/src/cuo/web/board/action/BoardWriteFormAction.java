package cuo.web.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.board.vo.ReplyInfo;



public class BoardWriteFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int postNum=0, ref=0, re_step=0, re_level=0;
		if(request.getParameter("postNum")!=null){
			//원글이 아니라 답변글쓰기 요청이 넘어왔으면
			postNum = Integer.parseInt(request.getParameter("postNum"));
			ref = Integer.parseInt(request.getParameter("ref"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
		}
		
		ReplyInfo replyInfo = new ReplyInfo();
		replyInfo.setPostNum(postNum);
		replyInfo.setRef(ref);
		replyInfo.setRe_step(re_step);
		replyInfo.setRe_level(re_level);
		
		request.setAttribute("replyInfo", replyInfo);
		
		ActionForward forward = new ActionForward();
		forward.setUrl("/board/writeForm.jsp");
		return forward;
	}

}
