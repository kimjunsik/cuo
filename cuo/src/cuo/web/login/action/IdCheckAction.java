package cuo.web.login.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.vo.ActionForward;
import cuo.web.login.svc.IdCheckService;



/**
 * Servlet implementation class IdCheckServlet
 */
@WebServlet("/idCheck")
public class IdCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdCheckAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		IdCheckService idCheckService = new IdCheckService();
		
		boolean idExists = idCheckService.existsId(id);
		System.out.println("id = " + id);
	    System.out.println("idExists = " + idExists);
		request.setAttribute("id", id);
		request.setAttribute("idExists", idExists);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/idCheck.jsp");
		dispatcher.forward(request, response);
		ActionForward forward = new ActionForward();
		forward.setUrl("/member/idCheck.jsp");
	}

}
