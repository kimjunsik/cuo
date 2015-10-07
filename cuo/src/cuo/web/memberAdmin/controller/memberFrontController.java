package cuo.web.memberAdmin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.memberAdmin.action.MemberGradeModifyAction;
import cuo.web.memberAdmin.action.MemberGradeModifyProAction;
import cuo.web.memberAdmin.action.MemberListAction;

/**
 * Servlet implementation class memberFrontController
 */
@WebServlet("*.cuo")
public class memberFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//1.요청파악
		String requestURI  =  request.getRequestURI();
		//요청주소 : http://localhost:8088/boardProject/boardWriteForm.bo
		//requestURI : /boardProject/boardWriteForm.bo
		
		String contextPath = request.getContextPath();
		// /boardProject
		
		String command = requestURI.substring(contextPath.length());
		// /boardWriteForm.bo
		
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/memberList.cuo")){
			action = new MemberListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		else if(command.equals("/memberGradeModify.cuo")){
			action = new MemberGradeModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		else if(command.equals("/memberGradeModifyPro.cuo")){
			action = new MemberGradeModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
			
		//포워딩
		if(forward != null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getUrl());
			}
			else{
				RequestDispatcher dispatcher =
						request.getRequestDispatcher(forward.getUrl());
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
		doProcess(request, response);
	}

}
