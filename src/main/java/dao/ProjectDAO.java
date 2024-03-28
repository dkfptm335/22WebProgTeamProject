package dao;
import java.sql.*;
import javax.naming.NamingException;
import java.text.ParseException;
import java.util.ArrayList;

import com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare;

import util.ConnectionPool;

public class ProjectDAO {
   // INSERT 함수: 프로젝트 제목, 시작날짜, 마감날짜, 내용만 들어감. 시작날짜랑 마감날짜의 DB type을 DATETIME에서 DATE로 바꿔줌.
   public boolean insert(String class_name, String title, String sdate, String fdate, String content, String id) throws NamingException, SQLException, ParseException {
      Connection conn = null;
      PreparedStatement stmt = null;
      
      try {
         String sql = "INSERT INTO project(class, title, sdate, fdate, content, tea_id) VALUES(?, ?, ?, ?, ?, ?)";
         
         conn = ConnectionPool.get();
         stmt = conn.prepareStatement(sql);
         stmt.setString(1, class_name);
         stmt.setString(2, title);
         stmt.setString(3, sdate);
         stmt.setString(4, fdate);
         stmt.setString(5, content);
         stmt.setString(6, id);
         
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
         String sql1 = "ALTER TABLE project AUTO_INCREMENT=1";
         String sql2 = "SET @COUNT = 0";
         String sql3 = "UPDATE project SET project_idx = @COUNT:=@COUNT+1";
         
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
   // GetProjectList 함수: 프로젝트 제목, 시작날짜, 마감날자, 내용을 db에서 불러옴.
   public ArrayList<ProjectObj> getProjectList(String id) throws NamingException, SQLException{
       Connection conn = null;
       PreparedStatement stmt = null;
       ResultSet rs = null;
       try {
          String sql = "SELECT * FROM project WHERE tea_id = ? ORDER BY project_idx ASC;";   
          conn = ConnectionPool.get();
          stmt = conn.prepareStatement(sql);
          stmt.setString(1, id);
          
          rs = stmt.executeQuery();
             
          ArrayList<ProjectObj> feeds = new ArrayList<ProjectObj>();
          while(rs.next()) {
             feeds.add(new ProjectObj(rs.getString("project_idx"), rs.getString("title"), rs.getString("class"),
                   rs.getString("sdate"), rs.getString("fdate"), rs.getString("content")));
          }
          return feeds;
          
       } finally {
          if(rs != null) rs.close();
          if(stmt != null) stmt.close();
          if(conn != null) conn.close();
       }
    }
   // GetProjectList2 함수: 프로젝트 제목, 시작날짜, 마감날자, 내용을 db에서 불러옴.
   public ArrayList<ProjectObj> getProjectList2() throws NamingException, SQLException{
       Connection conn = null;
       PreparedStatement stmt = null;
       ResultSet rs = null;
       try {
          String sql = "SELECT * FROM project ORDER BY project_idx ASC;";   
          conn = ConnectionPool.get();
          stmt = conn.prepareStatement(sql);
          
          rs = stmt.executeQuery();
             
          ArrayList<ProjectObj> feeds = new ArrayList<ProjectObj>();
          while(rs.next()) {
             feeds.add(new ProjectObj(rs.getString("project_idx"), rs.getString("title"), rs.getString("class"),
                   rs.getString("sdate"), rs.getString("fdate"), rs.getString("content")));
          }
          return feeds;
          
       } finally {
          if(rs != null) rs.close();
          if(stmt != null) stmt.close();
          if(conn != null) conn.close();
       }
    }
 }