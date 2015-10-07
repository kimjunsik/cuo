package cuo.web.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cuo.web.board.vo.BoardVO;

import static cuo.util.JdbcUtil.*;

public class BoardDAO {
	private static BoardDAO instance;
	private Connection con;

	private BoardDAO() {
		// TODO Auto-generated constructor stub

	}

	public static BoardDAO getInstance() {
		if (instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}
	//글쓰기 등록
	public int insertArticle(BoardVO article){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int insertCount = 0;
		//답변글 처리할 때 필요한 속성값들 변수에 저장
		int num = article.getPostNum();
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		
		int number = 0;
		//원글을 작성했을 때 새롭게 부여될 관련글 번호를 저장할 변수
		String sql = "";
		
		try {
			
			//작성한 글이 원글일 때 새로운 관련글 번호를 구하는 부분
			pstmt = con.prepareStatement("SELECT MAX(postNum) FROM board");
			rs = pstmt.executeQuery();
			if(rs.next()){
				//이전에 작성된 글이 있으면   지금 작성한 글이 첫번째 글이 아니면
				number = rs.getInt(1) +1;
			}
			else{
				number = 1;
			}
			
			if(num!=0){
				//답변글이면
				sql = "UPDATE board SET re_step = re_step+1" 
						+ " WHERE ref = ? AND re_step> ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				re_step = re_step+1;
				re_level = re_level+1;
			}
			else{
				ref=number;
				re_step=0;
				re_level=0;
			}
			sql="INSERT INTO board"
					+ "(postNum,boardTitle,postTitle,postContent,postReadcount,postWriter,postRegistTime,"
					+ "ref,re_step,re_level,ip,id)"
					+ " VALUES(board_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, article.getBoardTitle());
			pstmt.setString(2, article.getPostTitle());
			pstmt.setString(3, article.getPostContent());
			pstmt.setInt(4, article.getPostReadcount());
			pstmt.setString(5, article.getPostWriter());
			pstmt.setTimestamp(6, article.getPostRegistTime());
			pstmt.setInt(7, ref);
			pstmt.setInt(8, re_step);
			pstmt.setInt(9, re_level);
			pstmt.setString(10, article.getIp());
			pstmt.setString(11, article.getId());
			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally{
			close(rs);
			close(pstmt);
		}
		return insertCount;
		
	}
	
	public int selectArticleCount(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int articleCount = 0;
		try {
			pstmt = con.prepareStatement("SELECT COUNT(*) FROM board");
			rs = pstmt.executeQuery();
			if(rs.next()){
				articleCount = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally{
			close(rs);
			close(pstmt);
		}
		return articleCount;
	}
	//글 리스트보기
	public List<BoardVO> selectArticleList(int startRow, int pageSize){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardVO> articleList = null;
		BoardVO article = null;
		try {
			//해당 페이지에 출력될 레코드 10개 조회하는 SQL구문
			//subquery
			//서브쿼리 중 FROM절 뒤에 제공되는 서브쿼리를 인라인뷰라고 한다.
			//rownum : SELECT 구문에 의해서 레코드를 출력할 때 출력되는 레코드마다 번호를 부여하는 함수
			pstmt = con.prepareStatement("SELECT list2.* FROM (SELECT rownum r,list1.*"
					+ " FROM (SELECT * FROM board ORDER BY ref DESC,re_step ASC) list1 ) list2"
					+ " WHERE r BETWEEN ? AND ?");
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, startRow + pageSize -1);
			rs=pstmt.executeQuery();
			if(rs.next()){
				//글이하나라도 있으면
				articleList = new ArrayList<BoardVO>();
				do {
					article = new BoardVO();
					article.setPostNum(rs.getInt("postNum"));
					article.setPostWriter(rs.getString("postWriter"));
					article.setBoardTitle(rs.getString("boardTitle"));
					article.setPostTitle(rs.getString("postTitle"));
					article.setId(rs.getString("id"));
					article.setPostRegistTime(rs.getTimestamp("postRegistTime"));
					article.setPostReadcount(rs.getInt("postReadcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setPostContent(rs.getString("postContent"));
					article.setIp(rs.getString("ip"));
					articleList.add(article);
					
				} while (rs.next());
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	//글내용보기
	public BoardVO selectArticle(int num){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO article = null;
		try {
			//죄회수 증가 처리
			
			pstmt = con.prepareStatement("UPDATE board SET postReadcount = postReadcount + 1 WHERE postNum = ?");
			pstmt.setInt(1, num);
			int updateCount = pstmt.executeUpdate();
			if(updateCount>0){
				commit(con);
			}
			
			pstmt = con.prepareStatement("SELECT * FROM board WHERE postNum =?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
					article = new BoardVO();
					article.setPostNum(rs.getInt("postNum"));
					article.setPostWriter(rs.getString("postWriter"));
					article.setBoardTitle(rs.getString("boardTitle"));
					article.setPostTitle(rs.getString("postTitle"));
					article.setId(rs.getString("id"));
					article.setPostRegistTime(rs.getTimestamp("postRegistTime"));
					article.setPostReadcount(rs.getInt("postReadcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setPostContent(rs.getString("postContent"));
					article.setIp(rs.getString("ip"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally{
			close(rs);
			close(pstmt);
		}
		return article;
	}
	
	//글수정화면
	public BoardVO selectUpdateArticle(int num){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO article = null;
		try {
			
			pstmt = con.prepareStatement("SELECT * FROM board WHERE postNum =?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
					article = new BoardVO();
					article.setPostNum(rs.getInt("postNum"));
					article.setPostWriter(rs.getString("postWriter"));
					article.setBoardTitle(rs.getString("boardTitle"));
					article.setPostTitle(rs.getString("postTitle"));
					article.setId(rs.getString("id"));
					article.setPostRegistTime(rs.getTimestamp("postRegistTime"));
					article.setPostReadcount(rs.getInt("postReadcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setPostContent(rs.getString("postContent"));
					article.setIp(rs.getString("ip"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally{
			close(rs);
			close(pstmt);
		}
		return article;
	}
	
	//글수정하기
	public int updateArticle(BoardVO article){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbId = "";
		String sql = "";
		int updateCount = 0;
		try {
			sql="UPDATE board SET postWriter=?,postTitle=?,postContent=? WHERE postNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, article.getPostWriter());
			pstmt.setString(2, article.getPostTitle());
			pstmt.setString(3, article.getPostContent());
			pstmt.setInt(4, article.getPostNum());
			updateCount = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally{
			close(rs);
			close(pstmt);
		}
		return updateCount;
	}
	
	//글삭제
	public int deleteArticle(int postNum){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		int deleteCount = 0;
		try {
			sql="DELETE board WHERE postNum = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, postNum);
			deleteCount = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally{
			close(rs);
			close(pstmt);
		}
		return deleteCount;
	}

	public ArrayList<BoardVO> selectPostTitle(String search) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM board WHERE postTitle = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO board = null;
		ArrayList<BoardVO> boardList = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search);
			
            rs = pstmt.executeQuery();
            if(rs.next()){
				//글이하나라도 있으면
            	boardList = new ArrayList<BoardVO>();
				do {
					board = new BoardVO();
					board.setPostNum(rs.getInt("postNum"));
					board.setPostWriter(rs.getString("postWriter"));
					board.setBoardTitle(rs.getString("boardTitle"));
					board.setPostTitle(rs.getString("postTitle"));
					board.setId(rs.getString("id"));
					board.setPostRegistTime(rs.getTimestamp("postRegistTime"));
					board.setPostReadcount(rs.getInt("postReadcount"));
					board.setRef(rs.getInt("ref"));
					board.setRe_step(rs.getInt("re_step"));
					board.setRe_level(rs.getInt("re_level"));
					board.setPostContent(rs.getString("postContent"));
					board.setIp(rs.getString("ip"));
					boardList.add(board);
				} while (rs.next());
			}
          
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		
		return boardList;
	}

	public ArrayList<BoardVO> selectPostWriter(String search) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM board WHERE postWriter = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO board = null;
		ArrayList<BoardVO> boardList = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search);
			
            rs = pstmt.executeQuery();
            if(rs.next()){
				//글이하나라도 있으면
            	boardList = new ArrayList<BoardVO>();
				do {
					board = new BoardVO();
					board.setPostNum(rs.getInt("postNum"));
					board.setPostWriter(rs.getString("postWriter"));
					board.setBoardTitle(rs.getString("boardTitle"));
					board.setPostTitle(rs.getString("postTitle"));
					board.setId(rs.getString("id"));
					board.setPostRegistTime(rs.getTimestamp("postRegistTime"));
					board.setPostReadcount(rs.getInt("postReadcount"));
					board.setRef(rs.getInt("ref"));
					board.setRe_step(rs.getInt("re_step"));
					board.setRe_level(rs.getInt("re_level"));
					board.setPostContent(rs.getString("postContent"));
					board.setIp(rs.getString("ip"));
					boardList.add(board);
				} while (rs.next());
			}
          
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		
		return boardList;
	}
	
}