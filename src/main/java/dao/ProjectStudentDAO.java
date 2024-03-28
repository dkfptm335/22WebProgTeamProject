package dao;
import java.sql.*;
import javax.naming.NamingException;
import java.text.ParseException;
import java.util.ArrayList;

import com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare;

import util.ConnectionPool;

public class ProjectStudentDAO {
   
   public boolean insert_student(String title, String id, String content) throws NamingException, SQLException, ParseException {
      Connection conn = null;
      PreparedStatement stmt = null;
      
      try {
         String sql = "INSERT INTO project_student(title, stu_id, content, submit_date) VALUES(?, ?, ?, now())";
         
         conn = ConnectionPool.get();
         stmt = conn.prepareStatement(sql);
         stmt.setString(1, title);
         stmt.setString(2, id);
         stmt.setString(3, content);
         
         int count = stmt.executeUpdate();
         return (count > 0) ? true : false;
      } finally {
         if(stmt != null) stmt.close();
         if(conn != null) conn.close();
      }
   }
   public boolean insert_score(String[] idx, String[] score, String[] feedback) throws NamingException, SQLException, ParseException {
      Connection conn = null;
      PreparedStatement stmt = null;
      
      try {
         String sql = "UPDATE project_student SET point=?, feedback=? WHERE project_idx=?";

         conn = ConnectionPool.get();
         stmt = conn.prepareStatement(sql);
         
         int length = idx.length;
         
         int[] idx_int = new int[length];
         int[] score_int = new int[length];
         for(int i=0; i < length; i++)
         {
        	 idx_int[i] = Integer.parseInt(idx[i]);
        	 score_int[i] = Integer.parseInt(score[i]);
         }
         
         int count = 0;
         
         for(int i=0; i < length; i++)
         {
             stmt.setInt(1, score_int[i]);
             stmt.setString(2, feedback[i]);        	 
             stmt.setInt(3, idx_int[i]);
             
             count = stmt.executeUpdate();
             System.out.println(score_int[i]);
             System.out.println(feedback[i]);
             System.out.println(idx_int[i]);
             System.out.println(count);
         }
         
         return (count > 0) ? true : false;
      } finally {
         if(stmt != null) stmt.close();
         if(conn != null) conn.close();
      }
   }   
   public boolean insert_teacher(int point, String feedback) throws NamingException, SQLException, ParseException {
         Connection conn = null;
         PreparedStatement stmt = null;
         
         try {
            String sql = "INSERT INTO project_student(point, feedback) VALUES(?, ?)";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, point);
            stmt.setString(2, feedback);
            
            int count = stmt.executeUpdate();
            return (count > 0) ? true : false;
         } finally {
            if(stmt != null) stmt.close();
            if(conn != null) conn.close();
         }
      } 
   
   // REFRESH 함수: project_idx를 1부터 순서대로 정렬. 
   public boolean refresh() throws NamingException, SQLException, ParseException {
      Connection conn = null;
      PreparedStatement stmt1 = null;
      PreparedStatement stmt2 = null;
      PreparedStatement stmt3 = null;
      
      try {
         String sql1 = "ALTER TABLE project_student AUTO_INCREMENT=1";
         String sql2 = "SET @COUNT = 0";
         String sql3 = "UPDATE project_student SET project_idx = @COUNT:=@COUNT+1";
         
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
   
   public ArrayList<ProjectStudentObj> getProjectList(String id) throws NamingException, SQLException{
      Connection conn = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;
      try {
         String sql = "SELECT * FROM project_student WHERE stu_id = ? ORDER BY project_idx ASC;";   
         conn = ConnectionPool.get();
         stmt = conn.prepareStatement(sql);
         stmt.setString(1, id);
          
         rs = stmt.executeQuery();
             
         ArrayList<ProjectStudentObj> projects = new ArrayList<ProjectStudentObj>();
         while(rs.next()) {
            projects.add(new ProjectStudentObj(rs.getString("project_idx"), rs.getString("title"), 
                  rs.getString("stu_id"), rs.getString("content"), rs.getString("submit_date"), rs.getString("attach"), rs.getInt("point"), rs.getString("feedback")));
         }
         return projects;
          
      } finally {
         if(rs != null) rs.close();
         if(stmt != null) stmt.close();
         if(conn != null) conn.close();
      }
   }
   public ArrayList<ProjectStudentObj> getAssignmentList(String title) throws NamingException, SQLException{
      Connection conn = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;
      try {
         String sql = "SELECT * FROM project_student WHERE title = ? ORDER BY project_idx ASC;";   
         conn = ConnectionPool.get();
         stmt = conn.prepareStatement(sql);
         stmt.setString(1, title);
          
         rs = stmt.executeQuery();
             
         ArrayList<ProjectStudentObj> assignments = new ArrayList<ProjectStudentObj>();
         while(rs.next()) {
            assignments.add(new ProjectStudentObj(rs.getString("project_idx"), rs.getString("title"), 
                  rs.getString("stu_id"), rs.getString("content"), rs.getString("submit_date"), rs.getString("attach"), rs.getInt("point"), rs.getString("feedback")));
         }
         return assignments;
          
      } finally {
         if(rs != null) rs.close();
         if(stmt != null) stmt.close();
         if(conn != null) conn.close();
      }
   }
}