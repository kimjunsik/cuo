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
		//페이지번호를 사용해서 페이징 처리시 연ㅅ나을 수행할 것이므로 페이지 번호값을 정수타입으로 변경
		int currentPage = Integer.parseInt(pageNum);
		
		//해당 페이지에 출력되는 글들중 가장먼저 출력되는 글의 레코드 번호
		int startRow = (currentPage-1) *pageSize +1;
		//현재페이지 : 1
		//(1-1) * pageSize + 1 ---> 1 (1~10)
		//현재페이지 : 2
		//(2-1) * pageSize + 1 ---> 11 (11~20)
		
		int count = 0;
		//총 글의 개수를 저장할 변수
		int number = 0;
		//해당 페이지의 가장 먼저 출력되는 글의 번호
		
		List<BoardVO> articleList = null;
		//해당 페이지에 출력되는 글목록을 지정할 컬렉션
		
		BoardListService boardListService = new BoardListService();
		
		count = boardListService.getArticleCount();
		if(count>0){
			//글이 하나라도있으면 리스팅할 글 정보 얻어오기
			articleList = boardListService.getArticleCount(startRow, pageSize);
		}
		
		number = count -(currentPage -1)*pageSize;
		//총 글의 수 : 134
		//현재 페이지 : 1
		//134 - (1-1)*10 ---> 134

		int startPage = 0;
		int endPage = 0;
		int pageCount = 0;
		if(count>0){
			pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
			//총 페이지 개수를 구함
			
			startPage = ((currentPage -1)/pageSize)*pageSize + 1;
			//현재 페이지 그룹의 첫번째 페이지를 구함 [1],[11]...
			
			int pageBlock = 10;
			endPage = startPage + pageBlock -1;//[10],[20]...
			
			if(endPage > pageCount) endPage = pageCount;
			//마지막 페이지 그룹인 경우
		}
		
		
		boardSearchService boardSearchService = new boardSearchService();
		
		
		if(searchType.equals("제목")){
			articleList = boardSearchService.searchByPostTitle(searchName);
		}
		else if(searchType.equals("작성자")){
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
