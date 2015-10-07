package cuo.web.board.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.board.svc.BoardListService;
import cuo.web.board.vo.BoardVO;
import cuo.web.board.vo.PageInfo;
import cuo.web.login.vo.Member;



public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		//��������ȣ�� ����ؼ� ����¡ ó���� �������� ������ ���̹Ƿ� ������ ��ȣ���� ����Ÿ������ ����
		int currentPage = Integer.parseInt(pageNum);
		
		//�ش� �������� ��µǴ� �۵��� ������� ��µǴ� ���� ���ڵ� ��ȣ
		int startRow = (currentPage-1) *pageSize +1;
		//���������� : 1
		//(1-1) * pageSize + 1 ---> 1 (1~10)
		//���������� : 2
		//(2-1) * pageSize + 1 ---> 11 (11~20)
		
		int count = 0;
		//�� ���� ������ ������ ����
		int number = 0;
		//�ش� �������� ���� ���� ��µǴ� ���� ��ȣ
		
		List<BoardVO> articleList = null;
		//�ش� �������� ��µǴ� �۸���� ������ �÷���
		
		BoardListService boardListService = new BoardListService();
		
		count = boardListService.getArticleCount();
		if(count>0){
			//���� �ϳ��������� �������� �� ���� ������
			articleList = boardListService.getArticleCount(startRow, pageSize);
		}
		
		number = count -(currentPage -1)*pageSize;
		//�� ���� �� : 134
		//���� ������ : 1
		//134 - (1-1)*10 ---> 134

		int startPage = 0;
		int endPage = 0;
		int pageCount = 0;
		if(count>0){
			pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
			//�� ������ ������ ����
			
			startPage = ((currentPage -1)/pageSize)*pageSize + 1;
			//���� ������ �׷��� ù��° �������� ���� [1],[11]...
			
			int pageBlock = 10;
			endPage = startPage + pageBlock -1;//[10],[20]...
			
			if(endPage > pageCount) endPage = pageCount;
			//������ ������ �׷��� ���
		}
		
		request.setAttribute("articleList", articleList);
		PageInfo pageInfo = new PageInfo();
		pageInfo.setCount(count);
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setendPage(endPage);
		pageInfo.setNumber(number);
		pageInfo.setPageCount(count);
		pageInfo.setStartPage(startPage);
		
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		ActionForward forward = new ActionForward();
		if(loginMember != null){
			request.setAttribute("pageInfo", pageInfo);
			forward.setUrl("/board/list.jsp");
		}
		else{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('��α��ν� �Խ����� �̿��� �� �����ϴ�.')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
