package cuo.web.orderAdmin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.action.Action;
import cuo.vo.ActionForward;
import cuo.web.orderAdmin.svc.OrderAdminRegistService;
import cuo.web.orderAdmin.vo.OrderAdmin;

public class OrderAdminMenuRegistProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		int menuNum = Integer.parseInt(request.getParameter("menuNum"));
		String menuName = request.getParameter("menuName");
		String menuAddress = request.getParameter("menuAddress");
		String menuBhours = request.getParameter("menuBhours");
		String menuEhours = request.getParameter("menuEhours");
		String menuDel = request.getParameter("menuDel");
		String menuPack = request.getParameter("menuPack");
		String menuImage = request.getParameter("menuImage");
		String menuMap = request.getParameter("menuMap");
		String menuKey = request.getParameter("menuKey");
		String menu1 = request.getParameter("menu1");
		String menu2 = request.getParameter("menu2");
		String menu3 = request.getParameter("menu3");
		String menu4 = request.getParameter("menu4");
		String menu5 = request.getParameter("menu5");
		String menu6 = request.getParameter("menu6");
		String menu7 = request.getParameter("menu7");
		String menu8 = request.getParameter("menu8");
		String menu9 = request.getParameter("menu9");
		String menu10 = request.getParameter("menu10");
		String menu11 = request.getParameter("menu11");
		String menu12 = request.getParameter("menu12");
		String id = request.getParameter("id");
				
		OrderAdmin orderAdmin = new OrderAdmin(menuNum, menuName, menuAddress, menuBhours, 
				menuEhours, menuDel, menuPack, menuImage, menuMap, menuKey, menu1, 
				menu2, menu3, menu4, menu5, menu6, menu7, menu8, menu9, menu10, menu11, 
				menu12, id);
		
		OrderAdminRegistService orderAdminRegistService =
				new OrderAdminRegistService();
		boolean registSuccess = orderAdminRegistService.getMenuData(orderAdmin);
		ActionForward forward = null;
		if(registSuccess){
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setUrl("maindex.jsp");
		}
		else{
			System.out.println("½ÇÆÐ");
		}
		return forward;
	}

}
