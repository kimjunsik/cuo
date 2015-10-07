package cuo.web.board.svc;

import static cuo.util.JdbcUtil.*;
import java.sql.Connection;

import cuo.web.board.dao.BoardDAO;
import cuo.web.board.vo.BoardVO;


public class BoardContentService {

	public BoardVO getArticle(int num) {
		// TODO Auto-generated method stub
		
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		BoardVO article = boardDAO.selectArticle(num);
		close(con);
		
		return article;
	}

}
