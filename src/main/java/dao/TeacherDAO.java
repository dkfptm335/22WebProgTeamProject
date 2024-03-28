package dao;
import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare;

import util.ConnectionPool;

public class TeacherDAO {
   // INSERT 함수
   public boolean insert(String id, String pw, String name, String num) throws NamingException, SQLException {
      Connection conn = null;
      PreparedStatement stmt = null;
      
      try {
         String sql = "INSERT INTO teacher VALUES(?, ?, ?, ?)";
         
         conn = ConnectionPool.get();
         stmt = conn.prepareStatement(sql);
         stmt.setString(1, id);
         stmt.setString(2, pw);
         stmt.setString(3, name);
         stmt.setString(4, num);
         
         int count = stmt.executeUpdate();
         return (count > 0) ? true : false;
      } finally {
         if(stmt != null) stmt.close();
         if(conn != null) conn.close();
      }
   }
   
   // CHECK 함수
   public boolean exists(String id) throws NamingException, SQLException {
      Connection conn = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;
      
      try {
         String sql = "SELECT tea_id FROM teacher WHERE tea_id = ?";
         
         conn = ConnectionPool.get();
         stmt = conn.prepareStatement(sql);
         stmt.setString(1, id);
         
         rs = stmt.executeQuery();
         return rs.next();
      } finally {
         if(rs != null) rs.close();
         if(stmt != null) stmt.close();
         if(conn != null) conn.close();
      }
   }
   
   // DELETE 함수
   public boolean delete(String id) throws NamingException, SQLException {
      Connection conn = null;
      PreparedStatement stmt = null;
      
      try {
         String sql = "DELETE FROM teacher WHERE tea_id = ?";
         
         conn = ConnectionPool.get();
         stmt = conn.prepareStatement(sql);
         stmt.setString(1, id);
         
         int count = stmt.executeUpdate();
         return (count > 0) ? true : false;
      } finally {
         if(stmt != null) stmt.close();
         if(conn != null) conn.close();
      }
   }
   
   public int login(String id, String pw) throws NamingException, SQLException{
      Connection conn = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;
      
      try {
         String sql = "SELECT tea_id, tea_pwd FROM teacher WHERE tea_id = ?";
         
         conn = ConnectionPool.get();
         stmt = conn.prepareStatement(sql);
         stmt.setString(1, id);
         
         rs = stmt.executeQuery();
         if(!rs.next()) return 1;
         if(!pw.equals(rs.getString("tea_pwd"))) return 2;
         
         return 0;
      } finally {
         if(rs != null) rs.close();
         if(stmt != null) stmt.close();
         if(conn != null) conn.close();
      }
   }
   
   public ArrayList<TeacherObj> getInfo(String id) throws NamingException, SQLException{
      Connection conn = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;
      
      try {
         String sql = "SELECT * FROM teacher WHERE tea_id=?";
         conn = ConnectionPool.get();
         stmt = conn.prepareStatement(sql);
         stmt.setString(1, id);
         
         rs = stmt.executeQuery();
         
         ArrayList<TeacherObj> teachers = new ArrayList<TeacherObj>();
         while(rs.next()) {
            teachers.add(new TeacherObj(rs.getString("tea_id"), rs.getString("tea_pwd"), rs.getString("tea_name"), rs.getString("tea_num")));
         }
         
         return teachers;
         
      } finally {
         if(rs != null) rs.close();
         if(stmt != null) stmt.close();
         if(conn != null) conn.close();
      }
   }
   
   public boolean update(String id, String npw, String nnum) throws NamingException, SQLException {
      Connection conn = null;
      PreparedStatement stmt = null;
      
      try {
         String sql = "UPDATE teacher SET tea_pwd = ?, tea_num = ? WHERE tea_id = ?";
         
         conn = ConnectionPool.get();
         stmt = conn.prepareStatement(sql);
         stmt.setString(1, npw);
         stmt.setString(2, nnum);
         stmt.setString(3, id);
         
         int count = stmt.executeUpdate();
         return (count > 0) ? true : false;
      } finally {
         if(stmt != null) stmt.close();
         if(conn != null) conn.close();
      }
   }
}