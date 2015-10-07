package cuo.web.board.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.board.action.BoardContentAction;
import cuo.web.board.action.BoardDeleteFormAction;
import cuo.web.board.action.BoardDeleteProAction;
import cuo.web.board.action.BoardListAction;
import cuo.web.board.action.BoardSearchAction;
import cuo.web.board.action.BoardUpdateFormAction;
import cuo.web.board.action.BoardUpdateProAction;
import cuo.web.board.action.BoardWriteFormAction;
import cuo.web.board.action.BoardWriteProAction;



/**
 * Servlet implementation class BoardFrontController
 */
@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//공통작업
		//1.요청파악
		String requestURI = request.getRequestURI();
		//요청주소 : http://localhost:8088/boardWriteForm.bo
		//requestURI : /boardProject/boardWriteForm.bo
		
		String contextPath = request.getContextPath();
		// /boardProject
		
		String command = requestURI.substring(contextPath.length());
		// /boardWriteForm.bo
		
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/boardWriteForm.bo")){
			action = new BoardWriteFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardWritePro.bo")){
			action = new BoardWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardList.bo")){
			action = new BoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
			else if(command.equals("/content.bo")){
				action = new BoardContentAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
		}
			else if(command.equals("/boardUpdateForm.bo")){
				action = new BoardUpdateFormAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
			else if(command.equals("/boardUpdatePro.bo")){
				action = new BoardUpdateProAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
			else if(command.equals("/boardDeleteForm.bo")){
				action = new BoardDeleteFormAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
			else if(command.equals("/boardDeletePro.bo")){
				action = new BoardDeleteProAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
			else if(command.equals("/search.bo")){
				action = new BoardSearchAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
		//포워딩
		if(forward!=null){//뷰페이지정보가 제대로 넘어와야됨
			if(forward.isRedirect()){
				response.sendRedirect(forward.getUrl());
			}
			else{
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getUrl());
				dispatcher.forward(request, response);
			}
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doProcess(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		doProcess(request,response);
	}

}
