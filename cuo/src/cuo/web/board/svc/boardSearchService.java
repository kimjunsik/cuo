package cuo.web.board.svc;

import static cuo.util.JdbcUtil.close;
import static cuo.util.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import cuo.web.board.dao.BoardDAO;
import cuo.web.board.vo.BoardVO;

public class boardSearchService {

	public ArrayList<BoardVO> searchByPostTitle(String search) {
		// TODO Auto-generated method stub
		ArrayList<BoardVO> postTitle = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		
		postTitle= boardDAO.selectPostTitle(search);
		
		close(con);
		return postTitle;
	}

	public ArrayList<BoardVO> searchByPostWriter(String search) {
		// TODO Auto-generated method stub
		ArrayList<BoardVO> postWriter = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		postWriter= boardDAO.selectPostWriter(search);
		
		close(con);
		return postWriter;
	}

	

}
