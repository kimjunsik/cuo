package cuo.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JdbcUtil {
   
   /*static{
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
      } catch (ClassNotFoundException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }*/
   public static Connection getConnection(){
      Connection con = null;
      try {
         //con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","java","java");
         //Ʈ�����(:�ϳ��� ��ó�� ����, �ѹ��� ó���Ǳ� ���� ����) ó��
         //�����Ͻ� ��û �� �������� ������ ���� �۾��� �ؾ� �ϴ� ��û (ex)������ü)
         //�������� ������ ���� �۾��� �ϳ��� ��ó�� ������ �����ִ� ���� Ʈ����� ó���̴�.
         //Connection�� autoCommit �� true��. ���� �⺻������ Ʈ������� ������ �ȵ�.
         
         Context initCtx = new InitialContext();
         //���� ��ü�� ���ؽ�Ʈ ����
         Context envCtx = (Context)initCtx.lookup("java:comp/env");
         //���ǵ� Resource �� ������ �� �ִ� ���ؽ�Ʈ�� ����.
         
         DataSource ds = (DataSource)envCtx.lookup("jdbc/board");
         con = ds.getConnection();
         con.setAutoCommit(false);
         
         
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
      }
         return con;
   }
   
   public static void close(Connection con){
      try {
         con.close();
      } catch (Exception e) {
         // TODO: handle exception
      }
   }
   
   public static void close(Statement stat){
      try {
         stat.close();
      } catch (Exception e) {
         // TODO: handle exception
      }
   }
   public static void close(ResultSet rs){
      try {
         rs.close();
      } catch (Exception e) {
         // TODO: handle exception
      }
   }
   //Ʈ����� �κ�
   public static void commit(Connection con){
      try {
         con.commit();
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
      }
   }
   public static void rollback(Connection con){
      try {
         con.rollback();
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
      }
   }
   
}