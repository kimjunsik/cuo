package cuo.web.orderAdmin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.orderAdmin.action.OrderAdminListAction;
import cuo.web.orderAdmin.action.OrderAdminMenuModifyAction;
import cuo.web.orderAdmin.action.OrderAdminMenuModifyProAction;
import cuo.web.orderAdmin.action.OrderAdminMenuRegistAction;
import cuo.web.orderAdmin.action.OrderAdminMenuRegistProAction;
import cuo.web.orderAdmin.action.OrderAdminMenuRemoveAction;

/**
 * Servlet implementation class OrderAdminController
 */
@WebServlet("*.ora")
public class OrderAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		
		if(command.equals("/orderAdminList.ora")){
			action = new OrderAdminListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}	
		else if(command.equals("/orderAdminMenuRegist.ora")){
			action = new OrderAdminMenuRegistAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}	
		else if(command.equals("/orderAdminMenuRegistPro.ora")){
			action = new OrderAdminMenuRegistProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}	
		else if(command.equals("/orderAdminMenuModify.ora")){
			action = new OrderAdminMenuModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}	
		else if(command.equals("/orderAdminMenuModifyPro.ora")){
			action = new OrderAdminMenuModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}	
		else if(command.equals("/orderAdminMenuRemove.ora")){
			action = new OrderAdminMenuRemoveAction();
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
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getUrl());
				dispatcher.forward(request, response);
			}
		}
		
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

}
