package dao;
import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare;

import util.ConnectionPool;

public class StudentDAO {
   // INSERT 함수
   public boolean insert(String id, String pw, String name, String num) throws NamingException, SQLException {
      Connection conn = null;
      PreparedStatement stmt = null;
      
      try {
         String sql = "INSERT INTO student VALUES(?, ?, ?, ?)";
         
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
         String sql = "SELECT stu_id FROM student WHERE stu_id = ?";
         
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
         String sql = "DELETE FROM student WHERE stu_id = ?";
         
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
         String sql = "SELECT stu_id, stu_pwd FROM student WHERE stu_id = ?";
         
         conn = ConnectionPool.get();
         stmt = conn.prepareStatement(sql);
         stmt.setString(1, id);
         
         rs = stmt.executeQuery();
         if(!rs.next()) return 1; // 아이디 없음
         if(!pw.equals(rs.getString("stu_pwd"))) return 2; // 비밀번호 불일치
         
         return 0; // 로그인 성공
      } finally {
         if(rs != null) rs.close();
         if(stmt != null) stmt.close();
         if(conn != null) conn.close();
      }
   }
   
   public ArrayList<StudentObj> getInfo(String id) throws NamingException, SQLException{
      Connection conn = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;
      
      try {
         String sql = "SELECT * FROM student WHERE stu_id=?";
         conn = ConnectionPool.get();
         stmt = conn.prepareStatement(sql);
         stmt.setString(1, id);
         
         rs = stmt.executeQuery();
         
         ArrayList<StudentObj> students = new ArrayList<StudentObj>();
         while(rs.next()) {
            students.add(new StudentObj(rs.getString("stu_id"), rs.getString("stu_pwd"), rs.getString("stu_name"), rs.getString("stu_num")));
         }
         
         return students;
         
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
         String sql = "UPDATE student SET stu_pwd = ?, stu_num = ? WHERE stu_id = ?";
         
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