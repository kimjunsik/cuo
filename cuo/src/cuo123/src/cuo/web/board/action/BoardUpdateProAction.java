package cuo.web.board.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.board.svc.BoardUpdateProService;
import cuo.web.board.vo.BoardVO;


public class BoardUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		BoardVO article = new BoardVO();
		article.setPostContent(request.getParameter("postContent"));
		article.setPostNum(Integer.parseInt(request.getParameter("postNum")));
		article.setPostTitle(request.getParameter("postTitle"));
		article.setPostWriter(request.getParameter("postWriter"));
		
		article.setPostRegistTime(new Timestamp(System.currentTimeMillis()));
		//System.currentTimeMillis() : 1970�� 1�� 1�� �������� ��������� �ð��� �и��� ������ ��ȯ
		article.setIp(request.getRemoteAddr());//��û�� Ŭ���̾�Ʈ ip�ּ�
		//�����ͺ��̽� �۾��� ���ؼ� DAO Ŭ���� ��ü ������
		
		BoardUpdateProService boardUpdateProService = new BoardUpdateProService();
		
		boolean updateSuccess = boardUpdateProService.modifyArticle(article);
		ActionForward forward = null;
		
		if(updateSuccess){
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setUrl("boardList.bo");
		}
		else{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('��������')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
