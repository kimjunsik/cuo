package cuo.web.order.dao;

import static cuo.util.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import cuo.web.order.dao.OrderDAO;
import cuo.web.order.vo.Order;

public class OrderDAO {
	private static OrderDAO instance;
	private static Connection con;
	private OrderDAO() {
		// TODO Auto-generated constructor stub
	}
	public static OrderDAO getInstance(){
		if(instance == null){
			instance = new OrderDAO();
		}
		return instance;
	}
	public void setConnection(Connection con){
		this.con = con;
	}
	public ArrayList<Order> selectOrderList() {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Order> orderList = null;
		Order order = null;
		try {
			
			pstmt = con.prepareStatement("SELECT DISTINCT menuKey FROM menu ");
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				orderList = new ArrayList<Order>();
				do {
					order = new Order();
					order.setMenuKey(rs.getString("menuKey"));
					orderList.add(order);
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
		return orderList;
	}
	public ArrayList<Order> selectMenuList(String menuKey) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Order> orderList = null;
		Order order = null;
		try {
			
			pstmt = con.prepareStatement("SELECT * FROM menu WHERE menuKey = ?");
			pstmt.setString(1, menuKey);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				orderList = new ArrayList<Order>();
				do {
					order = new Order();
					order.setMenuNum(rs.getInt("menuNum"));
					order.setMenuName(rs.getString("menuName"));
					order.setMenuAddress(rs.getString("menuAddress"));
					order.setMenuBhours(rs.getString("menuBhours"));
					order.setMenuEhours(rs.getString("menuEhours"));
					order.setMenuDel(rs.getString("menuDel"));
					order.setMenuPack(rs.getString("menuPack"));
					order.setMenuImage(rs.getString("menuImage"));
					order.setMenuMap(rs.getString("menuMap"));
					order.setMenuKey(rs.getString("menuKey"));
					order.setMenu1(rs.getString("menu1"));
					order.setMenu2(rs.getString("menu2"));
					order.setMenu3(rs.getString("menu3"));
					order.setMenu4(rs.getString("menu4"));
					order.setMenu5(rs.getString("menu5"));
					order.setMenu6(rs.getString("menu6"));
					order.setMenu7(rs.getString("menu7"));
					order.setMenu8(rs.getString("menu8"));
					order.setMenu9(rs.getString("menu9"));
					order.setMenu10(rs.getString("menu10"));
					order.setMenu11(rs.getString("menu11"));
					order.setMenu12(rs.getString("menu12"));
					orderList.add(order);
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
		return orderList;
	}
	public Order selectMenu(String menuName) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Order> orderList = null;
		Order order = null;
		try {
			
			pstmt = con.prepareStatement("SELECT * FROM menu WHERE menuName = ?");
			pstmt.setString(1, menuName);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
					order = new Order();
					order.setMenuNum(rs.getInt("menuNum"));
					order.setMenuName(rs.getString("menuName"));
					order.setMenuAddress(rs.getString("menuAddress"));
					order.setMenuBhours(rs.getString("menuBhours"));
					order.setMenuEhours(rs.getString("menuEhours"));
					order.setMenuDel(rs.getString("menuDel"));
					order.setMenuPack(rs.getString("menuPack"));
					order.setMenuImage(rs.getString("menuImage"));
					order.setMenuMap(rs.getString("menuMap"));
					order.setMenuKey(rs.getString("menuKey"));
					order.setMenu1(rs.getString("menu1"));
					order.setMenu2(rs.getString("menu2"));
					order.setMenu3(rs.getString("menu3"));
					order.setMenu4(rs.getString("menu4"));
					order.setMenu5(rs.getString("menu5"));
					order.setMenu6(rs.getString("menu6"));
					order.setMenu7(rs.getString("menu7"));
					order.setMenu8(rs.getString("menu8"));
					order.setMenu9(rs.getString("menu9"));
					order.setMenu10(rs.getString("menu10"));
					order.setMenu11(rs.getString("menu11"));
					order.setMenu12(rs.getString("menu12"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return order;
	}
	public int insertOrderReg( String id, String menuKey, String menuName, String select1, String select2,String textArea, String menuCurrent) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int orderCount = 0;
		try {
			
			pstmt = con.prepareStatement("INSERT INTO message VALUES(?,?,?,?,?,?,?)");
			pstmt.setString(1, id);
			pstmt.setString(2, menuKey);
			pstmt.setString(3, menuName);
			pstmt.setString(4, select1);
			pstmt.setString(5, select2);
			pstmt.setString(6, textArea);
			pstmt.setString(7, menuCurrent);
			orderCount = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return orderCount;
	}
	
}
