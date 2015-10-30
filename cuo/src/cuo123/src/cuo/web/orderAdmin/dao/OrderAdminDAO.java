package cuo.web.orderAdmin.dao;

import static cuo.util.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import cuo.web.orderAdmin.vo.OrderAdmin;


public class OrderAdminDAO {
	private static OrderAdminDAO instance;
	private Connection con;
	public OrderAdminDAO(){
		
	}
	public static OrderAdminDAO getInstance(){
		if(instance == null){
			instance = new OrderAdminDAO();
		}
		return instance;
	}
	public void setConnection(Connection con){
		this.con = con;
	}
	public ArrayList<OrderAdmin> selectOrderList() {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<OrderAdmin> orderList = null;
		OrderAdmin orderAdmin = null;
		try {
			pstmt = con.prepareStatement("SELECT * FROM menu");
			rs = pstmt.executeQuery();

			if(rs.next()){
				//글이 하나라도 있으면...
				orderList = new ArrayList<OrderAdmin>();
				do {
					orderAdmin = new OrderAdmin();
					orderAdmin.setMenu1(rs.getString("menu1"));
					orderAdmin.setMenu2(rs.getString("menu2"));
					orderAdmin.setMenu3(rs.getString("menu3"));
					orderAdmin.setMenu4(rs.getString("menu4"));
					orderAdmin.setMenu5(rs.getString("menu5"));
					orderAdmin.setMenu6(rs.getString("menu6"));
					orderAdmin.setMenu7(rs.getString("menu7"));
					orderAdmin.setMenu8(rs.getString("menu8"));
					orderAdmin.setMenu9(rs.getString("menu9"));
					orderAdmin.setMenu10(rs.getString("menu10"));
					orderAdmin.setMenu11(rs.getString("menu11"));
					orderAdmin.setMenu12(rs.getString("menu12"));
					orderAdmin.setMenuAddress(rs.getString("menuAddress"));
					orderAdmin.setMenuBhours(rs.getString("menuBhours"));
					orderAdmin.setMenuDel(rs.getString("menuDel"));
					orderAdmin.setMenuEhours(rs.getString("menuEhours"));
					orderAdmin.setMenuImage(rs.getString("menuImage"));
					orderAdmin.setMenuKey(rs.getString("menuKey"));
					orderAdmin.setMenuMap(rs.getString("menuMap"));
					orderAdmin.setMenuName(rs.getString("menuName"));
					orderAdmin.setMenuNum(rs.getInt("menuNum"));
					orderAdmin.setMenuPack(rs.getString("menuPack"));
					orderAdmin.setId(rs.getString("id"));
					orderList.add(orderAdmin);
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
	public int selectInsertMenu(OrderAdmin orderAdmin) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO menu VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		int insertCount =0;
		try {

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, orderAdmin.getMenuNum());
			pstmt.setString(2, orderAdmin.getMenuName());
			pstmt.setString(3, orderAdmin.getMenuAddress());
			pstmt.setString(4, orderAdmin.getMenuBhours());
			pstmt.setString(5, orderAdmin.getMenuEhours());
			pstmt.setString(6, orderAdmin.getMenuDel());
			pstmt.setString(7, orderAdmin.getMenuPack());
			pstmt.setString(8, orderAdmin.getMenuImage());
			pstmt.setString(9, orderAdmin.getMenuMap());
			pstmt.setString(10, orderAdmin.getMenuKey());
			pstmt.setString(11, orderAdmin.getMenu1());
			pstmt.setString(12, orderAdmin.getMenu2());
			pstmt.setString(13, orderAdmin.getMenu3());
			pstmt.setString(14, orderAdmin.getMenu4());
			pstmt.setString(15, orderAdmin.getMenu5());
			pstmt.setString(16, orderAdmin.getMenu6());
			pstmt.setString(17, orderAdmin.getMenu7());
			pstmt.setString(18, orderAdmin.getMenu8());
			pstmt.setString(19, orderAdmin.getMenu9());
			pstmt.setString(20, orderAdmin.getMenu10());
			pstmt.setString(21, orderAdmin.getMenu11());
			pstmt.setString(22, orderAdmin.getMenu12());
			pstmt.setString(23, orderAdmin.getId());
			insertCount = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return insertCount;
	}
	public int selectDeleteMenu(String id) {
		// TODO Auto-generated method stub
		String sql = "DELETE from menu WHERE id = ?"; 
		
		
		PreparedStatement pstmt = null;
		int deleteCount = 0;
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			deleteCount = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception 
			e.printStackTrace();
		} 	
		finally{
			close(pstmt);
		}
		return deleteCount;
	}
	
	
	
}
