package cuo.web.board.svc;

import static cuo.util.JdbcUtil.*;

import java.sql.Connection;
import java.util.List;

import cuo.web.board.dao.BoardDAO;
import cuo.web.board.vo.BoardVO;



public class BoardListService {

	public int getArticleCount() {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int articleCount = boardDAO.selectArticleCount();
		close(con);
		
		return articleCount;
	}

	public List<BoardVO> getArticleCount(int startRow, int pageSize) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		List<BoardVO> articleList = boardDAO.selectArticleList(startRow,pageSize);
		close(con);
		return articleList;
	}

}
