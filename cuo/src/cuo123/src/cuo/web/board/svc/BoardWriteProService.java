package cuo.web.board.svc;
import static cuo.util.JdbcUtil.*;

import java.sql.Connection;

import cuo.web.board.dao.BoardDAO;
import cuo.web.board.vo.BoardVO;


public class BoardWriteProService {

	public boolean writeArticle(BoardVO article) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		
		boolean writeSuccess = false;
		int insertCount = boardDAO.insertArticle(article);
		
		if(insertCount>0){
			commit(con);
			writeSuccess = true;
		}
		else{
			rollback(con);
		}
		close(con);
		return writeSuccess;
	}
	
}
