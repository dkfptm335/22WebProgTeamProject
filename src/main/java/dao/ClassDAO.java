package dao;
import java.sql.*;
import javax.naming.NamingException;
import java.text.ParseException;
import java.util.ArrayList;

import com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare;

import util.ConnectionPool;

public class ClassDAO {
   // INSERT 함수: 수업 이름, 세부사항, 선생님 아이디, 이름을 class table에 저장. 
   public boolean insert(String classname, String classdetail, String id, String name) throws NamingException, SQLException, ParseException {
      Connection conn = null;
      PreparedStatement stmt = null;
      
      try {
         String sql = "INSERT INTO class(class_name, class_detail, tea_id, tea_name) VALUES(?, ?, ?, ?)";
         
         conn = ConnectionPool.get();
         stmt = conn.prepareStatement(sql);
         stmt.setString(1, classname);
         stmt.setString(2, classdetail);
         stmt.setString(3, id);
         stmt.setString(4, name);
         
         int count = stmt.executeUpdate();
         return (count > 0) ? true : false;
      } finally {
         if(stmt != null) stmt.close();
         if(conn != null) conn.close();
      }
   }   
   // REFRESH 함수: class_idx를 1부터 순서대로 정렬. 
   public boolean refresh() throws NamingException, SQLException, ParseException {
      Connection conn = null;
      PreparedStatement stmt1 = null;
      PreparedStatement stmt2 = null;
      PreparedStatement stmt3 = null;
      
      try {
         String sql1 = "ALTER TABLE class AUTO_INCREMENT=1";
         String sql2 = "SET @COUNT = 0";
         String sql3 = "UPDATE class SET class_idx = @COUNT:=@COUNT+1";
         
         conn = ConnectionPool.get();
         stmt1 = conn.prepareStatement(sql1);
         stmt2 = conn.prepareStatement(sql2);
         stmt3 = conn.prepareStatement(sql3);
         
         int count1 = stmt1.executeUpdate();
         int count2 = stmt2.executeUpdate();
         int count3 = stmt3.executeUpdate();
         return (count3 > 0) ? true : false;
      } finally {
         if(stmt1 != null) stmt1.close();
         if(stmt2 != null) stmt2.close();
         if(stmt3 != null) stmt3.close();
         if(conn != null) conn.close();
      }
   }   
   // GetProjectList 함수: 수업 이름, 세부사항, 선생님 아이디, 이름을 db에서 불러옴.
   public ArrayList<ClassObj> getClassList(String id) throws NamingException, SQLException{
       Connection conn = null;
       PreparedStatement stmt = null;
       ResultSet rs = null;
       try {
          String sql = "SELECT * FROM class WHERE tea_id = ? ORDER BY class_idx ASC;";   
          conn = ConnectionPool.get();
          stmt = conn.prepareStatement(sql);
          stmt.setString(1, id);
          
          rs = stmt.executeQuery();
             
          ArrayList<ClassObj> classes = new ArrayList<ClassObj>();
          while(rs.next()) {
             classes.add(new ClassObj(rs.getString("class_idx"), rs.getString("class_name"), 
                   rs.getString("class_detail"), rs.getString("tea_id"), rs.getString("tea_name")));
          }
          return classes;
          
       } finally {
          if(rs != null) rs.close();
          if(stmt != null) stmt.close();
          if(conn != null) conn.close();
       }
    }
 }