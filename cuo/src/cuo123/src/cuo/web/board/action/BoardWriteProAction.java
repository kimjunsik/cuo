package cuo.web.board.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.board.svc.BoardWriteProService;
import cuo.web.board.vo.BoardVO;



public class BoardWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		BoardVO article = new BoardVO();
		article.setPostNum(Integer.parseInt(request.getParameter("postNum")));
		article.setBoardTitle(request.getParameter("boardTitle"));
		article.setPostTitle(request.getParameter("postTitle"));
		article.setPostContent(request.getParameter("postContent"));
		article.setPostWriter(request.getParameter("postWriter"));
		article.setRef(Integer.parseInt(request.getParameter("ref")));
		article.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		article.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		
		article.setPostRegistTime(new Timestamp(System.currentTimeMillis()));
		//System.currentTimeMillis() : 1970년 1월 1일 자정부터 현재까지의 시간을 밀리초 단위로 반환
		article.setIp(request.getRemoteAddr());//요청한 클라이언트 ip주소
		//데이터베이스 작업을 위해서 DAO 클래스 객체 얻어오기
		article.setId(request.getParameter("id"));
		
		BoardWriteProService boardWriteProService = new BoardWriteProService();
		boolean writeSuccess = boardWriteProService.writeArticle(article);
		ActionForward forward = null;
		if(writeSuccess){
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setUrl("boardList.bo");
		}
		else{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
