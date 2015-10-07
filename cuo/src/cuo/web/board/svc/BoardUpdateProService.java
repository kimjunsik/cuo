package cuo.web.board.svc;
import static cuo.util.JdbcUtil.*;

import java.sql.Connection;

import cuo.web.board.dao.BoardDAO;
import cuo.web.board.vo.BoardVO;

public class BoardUpdateProService {

	public boolean modifyArticle(BoardVO article) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		boolean modifySuccess = false;
		int updateCount = boardDAO.updateArticle(article);
		
		if(updateCount>0){
			commit(con);
			modifySuccess = true;
		}
		else{
			rollback(con);
		}
		close(con);
		return modifySuccess;
	}

}
