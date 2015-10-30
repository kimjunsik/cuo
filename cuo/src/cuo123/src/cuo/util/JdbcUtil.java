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
         //트랜잭션(:하나의 일처리 단위, 한번에 처리되기 위한 단위) 처리
         //비지니스 요청 중 여러개의 데이터 조작 작업을 해야 하는 요청 (ex)계좌이체)
         //여러개의 데이터 조작 작업을 하나의 일처리 단위로 묶어주는 것이 트랜잭션 처리이다.
         //Connection은 autoCommit 이 true야. 따라서 기본적으로 트랜잭션이 적용이 안됨.
         
         Context initCtx = new InitialContext();
         //톰켓 자체의 컨텍스트 얻어옴
         Context envCtx = (Context)initCtx.lookup("java:comp/env");
         //정의된 Resource 에 접글할 수 있는 컨텍스트를 얻어옴.
         
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
   //트랜잭션 부분
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