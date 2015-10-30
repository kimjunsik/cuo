package cuo.web.board.svc;
import static cuo.util.JdbcUtil.*;

import java.sql.Connection;

import cuo.web.board.dao.BoardDAO;

public class BoardDeleteProService {

	public boolean removeArticle(int postNum) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		boolean removeSuccess = false;
		int deleteCount = boardDAO.deleteArticle(postNum);
		
		if(deleteCount>0){
			commit(con);
			removeSuccess = true;
		}
		else{
			rollback(con);
		}
		close(con);
		return removeSuccess;
	}

}
