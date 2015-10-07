package cuo.web.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.board.svc.BoardListService;
import cuo.web.board.svc.boardSearchService;
import cuo.web.board.vo.BoardVO;
import cuo.web.board.vo.PageInfo;

public class BoardSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String searchType = request.getParameter("searchType");
		String searchName = request.getParameter("searchName");


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
		
		
		boardSearchService boardSearchService = new boardSearchService();
		
		
		if(searchType.equals("����")){
			articleList = boardSearchService.searchByPostTitle(searchName);
		}
		else if(searchType.equals("�ۼ���")){
			articleList = boardSearchService.searchByPostWriter(searchName);
		}
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setCount(count);
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setendPage(endPage);
		pageInfo.setNumber(number);
		pageInfo.setPageCount(count);
		pageInfo.setStartPage(startPage);
		request.setAttribute("searchType", searchType);
		request.setAttribute("searchName", searchName);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("articleList", articleList);
		
		request.setAttribute("pageInfo", pageInfo);
		ActionForward forward = new ActionForward();
		forward.setUrl("/board/list.jsp");
		return forward;
	}

}
